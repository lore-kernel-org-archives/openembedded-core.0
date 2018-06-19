Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2E90D74DBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 20:09:25 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id f79-v6so907466oib.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GWKiLjN9ezSYV+eXK/ZqDNtDuaABYku4bZ5M0ObwivU=;
	b=DaZxKhhsIPKYhPI5fUsUlRUYqIEcxNi66nwYq3oOl+3EMAR7HM9NQQB2yN4IVkIWTW
	DWJ5PmR5gGmmwCUBfClR5n8yaFgjPnaypYA0w4+TKUpofYJVIc8zbIqPPM+wt7AEWWpl
	fGXD0imceyR+SVaRrnQDKXsUGm+IyMjP8oDMHUmlqnc24NbnRAZiiyEolt0NtFROJ2a0
	Ubm2q1zd3DR+fVxuoW4k/ey9nJ3ZjKa7kefLm7TrtQZQ+c/tYsGap6t/tvUCp7XlkXTx
	EXZ+fZ0skg+NJNG+ayLJM2QcSbf4eKj9itrY9BDlPuEU9THGxfQrRxA8rBRWfO55Q7gn
	Almg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GWKiLjN9ezSYV+eXK/ZqDNtDuaABYku4bZ5M0ObwivU=;
	b=NYcDkyZhb+zgfnwP9xWEuHk0SD35rH8ziBPVG8NitVqbrMd9xw2yuExmc1/grJuOqP
	IMWsngAnmn6nghv4Fa3/Pdw6En3cmBSM5O0Cx/fN7yIMc6KKm92Uovzqd31MYjGT8c+A
	2S37g3RbjKphY1RRG7mrxiT2NpCMRcXWhqIOeAtJjDdgKhY0bVKGaOVteTeiSUHZYfXZ
	nHm7+idFFTie0nV+S3JoWWNdYc3xBbUd2IadBoGQwu2WnF9H/dUVRHHRnfTSQXmtDhC1
	i9PydMAWU17JNXpKtzv7FfQJwhu2NezsvSLbFxgPVTJzMEvV/g9laN5NogngSEf+Kh+D
	JS+w==
X-Gm-Message-State: APt69E3EWqvD6egcHbh/yoQ9oZebdtRIhT7GeM+hk8wH1oD343qY14pL
	R0dHVrWA9YcencNtH2PGXUkvOIe2w1QX/7gyaCc=
X-Google-Smtp-Source: ADUXVKJPW361VAzKnz7NrOjshMFP7sQ4mNUrYlJCSgvi4qQwdsVRYwetUNMP1DE3PLSiPIGxl3SxaBNi62bwWaCiv3s=
X-Received: by 2002:aca:b7c3:: with SMTP id
	h186-v6mr9325785oif.54.1529438966143; 
	Tue, 19 Jun 2018 13:09:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 13:09:25
	-0700 (PDT)
In-Reply-To: <b536b753-8e56-bb37-5a7a-1f66092e9c02@windriver.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
	<282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
	<b536b753-8e56-bb37-5a7a-1f66092e9c02@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Jun 2018 23:09:25 +0300
Message-ID: <CANNYZj8M+88frU6ci4n-=ufcMts1764FPK2AdbYSkmboafsnfg@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 19 Jun 2018 20:09:25 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-19 22:01 GMT+02:00 Randy MacLeod <randy.macleod@windriver.com>:
> The compiler flag order difference is too large for a civilized
> email so it's here:
> diff -Naur: https://pastebin.com/pWSzDm5W
> sdiff -t  : https://pastebin.com/5BX8QvNs
>
>
> When linking libsystemd-shared-237.so the location of the:
>    -Wl,--end-group
> option changes:
>
> before:
>
> -lrt
> -L/.../qppc-sd/tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr//lib
> -lcap
> -lacl
> -llzma
> -lblkid
> -Wl,--end-group <-----
> -lrt
>
> after:
>
> -lrt
> -Wl,--end-group <-----
> -L/.../qppc-sd/tmp/work/ppc7400-poky-linux/systemd/1_237-r0/recipe-sysroot/usr//lib
> -lcap
> -lacl
> -llzma
> -lblkid
> -lrt

FWIW, I did fix a similar (or maybe even same) issue with this patch:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch

It's possible that more rearranging needs to be done, or this patch no
longer has the desired effect.

Alex

