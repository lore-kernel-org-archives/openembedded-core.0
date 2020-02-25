Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id BF03761541
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 22:00:20 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id k188so479731vsc.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 14:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qO3V0ppm50+H3SXFgjG5fYPB4OKZ6s6SIT3Z4MQIrLg=;
	b=fXk3Nbluo1KQLtQMC2belKRYR+/FeGPvC+re4fStXnl0AKWcWU5/cuna0ip0eZ5q/9
	PUqnvTGaHTVUgG57rYH/5AM6ua4JBHxQMCIKAzQ9EISIeduQgS0eTRS6l1GjDBxe25KE
	TRXw4G8/F7FRPoQoQyV/qYJhAnCbsIR6NE0FVIdnlHOmd3haPtSfpex5XHPBNIroUb22
	NBjvBfsLZiPosRAUDUJ8M+4BScsKUbwJt0HYfN4z0h1zWChgPqBuxDaYzRhAiEpYHH2G
	o9Bb2qJg/LzoWG+G3a/CbG3q2lkCEdWpyYnbVF61xVVHUz3bHK0KHKSVxCqG9zYyuWqC
	LAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qO3V0ppm50+H3SXFgjG5fYPB4OKZ6s6SIT3Z4MQIrLg=;
	b=LR/aVOOINiDqsxOng8pXuTiYSoMbdj/Vx4HAMxeBzW7lBInhwYdpq2n2XRjkA3xpsx
	A6TLWChdhqzMyzv8ngwVkpN6TsaH/uiUcaWwhsUtpT3t/87Lqrkvz98xPUWblNy3hWe8
	r4PcPrmoqP0EiFoWSalSl4AsSZw/udJsEBtlSgrfenM3qbf8iKAJYEpDdiQ5/yrFjxXg
	eWoZ6l/1amD6tSErq6Al18dtnt4WlMd1qKjgwvuF4WEvDRViTUJNZ7dy1jlbA5Sx+oEb
	5VtTzAe+KIbaAWDu3vQ9xzhiLpDlkcoVh3/QUpHwpYw9LSu0P4dW1HkZYnCeBA4qdvvI
	HKKQ==
X-Gm-Message-State: APjAAAUnftCB7LvG9XJFaXXbE5V9rWQCEy0xk3mdEQUtGSHFwlghYOqj
	Yqp8dDPbkEaq6RIye75fSBWj1mvRQ/1kukOAr70=
X-Google-Smtp-Source: APXvYqy/vySDhziYdQ7mR9Aj4kMvUNsVDlZ+ouTr5e6GdB2Yr95Z/qmDY3ecAx+sw85+3bvU7RrvqIe6ypMsZ9Gzt38=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr1340489vsq.23.1582668021892; 
	Tue, 25 Feb 2020 14:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20200225212233.30114-1-timothy.t.orling@linux.intel.com>
	<CANNYZj8AP-OdK9-gNTgYbcO4LwshN5ox1iHBnQKGfFc0kuKwsQ@mail.gmail.com>
In-Reply-To: <CANNYZj8AP-OdK9-gNTgYbcO4LwshN5ox1iHBnQKGfFc0kuKwsQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2020 23:00:10 +0100
Message-ID: <CANNYZj-xQ8Vxj3bh5YGEUU=RMTJ2n1NDYNh6_2YcHTaGXgRgwQ@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Tue, 25 Feb 2020 22:00:20 -0000
Content-Type: multipart/alternative; boundary="0000000000003e09d1059f6d9d98"

--0000000000003e09d1059f6d9d98
Content-Type: text/plain; charset="UTF-8"

But probably a better solution would be to keep the patch, and drop the
custom sed hack!

Alex

On Tue, 25 Feb 2020 at 22:58, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 25 Feb 2020 at 22:30, Tim Orling <timothy.t.orling@linux.intel.com>
> wrote:
>
>> +           file://ptest-perl/run-ptest \
>> +           file://0001-Committing-changes-from-do_patch.patch \
>
>
> These two are 'devtool upgrade' noise, and should be removed. The recipe
> does weird things which triggers devtool to add items unnecessarily.
>
> Alex
>

--0000000000003e09d1059f6d9d98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But probably a better solution would be to keep the p=
atch, and drop the custom sed hack!</div><div><br></div><div>Alex<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, 25 Feb 2020 at 22:58, Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 Feb 2020 at 22:3=
0, Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" targe=
t=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://ptest-perl/run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Committing-changes-fr=
om-do_patch.patch \</blockquote><div><br></div><div>These two are &#39;devt=
ool upgrade&#39; noise, and should be removed. The recipe does weird things=
 which triggers devtool to add items unnecessarily.<br></div><div><br></div=
><div>Alex<br></div></div></div>
</blockquote></div>

--0000000000003e09d1059f6d9d98--
