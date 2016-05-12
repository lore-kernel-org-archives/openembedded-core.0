Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2F965C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 15:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4CFEmje019810; Thu, 12 May 2016 16:14:49 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jSsfRWICXlJn; Thu, 12 May 2016 16:14:49 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4CFEl2t019797
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 May 2016 16:14:48 +0100
Message-ID: <1463066087.9746.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2016 16:14:47 +0100
In-Reply-To: <20160512174542.332fae80@adi-pc-linux.emea.corp.natinst.com>
References: <1463058769-8498-1-git-send-email-adrian.ratiu@ni.com>
	<CAMKF1sp-cXec1TAWfdVus_Hg46QxF5SMx+7yk5T-MhsUxsEz8Q@mail.gmail.com>
	<20160512174542.332fae80@adi-pc-linux.emea.corp.natinst.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.9: fix build with gcc 6
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
X-List-Received-Date: Thu, 12 May 2016 15:14:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-05-12 at 17:45 +0300, Ioan-Adrian Ratiu wrote:
> On Thu, 12 May 2016 07:38:00 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
> 
> > On Thu, May 12, 2016 at 6:12 AM, Ioan-Adrian Ratiu <
> > adrian.ratiu@ni.com> wrote:
> > > Building gcc-cross 4.9.3 with gcc 6 fails with the following
> > > error:
> > > 
> > > error: 'const char* libc_name_p(const char*, unsigned int)'
> > > redeclared inline with 'gnu_inline' attribute
> > > 
> > > This is a backport of the upstream fix.  
> > 
> > I have seen couple of such patches being proposed. I was of the
> > opinion to drop 4.9 from master however if we still want to
> > refresh it the I would propose that we change the SRC_URI to point
> > to
> > latest on gcc-4_9-branch and remove any backports
> > we have done since 4.9.3 release. It can also be merged into
> > krogoth.
> > Then we can latest decide if we want to keep 4.9 in
> > 2.2 release or not. Would you be able to test such a patch
> 
> Actually I'm all for dropping gcc 4 from master. It's about time IMO.
> 
> I need this patch to fix the build in krogoth and was just waiting
> for
> feedback on master before I sent this patch there.
> 
> I'll resend for krogoth directly then :)

Since several people are hitting this and we have the patch, lets merge
it, then drop 4.9 as a followup.

Cheers,

Richard

