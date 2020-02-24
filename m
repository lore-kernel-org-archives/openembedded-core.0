Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8D257606F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:31:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48R4JY0GhQz1v;
	Mon, 24 Feb 2020 15:31:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582554717;
	bh=6zqt29xJBoxektYon6WoSObe1eH/f5CTzNWzlOB0Lw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgTSigk8eYIePTm9q/j1sKbaTI6t/cca4LWvn3gETuuqoXXf/3dOV3w2YAemb/x1R
	QNODVyU4RZV9aFAVrc2N3iCDC0ZZ17P3yK3O1/ioaGp3ob3ZY/mACh5OTAKMGtz8z7
	Hn+8oI/iKPXxyyWCgmXhXUltaoBPgkjCEeHK0t4J/MGGzIH3vVai3+qYE0Tb56QYuk
	Rg3DYQQP4HbBIXyRbEwfB+X8oHe5S/MlD+/wMwxJ6m61H9EvIBvy9ZT+z7TBHy8j3G
	oembWEyrTfOnSvCmg1X8FqO5aXJbs+TbT4jpkKfvsuzOBpJJNhgv7rFx1Fmk21YaHy
	uHJtil9gcg2AvRAtoQ4yx/CNnPUd0j0dLIK50n9kb0nffUuTtl1BqY5/rSSqI3Z6HL
	17UoiSADINJ6VJ9LFfyQS+iiB5aFPrJdVn5IxhgmdYuKDLl6gN1QIqJ/MnYK95NUfj
	T9PCtgeqHWCY7M37XEiFI/H4A4uM/nyEcFpxITKbQ4EzARQL5d/wxrHz8AuOtGfCpf
	TH2Y0DhI7oRJbQY7lGXr3lJjUJWWo+UFxCH7ZdC4umM9aZZOJ+efZCMbR1pAuRK5SB
	jt3MTyH8tQfN/LZzOO1bT8TF5z1vJvsudWZ9Tus4Wme6pC6HhQ+7O8y/J0HH5UV5sO
	zvuuS7MHJSMVwvLKn6F/sI94=
Date: Mon, 24 Feb 2020 16:31:55 +0200
From: Adrian Bunk <bunk@stusta.de>
To: =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20200224143155.GD27036@localhost>
References: <20200224125955.26771-1-git@andred.net>
	<20200224134022.GB27036@localhost>
	<6c0d874e887dc5a2355d236d77e8ec771ea729f9.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <6c0d874e887dc5a2355d236d77e8ec771ea729f9.camel@andred.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: omit XZ threads and RAM from sstate signatures
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
X-List-Received-Date: Mon, 24 Feb 2020 14:31:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 24, 2020 at 02:21:57PM +0000, André Draszik wrote:
>...
> Once the artefact has been created, it doesn't matter anymore how it
> was created, as long as the high-level options aren't being changed (like
> an explicit compression level, checksum method, etc.)
>...

meta-poky/conf/distro/poky.conf:INHERIT += "reproducible_build"

> Cheers,
> Andre'

cu
Adrian

