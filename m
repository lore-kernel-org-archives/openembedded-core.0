Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1EADB73193
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 10:44:20 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id e62so69291876ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4EU6yZ4HoL2DYFNvKA3YEsZjGoP+1zV8cKvRC9NkJd0=;
	b=1gpZrvmfoU4jWzmsJlIFW9464k8ROwSIYn8Aps0CVvvxtk80LXsRRKAbOglpgNBOCN
	e6k2vSl3SnuEdMab/OBTflJpRSQPsRpDFZV10+Lhqq2rrO+STLwIW30KtW6CAbiWBEy5
	AjJGnteTlQ+U0V3NNlcuqF97Rb/+kq53gHRT/9OCwhzmOeOIsaH7jzn7820J9H41kcbR
	51ah5vC6FgLx6qyceBLobNNfwWjGz429Ca8HqJ8WWfkkWGZWXTe0jIMI7fe9B6lrIWgL
	HZ6l8aMxmtkkjEEO59qj+Vyzbyuw3DnfS6UnISBgyaEqPZKZ9EFkAj2FB5fRLy4Ahxpf
	rOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4EU6yZ4HoL2DYFNvKA3YEsZjGoP+1zV8cKvRC9NkJd0=;
	b=G4u7LPMZkg4iPIwjANXN4siBYK58TJHe0JcUeeF1jSSMbI1pka7H/Wwa6CatPGji7i
	Fiuq4iFSkHN5GkXYGeR3IvKvnv6qFWQzzqe4IsURsqXMMfKRQIw1uz2a2nNCMQ2fo020
	wzgRY0oRBfgp/V5LuJa0PNtVE/pqgu/IG3BA8s6tYcVZeWy6WMgmdkTd+4a/KtAYRk3s
	bZYLoa5hSoOhJE10xCJk6sI4C3PV3HrtmZUxZEdhwPmjg1Ad9CMfCTFiFvG3OvpC1cR+
	Yip9GvxyfLP3h2t+ktaR5qaMPrp1A5dps2gRxyEhs8XY04Vm4flpHiiVKsPX3b5vIQxf
	gbBw==
X-Gm-Message-State: AOPr4FU6Iu+Yp6rynq6a6CLGV841JewG3PI3kjljLQJPubldvCu32lwfB3jdlJeIP7tP/KfK/zeSc3YJuLLEbyjg
X-Received: by 10.36.2.71 with SMTP id 68mr22634543itu.38.1464173061393; Wed,
	25 May 2016 03:44:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 25 May 2016 03:44:02 -0700 (PDT)
In-Reply-To: <CAP71WjwwMDoKOG45tAxy+Fkh7euqO3dQ_ySOCp7VY=OhiSHh6w@mail.gmail.com>
References: <1462204592-22025-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAP71WjzOUk7fOVkBf2MCZizSW3mSYivYrNsa3XBkqhBCGX4ZWg@mail.gmail.com>
	<CAJTo0Laf6FBjdTYL1sMBsOqO4vjT4G26eY-VWaP-7ACadLFCFw@mail.gmail.com>
	<CAP71WjwwMDoKOG45tAxy+Fkh7euqO3dQ_ySOCp7VY=OhiSHh6w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 May 2016 11:44:02 +0100
Message-ID: <CAJTo0LZ0r52vjL2-9=V28kuM=fX_wBvodJ2VqDSFcVT8ueuAmw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bluez5: move btmgmt to common READLINE section
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
X-List-Received-Date: Wed, 25 May 2016 10:44:22 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d036e58e0533a85b7e

--001a1144b1d036e58e0533a85b7e
Content-Type: text/plain; charset=UTF-8

On 25 May 2016 at 11:05, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> the same patch is needed on krogoth and jethro (and applies as-is in
> both branches), should I send a separate patches or can it be picked
> up?
>

It's best to send patches so the relevant maintainers can see them.

Ross

--001a1144b1d036e58e0533a85b7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 May 2016 at 11:05, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"=
mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lina=
ro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
1s2" class=3D"a3s aXjCH m154e760e30c69ac3">the same patch is needed on krog=
oth and jethro (and applies as-is in<br>
both branches), should I send a separate patches or can it be picked<br>
up?</div></blockquote></div><br>It&#39;s best to send patches so the releva=
nt maintainers can see them.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1144b1d036e58e0533a85b7e--
