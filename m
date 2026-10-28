Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.975.1793230249365176018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 16:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Mb882LUN;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso89230f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 16:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793230247; x=1793835047; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g/MdtRxXVmbq3i2YHv9xj+cT+vHtBHV1gyV3l1HFlA8=;
        b=Mb882LUNFfXt2cU7O/U7z6BftA2F7eOrPEBi6p5N76mIsPP/DuNBNqJyxNjo1/A1z+
         US2JD2PkVbm68YO0DKOBMECIbYbKMLldKjnq2UOAfl7o9hfYQkNDlvUPqnvl/RlrpXtR
         zKmw0eeonBgKH/Js63+0q+FGeXveT8k88AeIw+wLjIX01rL1Sosb/fEqxcCyXsLDiMM1
         J7XsgY5k9M6ttT1F1ODZxmm7mqsnld3blRMjSpchHP1Qe1m3fpp6p7SBN51T/EEAKXAe
         rx+SB1zSGjY+UQfpFmBI/0cfq2yj1YoPiJpieO1FlnvlMYg7ZDaCFp8Lcm7Ajkn5k9DK
         TPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230247; x=1793835047;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/MdtRxXVmbq3i2YHv9xj+cT+vHtBHV1gyV3l1HFlA8=;
        b=bp+N47IWIw9A3nLgyn8D2LAP5XZIyuFRREgx24PfPZBWcAGzTUC6asU7WhoEld11Zp
         vYNHxEPwtuYWuiVEijDC+XQGIv062w0tQrTx/2X7gWsQ/5nRjyi5jYeEedeFEUoN1Sfe
         li/gS38NJ0q49sPa0RCaZLP/fJEsmLVNG9QIuTyExibt21MXloJtXxaPJDEPfVn8fGY3
         X/QJIZ6bmZ7wedtiB+IZW8e/xAaOoDQz623lVIazGpQbsI0eIWgsBFhlh3PYmeuyuQPd
         1j3SpmMlKFMggdKO7Ys0vqARpfDVFuwK76wd02pjZa3jQ2cxAVBZsHGPw59RYdM8mHK4
         d4Yg==
X-Forwarded-Encrypted: i=1; AKwUvByuAoratKVatiqX3yu2YHFqZggyHGXSmAIT+9DYsBbiYvwJUKi1PTsjt8rW/0Te5T5VVx6DZIrS9q/XyCXqEp/atA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYK75uYUycwLUklAwjPsG3867wFUAOp37r++V705sbvAqrLhLrAZ
	yHvhMgkiF3uvp/SfuG3hbycYS03ZovV54noxl7BHWyMjGqY1xhUUWIbo
X-Gm-Gg: AYBFou1tljrSgXFEi2D10ED1gkCm5tRaZ3k92P4Q4hix0KDmRhEED+CH58Lxk4hK9fD
	w0Lp0qjOb4pjy3ptIkbIyDQUFmK5IzXV/23l+u59NS/jefLLC9mNS7htpw3G19TO7rpKo8rzYYc
	H14wkI8qESVequLspzqZIWVsRJQ0A6YI3SutQ2xzJ8bPsBkK8+nwfV/3w05IFMr+o0rSupC+Blq
	8OiVXBdQtI6C2Zv26oPBfz0CBluCtvjs4vszmJHvEW/OHFNqc077sNfNn0DNJsuUEqMK0xT5dis
	WLRpk6eExopUC+iEYo1zE5IuLTRUaTW/d8AgzuftnuaZ1UzpOZ3eDqohWagcijP83vMoNQzF35V
	0IHsGdAxVCcOQcySeN1QCVqi0vuXR2bYc5uiNrpJH2y1mkYqdKfcc8SWLlVViCtTUrh7hRXuLSo
	FBf53HoFCRjmUjDHT1lX1jEmO4zpr0HtbMIGo0xmroz5hTwLHAfouqHv6ivh6CYgYkFJb31JxLu
	imP7rqQuvsd5DDRurM6sW2Y+e8DlBK50sxWrVKTrpa0w6TCEql9DNKyQJNep2C8gLZz/LGw1aIl
	YsbMVJh/tXiGqKfUMolMR5I/suIihjya8m6XfXJSSY7CxzNLx8ZeYWdJPsROgIsNzkDN5Q9ZPfY
	vUgI=
X-Received: by 2002:a5d:4f07:0:b0:48d:fce6:884e with SMTP id ffacd0b85a97d-48e649749a1mr1785110f8f.12.1793230247395;
        Wed, 28 Oct 2026 16:30:47 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm29403043f8f.56.2026.10.28.16.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:30:45 -0700 (PDT)
Message-ID: <13f70766a0b8e70d1070766ebe1e49afb1b05b8b.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 00/20] devtool: ide-sdk: add support for Rust
 recipes
From: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>
To: enguerrand.de-ribaucourt@savoirfairelinux.com, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Thu, 29 Oct 2026 00:30:45 +0100
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 23:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248855

Hi Enguerrand

Thanks for the series. The structure follows the existing CMake/Meson
support well. The QEMU test shows the whole build =E2=86=92 deploy =E2=86=
=92 debug =E2=86=92
rebuild cycle working. That's already very nice.

Three issues should be fixed before merge. Each is in a reply to the
matching patch:

12/20: ide_none is not updated for LLDB.
14/20: update_bbappend() always reports a change.
16/20: the native rustlib path is built from the target libdir.

Smaller points are in the other replies. Some of them I confirmed by
inspecting the generated .vscode files from a real run.

Also, we should consider to start without C/C++ support mixed into Rust
configurations.

Test coverage is thinner than for C/C++. Cargo has one QEMU scenario
(slirp, --ide=3Dcode only). There is no --ide=3Dnone, NFS, tap or shared-
sysroots coverage, and no recipe with dependencies. We can add this
later.

Best regards
Adrian
