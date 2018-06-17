Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F11216006E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jun 2018 21:36:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5HLaJL3010729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 17 Jun 2018 22:36:20 +0100
Message-ID: <313ce6af489a9ab4bb32f658aa17a251204ea53c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 17 Jun 2018 22:36:18 +0100
In-Reply-To: <74bb7fdc-8e9d-dd2d-c150-6d6b6ab79770@gmail.com>
References: <1527516680-22733-1-git-send-email-akuster808@gmail.com>
	<CAJTo0Lb9tukB0NEpCG5SOU0g6coh06wLjorHVktJd3tCs99edg@mail.gmail.com>
	<74bb7fdc-8e9d-dd2d-c150-6d6b6ab79770@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v3][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Sun, 17 Jun 2018 21:36:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-06-17 at 14:28 -0700, akuster808 wrote:
> > > Requires python-ply package in core
> > 
> > Comment says use meta-python.  If the python code here is useful,
> > we
> > can add it to core.
> 
> its in master now... I think..

Its in master-next, pending us figuring this other patch out.

> > Conflicts with the commit message.  Pick one.
> > 
> > > +PACKAGECONFIG[python3] = "--with-python=${PYTHON}, --without-
> > > python, python3-native python3-ply-native, python3-core"
> > 
> > Just python3-core sounds unlikely as that's a subset of the
> > standard library.
> 
> I just noticed python3-ply does not exist in the patch I sent you so
> I have done a v2 for that python-ply package.

Can you check what is in -next please as that was my fixed up version
of your patch which does what it says (and fixes maintainers too).

Do we need both the py2 and py3 versions?

Cheers,

Richard



