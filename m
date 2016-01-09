Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2220C731BE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 09:59:00 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ik10so94766083igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 01:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=OW3t6iYqeo147szDowSlAInoYn3G1mwzWdxJrwGpQr4=;
	b=jJUXdHS7gXHiBfjTFSBfHRMaOM+mzgNIY36ZP5+lMjRWsAVlA6PQofbz7jUDDn1eI9
	KSXd3HfxwEbEqC60ZRseXzIhcBz99cplWCeCxMS0YZsn2gG/C70Kbtg2ahJ2E8E6KCLD
	Qg+A5HMu58jcWGLt8xJL34+FuPrYBoD4JP/5Xkhi0tefHUPgw0qCTQZ64FFwTPgD3Efg
	4lRcOc2yvqyZq9/B0V9eD5hXdst4SUIu2ZtCU+IbSGVFeXUlcAb1CPJfxvJRAJv6hKGP
	pirN+gH3YfZU9pHIndSgAKwoH68cIWjOx8jawhvyAA3BP0SCVz671OhdCyILv/awuYdM
	+oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OW3t6iYqeo147szDowSlAInoYn3G1mwzWdxJrwGpQr4=;
	b=Z3yjqT7imGeAlq56UykIHw2a/eImCMQMBOgslWLpxOgHVOdI/2XYZImvl6WZzHGpyN
	a5+6oqBSpHNrSVG7Dp5TQkeUDNOhhtNbMRvDrvEJhlhYR526NcY6vcUUA7Kbd6Bus3Uk
	Vy/9OBEB1IH9J5KX2HOTXLVJQlM7nT+V6p++7T1lfFENT0M2k7A4YDntn/XLY6Mqh8Nh
	b7aU5nwHhSTfvydJFkZFY1maitZ/dWIsfOwFgDVmWfRZpFWH3J5qMJSTNjOZjMRofAuQ
	4lxwtOEJNuKMcY2LD+rU7vwcv+rQqGeJ6pT6of1Ia1NenBOmQ7+/BZHF8QeBBu5RllEz
	ERzA==
X-Gm-Message-State: ALoCoQnYF8KjHvWUB/kqADq9uAXjzw6O8tWh24iD4orw0EanAP68nsxyUNPOhZaPrsvG95CY1vckKfOXZbFRpUhnWlfBXB3nQ9LkRQo/sXmFZ9dbpXFB8rA=
X-Received: by 10.50.55.4 with SMTP id n4mr2924009igp.64.1452333541347; Sat,
	09 Jan 2016 01:59:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 9 Jan 2016 01:58:42 -0800 (PST)
In-Reply-To: <CAJ86T=X=s81M+2ywKV4T63A31sfmcRnHHar5oUMd4JsS+UFezw@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
	<555844c65d44169bb4478d4470a802ebc2fe2f94.1452248145.git.raj.khem@gmail.com>
	<CAJ86T=X=s81M+2ywKV4T63A31sfmcRnHHar5oUMd4JsS+UFezw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 9 Jan 2016 09:58:42 +0000
Message-ID: <CAJTo0La71kkiUt9ObMOkj-ah5k9o6pN=a4U4Md4xuYTzbTAXew@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/53] directfb: Fix build with musl
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
X-List-Received-Date: Sat, 09 Jan 2016 09:59:01 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b49d3ecee0528e3c02e

--e89a8f3b9b49d3ecee0528e3c02e
Content-Type: text/plain; charset=UTF-8

On 9 January 2016 at 03:27, Andre McCurdy <armccurdy@gmail.com> wrote:

> For patches which fix 'correctness' issues uncovered by musl maybe
> it's better to apply the patches unconditionally, so they get some
> test cover from non-musl builds?
>
> Especially true in this case - see below.
>

Agreed. Patches should only be applied on overrides if they negatively
impact other configurations, so a strict correctness patch should always be
applied whereas a patch that stubs out glibc-specific code would be applied
on specific configurations.

Ross

--e89a8f3b9b49d3ecee0528e3c02e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2016 at 03:27, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"=
mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2vg" class=3D"a3=
s" style=3D"overflow:hidden">For patches which fix &#39;correctness&#39; is=
sues uncovered by musl maybe<br>
it&#39;s better to apply the patches unconditionally, so they get some<br>
test cover from non-musl builds?<br>
<br>
Especially true in this case - see below.</div></blockquote></div><br>Agree=
d. Patches should only be applied on overrides if they negatively impact ot=
her configurations, so a strict correctness patch should always be applied =
whereas a patch that stubs out glibc-specific code would be applied on spec=
ific configurations.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--e89a8f3b9b49d3ecee0528e3c02e--
