Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53678.1795440985662115874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=m13TudXp;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso32666795e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795440984; x=1796045784; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2JVmM2xVXfVuFaPnrmeHhfVbVhIKelor0knetrOK9c=;
        b=m13TudXpUMsc3xShvTQjR6yYSDyR5VYgcUVzXkY1LZ03VXSgshNfa6nitYIAsX9aOC
         JCBmPeEGDnPcZ2pAIhB+4T/VtfePc5FbcCTDxIMCGDOj3g+G5JFWLQYO42U9bXDEcQLV
         SqOLvS2qK74ii0XtzKSbsWnipSnMfV6SeOJniklnbsXsQkUP7+zpj1t4dQy8jFE0mKeS
         s2THRzVZhOD4pJAhyegvWSq/FSAk9CkFRTzspVD5knJzJlcKKfgVMLKvCuN3X2RcCDGh
         ST8pfFoMjnfeAUeUkWGaPlRAj++ikss2POptGf5zE+MkPUyXTnUqyui1LDi/5vV8X9jW
         kWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440984; x=1796045784;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2JVmM2xVXfVuFaPnrmeHhfVbVhIKelor0knetrOK9c=;
        b=Ul38T7Z2wrK0NK/l5ZP8tVWWLDFRyRET2z+RZoVbSNGYJoZnq6hhUiICaNXWCUqAkz
         tY+BhnnprrY/2+v1L7f+YiQGuQRxUCsmzE7M+Qa7u3WAQ323DE3anxeb/08mr+EWRpKK
         EgQ/F076TgaxUaW7hxTlEDlyT3JPVuT3yLj4jllAQ0V68wg5TyPSpDyNbzWe3/WNkgpc
         dxK6WQhIsP3h+vbyAGV0+0HOeOHWHJl5BUGJoF/FtZ1voUSRcUGIAi1Xj47DzXd6pDnT
         QwEXrkf6mDOItLl3YuLdC0QXwLON7SSMVC20+NSHq98NKYJf6M6MLTBeavH9FDIHvNIj
         13dg==
X-Forwarded-Encrypted: i=1; AL+hErHx8hyCASFXjWQ2U9O0D0AM9N3/Jq52qyL3UaJM6DgwtCMaxHUGOOkQrctX4rsIA+FvaootZlx7BHbnCqVUZ8jfsQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8WYm1W1T6TTC+zpBZGTW77XpM3yEYT14Nw+r1ABIHbitEvTz9F
	UFdlL31ogiG/H40EKhfSMNxGVys2C+ja/jidig9l/ItlKe1+AY1er/Qcr4Vz43PEbtIJ7hs6jGy
	GrzOGVMk=
X-Gm-Gg: AZFdTZf8jMRbVU612KOQsX6V4LzkAACKHSCqJ1+IlJuksjZfzBXK2XZtYFJhUSnvIZh
	YWHaclgfyudiIrsdErftMBLz9swEr4xSpPQTPSs3Zie3YfV97qA6fRE6xpTgkrbqp9UwQput4Jj
	28IrvJfFSpYNBkGurkdIYP3fYHAbFXlNlxRT+gluT5gn6a6RlPHfKv+WpZq4/BkjMiEIGytEViX
	fQXkO3Aex9MpRaIGYGFi3q9XiJHONR31l0RUHufMhuorWmPhdEr1Qypz4B4YAONx1z1htAks8lB
	trM+xD2TeK2gaw+43xB9HowZanlZOyE6egplPCdAk7Qt44R8LrJgoqQboHZGfwkkKjQBq1C8kQI
	YXAj8PELnyKBlaH4aybbXykuFLioNIWnKKClkABw5raYlECTkH8X5t1/eJsgY34sDFOW0m24Ixe
	2AqTdbitIN7o6EnH46hcsw9HRwVZDtm1GJDrPjBBmPYvMWxGLY/9G0MDnqskvmlJ2QgCGD+nuiz
	MNe2VKu3zPX+85/L1b7jr/VaUmsEg6uB1b7EF9QX/1MROJ+Ev3p6LdKJ+U3Czq6JO2GchHFqNuE
	SL2Jg//hVEtZ8sE+GTLNHhFKIaM02aTS3yI1dMlkelD6hfL0f6KpvsffB8iUYUnjIqLsxVefI1z
	dnWVZnlnLilNhUw==
X-Received: by 2002:a05:600c:e40b:b0:4bb:9a6c:8712 with SMTP id 5b1f17b1804b1-4bb9a6c8724mr42030415e9.12.1795440983915;
        Mon, 23 Nov 2026 05:36:23 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm199809165e9.4.2026.11.23.05.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:36:23 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 14:36:23 +0100
Message-Id: <DN2MPL18V9TU.1A57UGBE3IOUM@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/3] expat: fix CVE-2026-117610
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261105091719.1622520-1-dkelaiya@cisco.com>
 <20261105091719.1622520-2-dkelaiya@cisco.com>
In-Reply-To: <20261105091719.1622520-2-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 13:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250919

On Thu Nov 5, 2026 at 10:17 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport the merged upstream fix [1] identified by the release
> announcement [2], together with its regression test [3]. An initial
> empty, non-final external-entity parse must remain in the correct
> initialization state instead of reaching a handler with invalid state.
>
> Use the final merged PR 1444 commits; the earlier advisory reference
> 7b0d50e4b1d16fafd55876260701e04279a7489d was superseded during review.
> The regression test uses Expat 2.8.3's existing XCS literals and
> xcstrcmp helper, so no string-helper refactoring is required.
>
> The focused external-entity case crashes the unpatched native library
> and passes with this fix. The full native unit suite also passes.
> BitBake was not run.
>
> [1] https://github.com/libexpat/libexpat/commit/bfc28346fa3efeb8ca56c1743=
7d24a7344e5feab
> [2] https://www.openwall.com/lists/oss-security/2026/11/02/6
> [3] https://github.com/libexpat/libexpat/commit/cedb704d2cad9d6ef77f8f172=
104d3e751eccfd2
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../expat/expat/CVE-2026-117610_p1.patch      | 30 ++++++
>  .../expat/expat/CVE-2026-117610_p2.patch      | 92 +++++++++++++++++++
>  meta/recipes-core/expat/expat_2.8.3.bb        |  2 +
>  3 files changed, 124 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610_p1.patc=
h
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-117610_p2.patc=
h
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch b/met=
a/recipes-core/expat/expat/CVE-2026-117610_p2.patch
> new file mode 100644
> index 0000000000..2ebe6446c4
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-117610_p2.patch
> @@ -0,0 +1,92 @@
> +From cedb704d2cad9d6ef77f8f172104d3e751eccfd2 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Mon, 26 Oct 2026 17:17:57 +0100
> +Subject: [PATCH] tests: Add a test for a initial non-final empty subpars=
er
> + parse
> +
> +.. with a handler call
> +
> +CVE: CVE-2026-117610
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/c=
edb704d2cad9d6ef77f8f172104d3e751eccfd2]
> +
> +Backport Changes:
> +- Compare handler data with the existing XCS macro and xcstrcmp test
> +  helper in Expat 2.8.3. This replaces xcsdup_str allocations,
> +  allocation assertions and frees, avoiding the newer xcs helpers.
> +
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>

Hello,

Blacksail backport does not have this _p2 adding the test. Can you
either:
* resent this without the test, or
* send the patch adding the test to blacksail? (Since the recipe has
  ptest, adding a test for the non regression of a CVE fix is
  acceptable)

Regards,
--=20
Yoann Congal
Smile ECS

