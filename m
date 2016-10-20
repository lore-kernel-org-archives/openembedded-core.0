Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8826E666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 11:05:57 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id q7so48854911qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 04:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l1yaXRusskmeIBKQKayAXBlyo2VjgeLPUZXb3gt4s8U=;
	b=BzRW6jX8SedD+7gP24ikyb42iOiwJNwVBw6XF4pHxjjLERtLc48+gtYfpeIXITAI9g
	CHs1GKwZhYzOhsSQ2h/bF1q+Hv68XdSSRfzodWild13tXpInLY18BgU5gEsl43eunemw
	K/HQb3FIh8SScrPEpYfrdwz0476CdW+6QY7BDGZbjaf4zlQQg01RmqCV0vWHXiBFw7Vs
	iYqvWA6Yz+NyDQ2uWqHuc+zm4QWKIwrC3LhLdKVNUIrJZMIqMSRj++jlEnTl7QutWDoA
	5YvxLmcvDvpB0xQIWfH6x42lz9DcVAvlFVqubtPmn9wKCTAZCjWQ9EH8sge46R7lmAID
	GNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l1yaXRusskmeIBKQKayAXBlyo2VjgeLPUZXb3gt4s8U=;
	b=bi4qRbMv/AVjLlVJsjJrhfgPe1c1815joJgMfDTBQ+3xuzSV2ViDHBdfJrbViyJW+k
	RXZe0TyXfGJEpvhijpVEkBfihhq6UzZ+3NhihWqY/61nzMq9f9qmSt9Y9HoubiYRgjFI
	nmXVCn6FKUblJJJEltk4LbeqU4dUXZIi9IL5DhiMFtQpbmqGDqewhiVeY5Gwzi+OG5wM
	klqBfxaScRImEYEIAHhJXwj2BaO6LrPYpXaVdPsUxuYudg/fYmVHJzGrZRrATvwnQ4w1
	SJwMzjmnc20ERzdqib60UvSNNxa/bgvD46/SYzODecos887FDjyfkudDyH6te7BZWc2G
	pTMw==
X-Gm-Message-State: ABUngvcV93d/0x4XnaNb03x1cCT7bsU8rciWpxBGKvNOSyRXn8XVs1clnx/jP5gOy2X6yHM7ZDFdx5XXT0bbxk6Q
X-Received: by 10.200.40.91 with SMTP id 27mr68548qtr.135.1476961558938; Thu,
	20 Oct 2016 04:05:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 04:05:38 -0700 (PDT)
In-Reply-To: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 12:05:38 +0100
Message-ID: <CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Thu, 20 Oct 2016 11:05:58 -0000
Content-Type: multipart/alternative; boundary=001a11415868115bd9053f49e902

--001a11415868115bd9053f49e902
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20 October 2016 at 09:30, Koen Kooi <koen.kooi@linaro.org> wrote:

> +BBCLASSEXTEND =3D "native nativesdk"
>

The native form fails on Debian stable hosts:

| make[2]: Entering directory
'/data/poky-master/tmp-glibc/work/x86_64-linux/libbsd-native/0.8.3-r0/build=
/src'
| ../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc  -DHAVE_CONFIG=
_H
-I.. -isystem ../../libbsd-0.8.3/include/bsd/ -include ../config.h
-DLIBBSD_OVERLAY -DLIBBSD_DISABLE_DEPRECATED -D__REENTRANT
-isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include
 -isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -O2
