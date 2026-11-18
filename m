Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11882.1795006724381435175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 04:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Ug6JloZQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so9878075e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 04:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795006722; x=1795611522; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dh1i/mi7GfnLVwLgBDRfD7VY1f7g60KK65os7TqcrM=;
        b=Ug6JloZQMmIwMtgwZo5JKkPS6DE4IJtOkzZeWuPmtR6zWYFkaeBO20cIR2a83RDwbD
         FFtNIkmFffprLz4WDbgcRkZwV5ZDwH7LDLVI6T1fQAd8/LaCYF5xlX+b65Y00T7C04ad
         EamS7JhFtspnbHL1tbm6GKdT2qvura/o109W4XLJLu5LRruuSCx+8vg7OjVvJwYxfBVW
         ZiFze+3ftjrAM7gJuY2bBA0StW7q4kWr17YAq5xv2yBTTemYWEM4d2cVFZU3a6/S2cWZ
         aj4MAcx3qqQgIICcGkVNMOa9HX0DsI+8kzQY9x09bulUPK80oRDI1p2u1Mo4Xu7DCb9o
         0Cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006722; x=1795611522;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dh1i/mi7GfnLVwLgBDRfD7VY1f7g60KK65os7TqcrM=;
        b=H60FUY2UmtjJfT9+pnzvlqw22YbSAquhWkPYjv8edfCKEY6O/7CLxs6IoWP3gRKma3
         FgJa7VZXBEdNRBaTZP23iSDRliqcAjVsyyAOPsja7k1L0sX00AFzpYloWKIqgMvUKim9
         bMW+VDCchcFLowwkf2MWQrLyqj3fmXvwQ3aOEGTLP8P2USijD8BXJEPpAomWMnCHTMAY
         2pLBs+U1igZLRjWDV8gvf4ZalFb1ANeT1476O9E78Wsqn5LGwC40BE4vAA0A6EPMa4EU
         64SraboOCQJCek3Z1N4izkCyEBsZgqRG7rlffwXjDavDD/uSJS2vJ9pCefvqsIKqgPj3
         US1A==
X-Forwarded-Encrypted: i=1; AL+hErEL5L5sPEv07e5hzzsM0lOF466dNvSKp5uRlSeRmGbvKBlD9lqhtXrlPp+JVl/5+tS2VH3sULk1Xu6Cg377m5PF5w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8eLjY/NGwOZj99022H3j4mfLfNSvuwzsb/vRYmCqJowhKlUcjp
	hWo2DZJnJcszQqkj4TCg+rg8PznHBFPlBvD81qXB3PEeG+dPL4YyvsNe/ETz1umWcj0=
X-Gm-Gg: AYBFou18yZ4jCkAeC+37ZckR6eSYONKVxZS2PMUkJICDRSXRyKrJT/olHtQyJbm80Zz
	X1/jhdEnbeqFcP7jZghrpMkgfMcknFHeb9vTyQZVP4FonenaSF9Bb7Cv/tsub1rSb0rM8S+HsqE
	AzuQpB99rvR628mikcPJEuJ9Cp/YxbqYE5D2E+sBnOKz62yqBAo0aszBRAfe2uDraAwtaBQPtkG
	je9sHV9pTxzsfL+Us+wOZovOERKgLL1mL1vgPqHGsl28REBt3Q5HcJVc6ZR9uwbDa4oGxPzfx7g
	kuD8M57ihzPWfdIl/mnHelMMU9uD/+hPKCjL8ScRpNkDCUhRjo/pHWWJH9pU7nSLqV85SrZ/Gli
	ENI3Ym2BNahD045HVerxl2V807fuFL7E+QBjjMratQG/1nc+W3U1cbzPBRuFyTD4+De90Kryn7h
	h6D9tCdQxqjNeAcMnt5PyRPC6oPGb2CQE42b88Ji69Q6vQlpuRZWZdAS/W0UpWyHFSfzhgn8Pof
	6vKpynh8rwyRwyr+14B2XJVO4jz9r5tdqedlkC/CaHzP7DYgcjhsBSLu3ZBpkUpCb6BEgHd8fEF
	1t7oT5q3dkt3ACmx+JxcXhVqTY15A6JEClLYEBXGh3w48rktAxcIxmnq76aXKT9W9R098MspyRJ
	zFwxamCS4lldIP9zQUbVtQR8EyDqhg1bOlEflvel4/8hlYSyo+4Xp4f0=
