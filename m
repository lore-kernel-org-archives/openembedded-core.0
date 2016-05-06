Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E68C26012C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 15:43:00 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id u185so135915057iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=+SO4z9tijP1why6wGdpbwKB52A5xc/fca4DNksvNDFA=;
	b=LeQIvzOhKkQAdfJ6FSlqrv4f8bFc1LCbWGwad3ZYPNAxNMc3OaK0VxtvcbLZ6Ej6JE
	imSx7Kccc5WQ84mFuy58odhu5L4YfDVP21sAqMIOdlzxPLSVuirgPEp1bbR+Zhc5I2I5
	N9nUeFnhc4sJwFih1s+XOmbmy0g9MhLdYBx5m9p6fHv+GbRKU2plBDDNgmBKfeiq9M35
	8bQTmBm583SVnBFgJyTevunaPaq/Wwtzw6CC2Q1USLDp+3pwNxF5TMqMnBP699VFQMRv
	0jNdueQznTevsbbaXrv5t89q3Xe+EhtdZj8zQkvA4aeFuHz995lkCJqOffzid0+QYqkJ
	PFiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=+SO4z9tijP1why6wGdpbwKB52A5xc/fca4DNksvNDFA=;
	b=j5wGJhItB7v6Og2bylZsb7tZnzRd3H7k8CF3GeXVtBUcSeH5AA9HXBiPBY48TUaV1K
	0PXirhVpUrEUPNuhREqUV/CHsBw2ROgjElqSZ9FEcf1tJtf1ZVBsdJ6+kLhBYBrxkcWx
	PF5VH0QTcm5TiqnvA456TOrPny6678LFkRZg4s9fYbgjMty5lb6/llieLvgM6giy4493
	uEFeX1hlE2rlBNO9jz9dRhLHpg5oMmxU86LpBeMrUUZFW+DxDBKOnIeAZQ8TLDLAkh8e
	wgSry9qIPSm6xeN5oVemr7DxGXH7nASTNgyxWzd+CuHoPjPCcHQ6YNgOyDDxb/iMA9an
	2NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=+SO4z9tijP1why6wGdpbwKB52A5xc/fca4DNksvNDFA=;
	b=LE01VoV/3px9BEziyUdTMfly+CdlKqnDkWZ/eD1ZO2ap+0OEPa1DamOM6gc8gfWfcR
	HXUtZzjB0Nyvy0ngkbz0I/ICsl/ySCpfAQkM3Olq6Y+R5MmV4r1oH7DKpV1E4/Lm9Dri
	SBcShVYACVrh4GlqPSK35iIDUlj/Ts7F9JXmjtHY0cb3YGraQHQd+xUCRmpOjCnm2mIr
	87urPlXlpC+B33cOqJZ5ARF0AKekOo3a+g2BtkRs5YsgJu6RHhsgFbnIp+ExOUqCYrw7
	9sSo6YMypbFSx3bHxHxF7h7ppkTVFEwLG0/kSCtv8bH7qkmSvcawtLH9YxXtGkRDKDyM
	+n6Q==
X-Gm-Message-State: AOPr4FV9anYxozPngF4rDdlnoBfVo6vQMULxl6/XRryZgwbVF2dWElN9TRYL9+78J9TNpxyFzi9xcBozNrhKZg==
X-Received: by 10.107.2.70 with SMTP id 67mr25648960ioc.70.1462549381110; Fri,
	06 May 2016 08:43:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Fri, 6 May 2016 08:42:41 -0700 (PDT)
In-Reply-To: <AM3PR07MB2283A59FECB71A5D04EF498F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
References: <DBXPR07MB23993DC9B9946851B629E21F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
	<CABcZANniNW9XRsATUvu=D0nSMWh2paEWPED2xZRjo2z6VBKvBg@mail.gmail.com>
	<AM3PR07MB22889D01AF1F38A1664FBB3F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
	<1462531762.21674.135.camel@linuxfoundation.org>
	<AM3PR07MB2283A59FECB71A5D04EF498F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 6 May 2016 08:42:41 -0700
X-Google-Sender-Auth: UVfvCxmp3kUzNobg-nscEn1ISxY
Message-ID: <CABcZANnAm354rEBfWm19bKY6yD3eRK35QSX=TaO6Gpj1inTffA@mail.gmail.com>
To: "Kucharczyk,
	Bartlomiej (Nokia - PL/Wroclaw)" <bartlomiej.kucharczyk@nokia.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to force BitBake to track dependency to METADATA_REVISION?
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
X-List-Received-Date: Fri, 06 May 2016 15:43:04 -0000
Content-Type: multipart/alternative; boundary=001a113968145417c605322e50be

--001a113968145417c605322e50be
Content-Type: text/plain; charset=UTF-8

On Fri, May 6, 2016 at 6:32 AM, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)
<bartlomiej.kucharczyk@nokia.com> wrote:

> > The problem is probably the cache. It has no knowledge of when it needs
> > to reparse to see if this value has changed. If you set BB_DONT_CACHE =
> > "1" in the recipe, does that help?
>
> Yes! That helps.
> Thanks for those hints!
>
> What BB_DONT_CACHE does exactly? I found it undocumented. ;-)
> I understand this is config cache, not the 'sstate cache'.


It's not the config cache or the 'sstate' cache', it's the parse cache.
Recipes are reparsed when the recipe files or classes change. They aren't
re-parsed every time by default.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113968145417c605322e50be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, May 6, 2016 at 6:32 AM, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:bartlomiej.kucharczyk@nokia.com" t=
arget=3D"_blank">bartlomiej.kucharczyk@nokia.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><span class=3D"">&gt; The problem is probably=
 the cache. It has no knowledge of when it needs<br>
&gt; to reparse to see if this value has changed. If you set BB_DONT_CACHE =
=3D<br>
&gt; &quot;1&quot; in the recipe, does that help?<br>
<br>
</span>Yes! That helps.<br>
Thanks for those hints!<br>
<br>
What BB_DONT_CACHE does exactly? I found it undocumented. ;-)<br>
I understand this is config cache, not the &#39;sstate cache&#39;.</blockqu=
ote></div><br>It&#39;s not the config cache or the &#39;sstate&#39; cache&#=
39;, it&#39;s the parse cache. Recipes are reparsed when the recipe files o=
r classes change. They aren&#39;t re-parsed every time by default.<br>-- <b=
r><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth d=
ot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib=
<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113968145417c605322e50be--
