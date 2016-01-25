Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A834D6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 13:50:15 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 77so151471765ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=WrMgWUhnQ7uqqiL2H9T02sHlq3sevnPTT6l+0WirO/8=;
	b=DYPhYBT9hfi2Xeo0i1rLhLWVyxztl54ydDALfxAnPgJ+emGA4196OWvKSdB5HwxtWd
	/nP8LATMdXODYJZhT3SInXWAyI3MsQvD1NTTt3xx6TOg5Twa4+GBr0C1IQGPJyeZSuZr
	04uakePeImq29jTB1pRjkVIkYnFpphoxI6KtSWDk+Zjpspi4eBbRCGWz7d/jNPN6TV7j
	rCVC57bdXyKv5iRSdbep1sKmYcfSHVN9fkM4yniWbETfzP2rEDYHcWOV0pScXFyqB76A
	j5XbDdtjHC/rBZqjw1V2CegWJQvy8Q6Ux7BhzR5VAJMR15Rpq1jDb6YBb829quXDF3QB
	BHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WrMgWUhnQ7uqqiL2H9T02sHlq3sevnPTT6l+0WirO/8=;
	b=D1+gZClx8UaM9YrRoUl0SN3uHtnHIKlBZWwTy5Ahh156mK+Elu2bDT+W7q+54y8ufI
	BwukY2MgZWZb/TR7ZqjxTjNg7hBfi36N3i3JQ+zof2PWAIRh3H8FdxuGkH3ID2i/m9O0
	rkA15Nscok8nyKpabnlGltbyraAaIjRtYgNNsWes7U+haKvA2QUUFeovIOYE1sHZeKCS
	io/TgpmuFnYiNs1pjb9jou2iFGUSCL67PT7scIrY9aYzbZySWyDGzt4ot42JWIIz4DTD
	2AZf5KKX8wKjYogWwj5Wqm/fDi/668YQ8Wwx4ZQlIeR34CqYUdYRGTBeTNZAxpWBCxnE
	HRUA==
X-Gm-Message-State: AG10YORvLh/fMHKUaB42e6RSHyHxLca8ZNuyYv7A2wgtgEDscO2/qkbQCEQl2YeUxPr0qNRcDoyD2gieV3IEjK/t
X-Received: by 10.107.164.38 with SMTP id n38mr252467ioe.148.1453729815694;
	Mon, 25 Jan 2016 05:50:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 25 Jan 2016 05:49:56 -0800 (PST)
In-Reply-To: <CAMKF1sq-mQQpBAa1YCcZFdQxEPOd=2DH-cm+oKKV2uD8_PPJ+A@mail.gmail.com>
References: <1453497982-9859-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sq-mQQpBAa1YCcZFdQxEPOd=2DH-cm+oKKV2uD8_PPJ+A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jan 2016 13:49:56 +0000
Message-ID: <CAJTo0LavmAFOxe2uL_L1OR4ZA0=_4JUz-qF5TE756ODkC3SyPQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bsd-headers: fix LICENSE syntax, && -> &
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
X-List-Received-Date: Mon, 25 Jan 2016 13:50:18 -0000
Content-Type: multipart/alternative; boundary=001a1142263243a7f5052a28d98a

--001a1142263243a7f5052a28d98a
Content-Type: text/plain; charset=UTF-8

On 23 January 2016 at 04:48, Khem Raj <raj.khem@gmail.com> wrote:

> This is already fixed in my tree. see
>
> https://github.com/kraj/openembedded-core/commit/86cd0650126b0ed7434335cd986272af69dc3671
>

That's lovely but you didn't send it to the list, so nobody else knew. ;)

Ross

--001a1142263243a7f5052a28d98a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2016 at 04:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":10kp" class=3D"a3s" st=
yle=3D"overflow:hidden">This is already fixed in my tree. see<br>
<a href=3D"https://github.com/kraj/openembedded-core/commit/86cd0650126b0ed=
7434335cd986272af69dc3671" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/kraj/openembedded-core/commit/86cd0650126b0ed7434335cd986272af69dc3=
671</a></div></blockquote></div><br>That&#39;s lovely but you didn&#39;t se=
nd it to the list, so nobody else knew. ;)</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142263243a7f5052a28d98a--
