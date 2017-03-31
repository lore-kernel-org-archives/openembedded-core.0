Return-Path: <tristan.vanberkom@codethink.co.uk>
Received: from imap0.codethink.co.uk (imap0.codethink.co.uk [185.43.218.159])
	by mail.openembedded.org (Postfix) with ESMTP id A6A1465C8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 07:43:59 +0000 (UTC)
Received: from imap1.codethink.co.uk ([176.9.8.82])
	by imap0.codethink.co.uk with esmtps (Exim 4.84_2 #1 (Debian))
	id 1ctrDz-0001AB-Mi; Fri, 31 Mar 2017 08:44:00 +0100
Received: from [222.110.195.192] (helo=think)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1ctrDy-0008CP-HN; Fri, 31 Mar 2017 08:43:59 +0100
Message-ID: <1490946226.18519.36.camel@codethink.co.uk>
From: Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>
To: "Burton, Ross" <ross.burton@intel.com>, "Maxin B. John"
	<maxin.john@intel.com>
Date: Fri, 31 Mar 2017 16:43:46 +0900
In-Reply-To: <CAJTo0Lar4023Z0kWdcgBPgc4aD+E6oEvh6jkfhCKdr0gtpYJkQ@mail.gmail.com>
References: <1490789493.18519.18.camel@codethink.co.uk>
	<CAJ86T=VYpCkzddgtVkT++N+gxj5oi8iuzb29Cm9N_0=7RrG_1A@mail.gmail.com>
	<20170330080955.GA403@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0Lar4023Z0kWdcgBPgc4aD+E6oEvh6jkfhCKdr0gtpYJkQ@mail.gmail.com>
Organization: Codethink
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: fix build on aarch64 or non-intel build hosts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Mar 2017 07:44:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-30 at 12:21 +0100, Burton, Ross wrote:
> 
> > Agree with Andre here. I would suggest to update nasm recipe to
> > support
> > build for other archs as well (tested on arm and it works as
> > expected. Will
> > require more testing on other archs).
> 
> Yes.  Simply deleting the COMPATIBLE_HOST in nasm.bb should be
> sufficient, Debian builds nasm for every architecture so that
> demonstrates that it builds just fine.
> 

Ok, I had this concern too when originally discussing the approach in
#yocto, this sounds better.

So just to get things straight, does this mean we no longer need the
patch to remove nasm-native from the jpeg turbo dependencies on non-
intel targets ?

I think "-native" here only means "build an nasm that I can run on the
host architecture" then I think this is fine, as jpeg-turbo will just
ignore the needlessly built nasm when targetting non-intel platforms.

Cheers,
    -Tristan


