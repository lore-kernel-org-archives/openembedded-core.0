Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 832CC78743
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 14:02:00 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id m11so2255627iob.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 06:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=78D15/3uCX8oyugchVCoF06xcovyqNHXQjscP2CexGk=;
	b=DNgPdSSz+v4dD5JTlafh/RukpiPTF+myMuHlkWYMOMrMo5Ftd8iYduW6zD/GwC/B18
	FxQakvyg3tvRjYrZFGwsFS6GulU02t5MDXHUGn1Al6Z0KisjGHexX07vAuc68t6Wlrx2
	uTDBHQmV8R/Xtjaxd+x8NSwLHEv/xHlTYMqLvuf6Q65kgywoQvLZDAcEBs8GqjTsnU5h
	XhEz+EBHL4D2Sd4ObFV1pS6C4gqg2m9oToXx2SDy+PiQA1rlFnYhYSP1Y5XXtCjt+tb8
	j+scuHkeLbCAfyQpJ14EN4qYl5wFXBM/YqRXcfifM6MkDFKc/9hnVOiW8jbyp/kxOOtY
	k9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=78D15/3uCX8oyugchVCoF06xcovyqNHXQjscP2CexGk=;
	b=BZpBkNPwaD7bxk/BOHikkCaFPDntZY8/XoCWk/wGJfOUJZAVNkA1Q0pZ4ZYJfAMCM4
	ax7FMhbffe5jA13FEm1+AOmM+KDr8RH1RHHwxz35HtFysUfjQbc0sHpu8B/oQAqHUWra
	EldfIqe/yVZaWF12TmUGIgWUw8GtlVpEnIKVtjBIySWxbpWx4nkdJDyPWq+Y+UWiEHHC
	dO+SgStzm6k87BxtD1/c85BAyRTAAsF12+e1/ptFsUstB+olmfK4MtPMPJL7lIy1Y/+O
	qA78oz6f5AUFe+56NH3WoLNC1vjOuHVQ2OaZS358BMrKqKfB8WH2EfNJcDUH1NHHMEpR
	M3DQ==
X-Gm-Message-State: AKwxytf3+mm9NCBwjlw6W6wmhh4HkD59oDjRpbtYoE1TrxKjPdtpTVgp
	f14507c6F638VDELxKQ3s923T1GwE5//LeggXF+mPQ==
X-Google-Smtp-Source: ACJfBou42PoMEpUf9PkdgjYCTOA3JwHWNdQJZxLFObuQ0hrDUvcBtmcbzyWCWO8pDH4t7jXKduGrMqUKM58NeXvBtC4=
X-Received: by 10.107.32.19 with SMTP id g19mr1783575iog.217.1516370520796;
	Fri, 19 Jan 2018 06:02:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 06:01:40 -0800 (PST)
In-Reply-To: <1516370069-9287-1-git-send-email-ole2mail@mail.com>
References: <1516370069-9287-1-git-send-email-ole2mail@mail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 14:01:40 +0000
Message-ID: <CAJTo0LbBLdJi0S+s-fRMT9b+JJZShTBgJ0kmCuMYiiK6KZp+Vw@mail.gmail.com>
To: Oleg Kokorin <ole2mail@mail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 14:02:00 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a43da828056321861e"

--001a1141a2a43da828056321861e
Content-Type: text/plain; charset="UTF-8"

On 19 January 2018 at 13:54, Oleg Kokorin <ole2mail@mail.com> wrote:

> +Upstream-Status: Pending
>

Is there a reason you're not sending this upstream?

Ross

--001a1141a2a43da828056321861e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 January 2018 at 13:54, Oleg Kokorin <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ole2mail@mail.com" target=3D"_blank">ole2mail@mail.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">+Upstream-Status: Pending<br></block=
quote><div><br></div><div>Is there a reason you&#39;re not sending this ups=
tream?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1141a2a43da828056321861e--
