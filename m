Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 41CF06FE64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 07:48:44 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id va2so11856480obc.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 00:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=b8NjbquIu90eBj5amwf7BIckQge8287WClRzT0xUQMg=;
	b=eqJKcIOEjM4yO/0E6Wp/NVx3sDr/4/sBb6AFN/O5o4+9TrzUVBUfvXkn/2ax2LAbk4
	sXx/KypTLaSs09QudWOVmwkVnhfx9r4cNnckeo7sgu+m/pOVr7JTX55OSSRkp3/hktT1
	Soo8fMj5+WfFJwxyEoTgR0Xf7UTuF3qGMNhSIvKSIex32XREH1xMmg+U4nhnXoj3NI/X
	TT8K1dHd89pP7uy381QyNwf1AK0Q1hxRcTRes9PQWLiTZ+fiQ/b5Ax/Ju+Q/WPRhbK+r
	mv+a/3Aat4742ioSxpPZJAbC4tvOWzjnb9roZb32lBVjTEPAUmzdmC1BX2t0oZof+vSP
	OWYw==
X-Gm-Message-State: ALoCoQlUyxSjr5OsbIICcvGihEST16OS4fHb4GrncJp4Hk/TkA//rsI4ampi6IJO/xKCLUmEAkWJ
MIME-Version: 1.0
X-Received: by 10.60.117.39 with SMTP id kb7mr55408582oeb.5.1404287325875;
	Wed, 02 Jul 2014 00:48:45 -0700 (PDT)
Received: by 10.76.69.228 with HTTP; Wed, 2 Jul 2014 00:48:45 -0700 (PDT)
Date: Wed, 2 Jul 2014 09:48:45 +0200
Message-ID: <CA+AhUGwRbd4kv0_wd3Y9=5SPe-cf76FKqMU4mdH7_m1YucWabw@mail.gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Building mesa uses hosts wayland-scanner instead of version from sysroot
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
X-List-Received-Date: Wed, 02 Jul 2014 07:48:48 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I noticed differences when building mesa on my local machine and on
one of our build servers. It failed on my local host due to errors in
the generated wayland-drm-client-protocol.h but worked on the build
server. Examining log.do_compile I noticed that it uses
wayland-scanner from /usr/bin/ on both machines instead of using the
one present in the sysroot, so I guess it works due to luck on one
machine.

If I make /usr/bin/wayland-scanner a symlink to the version in the
sysroot it builds ok.

Can anyone else verify if their mesa builds uses the hosts
wayland-scanner? And does anyone the proper way to convince mesa to
use the sysroot version?

(I'm using daisy, so mesa 9.2.5)

Cheers,
Erik

