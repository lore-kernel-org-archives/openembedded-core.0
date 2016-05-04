Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 788AC731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 19:31:51 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id bi2so158436286igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qZeRs7h5lGx2QtQOB81TxF4JlWjmTW2gwE/Zb40yCZk=;
	b=paCc6ggKwZijntP8zZjGguCcagWV5s/vXSjywEbUVr+lAHaL/h7/Q5+Tt3GzHKdmvI
	3IOXtiUh82k/znMJB9P2L6mw8+4M17in2paaq3Tdh3lSZN83QRdo9nFhROdBxRNuLOLO
	Ode/etgzCWMRe1gJUMbTiYEgTsIJD7v4SkmPsF1lA/tJZGKCnytSK9AywWQai8zBfObH
	a7qRnHNP+5Jn+zZlPYzXJ6zaPisfmF+m4hCuc7128u2ud13rR2TgC9D+YVsSw4LvuE7r
	uUWtnLgGUO4SQcEayoN1rbAAAui6jtsMyY7ZF0V78s/dGmPvcVA6XQb+O/Ls/UD0seg7
	Iemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qZeRs7h5lGx2QtQOB81TxF4JlWjmTW2gwE/Zb40yCZk=;
	b=fKqBr/QpHOMt24vykELxoVPxgJkUcgi/8yg1p0oC4J9qQX4aiqqjGhFj6kJc+5D3ax
	BcmfKvSuNGghMtiTa3RKwZGC8KX1t1sYdJCwPt/YHGDc13pFKI3FLU/rUa5PgE2GpnkO
	EsViEHYfFuEWQYrymZSeeTex5Wi/kQpuzosVx/wo8MoM/I6+dkWjHElzxgQjMDX8xCqd
	mWBCo/YtY0g7X9FHrPHzOd11uSzeodTxhFebelseo6Yr9/veA2uT6XxdXMXKnF4eRPY4
	VoZEkxFYTTMMyag8dy2WONaWqV035KZal+0bIrINk1KzapBnZ+EYruINAdg37QZPcKhx
	R6Dw==
X-Gm-Message-State: AOPr4FVpdpWZxfNrJQWVXWe2jgwlJ8yX+bpIrVUQyml+clrcPayJTRl1N+jjHn2aWFptrDbv3dysr8iOORPHWXoB
X-Received: by 10.50.60.132 with SMTP id h4mr32962706igr.78.1462390311266;
	Wed, 04 May 2016 12:31:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 12:31:31 -0700 (PDT)
In-Reply-To: <1547678da14.11ea2eb8718367.335561670221363303@geekcentral.pub>
References: <1461933709-22049-1-git-send-email-geiseri@geekcentral.pub>
	<1547678da14.11ea2eb8718367.335561670221363303@geekcentral.pub>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 20:31:31 +0100
Message-ID: <CAJTo0LZfkzOW6HnYaqS3zSXdS4YbSpvxrmWn14FXE-eNBUwG0Q@mail.gmail.com>
To: Ian Geiser <geiseri@geekcentral.pub>
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Allow different filesystems to be used for VM images.
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
X-List-Received-Date: Wed, 04 May 2016 19:31:53 -0000
Content-Type: multipart/alternative; boundary=bcaec5015c9b06ee620532094782

--bcaec5015c9b06ee620532094782
Content-Type: text/plain; charset=UTF-8

On 3 May 2016 at 12:55, Ian Geiser <geiseri@geekcentral.pub> wrote:

> What is the status of this patch?
>

It's merged into my staging branch, so should be in master soon.

Ross

--bcaec5015c9b06ee620532094782
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 May 2016 at 12:55, Ian Geiser <span dir=3D"ltr">&lt;<a href=3D"mailto:=
geiseri@geekcentral.pub" target=3D"_blank">geiseri@geekcentral.pub</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3un" class=3D"a=
3s aXjCH">What is the status of this patch?<br></div></blockquote></div><br=
>It&#39;s merged into my staging branch, so should be in master soon.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--bcaec5015c9b06ee620532094782--
