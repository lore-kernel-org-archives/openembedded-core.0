Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 652846AC6C;
	Sun, 17 Aug 2014 00:51:07 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so5121412igq.7
	for <multiple recipients>; Sat, 16 Aug 2014 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=qBuQHu8gq4942jdLuQMEEeHJGwPs8SYqhtuolOjBHDE=;
	b=Pp9/dQ6aUfbg9ShUiR+sBNkJxe5M1MeDjTHj6hryvFz0QmHY0mIANKVQ2gt/+irLuz
	rzp/m1/rNpG42fgIyc0E0wp3qSdWnXDjLKkmuc2VY4tGkCCQnbTqqEkHBQQtsrHmlBL8
	EtrMY6Ae8Hk9oP/LfCpo8VK8MEyx4q9ZrXC9DrTZ2BGtTlC8tVEO4vUxUZWLxy70b+T+
	9JdJLQYHcIvTOcgYre/enBFyECsm8H/36h8M+X+XGLNSZDwKqt2KOaGURXERiQ3++zDm
	B/D975NScXwDXIe0isvYGXE+oJMxWvs16eVTTTMCnViGdVWZXoN+fqRgHpsNFp6K9P33
	mcpw==
X-Received: by 10.50.176.202 with SMTP id ck10mr76461473igc.2.1408236668839;
	Sat, 16 Aug 2014 17:51:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Sat, 16 Aug 2014 17:50:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Aug 2014 17:50:38 -0700
Message-ID: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>, musl@lists.openwall.com
Subject: Announcing meta-musl OE/Yocto layer supporting musl C library
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
X-List-Received-Date: Sun, 17 Aug 2014 00:51:11 -0000
Content-Type: text/plain; charset=UTF-8

Hello All

musl <http://www.musl-libc.org/> is a newer implementation licensed
under MIT licence
A layer to support musl to supply your system C library as an
alternative to uclibc and eglibc/glibc  is now available at

https://github.com/kraj/meta-musl

README describes way to get going with it.

Few things to note

* Supports gcc 4.9 in OE not 4.8
* Current musl recipe is 1.1.4 based
* You need latest master of OE-Core
(106305227003761c3fc562c21bb859a5256f2b36) or          newer and
bitbake
* Its only able to build core-image-minimal
* core-image-minimal boots on qemuarm, qemuppc, qemumips, qemux86, qemux86-64

I will send a request to add it to layerindex soon and then you should
be able to find it using
layerindex.opernembedded.org as well

If you try it out on your hardware and/or have feedback I am
interested. Fork it from github, file bugs
send patches ....

Happy hacking

-Khem

