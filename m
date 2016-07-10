Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 504D165D00
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 23:05:27 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so41464761ith.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5l144JTwXAtzZK8WttoX3AARn7JCEneTPq1nzyhXCnA=;
	b=iBI8T9LFGBYZP0WinFAFkkhylj98lSsnhb4/MOsoK6pRvfLttwUkcq60Ue7Swv65/1
	2SkIVfZfUEMrbe3JXgtKJCsG16LxyDm4GMu4DqGN1G/DXiLSwAi7dsOaNODNNuv8YHOm
	QZC4p+/kiTWd/WjLfGfgH+A4qbu01hQj5tcDNXnx/Xdm9z/8Dli7jbX+jFJ7oGOS+7dB
	HzGRVNz2y4aV6L6rhmRW3GKD5/GxaVC2MttJhdsAey5MSn1n3kcw+CHE6ZSrGyic3jGZ
	8bF2A5/Iw8EqILeY6zSamM0X0BuNZVIfH4E2UhCnA/UxFPCTU2vga4aFrn26wdVbDcIn
	YxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5l144JTwXAtzZK8WttoX3AARn7JCEneTPq1nzyhXCnA=;
	b=Tunw9N1AO+hBzAuN6BrDwaUAl9Ov2D1N84I7991FBW/7HAZU8B9cvk8vad9MlHFiLS
	6fuO9jj2Pvz/+Zd8E7Y1CCNzEk3p+RmmSo+J+8g3yKcy/3qzMA5180LKoI6ZtojokhLu
	VbLVrBga4m1aps47kcvZS5D3jKTicSHBbV8RZdcbx1aydfyoBySlcsbDs/rPzlX1WvCh
	3IYSkDwOKxEpZonyfKzKX1t3LYpzZ+EcisDfKjuKLXUqCRL1zuKNKDqtHakH8tbg4DaO
	ZJTRsRugSbTtexTLwHozHE1TS3o8Pqd4VNvRHfEIkOCd/wZBjr+eh+ooupBg8jRfNkYq
	8yIQ==
X-Gm-Message-State: ALyK8tLl8EPgPzyhWEonC1RLDjZW6Mmqit5SVcwyVCKiOtNo/AfGThUa4jplGI9vGOQAaSzPoyJhof/KWMM0sk10
X-Received: by 10.36.121.21 with SMTP id z21mr13099344itc.38.1468191928483;
	Sun, 10 Jul 2016 16:05:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Sun, 10 Jul 2016 16:05:09 -0700 (PDT)
In-Reply-To: <CAMKF1sowh1yCm_0StdEjZJ1GWvSTanV3N-rFJmAS=B8=zaZf8g@mail.gmail.com>
References: <20160709232717.22380-1-raj.khem@gmail.com>
	<CAJTo0LbkQBgu89Ow79weX5mVPwtWewtkUeDzkc39+Mz9VHN85w@mail.gmail.com>
	<CAMKF1spk0f9xpNUUaqpLvx4aAPZ0cAU9NgG8eYLPtC7ziBDU2g@mail.gmail.com>
	<CAMKF1sq1oH4c96XyTX1CK7pZgLYgjHEQKmjJ4ndS9GyV4A1zZg@mail.gmail.com>
	<CAMKF1sowh1yCm_0StdEjZJ1GWvSTanV3N-rFJmAS=B8=zaZf8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jul 2016 00:05:09 +0100
Message-ID: <CAJTo0LbCsLsLjG7J_ZtQMRnoipyNeLSYPi_7LipbWqjN6Bo6+Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] v86d: Accept aarch64 as build host
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
X-List-Received-Date: Sun, 10 Jul 2016 23:05:28 -0000
Content-Type: multipart/alternative; boundary=001a114a95a05c11b20537501239

--001a114a95a05c11b20537501239
Content-Type: text/plain; charset=UTF-8

On 10 July 2016 at 18:59, Khem Raj <raj.khem@gmail.com> wrote:

> Yes it is however the recipe is limited to x86 and now that we add a non
> x86 build host this is a compromise I came up with. Hopefully we wont have
> folks adding host architectures to Build oe on so regularly. Otherwise we
> wont need cross compiling ;)
>
Actually looked at the recipe and I see we override this value anyway, so
ignore me. :)

Ross

--001a114a95a05c11b20537501239
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 July 2016 at 18:59, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex"><p>Yes it is however the recipe is limited to x86 a=
nd now that we add a non x86 build host this is a compromise I came up with=
. Hopefully we wont have folks adding host architectures to Build oe on so =
regularly. Otherwise we wont need cross compiling ;)</p></blockquote></div>=
</div><div class=3D"gmail_extra">Actually looked at the recipe and I see we=
 override this value anyway, so ignore me. :)</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a95a05c11b20537501239--
