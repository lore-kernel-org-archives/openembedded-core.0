Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12986.1794489603440104348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 05:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OM7jhY2M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso41646905e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 05:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794489601; x=1795094401; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aZ2wL3QSN9MVr+MAUfykhIaZBIX1c6z3h12p7MFm70M=;
        b=OM7jhY2MHPzCvf0N3A02bRQGKl3ILz/wLhejomg8YkoAIpef++RodmZFL+h0JicwXp
         lY5vbRCGHlM2oNEpjx4+OuVu3ZvgRZqvrnnpMD6Dso8hbzsZchJ58HAV1vQjlepF2cor
         l+9D4NFQhoNZCoIED2aeTppeRK2MaskObm5SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489601; x=1795094401;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ2wL3QSN9MVr+MAUfykhIaZBIX1c6z3h12p7MFm70M=;
        b=Pn4yQj8TpOTLwjRtUTpHyHyHntRtyCZXQ1REc9BdEUH7IcMYpHpKWAWYHrxnLDWlYx
         Aupu0FDqlSi8pFb/05Id+q9VHt5imMTYmiWGzaFWdlNp4SnoyerCeBEZDBcAENRBcOcm
         j5+RCUqEHlsLih8SU6KgnA+whwkzoASBcTREdhlFlPnlr/5a6eXvQB63ABjHTs2q4mgZ
         TOb/M7T2R7uvZlmdXHeq20jJDCR4yDQHUUmPbx1jBIn0EScz5BtPcKKam3I4CQs4pzIQ
         fy+xZ2WYtS7ysT8mujyXeGwfihqkPWVqe3RA4nfwqIwJ2xoeC2vjo2AFVBC7jS+W5/W7
         aOvg==
X-Forwarded-Encrypted: i=1; AL+hErHaZrSxf/z/crfShPnEOq49d54cWCVfhgOI+rNifSjIxSTxcy/wVKyg+vuSG8rWuSZXpHXc72N8F6uEqlBSh5Y3lg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8yaIb7OMSyy3R1B9czUHSEOfaLoANuS36CczMLg6UivTPk+BnX
	B1l4n+oNlQmaHFlBmwKeKcP5KikhmO9HFknpq/CLk8cc57J2XmBoXraiVjzPeoTa5IaBVlsn/Ca
	6oacUtcQ=
X-Gm-Gg: AYBFou3xU/Iff4DRLmixldTUeETHxuLRqUooKbBJxLc8ZdOeeDt+/b5Zu6ZoZWi4Qz7
	mEx23NFPtPAvYkiPrRS6nmi98lHUHenKXm3SKBQ7H9J0/hnPQWUUIjMOFsjks+bncGlvtcymSBY
	XETGLoEIOeC+H6TjQaxkccmKDsFlm8qW5p7nXALA1X88ubL7vI5cBGkWwBCI881ec2r/YK3S6uw
	5X1LG6qqAB7iOKHLEy9Kg9/53SSPhJ4lRWu73ZbWjS1gPTA1CUc/nnXKZBjPQptlL49sQZCN8Jh
	86YXBKqgBIrJceZWKfffT5TSEbt/NsX5rpARa/kkg9VT7Me004B0CuBCPDXXJqVMF+EZeAYQzE8
	oncb8HAMwwUvRk2lYy1LISmlI8kr48MQibAPZ7y60HhI7YD3Cju9ABM/L6njZ2Bh/wMTJcReUTK
	tybcHjd0TuzgECkW1WBObnMKQciqAT+WHSGvGB/dVJK+Rb3IIfzWDfbTM3kHMyaQGET2ZTlmfnU
	Op2gY8et3BSA6cAb+UpktlebTkYdVzH1YdrH0y0gCnyNJnXpYsBzqC02W/Yg6eW5dGu0XDnmghA
	Q7YMA5v0G3e+yZHiZBUosk9x7Nrwu1UfzHTSGmO/IcDN9uooaEhSS0vUyFdU2QyiFJ/343xLZuD
	Nx69PgcVTVcPnnwKTsQ==
