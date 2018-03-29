Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF4C744CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 21:56:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id x4so13950101wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 14:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fwSaENe2yXjChcDXxfVxB9CZxzh+O7ZDI9RZIWtT0/U=;
	b=pkeoJ5qW7JQyKCkvBn2YcTMTTvdlwYyCvIrDxMuMPTUTtSb9RXQT4Dnklz1D8tPbRj
	tBrFCThVACNvdYbHW63yI2hfNDOFyXpq8L0X81vgf7Fw6cd8UUy6CAHSfqp46LbfC1Tr
	/D8J6jt3Oo7BFuPK0H9wa5FPzqki5JPwXZhg2MMU2J0rSpp3pH7s/gZ8D745FOxFhvik
	J0ly5Ea3hX2CrrGcjiYMKFkxVTgfyKtcjQs4rpHUqwZngRxR0Mn0p5q9qqAKmZyCWlDx
	IKxV/ievz2Ug4TNtf+igWyse584+AcIODEZTV5ywfaINLwxwbfnRMF49ISDT6TGJ9gmZ
	VBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fwSaENe2yXjChcDXxfVxB9CZxzh+O7ZDI9RZIWtT0/U=;
	b=slkalz51rx/GDzjPR8/luHYEpdarjaW5KgnNihf8G/E9Y6U7sSfJsOTHgmQIwosVcF
	bC0W3wcETz8Eolqw8B18DiCP4TnbGJAHP6Rler7heVlJ0GGbYMkskLcb9jDy+1oDyJWp
	JU2HYlWG754OcEfmCDJI3JPKnJRXEr8Acgmqt/XttziHK8xLTbgNMOrs+X8BO2dSyEdb
	04ZOqlEnFxnkGwwpMzwGKzPpjyuHrOQBYIU6LONc0vkWuaSByiihMtcyexLSTSi3BBiC
	yV+mSxM6pN9OajZATem5XEosIkcwE0paG50E1a7Tlt3wt+KWY3Z7C6kJqWvFtvjuQrdu
	6RhA==
X-Gm-Message-State: ALQs6tBcdKgnD6RIG6yNVs8QMWHmTkjMmGthdc3I6kqaFLvR1qrwgtNj
	MhV4fXHNOPzX8ZYSsPQb0tlGsWt8K8/LkmTyZRQ=
X-Google-Smtp-Source: AIpwx4/1zT04C6yOvs9End0IU/lQTULmLvCyc8WY7d/sWVyf216J39HWUoK0bIxrWxA6xRX9E5i3nRJhbXOVq0d503U=
X-Received: by 10.28.45.74 with SMTP id t71mr72616wmt.32.1522360592657; Thu,
	29 Mar 2018 14:56:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Thu, 29 Mar 2018 14:56:32 -0700 (PDT)
In-Reply-To: <CAHUNapTc-iiZ6vbRV=J3pt5EQy-qJJbgkwzZKhpAkfC3pgzXiw@mail.gmail.com>
References: <mailman.363.1522325586.1651.openembedded-core@lists.openembedded.org>
	<CAHUNapTc-iiZ6vbRV=J3pt5EQy-qJJbgkwzZKhpAkfC3pgzXiw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Mar 2018 23:56:32 +0200
Message-ID: <CA+chaQdYG-kNDqiStA=yg1nGjLH_pgH7vcm6Db_kxZ+Bt1pWSg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: confirm 6bb527bbc2e6d9a2a2165aa081ea1271ece07fe8
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
X-List-Received-Date: Thu, 29 Mar 2018 21:56:32 -0000
Content-Type: multipart/alternative; boundary="001a11424d6858718d0568943280"

--001a11424d6858718d0568943280
Content-Type: text/plain; charset="UTF-8"

I got the same today.

On Thu, Mar 29, 2018 at 11:51 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> uhhh.... gmail is on the bad list?
> anyone else get one of these?
>
>
> ---------- Forwarded message ----------
> From: <openembedded-core-request@lists.openembedded.org>
> Date: Thu, Mar 29, 2018 at 8:13 AM
> Subject: confirm
> To: twoerner@gmail.com
>
>
> Your membership in the mailing list Openembedded-core has been
> disabled due to excessive bounces The last bounce received from you
> was dated 29-Mar-2018.  You will not get any more messages from this
> list until you re-enable your membership.  You will receive 3 more
> reminders like this before your membership in the list is deleted.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11424d6858718d0568943280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I got the same today.</div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Thu, Mar 29, 2018 at 11:51 PM, Trevor Woerner=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_bla=
nk">twoerner@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr"><div>uhhh.... gmail is on the bad list?<br></div>anyon=
e else get one of these?<br><div><div><br><br><div class=3D"gmail_quote">--=
-------- Forwarded message ----------<br>From: <b class=3D"gmail_sendername=
"></b> <span dir=3D"ltr">&lt;<a href=3D"mailto:openembedded-core-request@li=
sts.openembedded.org" target=3D"_blank">openembedded-core-request@<wbr>list=
s.openembedded.org</a>&gt;</span><br>Date: Thu, Mar 29, 2018 at 8:13 AM<br>=
Subject: confirm <br>To: <a href=3D"mailto:twoerner@gmail.com" target=3D"_b=
lank">twoerner@gmail.com</a><br><br><br>Your membership in the mailing list=
 Openembedded-core has been<br>
disabled due to excessive bounces The last bounce received from you<br>
was dated 29-Mar-2018.=C2=A0 You will not get any more messages from this<b=
r>
list until you re-enable your membership.=C2=A0 You will receive 3 more<br>
reminders like this before your membership in the list is deleted.<br></div=
><br></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a11424d6858718d0568943280--
