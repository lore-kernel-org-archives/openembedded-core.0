Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4A6748A9;
	Thu, 24 May 2018 15:07:57 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id a15-v6so3773224wrm.0;
	Thu, 24 May 2018 08:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jZwUz2Z81dptT/5ubkunSg8E4yYgSjMHCTjzrSpa3zg=;
	b=l1tLdyT+0oOhCB4iAP1HKEHFxoly+z84ed8jbbM4A5tp+wXI+VisXqqyWW7Q4P29Et
	9Nq3/MyGQj5CpmZIxMdrF0cqDBLO8aL5QAEIgbTp6leg29w36AZqI4LFAtj0Fdnmmgei
	uhqfuu2N5u2bJIPLnrjVtpQmDOZwJprunOHedsUA85Flh9CzEQhW35+4rHQaSirbQmO+
	fFxHiW7iyHXt7pZqoey3vX7mt1/uaDYyGgT0Z7vC2TAxfv3Nob9GHfe4K9U4/0GwDp27
	pUy8OHFi6XBa4ipOvJhXyi50cXQDvzVw3TJOTa5mVTXORu25jbFBXu8mESd9vo1gDj4S
	xZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jZwUz2Z81dptT/5ubkunSg8E4yYgSjMHCTjzrSpa3zg=;
	b=qQ/MLivtN5aT9xmyviKhjViFW1tel1L5XU3zNGQcT6ZjmGI9ADk9Umb4Mofnbjdj6U
	SeGINalzkuG1uKiuzCq0CYF41od9aLio8UTMy2MgAb2JO2SyC2zQ0ERU2tpg9fqInt0e
	lpUqiihDI94SG5W0PRLU4NKaPUtiiHygDxE1ozfydHbnMD8BKM+132z4cee+14O24ePZ
	260bgyYUocCvsX7e5ZB+wlkq6XrWjEznGcIcljE0uRiLRVFubM+uG6UhzqczbMXdHVQJ
	lrfvFGamSUrcXoIhuzJ1T5fhTjInQ9ZpNZjU6MsIGW9+zFiWKtmkc//O8282VCZttvPS
	0V8w==
X-Gm-Message-State: ALKqPwfCY1PV5vE/h8w5SEsfPSdM0SJSEeBJZ+CmIw98Ozc9I/Xp0L7Y
	OPjrEm7StTez5T0dLvvDzAU=
X-Google-Smtp-Source: AB8JxZonWZFLyKUWIeci6p9WLBlciF6d5YAo0UF8G3D8/xzablVSmoGqMXcijklAvsOWgU/7KrBL8w==
X-Received: by 2002:adf:9ae5:: with SMTP id
	a92-v6mr6237541wrc.180.1527174478248; 
	Thu, 24 May 2018 08:07:58 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	184-v6sm5228785wmv.33.2018.05.24.08.07.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 May 2018 08:07:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 May 2018 17:08:05 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180524150805.GC1395@jama>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama> <20180517104640.GA1398@jama>
MIME-Version: 1.0
In-Reply-To: <20180517104640.GA1398@jama>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 24 May 2018 15:07:58 -0000
X-Groupsio-MsgNum: 111686
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline

--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> That leaves only few issues in our internal components and strange failur=
e with perf which fails to include various header files:
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:1:28: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:2:26: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:3:25: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:5:41: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:1:28: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:2:26: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:3:25: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:5:41: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:1:28: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:2:26: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:3:25: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:5:41: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:1:28: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:2:26: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:3:25: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/../../../include/linux/list.=
h:5:41: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/util/include/asm/byteorder.h:2:10: fatal =
error: ../../../../include/uapi/linux/swab.h: No such file or directory
> perf/1.0-r9/perf-1.0/tools/perf/arch/arm/include/../../../../include/asm-=
generic/bitops/fls.h:1:56: error: #include nested too deeply
> perf/1.0-r9/perf-1.0/tools/perf/arch/arm/include/../../../../include/asm-=
generic/bitops/fls.h:1:56: error: #include nested too deeply
> ...

This issue wasn't caused by gcc upgrade, it was caused by:
https://patchwork.openembedded.org/patch/150269/
which was included in the same batch of updates when I've included
these RFT changes.

I've sent separate fix for perf with slightly longer explanation what
was wrong:
https://patchwork.openembedded.org/patch/151017/

Now I got a bit further with testing again, remaining 3 issues in public
recipes:

gcc-sanitizers/8.1.0-r0 fails to build with qemuarm (with thumb
enabled):
{standard input}: Assembler messages:
{standard input}:5724: Error: lo register required -- `ldr ip,[sp],#8'
make[2]: *** [sanitizer_linux.lo] Error 1

qtbase/5.6.3+gitAUTOINC+e6f8b072d2-r0 fails to build with qemuarm (with
thumb
enabled):
{standard input}: Assembler messages:
{standard input}: Error: unaligned opcodes detected in executable segment
make[2]: *** [.obj/qdrawhelper.o] Error 1

lib32-glibc-initial/2.27-r0 fails to build with multilib
checking installed Linux kernel header files... missing or too old!
configure: error: GNU libc requires kernel header files from
Linux 3.2.0 or later to be installed before configuring.
The kernel header files are found usually in /usr/include/asm and
/usr/include/linux; make sure these directories use files from
Linux 3.2.0 or later.  This check uses <linux/version.h>, so
make sure that file was built correctly when installing the kernel header
files.  To use kernel headers not from /usr/include/linux, use the
configure option --with-headers.
WARNING: exit code 1 from a shell command.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWwbVVAAKCRA3VSO3ZXaA
HA50AKCBm3S+4YFWAbPKqmLCkbwbEbdbZwCfY9P+WzbKZhe22O+XbYjulm6WHFA=
=r+WF
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
