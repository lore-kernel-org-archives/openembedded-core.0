Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFF7719A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 21:09:32 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n19so226375vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 13:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=J4ihIHIpmk4EG6DF7A7jZTn31TnlIwnrYFv0imHgmD4=;
	b=gC0BfquWYbGmJZK7Rr+SCLvSl6EsOFlb5OJI5IBRzLgxcUx3xHDQDi/MPYE1EG0jb7
	lJhnGprwZzEBgteWUnQKH0uR7t1B71eVvbaDURGlewuDPO+J9KiJ7b8jrR2KQMu597+I
	fukdg93oBEy4W65yGqUsxviWzacMcHRjIo5N+u86CLlKOEC9GLvzeqXREEqkHyLh7aNe
	o5GrUsiUGg8itaTJuqy090FwgfbYhfvt7oX9Iym7f8thRszw9TGcd5hj9T/rDpR1KG7I
	Lf8J8jszngeh56I4bzO41yB9VCjllmcTatZmjbrtgGwwhJqhTGLwfvdbZzu7K0yquLyg
	r8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=J4ihIHIpmk4EG6DF7A7jZTn31TnlIwnrYFv0imHgmD4=;
	b=d8atiENCM+aQ0h9wt7DvPgiw7XYihSAyAVHqHNxBIcI38VquTUysfjDCGL98e1HR5u
	PtsHm9O6ODTxDp/Wivx7a6vJKnaFp3FT+xyJc6sJadytYNi849yd/0rewmzLS3ousxrF
	1C6MpMsGaZD1yCrT/zoj5q0uaQp7SWFe3weviV037yAL9nDiHa8aKm2DmtKCkz9ggLpW
	VBmC0vtNixe5KxjZlqL6PurUidssK1iXs9TKi3zEuxqnMMuO97AiRe/mJn39h2H99i9E
	+rBMEXnxGJpEl7WEGocjiT9SC6O5LMPDNd2H9IWU4c08Fm33iBoe9IAybZIcKM/f+xQx
	u9Lg==
X-Gm-Message-State: AIkVDXJHfUPN0Ptj26aj9tgvTHxxiPz2OEzv+9GXAoexKXG46FTGyeEwCkV0OVvOK55ckckHW+2UZB3JecnvBw==
X-Received: by 10.31.201.7 with SMTP id z7mr2098793vkf.67.1484082572620; Tue,
	10 Jan 2017 13:09:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Tue, 10 Jan 2017 13:09:32 -0800 (PST)
In-Reply-To: <CAJTo0LZA_r=H8_Nchybr+7+bZu0Ka35MXd_AqvbYNZ9Db6VRLg@mail.gmail.com>
References: <1484070799-19031-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LZA_r=H8_Nchybr+7+bZu0Ka35MXd_AqvbYNZ9Db6VRLg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 10 Jan 2017 22:09:32 +0100
Message-ID: <CALbNGRRtQYDs_-KqD7TPeQKdWX7UQrYp1DKLfHkt5SJa-Ca17g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python3-pygobject: add PACKAGECONFIG for cairo - enabled by default
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
X-List-Received-Date: Tue, 10 Jan 2017 21:09:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 10, 2017 at 8:57 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 10 January 2017 at 17:53, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
> wrote:
>>
>> Have onboard (onscreen-keyboard) in the pipe for meta-oe. For that worki=
ng
>> properly we need python3-pygobject build with cairo support.
>
>
> Does v2 solve the problems that the autobuilder is seeing?
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-pam/builds/=
1023/steps/BuildImages/logs/stdio
>
Yes: we need python3-pycairo in DEPENDS and RDEPENDS. V1 had
python3-pycairo in RDEPENDS only.

Andreas

