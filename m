Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DBF8A6012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 10:37:02 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t69so2495644wmt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 03:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=59kJrtqblV/d/k6ODAFtOIkQlTgsklIS7w3+M1f0biA=;
	b=pkAVpOkh+T605iZZD99fY0ITo7d352KBlaUWdroXu5/UR+WgDavt2Je4Ppl28YssUW
	BoWMuqBVOtuOdig3yTV2fZRqZL7W+TPCF/GEjsYSLGngaoiRqAcK3Dae/10vgIpR1niE
	aUhK9L9JUP6LfhsfjT0Pq5KQ6lnMqPUG0al0XTJt0E2XoAXJ7eIC6NdtBamL0YwWw2u0
	XbyggbTKL9D/xoU9WAmAONMK1wbhgDb8Z8sUsd/DcXSe45cr7YxSJ4uBKFPgJAVOHOm9
	KM+1587TUO2w7uYFlq4qLh6aEeGGTbEjPOS/b3BSdyRldon+AOuCCX3q1wCi6iC8SNkX
	Vy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=59kJrtqblV/d/k6ODAFtOIkQlTgsklIS7w3+M1f0biA=;
	b=dwYkPsakmGFQNdaoITc1UWweNr8+EOL7KSutoTBX+mGc9dwXz/lQ1+IUk9jRhuoNhD
	UpbnvjNavYe6GU4wXptndCPcyKA5JHRvjRqoHFGs2ugaEyLPnI4BXZErM7w3T9G8n272
	6OOy94CLRj7bVyzN6hpi+q5hAq09Dk3E0cRuyYtUWaKEo9sVmuN8bProDYiWqK1kpZMc
	BbAkV1sQR07zi3CM7aVBfK7yvgO7rWjy+jwTDDrRwweMZcWK/7g0QXBnIpTts5jNn6Cx
	Zjf2h7qQp5mmNYOdC2f5gDS+PPJQYAAnxMqth6r0q8CTG51/SxfrUGqS64S/dLwhcCni
	RFTA==
X-Gm-Message-State: AHPjjUidFb8xb7xa+3z1UAjXwviRCeLhuxunaFGURiHDLbqj5I2gsDcz
	yJt2SqDb61yqHV2Xr0VQlRwNY7LPRO21RKkr/Mo=
X-Google-Smtp-Source: AOwi7QCoq0bwBK2N8SRtAuMBpYx8RBeDW9IazguFkwlbN9Xs3CAdnh+Fh6Ap1Ur46xApYimlgObSWL+bAN/QgY6YbXw=
X-Received: by 10.80.205.94 with SMTP id d30mr9521073edj.7.1506681423521; Fri,
	29 Sep 2017 03:37:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.142.236 with HTTP; Fri, 29 Sep 2017 03:37:02 -0700 (PDT)
Received: by 10.80.142.236 with HTTP; Fri, 29 Sep 2017 03:37:02 -0700 (PDT)
In-Reply-To: <CAJTo0LYaN8SapMtgpQhNkPz7TKR9JgOMhroxWp4Q1+BDkcucMQ@mail.gmail.com>
References: <20170929094702.5334-1-francescogiancane8@gmail.com>
	<CAJTo0LZTrRnhgFRhK3=GxVfzrT5H7p-k=Untwq9T+KWTrpyMQA@mail.gmail.com>
	<CAEQ58siT6Lw_W9Oe60v125ZZak2UXQ0L-R4PvaHAz6NKRi_-vA@mail.gmail.com>
	<CAJTo0LYaN8SapMtgpQhNkPz7TKR9JgOMhroxWp4Q1+BDkcucMQ@mail.gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Fri, 29 Sep 2017 12:37:02 +0200
Message-ID: <CAEQ58sgLXBEc4k=E2A2=SoG360_8zva-w+Y+Q9P_QauTK0uznw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [openembedded-core][PATCH] xorg-xserver: fix building of the package when different virtual/egl provider are selected
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
X-List-Received-Date: Fri, 29 Sep 2017 10:37:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c1af35809ee00055a519b50"

--94eb2c1af35809ee00055a519b50
Content-Type: text/plain; charset="UTF-8"

Yes, in fact Mesa rprovides both egl and libegl.
So the patch is to be issued to the userland recipe of raspberrypi in the
end. Would you confirm that?

Francesco Giancane

Via Paolo Braccini 46, 10141 Torino (TO)

+393933920466

Il 29 set 2017 12:16, "Burton, Ross" <ross.burton@intel.com> ha scritto:

> On 29 September 2017 at 11:14, Francesco Giancane <
> francescogiancane8@gmail.com> wrote:
>
>> Hi Ross,
>> Thank you for your clarification. I double checked the recipes before
>> asking for the patch,  and I found out that Mesa provides both virtual/egl
>> and virtual/libegl; searching through the layers I did not find any recipe
>> depending on libegl but only on egl. Incidentally, userland from
>> meta-raspberrypi provided only egl, and that was the final confirmation.
>>
>
> Note that virtual/* are build-time dependencies, this dependency is a
> runtime dependency.
>
> Ross
>

--94eb2c1af35809ee00055a519b50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, in fact Mesa rprovides both egl and libegl.=C2=A0<di=
v dir=3D"auto">So the patch is to be issued to the userland recipe of raspb=
errypi in the end. Would you confirm that?=C2=A0<br><br><div data-smartmail=
=3D"gmail_signature" dir=3D"auto">Francesco Giancane<br><br>Via Paolo Bracc=
ini 46, 10141 Torino (TO)<br><br>+393933920466</div></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">Il 29 set 2017 12:16, &quot=
;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burto=
n@intel.com</a>&gt; ha scritto:<br type=3D"attribution"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">On 29 September 2017 at 11:14, Francesco Gia=
ncane <span dir=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com"=
 target=3D"_blank">francescogiancane8@gmail.com</a>&gt;</span> wrote:<br><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"auto">Hi Ross,=C2=A0<div dir=3D"auto">Thank you for you=
r clarification. I double checked the recipes before asking for the patch,=
=C2=A0 and I found out that Mesa provides both virtual/egl and virtual/libe=
gl; searching through the layers I did not find any recipe depending on lib=
egl but only on egl. Incidentally, userland from meta-raspberrypi provided =
only egl, and that was the final confirmation.=C2=A0</div></div></blockquot=
e><div><br></div><div>Note that virtual/* are build-time dependencies, this=
 dependency is a runtime dependency.=C2=A0</div><div><br></div><div>Ross</d=
iv></div></div></div>
</blockquote></div></div>

--94eb2c1af35809ee00055a519b50--
