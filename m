Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4414E77261
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 16:40:22 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id 74so50492389uau.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to;
	bh=wS2g/nxwkpdERaVMqVjPtgRL/mJ2RnGaXDZxExolvZc=;
	b=ZC/H4XpX+lG/9FHs508/r/OILw4RzkTyUCQdMAk4Lw/nwJJXE/n7JwmtVmcBT87he3
	sIem4/XbYJRS0mkBqomC4m7GKyhm0IAnevSstAwg/ukCf8cAI8hwhAZ5ZObHCZ9Zi5/7
	BJHWThKCWqLUMTI4PsUD6wFHZHEwHZ03hOgLXbu2pxw1MVqmV8DKZun17yTYpl2uwJ5R
	485TdLYsrhxhxSUpfZ98Ih6F3PbJ6+V1Ptx2NQytBNq6BUKzA6AXjHMZ+PG4dbca9MYf
	8qyFS4QwjMpoc9Olf7UjW9ipCNQuLbyk6xwo3cylXrc7AHoydm6H8JcF8YBFPhE2OHQi
	T8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
	bh=wS2g/nxwkpdERaVMqVjPtgRL/mJ2RnGaXDZxExolvZc=;
	b=TcOlyJLJ/0ZdxpyCcAw1Lqr+VRSYfurhTiEzR28EsFGbIbLgMOblsSfMS2QVu2VpCf
	N4WQsWC94b/P5vwR776obwymZG9IFNMrgjDxORaFdGjYtA8k7Tb8HhgoKBR2I3LBmHVL
	1OZtgzbrmUwy/nAwYCKeFL3WU9beOsTI0kiz1OiiIhqtI/xEW5tqRz043Hh9nnlORKpl
	p1Gih81yIy1d/LMqFYeq8UIUCAxOmIGqgNOIk7X+u6gY0yknb/9pjYpgWc6xwSIrBNPv
	Cbw+EfojtjjH2e7UXTbetWOzLJO3yMST9+xSamIuSHYpL1PNewK/2wyY1JdB4R2P4TcI
	UOEw==
X-Gm-Message-State: AEkoouuq19SrLCtgN5xzIlvRJh0L932YBEChMqwnm/ZWT/IrsxgOYEYUyNjgtPBtbrajkw==
X-Received: by 10.31.181.81 with SMTP id e78mr6916033vkf.154.1471020023037;
	Fri, 12 Aug 2016 09:40:23 -0700 (PDT)
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com.
	[209.85.217.181])
	by smtp.gmail.com with ESMTPSA id 5sm1543468uaf.26.2016.08.12.09.40.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Aug 2016 09:40:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f181.google.com with SMTP id n59so50275763uan.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:40:21 -0700 (PDT)
X-Received: by 10.31.178.131 with SMTP id b125mr8313727vkf.72.1471020021056;
	Fri, 12 Aug 2016 09:40:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.138.78 with HTTP; Fri, 12 Aug 2016 09:40:20 -0700 (PDT)
Date: Fri, 12 Aug 2016 13:40:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpdmP+_ptEOOTqV4Kgk3ARX5sM-sMyz=C8=YaOMJxOSug@mail.gmail.com>
Message-ID: <CAP9ODKpdmP+_ptEOOTqV4Kgk3ARX5sM-sMyz=C8=YaOMJxOSug@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [for-krogoth] Backport "glibc: use the host locale archive in nativesdk builds"
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
X-List-Received-Date: Fri, 12 Aug 2016 16:40:23 -0000
Content-Type: text/plain; charset=UTF-8

Hello Armin,

The commit OE-Core:75321b6b0f2c0ac667b9350b387b01a188e195c8 is need
for Krogoth. See the full commit log below:

Author: Ross Burton <ross.burton@intel.com>
Date:   Wed Jul 6 10:54:29 2016 +0100

    glibc: use the host locale archive in nativesdk builds

    The nativesdk libc when used by buildtools has a hard requirement
on supporting
    a UTF-8 locale because Python 3 needs a UTF-8 locale.  However we
currently only
    ship the C locale, which means that Python attempts to lookup the
user's locale
    (for example, en_NZ.UTF-8) in the locale archive under it's prefix
it fails and
    falls back to C.  This the results in Python using ASCII instead
of UTF-8 for
    file encoding, and bitbake breaks.

    Th obvious solution would be to ship all locales, but this would add
    approximately 250MB to the size of the buildtools tarball (which
is currently
    around 30MB).  Generating a binary locale archive reduces this
down to 100MB,
    but this is still a drastic increase in footprint.  If we ship a subset of
    locales in the tarball then there will be users whose locale isn't in the
    tarball, and they'll have to change their locale to an "approved" one, which
    isn't the best of messages to send to new users.

    The alternative is to tell the nativesdk libc that the locale archive isn't
    under it own prefix but is in fact at /usr/lib/locale/locale-archive, so the
    buildtools libc uses the host locale archive. The locale archive
format appears
    to be at least fairly stable: our glibc 2.24 can read the locale archive
    generated by glibc 2.17 (Centos 7).

    [ YOCTO #9775 ]

    Signed-off-by: Ross Burton <ross.burton@intel.com>

The uninative tarball from Krogoth does not include that so native
tools which require locale usage fails badly. I found this issue while
working in a python3 based tool which is used in the 'native' context
and Richard (CCed) has debugged it with me until we found out that we
need to backport this. The use of the new uninative used on master is
not the best option as it bumps the glibc release and requires other
backports (such as pseudo) so making a 1.0.1 uninative release seems
to be the best choice for stable, thus this request.

Best Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

