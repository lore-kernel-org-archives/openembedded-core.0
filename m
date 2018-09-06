Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 23707747EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 22:05:26 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g33-v6so12975930wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 15:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=emZvCDjAqjUyCA3svfyyJwEOljoO7pc+xPWL9PMbooU=;
	b=Ub/IgeWY5WFvqwfieH665eTGm1+ra6Ua4Y2lbgIvwFhxueFQoam+ETco8zkulwI9FC
	Y30zWRaHE4VEqoq6PhtGreduT0EJd9Nb+lySy7M0LtwQ9xGmMwW9R98L5nLkJ2AyiVwc
	UkzcUhP9iJFQFcY62cwbI2hLFCqPfqFd4mUzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=emZvCDjAqjUyCA3svfyyJwEOljoO7pc+xPWL9PMbooU=;
	b=nLXJo9JqXQwhnDPcDUCZ7p2CTrPknzVT4ZgReV+lMiCMrTbfdS+us7AhNzjKb7f3um
	WePk4fnPonRzsNMCTCPoFPkQARZnzOrvL+s1p9+1/ckUy980THeYkp+GfiihSOD5x/q5
	Kym0fnFyGf7pM2MZED7xkAjaIq7ZFbr/XLF9ttXfOA5DsZQpatUN5YnqySleWw2ADsXu
	YxlBzwBnRXHu4bKtzTmOcJV092udqcDFJtzkNdLfs/uBiG55EYWrtLsiJ6HD5VJ3LGzW
	LfYMHg1Ebk6Mh4oxX7E7f56q6j+P2LnsHrevqz950eJIOGgtNfq7yMewCegiOImMWCr8
	OIHw==
X-Gm-Message-State: APzg51BEgSvSAqCOLR8HWx6am99ooRTO6klkG3x9fodt/Xefv16EniH2
	/Y+53v1eaIIuyLAGFxloFnsxoTY4qEM=
X-Google-Smtp-Source: ANB0VdbbLaNaz6ue95SaucX79tN/ddN+KjH8+HuCnuhTLAb2VLToN5zsDzXkU2Wd/BMvf4WccymnYw==
X-Received: by 2002:a5d:62c2:: with SMTP id o2-v6mr4177818wrv.83.1536271526792;
	Thu, 06 Sep 2018 15:05:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l10-v6sm4055728wre.0.2018.09.06.15.05.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Sep 2018 15:05:25 -0700 (PDT)
Message-ID: <d6d526241f42c97ce71280e180fd73f615a15b4c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 06 Sep 2018 23:05:24 +0100
In-Reply-To: <6a9fa2c4-b21c-38c5-cd4b-f8f4cfdb39ef@windriver.com>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-7-richard.purdie@linuxfoundation.org>
	<a7d35d68-e546-408f-561e-c5a3a8f4aaa5@windriver.com>
	<4f62f20f8d4b9378684b6224ddf7d1bc5cfca814.camel@linuxfoundation.org>
	<6a9fa2c4-b21c-38c5-cd4b-f8f4cfdb39ef@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 7/8] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Thu, 06 Sep 2018 22:05:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 17:04 +0800, ChenQi wrote:
> On 09/06/2018 04:19 PM, richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2018-09-06 at 10:11 +0800, ChenQi wrote:
> > > Hi Richard,
> > > 
> > > I think my previous patch has covered this case.
> > > 
> > >     git://git.pokylinux.org/poky-contrib ChenQi/busybox-alternatives
> > >     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busyb
> > > ox-alternatives
> > > 
> > > Chen Qi (1):
> > >     busybox: fix the alternatives logic
> > > 
> > > 
> > > Is there some problem with the patch?
> > 
> > Sorry, I thought I'd replied about this. There were build failures from
> > this patch and I had to drop it from the test branch. I'm afraid with
> > all the build failures we're had recently I'm struggling to find which
> > failures those were...
> > 
> > I merged my simpler but less complete fix simply to get patches moving
> > as I'd assumed this one was being debugged. I guess we need the
> > failures for that though...
> > 
> > Cheers,
> > 
> > Richard
> > 
> 
> Got it.
> I just looked at some build failures, the ones that might be related are 
> those of testimage failures complaining 'No syslog daemon'.
> I'll check things locally first.

It seems that we have problems in master even with my version of the
patch. Its not a deterministic problem, it depends upon rpm/dnf package
installation order.

The dnf.DnfRepoTest.test_dnf_installroot image test does:

dnf --repofrompath=oe-testimage-repo-i586,http://192.168.7.7:36895/i586 --repofrompath=oe-testimage-repo-qemux86,http://192.168.7.7:36895/qemux86 --repofrompath=oe-testimage-repo-noarch,http://192.168.7.7:36895/noarch --nogpgcheck install --installroot=/home/root/chroot/test -v -y --rpmverbosity=debug busybox run-postinst

which figures out:

================================================================================
|  Package                   Arch    Version      Repository                 Size
| ================================================================================
| Installing:
|  busybox                   i586    1.29.2-r0.0  oe-testimage-repo-i586    352 k
|  run-postinsts             noarch  1.0-r10.0    oe-testimage-repo-noarch  8.7 k
| Installing dependencies:
|  libc6                     i586    2.28-r0.0    oe-testimage-repo-i586    1.3 M
|  update-alternatives-opkg  i586    0.3.6-r0.0   oe-testimage-repo-i586    8.5 k
| Installing weak dependencies:
|  busybox-syslog            i586    1.29.2-r0.0  oe-testimage-repo-i586     10 k
|  busybox-udhcpc            i586    1.29.2-r0.0  oe-testimage-repo-i586    8.1 k
| 

so far so good. It then tries to install busybox-syslog *before*
busybox. During the postinstall of busybox-syslog we see:

update-alternatives --install /sbin/klogd klogd /bin/busybox.nosuid 50
| /usr/bin/update-alternatives: line 145: sed: command not found
| /usr/bin/update-alternatives: line 145: echo: write error: Broken pipe

which makes sense as sed comes from busybox which hasn't installed yet.

I added:

RDEPENDS_${PN}-syslog = "busybox"

to the busybox recipe but this doesn't seem to help. I see in the
busybox.spec file for the -syslog package:

Requires: /bin/sh
Requires: busybox
Requires: update-alternatives-opkg
Requires(post): /bin/sh
Requires(post): busybox
Requires(post): update-alternatives-opkg

but it still tries to install busybox-syslog *before* busybox.
(busybox only RRECOMMENDS busybox-syslog).

The autobuilder with the above RDEPENDS added also shows this.

Interestingly this test doesn't fail, its the parselogs test later
which fails due to the postinstall errors being detected in the dnf log
files.

This would seem to be an rpm/dnf bug :(. 

Sometimes we don't see the error as if it chooses to install busybox
first, things work ok. THis is currently breaking builds quite badly on
master :(.

Cheers,

Richard



