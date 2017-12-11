Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A973E71B86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:49:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f206so12825289wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 01:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JH8fTPhpepQv9YWXS25RQanN4gi2JSXoylEECFivjBk=;
	b=PX8j6N9DP/nKTRmILs6M0xNwuwidqCo4mGK80772QnDvoO+IWXw9uRY1sWCIU9Z8yb
	ZEhoVBhVsqdsXhuApvNa8/31YDX4vIt6OG4rE5LT2RFmuCvSeRS0LBi2jCiY49VFh7AB
	3OzPsyps3cyn8u4frZ6nAUmLO5aYxRvRF7Al9Mm990GFA70s24wYJ2AA6uDR/KY3w02j
	vwEVVRPB55wxQRdFasha3iunoHlvASGacoF19WKERNJaOOst0vqAwkd55IA84WoDkx2v
	qaDylaFlUkzpVtNHw3aegkhkO46aV8oCI4w2FOVCXDP6O6ERmD86I3DJQbG53+SDflOc
	7/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JH8fTPhpepQv9YWXS25RQanN4gi2JSXoylEECFivjBk=;
	b=jWC0vQANdq5hIWXJF3kXpEoLV2S4HtTHfan8psB+5TBS8Zv3PmLuLoiVZqQNt0gJYX
	B51JiYPrAz8eXa/bfeqCaTU9KEPYTzFuYn6c4UgWlqMYUhPzY9cDsQyT0Fscs/KrDK00
	awAPgQYDu4ZxoFz+v/7pi3rJaim8T2Edc34/82rNP7XxgoFbsnPeU6o6solvBZc4rPzx
	hmuXCAbzMwjIBp+6hLxP97LLPX1gSFoQT9xx2VdK0LDP8HUT+kSW9GU/YbjHF8T2qMe5
	7feybbJTO1Rf/7xy95T0as8eBlV/ZOtgaqN80Gv9UprcaSxe3MY5aojCiYq+TIN9liVH
	b7Pg==
X-Gm-Message-State: AKGB3mL5m2MrqQdCzSP0WXfC7RBPXhVpwLd8oZthjgRkyBULxzvmiad7
	WkMZSHOhekCG9nw/JmhqT7jDon0DJBbnqZvvI/Y=
X-Google-Smtp-Source: ACJfBovPH1f8yjSBdbGZnVXJ2jQDHCQpumR8ZHp+cwJtNK+/N8+YD2TJQNuPKPp+Jth1fne3nplYSNeyFUp65b6WOnk=
X-Received: by 10.80.166.222 with SMTP id f30mr306981edc.278.1512985796325;
	Mon, 11 Dec 2017 01:49:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.178.38 with HTTP; Mon, 11 Dec 2017 01:49:55 -0800 (PST)
In-Reply-To: <CAJ86T=XLobz3tiBOf+JqAt3JBV=o4HqUVBJwkjY0VR9LCDWNyQ@mail.gmail.com>
References: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
	<CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
	<CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
	<CAMKF1srhviBz5_Y9Gsn=Db2y9wCJ8HN96+FjBci+XA3m1R-Pwg@mail.gmail.com>
	<CAJ86T=XLobz3tiBOf+JqAt3JBV=o4HqUVBJwkjY0VR9LCDWNyQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 11 Dec 2017 10:49:55 +0100
Message-ID: <CAAQYJAvcyJ_OpXSRZiaEBga04BArR+=DKpiZbFQ3L-3EVVKkhw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Mike Crowe <mac@mcrowe.com>
Subject: Re: kernel.bbclass do_sizecheck behaviour changes
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
X-List-Received-Date: Mon, 11 Dec 2017 09:49:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 8, 2017 at 11:24 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Dec 8, 2017 at 1:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> The size limit for an uncompressed kernel vs a compressed kernel is
>>> going to be quite different, so defining one size limit and applying
>>> it to all images doesn't seem logical.
>>
>> I was hoping that we are talking about deployed kernels here compressed
>> sizes can vary widely too
>>
>> So may be we can have a hook to define which image types should be monitored
>> and what the limits are for individual type
>
> We could do a lot of things and add a lot of complexity. However based
> on the fact that the simplest test has been broken for some time and
> no-one noticed, the evidence is that the kernel image size check isn't
> a widely used feature (and the kernel image size check with multiple
> kernel image types even less so, if at all) and so probably shouldn't
> be the focus of our efforts.
> --


Hi,

we use do_sizecheck since oe-classic and noticed the change thus
patched our kernel recipe back in 2014.
So no, it has not been broken for long in the actively maintained layers ;).
See
http://cgit.openembedded.org/meta-handheld/commit/recipes-kernel/linux?id=e51a0c84c65651a646ac701a411f724c0ed583a6

We do build only one type (zImage) so is preferable to have the test
fail if size exceeds, not just a warning.

Besides, I am annoyed by the related change for the creation of
different image types in case of errors: I do build ubifs images and
if the size exceeds the eraseblocks of the device and mkufbifs fails
then the other images types are not deployed (tar.gz, ext3, ...).
I plan to fix this somehow, it wasn't like that originally.

Cheers
Andrea


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

