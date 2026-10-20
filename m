Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1333.1792476672648342564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 23:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Efvkm5Yl;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a98fc80925so21357841fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 23:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792476670; cv=none;
        d=google.com; s=arc-20260327;
        b=fysDg4TFD4m5Qa4RQKRcJ7n0xeeAKAHUEDOWV93gWB9qYzNZxkwDg4vFoahZ64iCTG
         ow6RoWvttsxn9N7b8Nd9Jv+Zdt9TV8FtHAOVvV4FyWhqAWY9560ua+/+Dc/ysEGlSNIm
         Qlpa8GK1IgkgGWNWUDrsvwqnnBDZRjxowA57Eh3a+xLcaN5k+OuWOtREs1o/UDx5qOdS
         nf+bl4Dv1qSLhR57bEXiOtZnN1nEXcQpn1w66ZJiw79A/W1TWqEN5Atzi1vW/WR66XsM
         FqgToUgG2qTAa4E7Yn2K8qk1WkSY/2vOJpnhwTTjtNdBKfaHspTgaA+gf07FMYKXFvtJ
         1mqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t5jFOrGrqXpXsYWmHU4LZTCAyUZ2bXjm/k0NUYqqJoc=;
        fh=TGAJ7QN59OjB8lo9bvDUHuorkqAYrWv9Infvq7Fr0k0=;
        b=rqSUkVnDs+3eV4b/R4/zv2ORd3490ov1URJrAfFpgFxt45fgMQ+bXqXCa5LIqZuV1D
         AXGbuN+Fyj5zDcfyrrN+cvUw8ThLqt7zr6ZUTplC5/OFoVVfpQv9SLKsK5p4GEqWTeMg
         En00XWwxzfJSa8eF4HhI9cLpMdQDgOsG+1s/22B6Vf5CzxuUb12k/weVJI7c8bndrIAk
         mrok7v1X7wg5daOQRMsVVuqcEXPNH8p820TPKgQeYwrYY22sNk0KybvzL2XnJ23YTMvZ
         ICvNVy0O4OpdGe/0FycbruhvuSMNTcTRa8pkf6oyQfNm3Jq1W+zvQdzo5W6sNzX9yH10
         6uMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792476670; x=1793081470; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t5jFOrGrqXpXsYWmHU4LZTCAyUZ2bXjm/k0NUYqqJoc=;
        b=Efvkm5YlvdrohN8tfNSTqoxv5LVfzvhNyvh9Gu5zm6C2oga9gf5aFbDd3cmtObo0wf
         nxSQF4RWpo31GbDmUaDCg9DFzpQY0qEXsgOGlNo6wGImYt780X/a18Wwx3+EPTxExgE2
         fc3JNubVnGVk/Y52W7u3a12vXyX2UcUx7mPKbdRG7LBZW3gk2R/oRDfJ7aqH4gTcBacN
         /f4kHYrXhqp4x3nZFxfgnf5Fe4GbmhZnvQuhL/7rs5H3757fqeNXTYFKQTFEduUX6Dn/
         XIpH3cqhW4lnTrJvZZd+mLfjolx/eIxvAay6JOUD6SavMqeX/0ppgV52Ul3lQgMBJRyc
         Q6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476670; x=1793081470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5jFOrGrqXpXsYWmHU4LZTCAyUZ2bXjm/k0NUYqqJoc=;
        b=No2uOAmW7cddm0ahKxm/ztXbVJ47KfANN67apN0yILlyY/YhLuy24TAY5w7nJoQY7J
         z7ndYK7djDTIy0QJtkPnXTsWlQaCrZPy9u/ZlbV767ajYzzLjK+XnuL7iJar/dHiIbBs
         iLsaPm6IG4AZBUL6LZeL9o9YsVMi5htKDEJ+CnGt0jjDPOv/vdXKP00ecYTaG3J9gNPh
         9nUpo7YhbWfjFCdx9lhSFvsNyo9DexmE0/4E/2TofNHobHIJR7sX0fpxoG6No8NeDhP+
         zexzgpIdXHvJEbyCwWlkKLCgiH0HZE159LCeEUCILJvWfRPJvc8c1JKQVY/EM9IpfqFe
         RKfw==
X-Gm-Message-State: AFq9FYIt6pEOJAuhAzGFWYJqi4kMzr9WX/tFPUPOvfxzXqSOkO0EYzE+
	3a7/GfuYRS56Ad9rXgmLZZ0McPoNXbEsbh+ECcm0poGIW31TQ96+2lTtSp1SZGHJnyWRmM1AAyp
	10UEv4Swe2H3VuBUhSZ1Nyx9K80lV6dk=
X-Gm-Gg: AYBFou1MMLHCXD/vEJOT0cxz2GxW1oECUOXG4amus4rZeMOzkXVJnEneQ7wIWoeJKz9
	FXOuIbtpjVA0uG5FoTU6fVjEPF7220JZ7gzL9mCNfoe7z99QbRMK/htsLIE4Ci2+C17g/7Dvuxv
	79bgaKQCmFHSO9pmRlQaC+CWjvmPxMtIIrTCXM9lc0hijDk/Dq895ncQaGhmpoh4oJCxiU2DEon
	6uLNXb5GEloHmG4JOeTNqEXrp0RfUHw9WZnjJh+te6LyOAkCsEjqe/i2DMJjyOBnbUf4P5/JylE
	tkMcD6Fw+uJXiqomGJtPyohqPC39bXZChsla0v37Q6XlI29ntkjXWsHdCHw3AjQBd1lEbIimkO+
	kBwlMmizpSyCvY8J0XSNJhtKVoLyZqz/S7vsK
X-Received: by 2002:a05:651c:222b:b0:3a9:a1ed:6341 with SMTP id
 38308e7fff4ca-3ab2913a3ecmr22116271fa.11.1792476670056; Mon, 19 Oct 2026
 23:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261019112517.1676091-1-martin.jansa@gmail.com> <2478518.1792458732381124777@lists.openembedded.org>
In-Reply-To: <2478518.1792458732381124777@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Oct 2026 08:10:57 +0200
X-Gm-Features: AclHuK_7erVlD1ZkFyNkiWmhCVVnntH9XixcPtlNrZlar-R8TUdT-3KgGDFdXIM
Message-ID: <CA+chaQdmwqj3GfYw2yE1srjc6qCw0wuU_-1OLq66+wpOcB65Gg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: use Release instead of MinSizeRel
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 06:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248219

On Tue, Oct 20, 2026 at 3:12=E2=80=AFAM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> Thank you, Martin.
> What do you think about changing this to release only for native and nati=
vesdk?

I didn't measure the performance of clang in the target, but the disk
size impact there is even smaller than for clang-native (just 4MB for
target compared to 30M for native - not sure why), but some people
might be using target clang for doing the builds as well, that's why
in commit message I've mentioned:

In theory we could use Release only for clang-native and
leave MinSizeRel for target clang (assuming that most people don't do
many demanding builds on target, but that won't be true for something
like build appliance built with OE).

Cheers,
