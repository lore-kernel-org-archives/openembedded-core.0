Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE326EE14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 16:47:07 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id k19so9140970igc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4cpWRgo9OVbm1zEjSYOPE82p5/7SSOjU4h9VRfBifDw=;
	b=qmnHOAuMTWflaYKu26LYhAfknTD/SfcrJYQYWt0Eoq+sAY2Oru/WERpk1Ww/M+Dtfe
	JNA1A77lNaL9Qut3h6Nv/vKwHVPnB0q2ecCkNt5EBzNkS2CJq8aZ5wx6NEQ4fQXl69ut
	N3AffAFQfkS0+LMcHQyYoqX6NDHQIqEsLowtaUCFRnlGiBbeuBBwjXwYDzC/bqU9zOk5
	XWFRmdKY5PvZLIt25wSjmKr3JtSLl1xVk/OJDQ5OUe5xLMrDDYaUdEobkT25fI/KV1NZ
	+Vu1PqGzr7NtPZ8vZIo9yshggYbYbkAASA9HHdir3R6QKzg605G72pYQR99i6KtJbh17
	+5Zw==
X-Received: by 10.50.29.9 with SMTP id f9mr20962986igh.2.1392137227873; Tue,
	11 Feb 2014 08:47:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 11 Feb 2014 08:46:36 -0800 (PST)
In-Reply-To: <CAJTo0LaB9HsxiYxRH3yA=f1pa5Xtp+EW2ofgwGHH3Uok-35v_Q@mail.gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
	<5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
	<CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
	<CAMKF1srNpswQ2doGgkAeHDHnS=JuK1E4MGKqjOYRbP+TK3qSVw@mail.gmail.com>
	<CAJTo0LaD4=NZTeLRKD=pOfi5sqGBVacKA-ObWmXkT0JbT2=Xwg@mail.gmail.com>
	<CAMKF1so-_a8437RrW9FYbENVys5D6Qv8dxd1kNDF9TzZ0OKyng@mail.gmail.com>
	<CAJTo0LaB9HsxiYxRH3yA=f1pa5Xtp+EW2ofgwGHH3Uok-35v_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2014 08:46:36 -0800
Message-ID: <CAMKF1srqDy1YzE992x_ersQ9FrcX0quqrhn3gevn5cU7OMNEiQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Enable building microhttpd
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
X-List-Received-Date: Tue, 11 Feb 2014 16:47:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 11, 2014 at 7:29 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 February 2014 15:07, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Feb 11, 2014 at 7:04 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> thats the default one can add --disable-microhttpd too
>>>
>>> Please add it for clarity.
>>
>> Do you suggest to add it to configure cmdline or in comments
>
> I meant this:
>
> +PACKAGECONFIG[microhttpd] =
> "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"

We already had --disable-microhttpd in EXTRA_OECONF so I removed it from there
and moved that piece to PACKAGECONFIG and pushed the patch to pull
tree, take a look.


>
> Clear to the person reading the .bb, and if systemd changes the
> behaviour when the option isn't specified (to enable, or automatically
> detect) then our build doesn't change.
>
> Ross

