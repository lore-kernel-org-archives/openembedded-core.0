Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAE47897C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 17:36:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 68so922328pfx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jVCD2QNNn/v5Nqfojv90nsgrey9VjacpDHETL2GU6JY=;
	b=bWeEY5/gWFTurVCj//wxN6zQzPvNISyv8dUGyFudF+In2WQxSzfNsWR+8YMFUMOLvo
	f05InTmy3CEhVVLGvkBr11BNll7+Z/cdYq4NZSIkW9eAnVfL1B+EneF6u/yQnFjqK7RR
	juAU4iNovMr7yuq0ecVhfK9+kAN44obpiFHIzo5SukefbozSI/P5X9iJQZga9OWsc70o
	Kg9jkGhZiIDYGMAi8A06gz2J73EKqDU06aa591NBHtA3UwjurlGzKtIs/Y23z7uVPpqb
	c91Z/ZqcLAWHpHRFQ9RxPH3SM1onDLRZtJzY0udBicL7bUoJT9qz68w7PW8InKiurJKx
	ywyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jVCD2QNNn/v5Nqfojv90nsgrey9VjacpDHETL2GU6JY=;
	b=ogEjGJgUbvTJBgToZ406HUjareGgIzhq59+CgIILSxMwXKdWG8poql1yx2WkyZhgyd
	axxaXN9DjRUzmOXXQGJCibCllH4WYF5HKrfBiHDq45LBQcR9FMIKpJeOTXgtFq+jjufu
	DHQ9/LZZT+hl8VQZGdsSu6ZcriP2iIsS3/SQMrZoJczjIR9MlO5V5eDY/p3NAl9TOy0M
	TPLL+OySRLKANb3as07nD+NExwCxAKxIrnY2JFgMqQurAtWaF/HIKB5EeVaezRktTp7h
	l9JGPG009WmyryD3ynqVhdzinS3agMmkhhBADbZjTXsc/rKrMiWdjhguyk2eV25e+0VQ
	OrEQ==
X-Gm-Message-State: AElRT7HRvYsgRpd3r13nky3D+k7qurT1qPX85qAy3dmGycnZiE58Zst3
	xAhJ1Mf2BdFAKQhgR9xujXLTzT3hF3vj3nQsSzc=
X-Google-Smtp-Source: AG47ELsIfZsX3rcnKQQOybfdx4QTVHnFTDBR6g1imDZr2HLyMDJ6HH8TM9gfJNwX9xxL3s/g1Urv5mIjGkv/DhSjp6I=
X-Received: by 10.101.97.15 with SMTP id z15mr10809288pgu.393.1521567392043;
	Tue, 20 Mar 2018 10:36:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Tue, 20 Mar 2018 10:36:01 -0700 (PDT)
In-Reply-To: <CAO5Uq5RBUztJ5uLdONZ0apJzCko_oXQ6L3D-9s-59Yvip9+BiQ@mail.gmail.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<CAO5Uq5RBUztJ5uLdONZ0apJzCko_oXQ6L3D-9s-59Yvip9+BiQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Mar 2018 10:36:01 -0700
Message-ID: <CAMKF1srb-oT6pXiE+1db8E9+4j=Rp+PURe5bdBUnVF3zMANnag@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Tue, 20 Mar 2018 17:36:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 20, 2018 at 10:19 AM, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> On Mon, Mar 12, 2018 at 8:38 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Upgrade systemd to 237.
>>
>
> ...
>
>> @@ -80,7 +78,7 @@ PACKAGECONFIG ??= " \
>>      polkit \
>>      quotacheck \
>>      randomseed \
>> -    resolved \
>> +    resolve \
>
> I guess this was deliberate, but does it need picking up in release
> notes? Tripped up my builds off of master - clearly a trivial fix
> though.

hmm good catch but why change ?

>
> --
> Alex Kiernan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