X-Received: by 2002:a05:600c:1d28:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4ba0939db75mr110377695e9.29.1794489601537;
        Thu, 12 Nov 2026 05:20:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1562:9f61:e354:1b51? ([2001:8b0:aba:5f3c:1562:9f61:e354:1b51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm79277115e9.10.2026.11.12.05.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:19:59 -0800 (PST)
Message-ID: <04496584f2ea27a4af59b09e4603ebbe50018869.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-yocto.bbclass: capture stderr from
 subprocess.check_output()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Nov 2026 13:19:58 +0000
In-Reply-To: <20261104114341.656092-1-mikko.rapeli@linaro.org>
References: <20261104114341.656092-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 13:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250093

On Wed, 2026-11-04 at 13:43 +0200, Mikko Rapeli via openembedded-core wrote=
:
> Hard to debug failures without stderr in output.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/classes-recipe/kernel-yocto.bbclass | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 43674e8bcb..002782f2ee 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -548,7 +548,7 @@ python do_config_analysis() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for action in ["analysis=
","audit"]:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if action =3D=3D "analysis":
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check_ou=
tput(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') + '/=
.config' ), '--blame', c], cwd=3Ds, env=3Denv ).decode('utf-8')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check_ou=
tput(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') + '/=
.config' ), '--blame', c], cwd=3Ds, stderr=3Dsubprocess.STDOUT, env=3Denv )=
.decode('utf-8')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal( "config analysis=
 failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')=
))


Whilst I understand the intent here and agree with the goal of
improving the error handling and failure messages, I think mixing
stdout and stderror is likely a bad idea.

We already have exception handling there, can we improve that to give
better errors instead?

(same comment to the other similar changes here).

Using text=3DTrue to subprocess would get rid of all the utf-8 decoding
too FWIW which might simplify the changes.

Cheers,

Richard

> @@ -556,7 +556,7 @@ python do_config_analysis() {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if action =3D=3D "audit":
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check_ou=
tput(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') + '/=
.config' ), '--summary', '--extended', '--sanity', c], cwd=3Ds, env=3Denv )=
.decode('utf-8')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check_ou=
tput(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') + '/=
.config' ), '--summary', '--extended', '--sanity', c], cwd=3Ds, stderr=3Dsu=
bprocess.STDOUT, env=3Denv ).decode('utf-8')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal( "config analysis=
 failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8')=
))
> =C2=A0
> @@ -593,7 +593,7 @@ python do_kernel_configcheck() {
> =C2=A0=C2=A0=C2=A0=C2=A0 # passed a valid meta-series for processing
> =C2=A0=C2=A0=C2=A0=C2=A0 kmeta =3D d.getVar("KMETA")
> =C2=A0=C2=A0=C2=A0=C2=A0 if not kmeta or not os.path.exists('{}/{}'.forma=
t(s,kmeta)):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kmeta =3D subprocess.check_ou=
tput(['kgit', '--meta'], cwd=3Dd.getVar('S')).decode('utf-8').rstrip()
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kmeta =3D subprocess.check_ou=
tput(['kgit', '--meta'], cwd=3Dd.getVar('S'), stderr=3Dsubprocess.STDOUT).d=
ecode('utf-8').rstrip()
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 env =3D os.environ.copy()
> =C2=A0=C2=A0=C2=A0=C2=A0 env['PATH'] =3D "%s:%s%s" % (d.getVar('PATH'), s=
, "/scripts/util/")
> @@ -608,7 +608,7 @@ python do_kernel_configcheck() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env['CLANG_FLAGS'] =3D "=
 -fintegrated-as"
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configs =3D subprocess.check_=
output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=3Denv).decode('=
utf-8')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 configs =3D subprocess.check_=
output(['scc', '--configs', '-o', s + '/.kernel-meta'], stderr=3Dsubprocess=
.STDOUT, env=3Denv).decode('utf-8')
> =C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal( "Cannot gather=
 config fragments for audit: %s" % e.output.decode("utf-8") )
> =C2=A0
> @@ -627,7 +627,7 @@ python do_kernel_configcheck() {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # category #1: mismatches
> =C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check=
_output(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') +=
 '/.config' ), '--mismatches', extra_params], cwd=3Ds, env=3Denv ).decode('=
utf-8')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check=
_output(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') +=
 '/.config' ), '--mismatches', extra_params], cwd=3Ds, stderr=3Dsubprocess.=
STDOUT, env=3Denv ).decode('utf-8')
> =C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal( "config analys=
is failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8=
')))
> =C2=A0
> @@ -649,7 +649,7 @@ python do_kernel_configcheck() {
> =C2=A0=C2=A0=C2=A0=C2=A0 if bsp_check_visibility > 1:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extra_params =3D "--stri=
ct"
> =C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check=
_output(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') +=
 '/.config' ), '--invalid', extra_params], cwd=3Ds, env=3Denv ).decode('utf=
-8')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check=
_output(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') +=
 '/.config' ), '--invalid', extra_params], cwd=3Ds, stderr=3Dsubprocess.STD=
OUT, env=3Denv ).decode('utf-8')
> =C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal( "config analys=
is failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8=
')))
> =C2=A0
> @@ -668,7 +668,7 @@ python do_kernel_configcheck() {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # category #3: redefined options (this is pretty=
 verbose and is debug only)
> =C2=A0=C2=A0=C2=A0=C2=A0 try:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check=
_output(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') +=
 '/.config' ), '--sanity'], cwd=3Ds, env=3Denv ).decode('utf-8')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 analysis =3D subprocess.check=
_output(['symbol_why.py', '--dotconfig',=C2=A0 '{}'.format( d.getVar('B') +=
 '/.config' ), '--sanity'], cwd=3Ds, stderr=3Dsubprocess.STDOUT, env=3Denv =
).decode('utf-8')
> =C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal( "config analys=
is failed when running '%s': %s" % (" ".join(e.cmd), e.output.decode('utf-8=
')))
> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249371): https://lists.openembedded.org/g/openembedde=
d-core/message/249371
> Mute This Topic: https://lists.openembedded.org/mt/122090961/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=C2=
=A0[richard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
