Return-Path: <brgl@bgdev.pl>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id E6CC47C326
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 09:09:15 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id q20so3315898otl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Fm6WcMwagZ2VpKX7jKsabqH/jDRh5iL5Ks4yZG5Uvdg=;
	b=VTHYmWCGlwEHQlQry6idWgWT0Yx8W5JtyoRYwWtE1TGkS6l8lwynZegZL6gHyXDzQR
	GTdH2vnaqLJSMA3B8NBLtBazPleTaNZVt91V45K6i9sOulpfu2VS4HmnwDawmzBLbxCd
	MLHE+fMVsdy8K9ZgjvM7tl6nK3XzmuuKWqPTr+WM/YL1cqFf4iyDUTtsn8y0YyZNGzIN
	6py1+w7PI8+ZmS+5Hn5rki7CNnEpajm7Hs8UablFUVrL6a48/9WXuoCgDkWGVR1Ybrxg
	AY50+4mb95wVE58BT3CApPAIYgoPHLKyVPrAsX67QpzmGwklSxx2U+kfOzmdrTIjBOP4
	JZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Fm6WcMwagZ2VpKX7jKsabqH/jDRh5iL5Ks4yZG5Uvdg=;
	b=FoTDPlhmN2uhVOjWqDm4sN8UQAKN7omhNdn3pUKKrL2wcoMD3cnGJa1JXDxulcBAND
	mWNaRsdb7dOgnmb2KTxnbIjZej20+mNT9iUnqL066LESlOCE25jGzrxvERZmclp1qmyS
	+IN/r0aQEnlPuaPQnEYm2xSMg0X5XQy7Qzig8a2vIwc1qpEADWKHjDmPdvybosNdBXOm
	Z40S8l4lQsTMO46pgJQ55Q+eOa6P6vX5kLK4DADD5YJ89WlH3cVJMWRFzXV+CingcUhv
	d8iGaIk5WdqoWvfn+KVrFERwm/WPzDrBlI0Wf0PXojWFEuBdUkKjZWy8vDH2M8uB3zAK
	AzRg==
X-Gm-Message-State: APjAAAXCUjakLT+9hyiNZcQKjWruPAQAiVJEFEDYzFNLja5Hdyz2gNbI
	kec/lgqGyTYuunzyQ9/+RbbYwinIojRyNGJ4oenIsw==
X-Google-Smtp-Source: APXvYqzcS0Y8WX8rF7L3UST+kceGVvH9ARzXsbpmHguqlDLChbKd42OLZgoAJpB8+hQ37FcwqLsfLonS1Be2byEkf1U=
X-Received: by 2002:a5e:9314:: with SMTP id k20mr798969iom.235.1565600956766; 
	Mon, 12 Aug 2019 02:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190730072254.10730-1-brgl@bgdev.pl>
	<CAMRc=MfE4sO7BAsmFdnQnogdXJ-TpJTkDODgLaxxKoirVVVngA@mail.gmail.com>
	<f9a2c6d0399f2998821c91386434d88b776283cb.camel@linuxfoundation.org>
In-Reply-To: <f9a2c6d0399f2998821c91386434d88b776283cb.camel@linuxfoundation.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 12 Aug 2019 11:09:05 +0200
Message-ID: <CAMRc=MfC5mYMNMJB0gQMdK7sDMdnS_StE6xSCsskE08xfwG0Zw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: fix patch authorship
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
X-List-Received-Date: Mon, 12 Aug 2019 09:09:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 12 sie 2019 o 10:51 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> On Mon, 2019-08-12 at 09:01 +0200, Bartosz Golaszewski wrote:
> > wt., 30 lip 2019 o 09:22 Bartosz Golaszewski <brgl@bgdev.pl>
> > napisa=C5=82(a):
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > I accidentally changed the patch author when backporting this from
> > > upstream qemu. This commit restores the original author.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  ...4-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch |
> > > 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-
> > > to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-
> > > devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-
> > > SIOCGSTAMP-w.patch
> > > index 2feb567f1c..f7939b84bf 100644
> > > --- a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-
> > > handle-variably-sized-SIOCGSTAMP-w.patch
> > > +++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-
> > > handle-variably-sized-SIOCGSTAMP-w.patch
> > > @@ -1,5 +1,5 @@
> > >  From 8104018ba4c66e568d2583a3a0ee940851ee7471 Mon Sep 17 00:00:00
> > > 2001
> > > -From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > +From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > >  Date: Tue, 23 Jul 2019 17:50:00 +0200
> > >  Subject: [PATCH] linux-user: fix to handle variably sized
> > > SIOCGSTAMP with new
> > >   kernels
> > > --
> > > 2.21.0
> > >
> >
> > Gentle ping.
>
> The original patch hadn't merged when this was posted and you were the
> author of the original submission to us so it was squashed. You can see
> the correct author in:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D57d702ed5de5717515=
17568872eda2b5ba9fa8df
>
> Cheers,
>
> Richard
>
>

Cool, I didn't notice it.

Thanks!
Bart

