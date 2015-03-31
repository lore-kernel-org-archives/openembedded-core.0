Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5DB724DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VLrRcq014582; Tue, 31 Mar 2015 22:53:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gU0fSTRibJQ9; Tue, 31 Mar 2015 22:53:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2VLrC9m014577
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 31 Mar 2015 22:53:24 +0100
Message-ID: <1427838792.14020.368.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Mar 2015 22:53:12 +0100
In-Reply-To: <B13BA224-B90E-4C26-AEEE-EC91F065F143@gmail.com>
References: <1427815329.14020.358.camel@linuxfoundation.org>
	<B13BA224-B90E-4C26-AEEE-EC91F065F143@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] siteinfo: Add x86_64-elf support
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
X-List-Received-Date: Tue, 31 Mar 2015 21:53:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2015-03-31 at 11:03 -0700, Khem Raj wrote:
> > On Mar 31, 2015, at 8:22 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Teach siteinfo about x86_64-elf so that baremetal toolchains parse/build.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
> > index 2c1f9d0..5fd99bf 100644
> > --- a/meta/classes/siteinfo.bbclass
> > +++ b/meta/classes/siteinfo.bbclass
> > @@ -95,6 +95,7 @@ def siteinfo_data(d):
> >         "x86_64-linux": "bit-64",
> >         "x86_64-linux-musl": "x86_64-linux bit-64",
> >         "x86_64-linux-uclibc": "bit-64",
> > +        "x86_64-elf": "bit-64”,
> 
> is 32bit bare metal already taken care of ?

As far as I can tell, yes. x86_64 is more spelt out due to the x32
issues.

Cheers,

Richard


