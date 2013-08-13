Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 64CD86A994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:33:13 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so8509622pad.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 00:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Lop9rtbe1cpIxmWuKc/Vm1/TxAnWAJi+87bbRhGHf/8=;
	b=CibFWZsAPJKO6DEU6j5dRbaxeMTi26Tks4eOIW5RijgT/vcgkNOycYpyQP6d/lupXS
	pRpT5HUKPsvSUgMMy35dj79iU98DriUeb4kQjRPTl3kSF6ussMQja/L9EdpMfsfM+y2y
	xUTQzbeeKz0NEznCc1IeVgsigWbCsC+s32BkXj0eyMtqtmkCA9wziqvOQRH7ZkslmnEH
	Xfg9y/lsABTmCH1Au4H0PXf2FjRLERuzf1ZDQWqt/cN7n4N7JwIq/ynJ/HF4ek8IoY4S
	BqDonuE2gvHvTdOdD4x+z7TX3e1X8Bl6NsnU+6WSTd4vBFPILA9SvdFtoW22I98wIOq/
	ykWg==
X-Gm-Message-State: ALoCoQm6tbLekrI9Qz33/uoDUlnvgJYfHINDERR7pjtnZeMEc46emDIj/s4u2pUQU6vlOJbmqLEZ
MIME-Version: 1.0
X-Received: by 10.68.189.72 with SMTP id gg8mr88789pbc.201.1376379194302; Tue,
	13 Aug 2013 00:33:14 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 00:33:14 -0700 (PDT)
In-Reply-To: <CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
Date: Tue, 13 Aug 2013 08:33:14 +0100
X-Google-Sender-Auth: xN5LlfbujRZlY8V4k6CJkcuDd3M
Message-ID: <CAOMwXhOTT4VuBFyNcK-T3ZLYOTYMyDJh6W+ioJCdYWJFtRwOKA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 07:33:13 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85ef409ec04e3cf4023

--e89a8ff1c85ef409ec04e3cf4023
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 13, 2013 at 8:32 AM, Laszlo Papp <lpapp@kde.org> wrote:

> So, everyone suggested PACKAGECONFIG in here on the mailing list except
> Khem whose reply I did not get.
>
> Yet, 4964 got closed by the "team". Could anyone please give a sane
> description why and what would block the end users other than fork?
>

... what would _un_block the end users ...

--e89a8ff1c85ef409ec04e3cf4023
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Aug 13, 2013 at 8:32 AM, Laszlo Papp <span dir=3D"=
ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</=
a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">So, everyone suggested PACKAGECONFIG in here on the mailin=
g list except Khem whose reply I did not get.<div><br></div><div>Yet, 4964 =
got closed by the &quot;team&quot;. Could anyone please give a sane descrip=
tion why and what would block the end users other than fork?</div>
</div></blockquote><div><br></div><div>... what would _un_block the end use=
rs ...</div><div><br></div></div></div></div>

--e89a8ff1c85ef409ec04e3cf4023--
