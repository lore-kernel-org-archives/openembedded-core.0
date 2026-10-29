Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9693.1793273705120143271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=pm51DKOO;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Gu4aHQRf;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 48D0D1D000B6
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 07:35:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 29 Oct 2026 07:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793273703;
	 x=1793360103; bh=hHmhOjgaSub2fY0vcCUWfJJ1rcRARn3Vtbw9SXN7Y2Q=; b=
	pm51DKOOcucE+rIxG8XpMI8iYoUyD6gcW+46RshgnUCmjN9sscy1c8WzRYP3sMVZ
	yEc7Lyxcekaty9+EJsvrYztEOAwqGk3Os6YcgX6CMq7IxpSArvwn7PDSaueTFAUG
	V5mwB7ikuz3bbtJuqLX3YHR4aEAyi3xGrFx8Y8C6/7WuH3eWoJ/LV73EPRL+6qYF
	z0PgfgJnhrUnnxPTrbu4lQYrxY9dOyNiBcNjcuZyikYxMjv2dOnCnu4ouJ21Tbdx
	stL+edTjbY3GHfe/0T/x1UwCb7cEgE2XPotSXwH+NWNRMCm5sa5T4SpLbowAYqI0
	KnTfXq6/LO+SMRWVXeG4nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793273703; x=1793360103; bh=h
	HmhOjgaSub2fY0vcCUWfJJ1rcRARn3Vtbw9SXN7Y2Q=; b=Gu4aHQRffmYtcNx7r
	4i4+xmJUe+fiBMOPOgYhuA5GZZiiesyPXjt8w5dLXOSRdgp12SGRaZPnbSB2OrwI
	Ocm6axHAF/nBrep4zzWu1jiLw7k92CX/Ww/GUkzrjlx491Tu1Q+uS09fU5g8mZYe
	2TrAL+M/4pjZU8TOYIjk+Ok/QYPMN9nH7Sq4ncNlLN2HEARx32zYuGV43VCeaLEI
	t5il9YWqfWKfyaV+xzBWU8uZzaCJZzl16gyUAvvJVPgzX+cFu+5+4XKdyFAD8x2C
	o+L7JWQzS18nYHQ9VcIfwoDQsI+bKF+TyyUOHDK6+LNSTW6hPwl7yGZTJu9mO2LX
	E6WHA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793273703; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:cuhr0W34I2ATsl59+k+thOZJuZzOcCI7Zmv3A2BESdjpRqN
	totoZOwY3gARza4/JV64wlQ1+SZGB69K3rvUN+ErGYdLRqVM0MViHX93rKpeUC27
	TchrtoTWzK8tdT8EXmgFTxbCjWKDIHQY3HW2Yra6CdXq54Ev0MjhdhsClPyzNvCp
	Z83ZWSa4XZCdP9hIYj4OBlAPb9Jb/5G8s9jC7nk8eFUY8+whYrNcMChAZ/GdL8xd
	SGeCi1VxH3te7d0Bqs77CvLJOb+junTaGkSySjc9b7CWSpuaHJmNS/z8SWjtZMqM
	IPxT/wvDDLp3eQdj/8QtadQWaQdPKiV54L+c4CQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:ypdzF1dFbuK6Pt4POeuzgnpBvBybSTcrzFtcIjMRaC0=:ktryDiagj67WHTIXSch07NgXtqTWPJHAB9GRq+H2Axc=;
X-ME-Sender: <xms:Zy_jasmFAxhE6toCKNhTX---t1vqjN6tUJ74NVHB2uqWo-BiIHUNdw>
    <xme:Zy_jah0skt-E7qouXrX_mRczBXWVHBBvKF9UwFFHH6yzUeA-s-M6tKtlGPcUI11bs
    Hq0wNtQdrQzg6C4JkxMOXMYxSV5dLbi3evRbFRMZYT1LO4-hzvpgM0>
