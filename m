Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F23CA6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 May 2016 08:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4E8aI3t018068; Sat, 14 May 2016 09:36:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iCrjR_Pgu64s; Sat, 14 May 2016 09:36:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4E8aEhX018063
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 14 May 2016 09:36:15 +0100
Message-ID: <1463214974.9746.146.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 14 May 2016 09:36:14 +0100
In-Reply-To: <5736340E.1010401@gmail.com>
References: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
	<5732CFA3.7080302@windriver.com> <57330B87.5080300@gmail.com>
	<20160513143139.GA2565@jama> <5736340E.1010401@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] openssl: Security fix via update to 1.0.2h
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
X-List-Received-Date: Sat, 14 May 2016 08:36:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-05-13 at 13:07 -0700, akuster808 wrote:
> 
> On 05/13/2016 07:31 AM, Martin Jansa wrote:
> > On Wed, May 11, 2016 at 03:37:59AM -0700, akuster808 wrote:
> > > Robert,
> > > 
> > > 
> > > On 05/10/2016 11:22 PM, Robert Yang wrote:
> > > > 
> > > > 
> > > > On 05/04/2016 07:46 AM, Armin Kuster wrote:
> > > > > From: Armin Kuster <akuster@mvista.com>
> > > > > 
> > > > > CVE-2016-2105
> > > > > CVE-2016-2106
> > > > > CVE-2016-2109
> > > > > CVE-2016-2176
> > > > > 
> > > > > https://www.openssl.org/news/secadv/20160503.txt
> > > > > 
> > > > > fixup openssl-avoid-NULL-pointer-dereference-in
> > > > > -EVP_DigestInit_ex.patch
> > > > > 
> > > > > drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in
> > > > > latest.
> > > > 
> > > > After I looked into the code, it seems that this patch is not
> > > > in latest
> > > > code ?
> > > 
> > > hmm, my old eyes deceive me.
> > > 
> > > thanks for checking.
> > > 
> > > I will send a correcting.
> > 
> > 1.0.2h is already in fido, jethro and master, can we quickly get it
> > to krogoth
> > which is still using older version 1.0.2g?
> 
> this hit master 2 days ago. I just sync'd changes over to krogth and
> am
> doing sanity checks.  The last time I backported something before
> master
> folks got the shorts-in-a-twist.
> 
> > 
> > It's always strange to see recipe version downgrades when upgrading
> > to
> > newer Yocto release.
> 
> yes it is. I have no control when the other maintainers do their
> merges.

I should explain that in this case we had 1.8.2 pretty much ready to
go, then the openssl issue came to light. I therefore fast tracked that
merge on the basis that getting it into the release and a build into QA
was "a good thing", and on the assumption that getting this into jethro
would follow quickly.

In general we do fallow the waterfall model and this was an exception
to the rule, purely to try and help my sanity and keep builds/releases
moving.

Cheers,

Richard

