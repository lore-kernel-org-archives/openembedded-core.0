Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7060.1794641612448832921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 23:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Q2jgy/FH;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso13525065e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794641610; x=1795246410; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ijO9fNE8aLJMvtW3oJROQsXmCebEJXIgVxtyYDjHKU=;
        b=Q2jgy/FH7auC2wAR3WLbkuW6ls5tYtUR04bhGjO1zdGAFcKGtNKsggL4k91y892lbf
         O1fB7ijHFamOgx+f+gh4GyfJJ6gItglYOxPPWHzdHbMKfP/8kc1KvS46YyjKhWtItJ4m
         SplVR7hp9ZGu+7TomXvFvv0s/kMQ/vSVbCZtltum1T5wyaZGtuZtTAUL0tsbvTLrTkfH
         tWMSzJiwVQ5eVtimo81fqa1ox12IzkBwd/ZBAWUl6sgmiMGs1wS9ZEfi8nMTIdOaoHzi
         thgptBeOIu221SPu/vyyACA9ZxQluYRKdM96goC4nD/NhUOrXVoQfOE9HQupJwjWuY6T
         BAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641610; x=1795246410;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ijO9fNE8aLJMvtW3oJROQsXmCebEJXIgVxtyYDjHKU=;
        b=CO7TTimxTfdBUOBoxDnqbeccfRObsUUYjhvmS4ltnl7x0RNr70ruAlOgEYK8lMI7dg
         0mVnuRZCq0qjx7ypTx1UwvCzvNprPzCzX2w0CSfXWINQWD8DzRM0h9WSdWf1HNOUvC4i
         yx/BbPPHf5VFQyLRgln5QqX1VzPx9kF7UOOIoxrpkv8A19UdUoKXpLNuuG8aqfBa+Qzk
         ke+fVPNi7Xva8jFL/PUda60IlvMS2Lf1QbTKUtt7F8Um8YSoTI8Ecum93Bsh1IMSi+na
         tY7hfeUTY4kg7X2Gm6H10S5Ly4IVeU7dZT7ORPFE7Ljo2+1lHpiDuEYRBzNzXRcUIjFE
         sTTA==
X-Forwarded-Encrypted: i=1; AL+hErGXni7VPXojIn8+rI0Gqa1Bd+TFNInvdGyZjOhJMXvcVipMIAIaUlUrz7SuUAboSPvhGLb4z1NwdQE/ZuT2Z04Utw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/icu9jlPUI4wbmiR5JhFf7jtjeu0TpVbnirY8rjQAmO+VCa/Bi
	jPuXvbgo0sL1QkOsBZShHXckK/6TNb6jKyqpg+Xv8rbMhkm96iyS86BmLnf61fieVxM=
X-Gm-Gg: AYBFou0J+rZd3POt5oMifVgQ5SIyR+m0oLZH5TA2+fF76XNeYH+5/APzLQJMXLtF0gv
	vE90hDM9m66fUGPPQD54dtp7GFnUxxxEKaD0UXAw21LwG/PWCYAn0StNstx/HTrt/Ta/1pr2grw
	lu+5ZKJBStDJ9vEx3R8qVaaF5kOWorErJ69auOw6ibp395mC87ctBw6SY1mo1NqDS1CNCOO2Kwx
	695YGMHw68iQn20zq05swNJwIgYZ1thMddqDNRzM8EpuSPU7T0H3tI3reSRwMnqcMt7G/GwBNJR
	lbyRBEVGoLjSUo7Q+QJG6l8bnz2kiY7AkmSusdBTsVRr5RDTwECSqdO79KBS5VvIusnS/n7dAEM
	JlCcEbayPGwOfp6pavUpQwIM79z3Zm1MJX00XudGnNWpi/5CdOKHnkHOQVemXvMQU3u6va1mg5H
	o0ULyDNQzrx98qk84xXi7vXPVeyl5IDniJGc83lZ9ISP3WTbRYJ9l2Kj+mr4OHihlAfihzhT3mA
	cQEmgtPUwX1HmDfJ8uOChI5bgkkNzBkBNvM1W5j1lxn2709QbpBgGDpF6JMCes7oSwSuuL/bftD
	mR7JHP4dIOvsvasEU9cud6aQgjUEc7UFV40PnFkCAtv08W3SVnjXlRObsuP7Dmp6fD2M5CBj//q
	uF4vwTzygf2+7+UxOVg==
X-Received: by 2002:a05:600c:8b34:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4bb559f7039mr99926145e9.3.1794641610446;
        Fri, 13 Nov 2026 23:33:30 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e33ae5bsm187293755e9.3.2026.11.13.23.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:33:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 08:33:29 +0100
Message-Id: <DMURCTWBY1Z9.B5YQCG1DVGUB@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] bison: Fix CVE-2026-56390
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260928162713.2651011-1-yurade@cisco.com>
In-Reply-To: <20260928162713.2651011-1-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 07:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250198

On Mon Sep 28, 2026 at 6:27 PM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=3D8d101c1=
9d4d9aaedf83a448c925513742d4efcf0
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-56390
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>

Hello,

This patch make bison-native:do_compile and bison-nativesdk:do_compile
fail:
Lots of example in https://autobuilder.yoctoproject.org/valkyrie/#/builders=
/29/builds/5120
A random one:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/66/builds/5108/st=
eps/15/logs/stdio line 3796:
| /srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-3005866/tmp/host=
tools/mkdir -p examples
| touch examples/extracted.stamp.tmp
| Can't open y.tab.[ch]: No such file or directory.
| VERSION=3D"3.8.2" /srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-s=
t-3005866/tmp/hosttools/perl ../sources/bison-3.8.2/examples/extexi  ../sou=
rces/bison-3.8.2/doc/bison.texi -- examples/c/mfcalc/calc.h examples/c/mfca=
lc/mfcalc.y examples/c/rpcalc/rpcalc.y examples/c++/calc++/driver.cc exampl=
es/c++/calc++/driver.hh examples/c++/calc++/scanner.ll examples/c++/calc++/=
calc++.cc examples/c++/calc++/parser.yy examples/c++/simple.yy
| make: *** [Makefile:9604: src/parse-gram.c] Error 127
| make: *** Waiting for unfinished jobs....
| extexi:  GEN examples/c/rpcalc/rpcalc.y
| extexi:  GEN examples/c/mfcalc/mfcalc.y
| extexi:  GEN examples/c/mfcalc/calc.h
| extexi:  GEN examples/c++/simple.yy
| extexi:  GEN examples/c++/calc++/driver.hh
| extexi:  GEN examples/c++/calc++/driver.cc
| extexi:  GEN examples/c++/calc++/parser.yy
| extexi:  GEN examples/c++/calc++/scanner.ll
| extexi:  GEN examples/c++/calc++/calc++.cc
| mv examples/extracted.stamp.tmp examples/extracted.stamp
| ERROR: oe_runmake failed

Regards,
--=20
Yoann Congal
Smile ECS

