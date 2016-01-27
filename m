Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 91AA76FF5B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:29:22 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id f81so15598901iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 03:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Js1Kxl7HF71PhqueCpqeBJGxVP0r73RejKAqZCm/ElM=;
	b=QfX7moc6PY7NNXRjyr1qu2TmELvc+cqG6YGHo93vAePrVKDlw1lDDnW2Ojb9mNXm36
	kValDLvYdCaU9fdIMvN/0+J4sRJrHM9MMu6pDfW1I3v0gJTqG8oUXG4T8PNVgQXSBu/e
	r20QXIz/Lrk1gWhG1bymwpy7D1H+NhWusX/R0GyLX8V7Bj0xy7ypUsjYg0w6tpoXg5O9
	pspAes+d91joG76fkkbpe++75zYLO+xX/H5wyEyC3Z/htMc72lweL21V6qo5R6KuARFJ
	AKVwYG4vAyS8PWmEsiTuI40g4bK5vK8YkoN74gD/GWIfZ+uJHgA9IxXA8b8PxgglWTjU
	1epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Js1Kxl7HF71PhqueCpqeBJGxVP0r73RejKAqZCm/ElM=;
	b=IsFo4aNj84Jr5eqbKjaLT0I+2+zIBgg7dZTsSXqyWDIaMhik3fMBKpTglvCNHfi0XQ
	6okekCk4KXXKaBOspx7lPX7AycT3HPmrnOfg4k5suhF0evvrzM8VAEnW8IDmhvzTLXS+
	p+XxTe7Qh8zmBZGPmx0arJCxk63DKj2/iNispkoHMTy346U2GGwJk3/0+xiY6Vo/2FP0
	6SBbXGcaFL6guNR2ndh9sxFXaAnlZHTuXo2Xm45a4sGICDMm/bqJkLRxqInhJb9GLLzm
	tuIkbyuO/XQFddk+1UgqzRrjmTTqTJ48yCC+KgDX72S9ug6xoD0iH8RIVol6LZyGwWe3
	v9aQ==
X-Gm-Message-State: AG10YORXvlcBwVmbRE2i+b/iQjM4dSytezFgqrJovbJvvCLXBdVJt5WnwK74UNS3inJn3vEEt4JufiSQD+uIFpPb
X-Received: by 10.107.3.154 with SMTP id e26mr25655255ioi.99.1453894163425;
	Wed, 27 Jan 2016 03:29:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 27 Jan 2016 03:29:04 -0800 (PST)
In-Reply-To: <1453890141-4213-1-git-send-email-catalin.enache@windriver.com>
References: <1453890141-4213-1-git-send-email-catalin.enache@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jan 2016 11:29:04 +0000
Message-ID: <CAJTo0LZe5rwfWJUMvbaavospzyqeNV-h5BgjoJ8uLfZUb_rVEw@mail.gmail.com>
To: Catalin Enache <catalin.enache@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: fix CVE-2015-0860
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
X-List-Received-Date: Wed, 27 Jan 2016 11:29:24 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a270418052a4f1d3f

--001a113ec10a270418052a4f1d3f
Content-Type: text/plain; charset=UTF-8

On 27 January 2016 at 10:22, Catalin Enache <catalin.enache@windriver.com>
wrote:

> +Fixes: CVE-2015-0860
>

Please use the tag CVE: CVE-2015-0860.

Ross

--001a113ec10a270418052a4f1d3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2016 at 10:22, Catalin Enache <span dir=3D"ltr">&lt;<a href=
=3D"mailto:catalin.enache@windriver.com" target=3D"_blank">catalin.enache@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":7w" class=3D"a3s" style=3D"overflow:hidden">+Fixes: CVE-2015-0860<br>=
</div></blockquote></div><br>Please use the tag CVE: CVE-2015-0860.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a113ec10a270418052a4f1d3f--
