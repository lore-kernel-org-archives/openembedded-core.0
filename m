Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D9DC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:56:53 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.13961.1719817012842433201
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dj6x1ziA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-36742cc9c12so1748608f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 23:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719817011; x=1720421811; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15+5hRPgkgXt0uC+SQu9Z/U8tLZbcUHJUmeg+oNSZ7c=;
        b=dj6x1ziAEMQ4C4aQXYjxlreSIX4Vm8OMxhPkOIaaoglniXfNEDPC/9C7PlSPLDsJDw
         rT5p9t9smM/Wl5ilX1z51UDbYBds+cQrXTJeKiM0jwdsxtRuGuwwCH07IZFbyEdmv8aA
         Y1JHBUR8MwUq3786dW9fleT55dsZcWNZhhBLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817011; x=1720421811;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15+5hRPgkgXt0uC+SQu9Z/U8tLZbcUHJUmeg+oNSZ7c=;
        b=HzI3EUH29Od/XGoplSiT510G7BmWJuvowfAKuSJGzTpbTLiTRGs5m5Xa8S4wytyc88
         hNbXTimus+2+v7YXCAJ5YzlLMIvMXTmmYvgGb5QpVNMaYgDbun+2BIa6sBBROsGEyX6Q
         eqnSnwy6gD8J+pCrepmQ/1ePnJHSBv5UfZyHvX3xm/uzIuk+WjumfmqwNuMq42/Qda0H
         xW6R58jFpLHU5L6fI22a6wVVkPNNYoJxKLG4E5qWvB2aPssMLOvLASULwqPiuccBmH1n
         sj38PHaqHMB6jFUVr2T0x58z+DPf/AbUWNw0XFR0rjcF4wusdoBrGd6ZXeEIxivIL/Vn
         wWWA==
X-Forwarded-Encrypted: i=1; AJvYcCXH+Czj8U0iSvSublZPkrQf0JhhDzeNroLjfLf83MQSWvGArZGBPFikm+BL5Xlss4HSQlZ0tWeGHu2bYoecFfn12fkrQSH+9b2FCi84DesSRxKhlrMc0hiF
X-Gm-Message-State: AOJu0YzUFzK/1C5VR85xBKfViMhba34oQCkdhjaW+70xouDF+IEhzcS4
	4jy3ufZBorxUo2Qc0Y5kA4/FV/OAKRT1wOFqKbki7KbYvHlRtBe3KMqRct+Lf4c=
X-Google-Smtp-Source: AGHT+IHWA7GhKyO91RcaQiVweUtoC/6XKgxPKzc3NJAk4IxFC8Wat+DF4TFqYggDgELo2PWzGdVsag==
X-Received: by 2002:a05:6000:246:b0:366:f3b8:14e with SMTP id ffacd0b85a97d-367756a356dmr2937268f8f.11.1719817011203;
        Sun, 30 Jun 2024 23:56:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f97:b32e:5e26:d91? ([2001:8b0:aba:5f3c:5f97:b32e:5e26:d91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a102fd4sm9142232f8f.90.2024.06.30.23.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:56:50 -0700 (PDT)
Message-ID: <bce5f93668412736c515e663d39c39696ccabf7b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/2] Update to latest version of SPDX licenses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 01 Jul 2024 07:56:50 +0100
In-Reply-To: <20240627221804.599573-1-JPEWhacker@gmail.com>
References: <20240627221804.599573-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 06:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201280

On Thu, 2024-06-27 at 16:16 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> Adds a script to read the released SPDX license JSON data, and uses it
> to update the common license files
>=20
> Joshua Watt (2):
> =C2=A0 scripts/pull-spdx-licenses.py: Add script
> =C2=A0 licenses: Update to SPDX license version 3.24.0

Thanks for doing this. It does seem to upset one of the selftests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6871

2024-06-30 21:07:48,909 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2024-06-30 21:07:48,966 - oe-selftest - INFO - FAIL: spdx.SPDXCheck.test_sp=
dx_base_files (subunit.RemotedTestCase)
2024-06-30 21:07:48,966 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2024-06-30 21:07:48,980 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/selftest/cases/spdx.py", line 55, in test_spdx_base_files
    self.check_recipe_spdx("packages", "base-files.spdx.json", "base-files"=
)
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/selftest/cases/spdx.py", line 52, in check_recipe_spdx
    result =3D check_spdx_json(full_file_path)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/selftest/cases/spdx.py", line 49, in check_spdx_json
    result =3D runCmd("{} {} -i {}".format(python, validator, filename))
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa=
/utils/commands.py", line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '/home/pokybuild/yocto-worker/oe-selftest-debian/bu=
ild/build-st-296488/tmp/work/x86_64-linux/python3-spdx-tools-native/0.8.2/r=
ecipe-sysroot-native/usr/bin/nativepython3 /home/pokybuild/yocto-worker/oe-=
selftest-debian/build/build-st-296488/tmp/work/x86_64-linux/python3-spdx-to=
ols-native/0.8.2/recipe-sysroot-native/usr/bin/pyspdxtools -i /home/pokybui=
ld/yocto-worker/oe-selftest-debian/build/build-st-296488/tmp/deploy/spdx/2.=
2/qemux86_64/packages/base-files.spdx.json' returned non-zero exit status 1=
:
ERROR:root:There have been issues while parsing the provided document:
Error while parsing Document: ['Error while parsing version 3.24.0: 3.24.0 =
is not a valid version string']

It is coming from here:

https://github.com/spdx/tools-python/blob/main/src/spdx_tools/spdx/model/ve=
rsion.py

in spdx-tools :/.

Cheers,

Richard

