Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 573E3731BD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 11:56:25 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id o6so58255449qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 03:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jDvE5QK7xbED4GC7tnHWMMv5dOEkkKqLFlMHWYRJj5Y=;
	b=l9AbY5wWaH4RP/aR0/0Aj6Xp/VNsqM2XT5jRxPX13EGU8aTCHhHGuvQdLi484Ck3DZ
	0hUFClilQDwhgloVlK3+5TpLX4D685LunmbQaLN51ehn8N7jMOXfeSHaz0lD7fNGSl5w
	Pg2hkef3x+FjssJxyjy+W2U7o2CqtyjTTv+OxeoD2RnVSmp/UCgl5ZwbVMN6MkNXOvdj
	LGDTiz3Nvj8/zv2JlbPDAcSALfyt0aPtHqEPEftU9WcuQ8x4Quaz6NNUsyFecP/HkJKE
	FRAKtKempruJ8Hw7tI20Cn2RqVp4vOVUhNWIdOucd5hl9OvTJxDlNAolTn0L4+ZOwddW
	/bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jDvE5QK7xbED4GC7tnHWMMv5dOEkkKqLFlMHWYRJj5Y=;
	b=GX06enT9bKP9aMy13kBeW4JpwJ7NBOsw0reabI84Pddqjs/Tyy/aZxDean5WfdXbRp
	cLwCnFDNQuC6l5UoQD38BHOieT3HjyymHkbfFng/5lXS9MqJlfOKI3Szg++8E3E3OcAq
	fZC8jX4O9MOMaru7dkeuYzjDW5nQbm2bi0LfMigKYpsfNB9d4em6+u1AmoYWVEmFJm46
	vqd8nQDZHKhnZXoDFZLK1fvyFM0BK1wUBc9JlrF63Jzux8UkdTEa1Xr+g2mtrlx8TZqj
	IJCWJ8QbryMgGQ5n8GFQTpMREM/fSFfHl1AM3bB2pbYbmt93kny3cijZw0IVD9FLqj59
	dEKA==
X-Gm-Message-State: AD7BkJIftO/PmsbVIcbjEqLFeud/Ojx5mIULMh6wYNwnWDj9b3SIemoxfjq3Yj4kxeqc2+KHNcHqUPOUQcXLQw==
X-Received: by 10.55.73.199 with SMTP id w190mr17674915qka.77.1457783785581;
	Sat, 12 Mar 2016 03:56:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 12 Mar 2016 03:55:56 -0800 (PST)
In-Reply-To: <56E3AA3D.4000105@gmail.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
	<CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
	<56E39AD3.4000503@gmail.com> <56E3AA3D.4000105@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Mar 2016 19:55:56 +0800
Message-ID: <CAMKF1spxHV_pMSVUqxDh4Z9iELQx1=pEmdTqs0GfCJWmmBfUFA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 11:56:27 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 1:33 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> To me, the purpose of buildhistory's metadata-revs is to enable someone else
> (or myself in the future) to recreate a specific build, that's why I always
> save this file with any build artifacts. Simply saying "meta" isn't good
> enough because it doesn't specify which repository's "meta". So the purpose
> of this patch is to try to clarify which repositories we're talking about.
>
>> Before:
>>     meta              = master:00d3fd571a8d261d065b43f5cf3076a381843984
>>     meta-oe           = master:a1e135a499998add7575682bf53db5e02e753580
>>     meta-gnome        = master:a1e135a499998add7575682bf53db5e02e753580
>>     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>>     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>>     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>>     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>>     meta-linaro-toolchain =
>> master:367f784b831938dc508b7d472342d2d0d6ed9769
>>     meta              = master:37b61b059031e3c272a929b834e12fd83f46598c
>>     meta-poky         = master:37b61b059031e3c272a929b834e12fd83f46598c
>>
>> After:
>>     openembedded-core/meta =
>> master:00d3fd571a8d261d065b43f5cf3076a381843984
>>     meta-openembedded/meta-oe =
>> master:a1e135a499998add7575682bf53db5e02e753580
>>     meta-openembedded/meta-gnome =
>> master:a1e135a499998add7575682bf53db5e02e753580
>>     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>>     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>>     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>>     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>>     meta-linaro/meta-linaro-toolchain =
>> master:367f784b831938dc508b7d472342d2d0d6ed9769
>>     meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c
>>     meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c
>
>
> I have a second patch, now, that will generate the following output, which I
> think is even better:
>
>     git://git.openembedded.org/openembedded-core.git
>     openembedded-core/meta = master:00d3fd571a8d261d065b43f5cf3076a381843984
>
>     git://git.openembedded.org/meta-openembedded
>     meta-openembedded/meta-oe =
> master:a1e135a499998add7575682bf53db5e02e753580
>
>     git://git.openembedded.org/meta-openembedded
>     meta-openembedded/meta-gnome =
> master:a1e135a499998add7575682bf53db5e02e753580
>
>     git://github.com/96boards/meta-rpb.git
>     meta-rpb          = master:203903ca6f4e8df09bef6ea3c6e899d07eca8df9
>
>     https://github.com/96boards/meta-96boards.git
>     meta-96boards     = master:2be59f0d381b5ec173d7fc24f3ae14aaf47b8649
>
>     https://github.com/ndechesne/meta-qcom.git
>     meta-qcom         = master:32fcda819acb8ec485d9ab05108d554f807bf75d
>
>     git://github.com/OSSystems/meta-browser.git
>     meta-browser      = master:a3789a4168fcd42f1cdf5b5febe2c779a9467919
>
>     git://git.linaro.org/openembedded/meta-linaro.git
>     meta-linaro/meta-linaro-toolchain =
> master:367f784b831938dc508b7d472342d2d0d6ed9769
>
>     git://git.yoctoproject.org/poky
>     meta-poky/meta    = master:37b61b059031e3c272a929b834e12fd83f46598c
>
>     git://git.yoctoproject.org/poky
>     meta-poky/meta-poky = master:37b61b059031e3c272a929b834e12fd83f46598c
>
> Frankly, there are too many forks and clones. There are too many
> meta-beaglebone or meta-odroid or meta-raspberrypi repositories. If six
> months from now I want to recreate a build I've done today, I'll need to
> know the repository, where it's from, and which commit was checked out. My
> latest patch provides that information.
>
> Is this better?

what happens if one has a local checkout forked from upstream branch ?
it reports that one, so buildhistory is expecting you to control the repos
e.g. when using tools like repo, it gets utterly confused since its meant
to track local checkout SHAs not remote ones, may be your change
can establish a better origin tracking. it would be interesting to see
how it works with repo and when I have more than 1 remotes in a single
repo

