Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id BACA67F634
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2019 02:54:33 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id m2so12969591qki.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2019 19:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EFHI9ZVyd4lckaYn6fxxbgHQfvCkAQiQehFwid/U3Og=;
	b=hNaXcmNXy1TmkmNurFyw+M2zKq/LAJVGs9HSJU3ISBgXzFVKT5z9alqr8GtksW6ewO
	sc7un9cVC1ORteU82Dp3rN7NcEOO0YQHJ0J18us5HdGnH8j3s3/L9UugsBVYBWPg3UjB
	I6DCOucwTcRCekDqDpHIdPH+sM5GdeZ+Oj5MJsQ7Lt41c+QHzDFMdYlC4aV51YXrLYmz
	AsAGT0WD3mF8iXna+aLerBk3ZFR4xQw76bGdxY/99RbDyyfNnFhll+dXAFOiZhrOngbn
	SupXrn0M02Lx14VmVBlRGzTSA0n/d7xm+JrkOEKL1xdoqPd88GrcKC6d/4xcqdtXzuvT
	ZCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EFHI9ZVyd4lckaYn6fxxbgHQfvCkAQiQehFwid/U3Og=;
	b=odrBPjbf2YQp1ptGhU6xmLgbLcCeyXZFd/+5h+DaqE5Z73yRvd5osXcnd5iSe6fFT9
	tYGqR8ZJFjHTl+Ktw6kZLSUBeOZZnTJVLpkqyi9dTnS/90+snQ3Y2qOQMe8QsPraahw8
	KaT5n5ld+ARR2am1Zh3UinZ1B+l06e8pk007l3H+hFEUO8sOchsaePxVx+ABnMTRu+NB
	Bc5Q8MBsiB41TfM5MI8jWMO8d7oZAecdWixzR0S8zIQVc6Cw5fdygFjq+dkFj7pmDe7D
	tDk4DbVK48NC9MHB63nZgE6NWfwdO6UJ1ESv7KXI2Wgpz2zMTXfbOl499ojGxK+0rjce
	SOtA==
X-Gm-Message-State: APjAAAWBJuzvy/4ORWU5qmgae7k5iOPtNc1qxYs9Kqj5Rfl1ZJ2mhA9b
	p3yzQ2aaaD2ooyEAEwpYnSWx+iCyRgozQA19Drs=
X-Google-Smtp-Source: APXvYqwwkLbSZvwgFzALQxS/u6FZ529eVoW6YZ98ZY5f6bT9OQSXMvay8hx9vlD29g7skVKiT+LA/wELTgg4UHt5OUc=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr14658241qke.212.1566788074267;
	Sun, 25 Aug 2019 19:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190823081945.49883-1-kai.kang@windriver.com>
	<CANNYZj8S5kUL_=nXEQtEcrGM8W174gUx7b-0pJ15edbPG4ej5w@mail.gmail.com>
	<b0cbad63-7ead-a303-b870-b72773e7e060@windriver.com>
In-Reply-To: <b0cbad63-7ead-a303-b870-b72773e7e060@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Aug 2019 19:54:08 -0700
Message-ID: <CAMKF1sqj+65uA31KbYGD4Mo4ggkFjkRfnXpD4vjTS-TVihAuVg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libwacom: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2019 02:54:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 25, 2019 at 6:29 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/8/23 =E4=B8=8B=E5=8D=886:21, Alexander Kanavin wrote:
>
> On Fri, 23 Aug 2019 at 10:20, <kai.kang@windriver.com> wrote:
>>
>> Package libinput has a package config 'libwacom'. When it is set,
>> package libwacom is required. So add the recipe of libwacom.
>
>
> This recipe probably needs to go to meta-oe? Why oe-core?
>
> Because libinput is in openembedded-core/meta/recipes-graphics/wayland/li=
binput_1.13.4.bb.
> If package config 'libwacom' is enabled and libwacom belongs to meta-oe, =
then oe-core may need meta-oe.
>
there are many packageconfig options like that in oe-core, the key is
they are disabled by default.
idea is not to provide all the extended features with in oe-core
> Regards,
> Kai
>
>
>
> Alex
>
>
> --
> Kai Kang
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

