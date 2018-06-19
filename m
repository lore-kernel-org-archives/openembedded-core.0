Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC94476047
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 23:03:07 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id i205-v6so1330376oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 16:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=97vIkdUA5RqzQTxvFG3gYH1AZ+vDnJJrff0/JWu4QBg=;
	b=ejKaTotTpM+/ZgO/8MtGNMcJ4VGz05OPSsJFdrCbn4rnkW9glbI6yKibUf+2P8bTrr
	h0g5YeRCCFbsUQa+VTwuTNOduSQFXGyoCavGpXojJtMSZP3+SvOok81p/afFxFmaIY1c
	iaUdQwomlI+CqNBDGHUe/Wgulyo/lOqUojSVKU4pXjKT7t38Hn+ko4WkqZLWEQ1+nlc2
	Q4ESnK+wJrjU4cnuI5XDBEaTT8XqGiTOZpgiBv3/+vtcGW44rt0CSI2PRYfSs4Y2Y254
	PoVKyW+KkPSw1zMWd45IN4WBQWf7SK7K/sBJL4Ah+Vtj0OIlSP0lN8Pc8q/R9cHSTaLH
	G7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=97vIkdUA5RqzQTxvFG3gYH1AZ+vDnJJrff0/JWu4QBg=;
	b=WTOyrhnq4cKetKWje4Hf7xwSTrgFlf5ycLMCM9Ihd4akALMq5Jdok1MB7dcSQxQWeY
	GH/+Dnje2OH6aYk0Mix5rtJsHdnS6yBX0tDndHx5+hdDf2G3LOuG48lXfA2E4IDOooit
	gE2SUdWcF/9DjxEJfX1ENchm6HeLJr1eVRzXNhhnFFLRSXUwkawUQrU3mBF6Aohdz86q
	m+G8gpUDcFHluk8KUT3joIxz2cOnQCvk/76FR/ZCdHHhTQQ9/jlkWeTm5DrPPsw5kliF
	T8OBIFCxpdnr5wy8kkOPf/1D4iYMfrAXRREZxrCQgr0XXPoaFHkvXtSdSO5cGHKIBygO
	0C0w==
X-Gm-Message-State: APt69E1QKcXdJxClgpI6xxQnINhLZyPanfv+1d2VnsMzVb0nzYinhS+e
	FxPDMA24FsmGchq/FepX7Kok5BgxQOMizLIc4wE6dg==
X-Google-Smtp-Source: ADUXVKJOcILY9N0H9gmr9s/tnfWk2rviVYR9WghEi74pLjgHaxRLlME7LJclJ9gfPSvhYGLMf0LlXetqtimMHBhEur4=
X-Received: by 2002:aca:5406:: with SMTP id
	i6-v6mr11072854oib.115.1529449388778; 
	Tue, 19 Jun 2018 16:03:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 16:02:48
	-0700 (PDT)
In-Reply-To: <CADqQcK7Q_eZBoRiE88_XY=FbZVfJSpkybHdTCPqFM9okVZqYcQ@mail.gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
	<b536b753-8e56-bb37-5a7a-1f66092e9c02@windriver.com>
	<CANNYZj8M+88frU6ci4n-=ufcMts1764FPK2AdbYSkmboafsnfg@mail.gmail.com>
	<CADqQcK7Q_eZBoRiE88_XY=FbZVfJSpkybHdTCPqFM9okVZqYcQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Jun 2018 00:02:48 +0100
Message-ID: <CAJTo0LaA44BywL8+0kNRnPJD5b90tA9M0B6wEZ7hOJcbX=L+ZA@mail.gmail.com>
To: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 23:03:08 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 June 2018 at 21:24, Nirbheek Chauhan <nirbheek.chauhan@gmail.com> wrote:
> On Wed, Jun 20, 2018 at 1:39 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> FWIW, I did fix a similar (or maybe even same) issue with this patch:
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
>>
>> It's possible that more rearranging needs to be done, or this patch no
>> longer has the desired effect.
>>
>
> So far in this thread, I don't see any changes that would cause this
> issue, and that patch shouldn't change things either. The bisection is
> probably significant, but I am not sure what's going.
>
> Also, in general please try to talk to us first before doing a change
> like that (switching the order of cross_args) so we can investigate
> and figure out what we should fix. The cross_args are at the end so
> they can override existing arguments, such as -D flags or -W flags.
>
> Another thing to try would be current git, which has significant
> changes in how we do library resolution, de-duplication, and so on.
> Specifically, instead of `-lfoo`, we now prefer full paths to the
> library to use instead since this allows greater flexibility in
> selecting whether to use shared or static libraries.

So I just generated a snapshot of current git and am building systemd
with it.  Interestingly, the flag order change is resulting in what
were warnings now being fatal and systemd fails to build.  One was
easily fixed with a patch from master, the other will have to wait
until tomorrow morning, but I will get back to this.

Ross

