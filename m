Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 27B3675EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 09:18:46 +0000 (UTC)
Received: by qkcn129 with SMTP id n129so43265973qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 01:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=prLwydX3WU9jDlAGgCxJAijiRzlh4RM2JaibWnm/yuQ=;
	b=NiH1AvkIZmQzWFgC5WekFI1LtRKcd/u2fM+r5wLp0Mt101n0AtDRe/ijkaM+7vKGzl
	syL8EARNMlBkWuHWuJ1L4JxDuPhlvOXwlidSRs+tWtDYiXzJqCrd7Lr5plfV9k/yJjiB
	Decz7//g3Egry1/G7J+1Vqzqu/oMS0MqrvxUKRo5qi0541OXwX7pJoB5MQbWuUEaGGAA
	48/T9W7SODZ1faEBvA1iDN4e8CnDVOdFkkEG36i41H8q7SfoP4AkoSJdyc3tPH3n6Rw5
	qddnLO+UTaYVeulxfeg9x1FLon4bUCW5GBc7q6jMlPDqEVk5gtVpYMkb1q0376uEnsNd
	rXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=prLwydX3WU9jDlAGgCxJAijiRzlh4RM2JaibWnm/yuQ=;
	b=TBtgG0u75ikTIq+KzJSyrxWtm9FiUi2wtG3M+gdHZnkLlEhrTDaTWmP2tR0wSdjq53
	s01zEKI/VQUEPP6rw9RFhPGIaltMYHqfT+lXTJmmNqbzI1JWkFljgaeynlSMRLt87ylB
	eGXfHXMK84IRSLugKy/00hg6tWws+BxOPXvoYZuaTTQ3YtVLSw0t1DmwplQ8a20TFj+X
	U44oZkOl1zQ4o0lLsb/4HUtmiCwIy4kN55SuKKfeDotG4REy+qCPyLDH5O/fxWcucOyN
	mSzGet7vGr63CT7EMkjTz2xJTthxbhxXLwmtnLlwjwRiSTPyAVZrTbVsPEcSumEtzrfv
	BZsg==
X-Gm-Message-State: ALoCoQlhpTLAZ+kObMkB7ju2nYvYjVG7pexmVYuK+kwE0U4rHzlkIVaOk1zBXNuolVwoSTApvKK4
X-Received: by 10.55.73.144 with SMTP id w138mr12328212qka.104.1446801526782; 
	Fri, 06 Nov 2015 01:18:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Fri, 6 Nov 2015 01:18:27 -0800 (PST)
In-Reply-To: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Nov 2015 09:18:27 +0000
Message-ID: <CAJTo0LYA78vJehCoLLeGu8DwQCrRF=bV7RKs=BvH4fY8SsmSZQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Fri, 06 Nov 2015 09:18:47 -0000
Content-Type: multipart/alternative; boundary=001a114a9f441096120523dbbb78

--001a114a9f441096120523dbbb78
Content-Type: text/plain; charset=UTF-8

On 27 October 2015 at 16:05, Otavio Salvador <otavio@ossystems.com.br>
wrote:
>
> The U-Boot 2015.10 has been released at October 20th 2015. This also
> removes the GCC workaround, for the inline behavior, as this version
> properlu supports the GCC 5.2 as compiler.


Breaks on the autobuilder:

arch/powerpc/lib/cache.oarch/powerpc/cpu/mpc83xx/cpu.o: In function
`ld_le16':
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12:
multiple definition of `ld_le16'
arch/powerpc/cpu/mpc83xx/traps.o:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12:
first defined here
arch/powerpc/cpu/mpc83xx/cpu.o: In function `ld_le16':
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12:
multiple definition of `st_le16'
[and another hundred pages or so]

http://errors.yoctoproject.org/Errors/Details/21468/

Ross

--001a114a9f441096120523dbbb78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 27 October 2015 at 16:05, Otavio Salvador &lt;<a hr=
ef=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt; wrote=
:<br>&gt;<br>&gt; The U-Boot 2015.10 has been released at October 20th 2015=
. This also<br>&gt; removes the GCC workaround, for the inline behavior, as=
 this version<br>&gt; properlu supports the GCC 5.2 as compiler.<br><br><br=
>Breaks on the autobuilder:<br><br>arch/powerpc/lib/cache.oarch/powerpc/cpu=
/mpc83xx/cpu.o: In function `ld_le16&#39;:<br>/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-ppc-lsb/build/build/tmp/work/mpc8315e_rdb-poky-li=
nux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./arch/powerpc/include/asm=
/byteorder.h:12: multiple definition of `ld_le16&#39;<br>arch/powerpc/cpu/m=
pc83xx/traps.o:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-l=
sb/build/build/tmp/work/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+=
5ec0003b19-r0/git/./arch/powerpc/include/asm/byteorder.h:12: first defined =
here<br>arch/powerpc/cpu/mpc83xx/cpu.o: In function `ld_le16&#39;:<br>/home=
/pokybuild/yocto-autobuilder/yocto-worker/nightly-ppc-lsb/build/build/tmp/w=
ork/mpc8315e_rdb-poky-linux/u-boot/v2015.10+gitAUTOINC+5ec0003b19-r0/git/./=
arch/powerpc/include/asm/byteorder.h:12: multiple definition of `st_le16&#3=
9;<div>[and another hundred pages or so]</div><div><br></div><div><a href=
=3D"http://errors.yoctoproject.org/Errors/Details/21468/">http://errors.yoc=
toproject.org/Errors/Details/21468/</a><br></div><div><br></div><div>Ross</=
div></div>

--001a114a9f441096120523dbbb78--
