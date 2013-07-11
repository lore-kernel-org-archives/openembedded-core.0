Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 56E4C6AEA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 11:51:25 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UxFPA-0002ro-1Z; Thu, 11 Jul 2013 13:51:24 +0200
Message-ID: <1373543483.2389.331.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 11 Jul 2013 12:51:23 +0100
In-Reply-To: <51DE8EB8.60908@opendreambox.org>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
	<1373504197-9550-3-git-send-email-obi@opendreambox.org>
	<CAJTo0Laa7if2poYd_8AeLYDq8obefuw5F7ygSi+uz4LYpWrOkg@mail.gmail.com>
	<51DE8EB8.60908@opendreambox.org>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] cogl-1.0: add option to enable GLES1
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
X-List-Received-Date: Thu, 11 Jul 2013 11:51:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-07-11 at 12:53 +0200, Andreas Oberritter wrote:
> On 11.07.2013 10:52, Burton, Ross wrote:
> > On 11 July 2013 01:56, Andreas Oberritter <obi@opendreambox.org> wrote:
> >> Only PACKAGECONFIG options for GL and GLES2 were available before.
> > 
> > The rationale behind this was that the GLES1 support isn't tested,
> > mainly as there's not a lot of hardware that can't also do GLESv2.
> > Was this enabled for completeness or are you actually restricted to
> > GLESv1?
> 
> It's for completeness, so if you have libraries for both GLES1 and
> GLES2, you can compare them easily and then choose the one that works
> better for your application. 

If your hardware supports GLESv2 then it seems very unlikely that the
GLESv1 backend is going to work better for any application.  I suppose
it's just about conceivable that there might be some or other bug in the
GLESv2 driver which you could work around by using the GLESv1 API, but
I've never heard of this happening in practice and it doesn't sound very
likely.

I wouldn't be surprised if Cogl's GLESv1 backend went away altogether in
the not-too-distant future.  The gap in capabilities between GLESv1 and
either GLESv2 or big GL is quite significant.

All that said, if there is genuine (even if possibly misguided) interest
in experimenting with GLESv1 then I don't have any real objection to
adding a PACKAGECONFIG option for it.

p.



