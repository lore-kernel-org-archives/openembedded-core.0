Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 69D166011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 21:12:57 +0000 (UTC)
Received: by igvg19 with SMTP id g19so20667354igv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=bTpaoLRGcJ8TTW0oWqiBl/ppXlPjcIvLWiHLIb8JtCk=;
	b=b2lT+1+dBaHuLodMN4mTNE8yr1KiDhY/H0YN0iLhCLXUrkV877hMbpH+aitTBma4wF
	7b41GeWP7RoFhk1G7IUwg7OyhgKIYT5O7TAQT3ssrtrQPo47ULM3ClNQ65RZRZd01BLK
	QxmsJ2Nr4gufGW3LsqaKCkPizP06c/fUN+rLLVKBcU23rU1EJBZ6ThRwMFEfOtHkQH7d
	EEm/5gDP58IUGynEOwwyjpHNCFtmihlJYl4LV985xRy68l1IFNaI5iF2B5HGzJgXkJrp
	z/k76h4cB4Atkj/oRbcBXalCQlinHzTJOs3ANQlGfA3hK+Rj4WEpP4esgxnjUwDpFMkR
	6YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=bTpaoLRGcJ8TTW0oWqiBl/ppXlPjcIvLWiHLIb8JtCk=;
	b=CBiNk5DEsLNIWtV/wlFq5g9pdUiCatliTh3Bajg7IBVGhSnmnYSwHbjuOiTPfLkS1d
	U7H2IWNRyviWTdmUnKnYi8w2Sy80fl5j3SPgPbywGwncgWyA9fJlNI+QqY1es/hygoYk
	0QZlJfYPbEbDSwX2eU9PQ4/VSO7M7NaeCT7WrBq3azH9HYA9utFnhDox8EShREOPkxiJ
	c1ltEq3W/rxb+51qawp8B/yodk32cUbbeFapcrVNR1DfrldNcQnx0xugxpVWq5vambre
	l9hYNLX8KZ1g+i8uZZMZgq0y2XpV0MgVgpc92cd6u21q/9mR1BZm+x41AljuBkIMjeI3
	tAXA==
X-Gm-Message-State: ALoCoQmJ2XiD9Exy/lnqhS+RAxfs1/bN4zvGUUPpz9CdBCWTSFZhbN84Uo1U0mCmN4B2cNWxgeer
X-Received: by 10.50.64.147 with SMTP id o19mr4503924igs.52.1448572378459;
	Thu, 26 Nov 2015 13:12:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 26 Nov 2015 13:12:38 -0800 (PST)
In-Reply-To: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Nov 2015 21:12:38 +0000
Message-ID: <CAJTo0LZUnsmPi7yuDcEtYVGGXb4Lj3n8kRDpSQQineWhMYpZGA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Thu, 26 Nov 2015 21:12:59 -0000
Content-Type: multipart/alternative; boundary=047d7bea2f980cc4a60525780a93

--047d7bea2f980cc4a60525780a93
Content-Type: text/plain; charset=UTF-8

On 26 November 2015 at 21:00, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Please let me know your thoughts on the above, most importantly on the
> patchwork upgrade, since most of this hinges on that; I don't believe we
> can
> practically base it on the version of Patchwork we are using now.
>

Yes, yes, and again yes.  :)

Ross

--047d7bea2f980cc4a60525780a93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 26 November 2015 at 21:00, P=
aul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.in=
tel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wro=
te:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":134" class=3D"a3s" style=3D"overflow:hidden">Please let me know your t=
houghts on the above, most importantly on the<br>
patchwork upgrade, since most of this hinges on that; I don&#39;t believe w=
e can<br>
practically base it on the version of Patchwork we are using now.<br></div>=
</blockquote></div><br>Yes, yes, and again yes. =C2=A0:)</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bea2f980cc4a60525780a93--
