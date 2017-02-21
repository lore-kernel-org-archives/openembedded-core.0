Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 907BE72F0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:41:30 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id k15so99831188qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 16:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mL0bcHaSCiRil8W4q7LRegSxo1zVotkynmc+n9LwioI=;
	b=gJemhzogQf0XcMV4Z+ZXTGpJYHuAu5q6DQI135RBv6CLnkZxP6frOZzXQNuRmzmY33
	qcqYM8w3fakPrj3XrT8OVPIHjYvLiR7T3g48EzyXKOJ6BDgCt6l71u0JZ7mtVhsIyd7k
	BIt23jHpm6S78GEg02zdoD/lJSbXQxydlNMHjvslvtefnTPgZAgwHBRphaqdKuChfPQB
	EqWc4EJSpawA9x18nCsWavz94ckzA4a6viq9oBTBTYKkSSb6vHJGVL/XRKRqxQwdKNGF
	6VXW2ZaG22kRBHy4P6SRUckuclnoHH4OhksmyxzZW+RijXZaTSlcypLeXQXq624TAikR
	y6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mL0bcHaSCiRil8W4q7LRegSxo1zVotkynmc+n9LwioI=;
	b=Sg3CTkXeqCcWFNXlLOCyX+aQpooaZPkkE+KK8TrZOZFm/XIH8LxrsCJ54m9eUR7z94
	LChC1tute8VxjYP2KOgo6PWyIrptWrdcaXUiPSjrelSY9TmJ4FQCVFLXAY3/85fz+u2y
	Lbb5lrt/2SUp2mL3jOoAQ3gwRce3DgZmAL1ZVxajCv79Z2a4SvrfGl9GzmoJh2VQHl8j
	8VYzggKOW/XjJQRAuRODDuAsfAwxpvxitjIFcUYqczpObaL/juiHT8JF4zsrEU2J+DGK
	+S9r3kU0f3o3drVko5lk3QUeWda6NJy6AxjLox+xlEl6vww4G5vK9Z6Hatjtdm1tKegN
	vZVw==
X-Gm-Message-State: AMke39l8oQz6RHt/Wu/THa2A++npA447YmwB/WtFotaeQ9M8T0u+wHooh9B+6BTQH9mfRdBxSnuCRaZ1IrLP4Jck
X-Received: by 10.237.53.9 with SMTP id a9mr203355qte.188.1487637691337; Mon,
	20 Feb 2017 16:41:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 16:41:10 -0800 (PST)
In-Reply-To: <1486735300-3408-1-git-send-email-maxin.john@intel.com>
References: <1486735300-3408-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 00:41:10 +0000
Message-ID: <CAJTo0La+yHGLse_kzxAqOkzk3eea-YdcRPaRWQACPcec8-yR8w@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Cristian Iorga <cristian.iorga@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: add ptest
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
X-List-Received-Date: Tue, 21 Feb 2017 00:41:31 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e25a5430548ffa470

--001a11c0285e25a5430548ffa470
Content-Type: text/plain; charset=UTF-8

On 10 February 2017 at 14:01, Maxin B. John <maxin.john@intel.com> wrote:

> +RDEPENDS_${PN}-ptest += "make bash sudo perl perl-module-cwd
> perl-module-ipc-open2 \
>

The ptest needing sudo is moderately scary and also suggests that it can't
be ran in an automated test harness.  What does this need sudo for?

Ross

--001a11c0285e25a5430548ffa470
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2017 at 14:01, Maxin B. John <span dir=3D"ltr">&lt;<a href=
=3D"mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":27j" class=
=3D"a3s aXjCH m15a285d7e825f619">+RDEPENDS_${PN}-ptest +=3D &quot;make bash=
 sudo perl perl-module-cwd perl-module-ipc-open2 \<br></div></blockquote></=
div><br>The ptest needing sudo is moderately scary and also suggests that i=
t can&#39;t be ran in an automated test harness.=C2=A0 What does this need =
sudo for?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a11c0285e25a5430548ffa470--
