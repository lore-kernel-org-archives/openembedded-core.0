Return-Path: <jon.szymaniak@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7145B71CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 01:52:49 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id k81-v6so395217oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 18:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Txtqb2k9WO8LOISGOhmkQzZQrKKJFuyXDJzUATLAICQ=;
	b=BY/rXkuqt7SMgBu0b1oqNKyBMiZ4RyybY+iv9v6zalP9emo0JykYr2CxBhv1pn+muH
	Jv4bk6WEqsiArXyO/mam4pCjNewAf1HypAgL7SJ2zwM5e7sNn4vhNeMwj7+UWTAm/EBG
	Myv6T8rlCF9nHinhj+RA/oWapAwUzkOn/YvWsvRTf1gsBU9GBYac3sdaus7xcvME1FZ8
	PMhGDMO4rOUHuwlcQEVq6XzrWZIWc8lgy6puMpgHyCfgnvm6wOcHOqullpyZCAJB5zX9
	I33vimZ59msx2I2j3hUT01vgYjcFGbvnAW4PSV7JQv467k9OQbCCG2bufAwvVMy/3NXJ
	m7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Txtqb2k9WO8LOISGOhmkQzZQrKKJFuyXDJzUATLAICQ=;
	b=aBg1z6KK1ekAvLrcRNSzn2S/yAm7/PKd5xQHuJU5OA10O9fP/s9H4i4NRcWMny4yMK
	CRoSEM14/j2xoCMFQDpCbd59lUQWi11EtCZvMRI6DnDCAoT4hqJWxVnOsxhmSq7Q2K+z
	EcbdDQG9948e7sSPrrkAKtnccM+E4ovwZCAWSUP/i4TUl1kqpkBtmwoauiD04sd7MbM/
	lQcUB6fmMAEGctzf2noxVwT6GWTc+Dd+twMmP/OQH1gYInWp3RzMGkKCyrBZhTWf/n+u
	YFntkxwsVZmOAnd4NKWjY1ZrbDq8khE0I+/6sDgsmSDCTY1RPCiD70TOvVzCVwyHqG8B
	tSeg==
X-Gm-Message-State: APt69E2+FSwEIy2RNsZIwIM49vqGVS32Yg/fDyTKJF9BY4IsLKkDOsWT
	A8SupITQUZYnF7E9mXKamrnI0W1vusPTDUrnDjI=
X-Google-Smtp-Source: ADUXVKIkD8XihcIUMmhtqNOoOPj+5ZkZD01poPXvEsU3GUjgJVhs0hCROPUtbC+Fe5EegG+Ct+KvsF96/fJkeMx1Dyo=
X-Received: by 2002:aca:5217:: with SMTP id
	g23-v6mr292382oib.255.1529977970261; 
	Mon, 25 Jun 2018 18:52:50 -0700 (PDT)
MIME-Version: 1.0
Sender: jon.szymaniak@gmail.com
Received: by 2002:a9d:ed1:0:0:0:0:0 with HTTP;
	Mon, 25 Jun 2018 18:52:29 -0700 (PDT)
In-Reply-To: <CANge7vXk5XKAwmZEtfww0F0tUvOUyiE=sR3OsJoRZX3P-3kf=A@mail.gmail.com>
References: <20180625175043.25267-1-jon.szymaniak.foss@gmail.com>
	<CADkTA4P881jar5PygYaY+i4VD_rXYsXOOhU3eZDLWGDn4xRcCA@mail.gmail.com>
	<CANge7vXk5XKAwmZEtfww0F0tUvOUyiE=sR3OsJoRZX3P-3kf=A@mail.gmail.com>
From: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
Date: Mon, 25 Jun 2018 20:52:29 -0500
X-Google-Sender-Auth: EqjqTwkGNuRoJKXCxGsGHkSiAB0
Message-ID: <CANge7vVSu888hL05s9q07xxZmx1yzxHYD_sRvV8N5YsXsMTQXQ@mail.gmail.com>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Use capstone version included via git submodule
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
X-List-Received-Date: Tue, 26 Jun 2018 01:52:49 -0000
Content-Type: text/plain; charset="UTF-8"

I'm sorry for the duplicate email Bruce. Resending because I failed to
include the list.

On Mon, Jun 25, 2018 at 3:52 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Mon, Jun 25, 2018 at 1:50 PM, Jon Szymaniak
> <jon.szymaniak.foss@gmail.com> wrote:
>>
>> An optional dependency upon the capstone disassembler was introduced
>> in QEMU v2.11.0-rc0. The necessary version of capstone is included
>> in the QEMU repository as a git submodule.
>>
>> The QEMU configure script uses pkg-config to determine if an
>> installation of capstone already exists on the system, and defaults to
>> this, if found. However, there does not appear to be any capstone
>> version or API compatibility checks.
>>
>> To avoid any potential version conflicts or API incompatibility issues
>> in the future, use the `--enable-capstone=git` argument to force the use
>> of the capstone version included by QEMU as a git submodule.
>
>
> How exactly does that work when the default qemu recipe is a tar.bz2
> download ?

The tar.bz2 fetched by the current recipe actually contains a git
repo, with the capstone submodule already present in this archive.

> We can't have the recipe going out to the 'net and fetching / downloading
> source code .. and looking at the option, that appears to be what it would
> do. Or maybe I'm missing where the code is being fetched into place.

Understood and agreed. I don't *think* it's actually going out and
fetching anything, but I would certainly need to double check this.

Nonetheless, what I've proposed here doesn't seem like the right
approach to pursue anyway...

> This is something that looks like it could be controlled via packageconfig,
> or similar mechanism, versus being hard coded into the configure line.

I had been noticing that the $pkg_config invocation of qemu's
configure script (line 4594) was picking up the bleeding edge version
of capstone installed on my build machine, which I had been actively
hacking on for something unrelated. Ultimately the issues I was
experiencing with this were a case of PEBKAC. However, this new-ish
capstone dependency still struck me as something worth having another
pair of eyes on to avoid future headaches down the road.

The --enable-capstone=git configuration appeared to be the only
exposed option to skip the $pkg_config invocation in 4592-4612 and
still allow lines 4616-4627 to pick up the submodule.

Usually, if one does not have capstone installed on their build
system, this appears to fall back to using the included git submodule.

Reflecting on it further -- what I've proposed here is a gross hack.
Ultimately I just wanted to ensure that the capstone dependency
shipped in the tar.bz2 is always what's used, assuming that's what the
QEMU team tested and deemed adequate.

How would you advise moving forward with a packageconfig solution?
Does it seem like some change is required to prevent the QEMU
configure script from diving into the build hosts pkg-config path, or
is this the desired behavior?

What do you think about instead patching the configure script to just
set the default to capstone=internal?

> Also, the patch is missing your Signed-off-by:
Whoops! Noted, thank you! :)

