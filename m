Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 55DD87570D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:40:36 +0000 (UTC)
Received: by qkbl190 with SMTP id l190so120212024qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gtr1jtJt37VCISOegiFR3/f12ug7j+3FfxDIhvc1Hjg=;
	b=AqlhAK3AJ6uzOzl2oi0KB3jUAoNjAS6tpJy3vS+z+0faNLozool3P7aEQhI1iPd5KD
	4v+UhPGYMjuEadneDb9G+xB8/3S1t6F8rwAGWoY+J3SKUrO/kiCGB7Da5RDfq2nmuzAX
	5N2jjc+bwp/jrNBr0ch7hxVwgGdpDgzBH+oSuimb0P+GpymXZuPs85yx5530bLD4dbTC
	ZmavFIB2Dx+6rCEX06HRkgrSnvmiLBUaNXFSU4fKHueIVVomTPrRdx/GNXTy/4FLkcMc
	fXf/QcC6DzZVboIqejZXxXYKLY6fvg+jvWAZ8mCRfXt3D2U0CEU8WK/ocPgrJJ/ua3pm
	2M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gtr1jtJt37VCISOegiFR3/f12ug7j+3FfxDIhvc1Hjg=;
	b=PIT5ttW/k8MjA7ZFlmZOkFoxtk49IsfYr6KK7rCGmY2BJDf0A5/19r3moEKqql+fom
	6+8SKDGKbaWGXoXOriVLsSi1xO4+csXQGAjHOtGTXhqO5aLEIXmAbbmUAr4EUmDfg/+E
	fGaDB7yb5K/YPHTY6yve62NlVJtHbS/mNMnJ3dThiShep2hocMERjSZ8te2aZpZiUN6r
	YWkXjksfoISQdJXCwQzexqa1BA181NSzHSLWfYMTwZk2WdD7xOtLYddh1KTsPL3iejDL
	mN2c878TMy/IERtB8+H1LUc9HDUP6X2tcKd1sjtT3E+Bso5C1TCLihYnTMIi0dnX8KVU
	rB4A==
X-Gm-Message-State: ALoCoQlhWFTA//YfCgPWkT5Tr+08i8BvYZ1BshgN+4yA5ofBbD/6C6+wHrt4qMGxmix30St4tl9R
X-Received: by 10.55.221.9 with SMTP id n9mr48124173qki.64.1445942437023; Tue,
	27 Oct 2015 03:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Tue, 27 Oct 2015 03:40:17 -0700 (PDT)
In-Reply-To: <1445914371-56565-1-git-send-email-biannm@cn.fujitsu.com>
References: <1445914371-56565-1-git-send-email-biannm@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Oct 2015 10:40:17 +0000
Message-ID: <CAJTo0LZ9zjDUCZ-jUqSPmEMZhnXAeu9wC184BUUcs5DVqtStqg@mail.gmail.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-smartpm: define LOCKED_KEEP to avoid running error
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
X-List-Received-Date: Tue, 27 Oct 2015 10:40:37 -0000
Content-Type: multipart/alternative; boundary=001a1149d604532f13052313b5d4

--001a1149d604532f13052313b5d4
Content-Type: text/plain; charset=UTF-8

On 27 October 2015 at 02:52, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

> +From daaec43ecf3f0d0f89cef586327aa1063a4c44c6 Mon Sep 17 00:00:00 2001
> +From: Bian Naimeng <biannm@cn.fujitsu.com>
> +Date: Tue, 27 Oct 2015 11:08:52 +0900
> +Subject: [PATCH] Fix a undefined error
> +
> +LOCKED_KEEP is undefined, so the following error will be caught.
> +
> +  /usr/lib/python2.7/site-packages/smart/transaction.py", line 1230, in
> run
> +    locked[pkg] = (LOCKED_KEEP, None)
> +
> +  NameError: global name 'LOCKED_KEEP' is not defined
> +
> +Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
>

This patch is missing an Upstream-Status.

Ross

--001a1149d604532f13052313b5d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 October 2015 at 02:52, Bian Naimeng <span dir=3D"ltr">&lt;<a href=3D"=
mailto:biannm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ny" class=
=3D"a3s" style=3D"overflow:hidden">+From daaec43ecf3f0d0f89cef586327aa1063a=
4c44c6 Mon Sep 17 00:00:00 2001<br>
+From: Bian Naimeng &lt;<a href=3D"mailto:biannm@cn.fujitsu.com">biannm@cn.=
fujitsu.com</a>&gt;<br>
+Date: Tue, 27 Oct 2015 11:08:52 +0900<br>
+Subject: [PATCH] Fix a undefined error<br>
+<br>
+LOCKED_KEEP is undefined, so the following error will be caught.<br>
+<br>
+=C2=A0 /usr/lib/python2.7/site-packages/smart/transaction.py&quot;, line 1=
230, in run<br>
+=C2=A0 =C2=A0 locked[pkg] =3D (LOCKED_KEEP, None)<br>
+<br>
+=C2=A0 NameError: global name &#39;LOCKED_KEEP&#39; is not defined<br>
+<br>
+Signed-off-by: Bian Naimeng &lt;<a href=3D"mailto:biannm@cn.fujitsu.com">b=
iannm@cn.fujitsu.com</a>&gt;</div></blockquote></div><br>This patch is miss=
ing an Upstream-Status.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1149d604532f13052313b5d4--
