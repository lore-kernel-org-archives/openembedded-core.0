Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9823960777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 11:32:33 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q130so37622946qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZbQqXyq2bvs/iNVY56AWGQi3Z4F61UxJLavgOxe3H/w=;
	b=N8A59shas8o4cjGgudInq7ahGwkLnXwtEQARDdpaYfn2/5qsbPsBLPc27hGoq9WqSY
	5NfHRU7omVkvsTmaa4E7pSYW7/gR+kMb44xm9AwNHswPnbA26PngbgYxfhhj8osLbpfh
	LYflIoEXqNX9m31QN4jtE55n7gFoUbLUevHOLADDg0ZLvaSdqh61ji+EM2xUqKNcrVTL
	KrBAN4rplZD/doRjKeWX4frw13l9mBYnPbOxS9Iu+RrE0pd9Up0qVNgt+YNeuO/XLHWM
	eLyAYR6PjhbI67bAw1iJOTMfPqQD2nV3lcZRNjah/HL5G8l9Q7eqn6uZiAX7//leYs6W
	BsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZbQqXyq2bvs/iNVY56AWGQi3Z4F61UxJLavgOxe3H/w=;
	b=c05NCDci2MQI2dGlFQms40jvYpHn9zf4kghEf1491mNbWtsXjWDsWsopawc9CnAYfc
	pOwKaYIqjeA7UWZaYqIA195Ra/v28M7RTW56tQWvD4zJtndSvZ8WrrfR13vQ6J1gnoG9
	hiPBSlbCw3eyEaJmYg7gBNpPYYyR7fTJrV8JnplEUwR/tMwhdcVpC3KFSL9eRxrcTnAT
	N+1ihTVcNBqdzpaI9pUVxe8PEH3T80gYVyZwI5VIKEEHeOoLc/LOHcswQqn11gpRIvKf
	UO+uIt1QC2JMkBj9E6OxUbcaIKCfUntUc5lsyhPEqB2Jqytnm0TbrlKuCJwGgd74AxRF
	MXOg==
X-Gm-Message-State: ABUngve9Qc9C+XzScxxVrr2PlaKPPu0+Cu+1LHFzcZt3wQlvyWJ+FgMLk746UrWTJET+upiBB7D8ZYELPoZhcL7M
X-Received: by 10.55.5.145 with SMTP id 139mr23426011qkf.77.1477913554489;
	Mon, 31 Oct 2016 04:32:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Mon, 31 Oct 2016 04:32:14 -0700 (PDT)
In-Reply-To: <CAHvQdo11Y5ZV0GaC0YsdFCEz6KwLymLms51hDkASayPXo-3TVA@mail.gmail.com>
References: <20161029145747.32390-1-fathi.boudra@linaro.org>
	<CAHvQdo11Y5ZV0GaC0YsdFCEz6KwLymLms51hDkASayPXo-3TVA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 31 Oct 2016 11:32:14 +0000
Message-ID: <CAJTo0LYBANe9f--NJkex3sN52ZGUH6Nrd45ktaYV1qxdY8gNJg@mail.gmail.com>
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core PATCH] wayland: upgrade from 1.11.0 to 1.11.1
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
X-List-Received-Date: Mon, 31 Oct 2016 11:32:33 -0000
Content-Type: multipart/alternative; boundary=001a114c8f846cade305402790f9

--001a114c8f846cade305402790f9
Content-Type: text/plain; charset=UTF-8

On 31 October 2016 at 08:25, Johannes Pointner <h4nn35.work@gmail.com>
wrote:

> Wouldn't it make more sense to update to 1.12?
> Since 1.11.1 is backporting fixes from 1.12 as stated in the annouce
> mail of the release.
>

Absolutely - there's a 1.12 so unless there's a good reason to avoid it in
master we should be moving to that.

Ross

--001a114c8f846cade305402790f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 October 2016 at 08:25, Johannes Pointner <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:h4nn35.work@gmail.com" target=3D"_blank">h4nn35.work@gmail.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":20l" cl=
ass=3D"a3s aXjCH m15819d921e7135e0">Wouldn&#39;t it make more sense to upda=
te to 1.12?<br>
Since 1.11.1 is backporting fixes from 1.12 as stated in the annouce<br>
mail of the release.<div class=3D"yj6qo ajU"><div id=3D":1y5" class=3D"ajR"=
 tabindex=3D"0"></div></div></div></blockquote></div><br>Absolutely - there=
&#39;s a 1.12 so unless there&#39;s a good reason to avoid it in master we =
should be moving to that.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a114c8f846cade305402790f9--
