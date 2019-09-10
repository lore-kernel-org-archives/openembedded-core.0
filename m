Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id EDC567F32C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 13:59:41 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id i78so17074127qke.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lZl52gbQYXklNTOb6mB84ro3fGte7NIFQYThYJARjFQ=;
	b=EN3FyZ8W/kZ+SsdpsDAwBULR/NoCsEfCG5ehccs2JautJmsGlAJnGF7fAtD1dIrjuB
	kFtRX3qTv1CNJJuxyN7/TPLD/MhAPxTGXL3zm7suHR4fOu0+SMaFUTSC7CsnIbbb2QT2
	JNpNZu4gcpd9W59bjuYR26jIB6R/8HXbQt8TgfFpNMggQSFvEJZpScwkXsUNf8cq2IoA
	8GqBEo/71qFKDK+Tqn1R7DA5rKB3h/iHURRSRouIXZFpFMvR+KIjr3G/KsTk/0fu5RH5
	ukdc34RLhGsunn358oYG3VaXfx4SnF+cxT5XiKSxHON9SbTirEbuMc37zHW01cq20T8Z
	Shxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lZl52gbQYXklNTOb6mB84ro3fGte7NIFQYThYJARjFQ=;
	b=WmP3koWVT399r63vGtNwFuD/fheqj7y6zLVhmuwTab3+xCqzBSHJ7PPZkT4qEj4FX/
	ajqNVpSC9ltfvVcrLGj1Wx2h8g5kPsO5hIXk/vtMtcsjVWOH5ln2UTYuJfMz7TTO5mWu
	cKVta98xNpd6IM+bQMzAUKC+S7lyc/NJdDQKv6cwgBKy7DMTsYhveYmim882GSmqHO5X
	6lldMJc14eFaz+1hgbU1XGKvbV7dJ/10oeCiobdHESLhsp4AVToCjzHT5h5N0GcAyYoL
	e3lcNFbF+Og6tG1sZQ/Sgez1VaBkaL4l2ddPMDB8IuBwZ2lpv01bdOnXc+BZ+PgfxXy2
	FGTQ==
X-Gm-Message-State: APjAAAXujfMzF0dhtipFdWIH9zvEQPfOO7JwgbSlBe2DOKhbaNgOgaEo
	WNg97OxQ2R+KF0fRkycPGHsDRzd7Ni13xk5vmmOMkw==
X-Google-Smtp-Source: APXvYqw08LoQI6mKusOjNWoUqjyWbnbZnqL9LTDWFg/00spoY4XHVLDKgnnRFMMtkKEwGt4QtIe8hCykmqNXeN3ZFNE=
X-Received: by 2002:a37:6789:: with SMTP id
	b131mr28730996qkc.314.1568123982600; 
	Tue, 10 Sep 2019 06:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
	<CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
In-Reply-To: <CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 10 Sep 2019 10:59:26 -0300
Message-ID: <CAAPZna02yCZxxG3Y1_St-G6mq2wJr5tJxyEzyN-f4E97M=-yNw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Tue, 10 Sep 2019 13:59:42 -0000
Content-Type: text/plain; charset="UTF-8"

Adding python3-native doesn't work.

Hmm... it seems that adding "export STAGING_LIBDIR =
"${STAGING_LIBDIR_NATIVE}"" and removing python3 from DEPENDS worked.

Alexander, I don't know what is the best way to do this, maybe you can
help here.

Thanks!

On Tue, Sep 10, 2019 at 7:40 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 10 Sep 2019 at 11:50, Ross Burton <ross.burton@intel.com> wrote:
>>
>> On 09/09/2019 19:41, Alexander Kanavin wrote:
>> > and find_installation() method of meson does not merely look for the
>> > native python binary, it runs the binary with a meson-supplied python
>> > script designed to obtain all sorts of information, including
>> > target-specific things that we patch native python to report. If the
>> > target python installation is not present in sysroot, the script will
>> > fail, and meson will declare that 'there is no valid installation of
>> > python on your system'.
>>
>> So the python3-native pokes around the target python3 to get the right
>> values?
>
>
> Yes, if STAGING_LIBDIR is set, via this patch:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
>
> (don't shoot the pianist, it was working like this pre-rewrite as well).
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