X-ME-Received: <xmr:Zy_jaoTM44kJqSJg4PqDqK-WtdRdMFTH9FY9VLz_Wmk5l7-BTChXKNnnuUXCxLsHu2qsAPKdEkPExIaCBN0YAdmmvrkqx9sCMN_kli8>
X-ME-Proxy-Cause: dmFkZTEU3K+ALM31s1Nz/PtLKbYbJBuJjZrgIcZvwa/I+wYhTi+6KSykTHobY/hLx8tmfX
    boO9zvQdot7FszZnyS/gYJq/YUVGXvXsEc23Wbnot9xCcb1q2bXgETjkIUXM3I+UmylRDS
    hOZK7F0O8AIofpINjPnDObGzm/Xguh1zflIjxqzSll3li5A39gY02hbaVihmY/KuFR0AnQ
    b8HjWHJvPCrTVyIO5v5xQmkLUKg51wXlRrqkqESLxG8AnOFK9jLRgsQ4Si30j2e7NE2TIO
    adAsxjwvYZWWrjoXcH8+CiSjx+lq1EfUsVuD9rO7wlEI2qaEgGqZ8OXfDDJQZnU5XANxsx
    d95iWFHo0Is1LbTASVo7pIBGjhnFj4vNymzAJFy9J0VkK2i6Cqq7cSdUHfA0Ut3BBnx8QU
    Ykui1wvCNG2fu2I+9zIIG7XbyoS1+/kiFLjNNp8Mc7/250G4W+RBPD+ZrWlelilIsbYerM
    Mh0Ljc2hXVU6WVRZwrEgZg3H39GTYgTCNzQAhPufx16wmypQWy4byTMebCFnIFwq0Yuuth
    x1uQLrxUmAQQ5cGQ+aobuj/35pZb+4nUQOSa2Ki0lXUmeFB5Ifa23cHCIHN+rqV91hkgQj
    tgRo4o//cjyQqcpR10x4obsxXzD16F48Qjqey/6il4XbeL5/7w8VFORTMfmA
X-ME-Proxy: <xmx:Zy_jajv1RomuM89fMtXqDOwHzt_w-IBlFD0hZCAiAw_le7oyuPF7pw>
    <xmx:Zy_jatbps1lCN5AVTNivw4JsSQhULLANaOtnW3jt3zX6bE8pRRV5rA>
    <xmx:Zy_jaou_kJi9OX9FPzbkYw8XMy1FY_-rbsJqV0qF4y_1TKI_HqXDzw>
    <xmx:Zy_javEicfupzv1QHDU1uCmQMvZ-xPPPgagNa0nMXScCdmitGiF0gA>
    <xmx:Zy_jajPIH5L19UTH71GfZyR0X2NO3RRBm7mjJA04fw2VjsS3cCJxgHoV>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 07:35:03 -0400 (EDT)
Message-ID: <db769233789a26f48fb157e52b7d98fd3f05b174.camel@pbarker.dev>
Subject: Re: [PATCH] systemd: Improve detection of executables and libraries
From: Paul Barker <paul@pbarker.dev>
To: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Oct 2026 11:35:01 +0000
In-Reply-To: <20261027152930.1387813-1-anusmita.duttamazumder@arm.com>
References: <20261027152930.1387813-1-anusmita.duttamazumder@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248934

On Tue, 2026-10-27 at 15:29 +0000, Anusmita Dutta Mazumder wrote:
> Use cached mode bits to detect executables independently of
> host access permissions. Match shared-library basenames with
> a regex to avoid matching directory names.
>=20
> Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
> ---
>  meta/recipes-core/systemd/dlopen-deps.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/dlopen-deps.inc b/meta/recipes-cor=
e/systemd/dlopen-deps.inc
> index 37074a9682..4ce9845ad8 100644
> --- a/meta/recipes-core/systemd/dlopen-deps.inc
> +++ b/meta/recipes-core/systemd/dlopen-deps.inc
> @@ -3,7 +3,7 @@ PACKAGEFUNCS =3D+ "package_generate_dlopen_deps"
>  python package_generate_dlopen_deps() {
>      # https://systemd.io/ELF_DLOPEN_METADATA/
> =20
> -    import os, struct, json
> +    import os, struct, json, re
> =20
>      def extract_segment(filename, segment):
>          """
> @@ -49,6 +49,7 @@ python package_generate_dlopen_deps() {
>      }
> =20
>      shlibs =3D oe.package.read_shlib_providers(d)
> +    shlib_pattern =3D re.compile(r"\.so(\.|$)")
> =20
>      for pkg, files in pkgfiles.items():
>          # Skip -dbg packages as we won't need to generate dependencies f=
or those
> @@ -61,7 +62,8 @@ python package_generate_dlopen_deps() {
>              if cpath.islink(f):
>                  continue
> =20
> -            if os.access(f, os.X_OK) or ".so." in f or f.endswith(".so")=
:
> +            # Scan shared libraries and executable files for dlopen note=
s.
> +            if shlib_pattern.search(os.path.basename(f)) or cpath.is_exe=
cutable(f):

Hi,

Thanks for the patch. The switch to is_executable() looks good, but the
regex is more complex than the existing code. Could we use something
like the following?

    if cpath.is_executable(f) or ".so." in os.path.basename(f) or f.endswit=
h(".so"):
        ...

Best regards,

--=20
Paul Barker

