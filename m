Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id E4A0A72F06
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 20:56:54 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id f54so183672957uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 12:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N6GZ25iljkMw0cN4iG8/y2LKdKyGdph1KLGm5XXWgIY=;
	b=WR4pI14kgB9lB/WfZhPddC3Sj4euMAU5ghg/mBfvs/vy4+fqYePXxJ6iaVwWRfczDI
	MiVxwL1FUScxYN5JO0WiUUDEVIeAxXzRxs/bH5gd7KvsgLrZCCgYgWMOKioQgXLUGR2r
	cDOIayjjV0gICzZKt97Qf43F/omH6Huk7UgpeDhJU6HJUED5bMKkhjbdzrz9TWyx4GdD
	r539LJOmvHYlOz2tkdR4ni1KR7inR0p7+QZxk340vt0fX9ZgraSY/g8Lf+nAt2X5z0UF
	eabAlVbpQPAvyWPw1+VEOD4NBMMSif2IKMQo0+V9BkU9/KMfFFVOQUn8gxOKxbl5x7Xz
	f8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N6GZ25iljkMw0cN4iG8/y2LKdKyGdph1KLGm5XXWgIY=;
	b=gAcUGwJIT+W6/UhwzU8e21yKBVroWKvj8B/D4/ayuKacQyScwXmjmSd+n666R2sY0O
	BB8rJNJgW1PGmg7JEW58cUgBVR72l0X1iQT9q2HbTmcLqQMVLUqwBsgtEQwJbeMM19+r
	E+fHHXpn59edjucM6ZR50SUs9hREN8IAoLs8LlheRQTZOR4JfAXbR1i0NLah0uYg2QiM
	dYWGUrJGLXyjiEmzaLqbE6NGmTG1T/IPqH+euSQWOeeixCqhx7lSdb2r2rPVzu4zljS9
	3nkGEnir8Xg5KvmhKpkepjFxUsaOD/t8n/O1OPQHxvEoyIqDuKFHHFmlqU4yKqwXeA3g
	nmcQ==
X-Gm-Message-State: AMke39kF/o65MQ3rLGbIb9BEeM0OoGdhAumraw8JPx6zVU/mdT1EGGnVVZPiF3Ci20YUQFG1HVjfzMWfsO4Cww==
X-Received: by 10.31.168.145 with SMTP id r139mr7524915vke.148.1488833815589; 
	Mon, 06 Mar 2017 12:56:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Mon, 6 Mar 2017 12:56:25 -0800 (PST)
In-Reply-To: <CAJTo0LaeKQYpsVXd0LosCL0+JZ3RDd1LYRDDsindjQU5Xk0ULw@mail.gmail.com>
References: <20170306184613.5673-1-raj.khem@gmail.com>
	<CAJTo0LaeKQYpsVXd0LosCL0+JZ3RDd1LYRDDsindjQU5Xk0ULw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Mar 2017 12:56:25 -0800
Message-ID: <CAMKF1soNQb0McY_OARwyeYeR0Kaii3gHcpEhpZBJtG_yv5DcAg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 06 Mar 2017 20:56:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 6, 2017 at 12:51 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 March 2017 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> * This is converging the recipes for go from
>>   meta-virtualization and oe-meta-go
>
>
> In master-next, Richard has a patch to disable Go on musl.  Can you
> incorporate that too (or fix Go)?

Which arch is it failing for on musl ? I know I had issues with clang/musl
for go but I thought it was more related to clang then musl

I have seen Richard's patch. its ok for now.

>
> In mut I've picked his musl fix on top on v7 for testing.
>
> Ross