-pipe -c -o getentropy.lo ../../libbsd-0.8.3/src/getentropy.c
| x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I.. -isystem
../../libbsd-0.8.3/include/bsd/ -include ../config.h -DLIBBSD_OVERLAY
-DLIBBSD_DISABLE_DEPRECATED -D__REENTRANT
-isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include
-isystem/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -O2
-pipe -c ../../libbsd-0.8.3/src/getentropy.c  -fPIC -DPIC -o
.libs/getentropy.o
| In file included from /usr/include/x86_64-linux-gnu/sys/syscall.h:31:0,
|                  from ../../libbsd-0.8.3/src/getentropy_linux.c:29,
|                  from ../../libbsd-0.8.3/src/getentropy.c:28:
| ../../libbsd-0.8.3/src/getentropy_linux.c: In function
=E2=80=98getentropy_getrandom=E2=80=99:
| ../../libbsd-0.8.3/src/getentropy_linux.c:203:17: error: =E2=80=98__NR_ge=
trandom=E2=80=99
undeclared (first use in this function)
|    ret =3D syscall(SYS_getrandom, buf, len, 0);
|                  ^
| ../../libbsd-0.8.3/src/getentropy_linux.c:203:17: note: each undeclared
identifier is reported only once for each function it appears in

It's not wrong - there's no actual definition of __NR_getrandom in
/usr/include here.

Ross

--001a11415868115bd9053f49e902
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2016 at 09:30, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:koen.kooi@linaro.org" target=3D"_blank">koen.kooi@linaro.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D"gmail-:7kk" class=3D"gmail-a3s g=
mail-aXjCH gmail-m157e13d74bff2543">+BBCLASSEXTEND =3D &quot;native natives=
dk&quot;<br></div></blockquote><div><br></div><div>The native form fails on=
 Debian stable hosts:</div><div><br></div><div><div>| make[2]: Entering dir=
ectory &#39;/data/poky-master/tmp-glibc/work/x86_64-linux/libbsd-native/0.8=
.3-r0/build/src&#39;</div><div>| ../x86_64-linux-libtool =C2=A0--tag=3DCC =
=C2=A0 --mode=3Dcompile gcc =C2=A0-DHAVE_CONFIG_H =C2=A0 -I.. -isystem ../.=
./libbsd-0.8.3/include/bsd/ -include ../config.h -DLIBBSD_OVERLAY -DLIBBSD_=
DISABLE_DEPRECATED -D__REENTRANT -isystem/data/poky-master/tmp-glibc/sysroo=
ts/x86_64-linux/usr/include =C2=A0-isystem/data/poky-master/tmp-glibc/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o getentropy.lo ../../libbsd-0.8=
.3/src/getentropy.c</div><div>| x86_64-linux-libtool: compile: =C2=A0gcc -D=
HAVE_CONFIG_H -I.. -isystem ../../libbsd-0.8.3/include/bsd/ -include ../con=
fig.h -DLIBBSD_OVERLAY -DLIBBSD_DISABLE_DEPRECATED -D__REENTRANT -isystem/d=
ata/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -isystem/data/p=
oky-master/tmp-glibc/sysroots/x86_64-linux/usr/include -O2 -pipe -c ../../l=
ibbsd-0.8.3/src/getentropy.c =C2=A0-fPIC -DPIC -o .libs/getentropy.o</div><=
div>| In file included from /usr/include/x86_64-linux-gnu/sys/syscall.h:31:=
0,</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from ../../libbsd-0.8.3/src/getentropy_linux.c:29,</div><div>| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../libbsd-0.=
8.3/src/getentropy.c:28:</div><div>| ../../libbsd-0.8.3/src/getentropy_linu=
x.c: In function =E2=80=98getentropy_getrandom=E2=80=99:</div><div>| ../../=
libbsd-0.8.3/src/getentropy_linux.c:203:17: error: =E2=80=98__NR_getrandom=
=E2=80=99 undeclared (first use in this function)</div><div>| =C2=A0 =C2=A0=
ret =3D syscall(SYS_getrandom, buf, len, 0);</div><div>| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>| ../../libbsd-0.8=
.3/src/getentropy_linux.c:203:17: note: each undeclared identifier is repor=
ted only once for each function it appears in</div></div><div><br></div><di=
v>It&#39;s not wrong - there&#39;s no actual definition of __NR_getrandom i=
n /usr/include here.</div><div><br></div><div>Ross</div></div></div></div>

--001a11415868115bd9053f49e902--
