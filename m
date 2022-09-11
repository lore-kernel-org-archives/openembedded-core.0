Return-Path: <joel.winarske@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83698ECAAD3
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 16:12:43 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.11536.1662912762548070461
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 09:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q36rcRJN;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: joel.winarske@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id gh9so14961714ejc.8
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=C3yhaS7csNLJoBiy+l1yl+xmbJJU1g4xiRwWHifWkSU=;
        b=q36rcRJNI1/pNDs+FYOIfr6gUnKGbCYDHY/fPw91HTj2BJO2vUWC6bu2GtTVLPJRAe
         TB5XScicQnwPDnWihsNCHmGdg26c/JVV35ePg6KltRpTIQ1QSCwgUzz066DkdTc0fJMb
         zFqu9Y795yQEzoG6Zvow50JHjAFzDQG5VVXhiIAgpF/mfkeu7BB4modByE9ivB9DRv5V
         9msHd1MeiliUozBJeDyYk72eFJXDCxrllNQmPW7EO42AQzJF4FA6mg4NLUyJt1PVmi6z
         otXDbpU6lurDp/h4zwiX5TKib3kpuB40nOAcEZXOCbbPvE/Y01D5hH6wrfGwaEc7vRnS
         Ougg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=C3yhaS7csNLJoBiy+l1yl+xmbJJU1g4xiRwWHifWkSU=;
        b=Dyiave/pO1uos/4+uVedLG16cwHuCPOSz2UyL8XVSUb2gEdER45/s7mZqXxl3Ui/Ur
         iO1yuLbDRaKH76YnvpcSjoDT/5rzaNyKOSeLoikXLb6+vkuyI7RwulNJou3GJj5osvxt
         Z5LSNn7rWpt5PCjccB2Y1jGRzcApPp/HtzSEfVYJHculMfKqJEcxVcf9I46mooabRYc7
         gjIkzw7bpu3bmGPwxfJah8D9ajg6hzwa0hXnNBbt77XgIa3yrVGsNNDk5R1TTyCIWpwG
         32WBW0ulY8G3+dfhwq42LNbSas7T7Z/l3rlByx9ODmRqg0MiLtKa1c7TPA9KrF5uGcg5
         AIWg==
X-Gm-Message-State: ACgBeo3WzBR2Z5AJ7uUaFjnIHC/5fJE0D+BBBC1qqztRDkUK+Rc4t8IN
	3e4SweyIJmAtcusx4fVVFGNewzaP6DDtpSidoy4=
X-Google-Smtp-Source: 
 AA6agR49LzdrUrtFRELpRptk1/1Lw9p7QR+LvdxRqIRDo3FBvXd91Zf0JSFfyaibuAsS1vPqJow2vRLoQiZvIJ+CYGg=
X-Received: by 2002:a17:907:7f1c:b0:77d:248:c1c3 with SMTP id
 qf28-20020a1709077f1c00b0077d0248c1c3mr1564048ejc.416.1662912760943; Sun, 11
 Sep 2022 09:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <1713A89B64102363.13191@lists.openembedded.org>
In-Reply-To: <1713A89B64102363.13191@lists.openembedded.org>
From: Joel Winarske <joel.winarske@gmail.com>
Date: Sun, 11 Sep 2022 09:12:29 -0700
Message-ID: 
 <CABKMkPJotqNUL=Ye+zyMYMc5xisT+dn7qvfLbezK6d_qkNz2Cg@mail.gmail.com>
Subject: Re: [OE-core] Kirkstone Rust - native only error
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000689aa905e8690ca0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 16:12:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170521

--000000000000689aa905e8690ca0
Content-Type: text/plain; charset="UTF-8"

This resolved the issue - native compilation pass.  Found a clue in
python3-setuptools-rust-native_1.1.2.bb.

cargo_do_compile:class-native() {

    cd ${S}/${CARGO_SRC_DIR}

    export CARGO_BUILD_TARGET="${HOST_SYS}"
    export CARGO_TARGET_DIR=${S}
    export RUSTFLAGS

    "${CARGO}" build run --verbose
}

--000000000000689aa905e8690ca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This resolved the issue - native compilat=
ion pass.=C2=A0 Found a clue in<span class=3D"gmail-Apple-converted-space">=
=C2=A0</span><a href=3D"http://python3-setuptools-rust-native_1.1.2.bb" tar=
get=3D"_blank">python3-setuptools-rust-native_1.1.2.bb</a>. =C2=A0<br></div=
><div dir=3D"ltr"><div><br></div><div>cargo_do_compile:class-native() { =C2=
=A0 =C2=A0<br><br>=C2=A0 =C2=A0 cd ${S}/${CARGO_SRC_DIR}<br><br>=C2=A0 =C2=
=A0 export CARGO_BUILD_TARGET=3D&quot;${HOST_SYS}&quot;<br>=C2=A0 =C2=A0 ex=
port CARGO_TARGET_DIR=3D${S}<br>=C2=A0 =C2=A0 export RUSTFLAGS<br><br>=C2=
=A0 =C2=A0 &quot;${CARGO}&quot; build run --verbose<br>}</div></div></div>

--000000000000689aa905e8690ca0--

