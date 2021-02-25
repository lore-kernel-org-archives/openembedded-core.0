Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.112.1614272451084867836
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 09:00:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moseleynet.net header.s=google header.b=JcHM3SIy;
 spf=pass (domain: moseleynet.net, ip: 209.85.160.173, mailfrom: drew@moseleynet.net)
Received: by mail-qt1-f173.google.com with SMTP id s15so4602535qtq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moseleynet.net; s=google;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-language;
        bh=DPO6KCCRxis9WykeRvNzaPJvbWLnq4knwkTGe2ZaBho=;
        b=JcHM3SIyCKDVgmTJgHHoPnVPYhZaHUnjOKa1LrsqN3PTBTVV2sybJ/KYQj2NfSK7Ur
         k2l4WtqN4yaXQ2MnqTejIbaWEhIQwCYT+aC93sE+G5gUXpxbQGMr/6WpC9SBdiNz+Pfc
         M234t9Nu2oTR4vHn/zESm/4pObuKpI4itvzMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-language;
        bh=DPO6KCCRxis9WykeRvNzaPJvbWLnq4knwkTGe2ZaBho=;
        b=QFXMmRYPZtLvFIS/wka/+hqjpHHgbp7s8GOGyRSqjjttYJFldBL8oc+fr9Vug7/yhb
         WRj96XvqbuUcLBevFWrsosoSHXMUl4nMtfOszoim6ETycAmtRXLPelRVM+dxFwmpxuNN
         3fJRJ09ljCtdfq/NUaocx1KUTfmAs0lrIoBWxDhfcKWaZAeCzXBLI6tpO1/kT7oZfRDn
         m5Fv4BP9o7QOZOe9H/b38xc1/OUvNwJdzfJi9N0FhcRzfQob/L3etzcJzsyK2XfWtF9c
         Wzu8KI2jnF10ez9O/kzaXVfaTyqiE0WkOieTbrfG+OzFn5iANVAaHscS+GwUQlIUDAU4
         rCtQ==
X-Gm-Message-State: AOAM533mzvnK6q1Gmb3Y2Ym2aLhHoPOjmP8KycCDRNDluLhONRfBzg3c
	yCtlD+DPrrSwGIJDvhSmjLtoj0qPgjTWon/A
X-Google-Smtp-Source: ABdhPJzzQc3Ex07KrgekydrRMcfjP009DCj8fz6g6C14cyjJOHjxVOVZXPF1byPUdh5COCy2oGox3Q==
X-Received: by 2002:ac8:4d59:: with SMTP id x25mr3126747qtv.44.1614272448765;
        Thu, 25 Feb 2021 09:00:48 -0800 (PST)
Return-Path: <drew@moseleynet.net>
Received: from aruba.home.moseleynet.net ([24.96.56.90])
        by smtp.gmail.com with ESMTPSA id l129sm987924qkd.76.2021.02.25.09.00.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 09:00:48 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: "Drew Moseley" <drew.moseley@gmail.com>
Subject: DTC_FLAGS with devshell
Autocrypt: addr=drew@moseleynet.net; keydata=
 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
 alb5dL99r1Dy6w==
Message-ID: <be6caeb7-3822-a710-be04-9b57f658331e@moseleynet.net>
Date: Thu, 25 Feb 2021 12:00:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------B24C5BEC7C690F4968842AA8"
Content-Language: en-US

--------------B24C5BEC7C690F4968842AA8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm having difficulty using "bitbake -c devshell virtual/kernel" to
build dtb files properly. In our case, we set "DTC_FLAGS=3D-@" in recipe
metadata to ensure device tree overlay support is available. It all
works fine when run as a standard build.=C2=A0 In the devshell, that vari=
able
is not respected by default. I do see that there is an EXTRA_OEMAKE
environment variable with HOSTCC, HOSTCPP and DTC_FLAGS set but when I
try to invoke "make ${EXTRA_OEMAKE} dtbs" it gets a weird argument
parsing error presumably due to shell globbing, quotation mark
processing etc:

    # make ${EXTRA_OEMAKE} dtbs
    make: invalid option -- 'y'
    make: invalid option -- '/'
    make: invalid option -- '/'
    make: invalid option -- '/'
    make: invalid option -- 'E'
    make: invalid option -- '"'
    Usage: make [options] [target] ...

If I manually copy/paste the value of EXTRA_OEMAKE onto my make
invocation it works. If I just add the DTC_FLAGS it also works (ie "make
DTC_FLAGS=3D-@ dtbs").

Is there a better mechanism for handling this?


Drew




--------------B24C5BEC7C690F4968842AA8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello,</p>
    <p>I'm having difficulty using "bitbake -c devshell virtual/kernel"
      to build dtb files properly. In our case, we set "DTC_FLAGS=-@" in
      recipe metadata to ensure device tree overlay support is
      available. It all works fine when run as a standard build.  In the
      devshell, that variable is not respected by default. I do see that
      there is an EXTRA_OEMAKE environment variable with HOSTCC, HOSTCPP
      and DTC_FLAGS set but when I try to invoke "make ${EXTRA_OEMAKE}
      dtbs" it gets a weird argument parsing error presumably due to
      shell globbing, quotation mark processing etc:</p>
    <blockquote>
      <p># make ${EXTRA_OEMAKE} dtbs<br>
        make: invalid option -- 'y'<br>
        make: invalid option -- '/'<br>
        make: invalid option -- '/'<br>
        make: invalid option -- '/'<br>
        make: invalid option -- 'E'<br>
        make: invalid option -- '"'<br>
        Usage: make [options] [target] ...<br>
      </p>
    </blockquote>
    <p>If I manually copy/paste the value of EXTRA_OEMAKE onto my make
      invocation it works. If I just add the DTC_FLAGS it also works (ie
      "make DTC_FLAGS=-@ dtbs").</p>
    <p>Is there a better mechanism for handling this?</p>
    <p><br>
    </p>
    <p>Drew<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------B24C5BEC7C690F4968842AA8--
