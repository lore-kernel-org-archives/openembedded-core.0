Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id E50F860088
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 21:07:06 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id h190so24816312ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EORl1hSVOJzrvavBNx5vqAT+4u/he2Dp4pSk6ZL9Cy4=;
	b=iNYGVRIWNGWgHZR/A8SRnYF7jA6raIpeZ76dlQKfu6pK8Dgz2suR7VMi9IY1biJPZK
	ONFQD2mX00RjsHiqf1bLHyrOWuh72fOqpzeWcT+Dt1DpiHZfhHxDFTMXd9SW7vzPkBIb
	YxrkmKzf71crPnKNSQ7wpf7yN7esCFvkSMNQgROXJsZJYRkkgm/PX9Si9ug9U/0WgFr+
	QFPHVupyT4j/OQd9f4EBtsGzJai0GCrYKJUM0+AjkpB28KM/gp6BStZgQbrUE2m9VwDQ
	hrd9hPvzFGNA6lnbFaTBfFTVvyOZmtBjgqJlxTtKIrXO8YLgPqluqmKsYrO/mv1MmCet
	3WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EORl1hSVOJzrvavBNx5vqAT+4u/he2Dp4pSk6ZL9Cy4=;
	b=Y+BYXRlyI7mVxGNJZ3xOeBFTQKAO4f4+59HdBk4dUcdrga5nD/W98WGdrAtQwaNWEj
	tmdUZ7dqB74xDR6W0VYbcoItCBvD/uG/QY/bxwRY/n6fkeU2kxgxiY7tu4DYKlaGAK//
	aeyZkEwDRMF3gD8nPqFthCBILLuXGcWeHM0YaiUg13S0BKcaYvvEFL3/iTxsPMhYBDJK
	EKkQa7cS6tInivQfmkAWVTKxxroJ6tgC/KF3QUmljfNFL0uwjRFELM4iKMRK2yumCrwN
	5j638Dadkm6Zxe7OaBu/N3TpDZ+GCtf3ivMHZd9ak6htBnwYDoA7Kcsh0djMFGjqKbEx
	AzKg==
X-Gm-Message-State: ALyK8tIX4nGqm5HXyuCFyb4rikstu7/lhObHUuZZ45rsyfnlQOH2ig7wiCsidqWm8a0J9O+gdfjoTFIUWTU4MtEn
X-Received: by 10.36.2.71 with SMTP id 68mr9473444itu.38.1466543227462; Tue,
	21 Jun 2016 14:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 21 Jun 2016 14:06:48 -0700 (PDT)
In-Reply-To: <DBXPR07MB2395258466152EFCDCB4ADEF92B0@DBXPR07MB239.eurprd07.prod.outlook.com>
References: <DBXPR07MB2395258466152EFCDCB4ADEF92B0@DBXPR07MB239.eurprd07.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jun 2016 22:06:48 +0100
Message-ID: <CAJTo0Lb3D1Ktk4OUw_+Wa4ZHt4ncMa89-c_WaotXjJzmxs9YiQ@mail.gmail.com>
To: "Kucharczyk,
	Bartlomiej (Nokia - PL/Wroclaw)" <bartlomiej.kucharczyk@nokia.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding Bash to meta-toolchain.
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
X-List-Received-Date: Tue, 21 Jun 2016 21:07:08 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d01effe70535d034a7

--001a1144b1d01effe70535d034a7
Content-Type: text/plain; charset=UTF-8

On 21 June 2016 at 17:08, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw) <
bartlomiej.kucharczyk@nokia.com> wrote:

> I have encountered the following issue when trying to add Bash to the SDK
> (meta-toolchain).
> After SDK is installed, bash is not accessible in PATH.
>

Why do you want to install bash to the toolchain?  In general only tools
that are specific to the SDK are part of the toolchain, so can't you just
use the host's bash binary?

Ross

--001a1144b1d01effe70535d034a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 June 2016 at 17:08, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw) <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:bartlomiej.kucharczyk@nokia.com" target=
=3D"_blank">bartlomiej.kucharczyk@nokia.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div id=3D":408" class=3D"a3s aXjCH m15574b40ca666=
37c">I have encountered the following issue when trying to add Bash to the =
SDK (meta-toolchain).<br>
After SDK is installed, bash is not accessible in PATH.<br></div></blockquo=
te></div><br>Why do you want to install bash to the toolchain?=C2=A0 In gen=
eral only tools that are specific to the SDK are part of the toolchain, so =
can&#39;t you just use the host&#39;s bash binary?</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1144b1d01effe70535d034a7--