X-Received: by 2002:a05:600c:19d2:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb7d5d65ffmr53045315e9.3.1795006722317;
        Wed, 18 Nov 2026 04:58:42 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from localhost ([2a04:cec0:11f8:fead:9303:9e65:1369:c4dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d256f64sm58663645e9.1.2026.11.18.04.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:58:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 13:58:40 +0100
Message-Id: <DMYCRZJNVXMT.3L0J83ZJLGGWM@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 7/8] openssh: Ignore CVE-2026-106553
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261105053148.2704106-1-hthakar@cisco.com>
 <20261105053148.2704106-7-hthakar@cisco.com>
In-Reply-To: <20261105053148.2704106-7-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250546

On Thu Nov 5, 2026 at 6:31 AM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS P=
RIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> The vulnerable GSSAPI implementation is compiled only when OpenSSH
> is built with Kerberos support. The default PACKAGECONFIG excludes
> kerberos and passes --without-kerberos5.
>
> Set not-applicable-config only for builds without kerberos. Keep
> kerberos-enabled configurations marked unpatched. The upstream fix
> and advisory are referenced in [1] and [2].
>
> [1] https://github.com/openssh/openssh-portable/commit/6f9cd19af05aa828d7=
778cfb047faaed1679e8b7
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-106553
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_9.6p1.bb
> index dd49cdf977..54cb2628f1 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -69,6 +69,7 @@ CVE_STATUS[CVE-2008-3844] =3D "not-applicable-platform:=
 Only applies to some distr
>  CVE_STATUS[CVE-2023-51767] =3D "upstream-wontfix: It was demonstrated on=
 modified sshd and does not exist in upstream openssh https://bugzilla.mind=
rot.org/show_bug.cgi?id=3D3656#c1."
>  CVE_STATUS[CVE-2026-3497] =3D "not-applicable-platform: Only affects GSS=
API Key Exchange patches used by some Linux distributions and does not exis=
t in upstream openssh."
>  CVE_STATUS[CVE-2026-59998] =3D "${@bb.utils.contains('PACKAGECONFIG', 'k=
erberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is d=
isabled in the default OpenSSH configuration', d)}"
> +CVE_STATUS[CVE-2026-106553] =3D "${@bb.utils.contains('PACKAGECONFIG', '=
kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is =
not built without PACKAGECONFIG kerberos', d)}"
>  CVE_STATUS[CVE-2026-106555] =3D "${@bb.utils.contains('PACKAGECONFIG', '=
kerberos', 'unpatched', 'not-applicable-config: GSSAPI/Kerberos support is =
not built without PACKAGECONFIG kerberos', d)}"
>  CVE_STATUS[CVE-2026-55653] =3D "not-applicable-platform: Only applies to=
 RHEL FIPS patches."
>  CVE_STATUS[CVE-2026-55654] =3D "not-applicable-platform: Only applies to=
 RHEL patches."

Hi Hetvi,

I discard this one (Ignore CVE-2026-106553), and the next one
(Ignore CVE-2026-106553) because we already receive a fix few=20
days before yours. So I'll go for the fix instead the ignore
way, it will be more consistent with the fix you already=20
sent for Wrynose.

However, the backport for Blacksail are still missing.
Can you take a look so I can validate your scarthgap and=20
wrynose series ?

--=20
Fabien Thomas
Smile
