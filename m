Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6F67A71B48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:30:17 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id c47so529853205qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 12:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fZzM2au1yf3GAj14E4lKmPhhvmnFJDzD4WBAL/kuQ/w=;
	b=Fiw8IToZs1MBY8ZsnZWBvOOPLXgCmtTZRBFtL2B/Gu29aUpy1KdA7BbWeB4ui9vogm
	NXRE56A8MhpZAQclCzotCXvEixGcdIBIzOGg15jeV1RTBZ96bPL7BWTxVUGXydhzTSoH
	+IUCKVIUY6mPLNVeHCyyQew52MZc6xKYVuBqRcnsGeCuWQ10mueX5F98n3mSK+V0YJ/Q
	mZYtz0ZY3dmqbEV1SNTShzXp/Y+Z1G9T7hkzEBDLfdQiuUgObeigBQE5S/4xxcX4lRMj
	MEB9MoG7qwEBDVZQui2WQbGF8+93fINVA6b7B5VMOF2oXaLQR5up2QjeaD9Qq7hyGkon
	iStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fZzM2au1yf3GAj14E4lKmPhhvmnFJDzD4WBAL/kuQ/w=;
	b=RlXVtLy/RHLx+ZCOiniUAMbqZh2t6HBz9BmAxP6EddX+bLjl7M2YOa2QkgIF/+FQoO
	H/52V7SBSU8/iT/KbMT8GSx88e/waVn2Lqh/0uTvCl3WGlXl/KLCanwUfrgqszrimUzO
	i71cT2OBG00sy3Txfj5esBFBzqSeDDaIQjnVTZ338mxDgdiqkCPc1drMrjmHKhE8HkC4
	YXCrDp6dQbgZ6zjiEmMq9CKA6UScHT8nddNJ/HazSTjlQBoDc2KatsJtdbrvHr0D/XrN
	65B9dBIayMpXRqedUFU2EWuVwPpHR0txMlNHVwXzjYeB9EKguKPFcWag9l81glbA1vj6
	hLzA==
X-Gm-Message-State: AIkVDXL9i4LwEV201IyZVJtS8xcjv2m7mV3WkmvjMvC0qaquCLrPVsDDRLFhsFjucJLj3kOjKdE/4c3xT41jZWr9
X-Received: by 10.237.44.161 with SMTP id g30mr69375335qtd.144.1483648218418; 
	Thu, 05 Jan 2017 12:30:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 5 Jan 2017 12:29:58 -0800 (PST)
In-Reply-To: <719dfc6d6e21c3493d0d67deab963e06f1897d6f.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
	<719dfc6d6e21c3493d0d67deab963e06f1897d6f.1483645446.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Jan 2017 20:29:58 +0000
Message-ID: <CAJTo0LYBOGw_KFb4+X=97FBmcUnc-uv-kW63ritDBkSMR0DOyQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/16] boost: drop flags bits, fix for x32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2017 20:30:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c12584807fabb05455ec54d

--94eb2c12584807fabb05455ec54d
Content-Type: text/plain; charset=UTF-8

On 5 January 2017 at 19:46, Christopher Larson <kergoth@gmail.com> wrote:

> +Upstream-Status: Pending
>

I think Inappropriate is more fitting here, but you're brave for daring to
look into bjam. :)

Ross

--94eb2c12584807fabb05455ec54d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 January 2017 at 19:46, Christopher Larson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">+Upstream-Status: Pending<b=
r></blockquote><div><br></div><div>I think Inappropriate is more fitting he=
re, but you&#39;re brave for daring to look into bjam. :)</div><div><br></d=
iv><div>Ross=C2=A0</div></div></div></div>

--94eb2c12584807fabb05455ec54d--
