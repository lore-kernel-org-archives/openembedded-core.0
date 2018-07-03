Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 546917871B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:33:04 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id k12-v6so3381343oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=FMb2GSYl+Z9iLNp/ONAhUqmFPSVDw23Y6OhF0tRaNeY=;
	b=n6cldF2ua2hTDdut9ZsWZYhDsBxykoCu5lSmlvXWLwvIIqWcED+DTQxGh76WsJvfyg
	Zzx3n7qzjCiUQ2x3Z7GnWwfpxAJt9p/5dCaTangLn2lZk83INoMWTCcGu/dS54RYF4IV
	zr7ZYVIvw+2SdzajiW7iOgXk9n6K2N1dN/PNMyvLcVd92o2wr0ruh+EIrDdmQmAgNDHf
	la5UbHSYgf6ZC8yWvCfM9auSlSi6+l0u9BG7+EypaT/ODHFdUEqJZy9rUg3e45z/JVlr
	uQaS37Ks0Qyld1KPvMZxjy+TtcnHK20WErCr1UV9/22hvGxsgjUrnlPUw0iUfRBAucoj
	MFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=FMb2GSYl+Z9iLNp/ONAhUqmFPSVDw23Y6OhF0tRaNeY=;
	b=R6AEHR0a388RusJ7tUwSQsNUJgjIVsZFxR3fUTgB/NivIzDEROHvW1s/bvzCOAZBcU
	yz3AFnQGuz+25SjKNkIKsomk+SkH72uSLVWvovuZ4fdEOlxbjiwZgzzBTCuoBOpwSwX/
	TqSbFORTDgfxMY1/w3JS5bUY8HMEhPzpCVUmCBYWXmmX5i9hSy65RVUA+iq31+aAd8v2
	ozdDWnE6EvP+kEWhlmC4wlBJxHO1jmlj+8eAykM0UI38zMiKStFgGR4YMQd8hgChOGLT
	VG0IomnC1GINBsK2qEu3H7FmyPH6swcpVtJtqULlhhgy6VqjwmQIzKrdMey3eRP1aQ7a
	OnhA==
X-Gm-Message-State: APt69E25kcqIEnj7nEaT1i1puUj1jw7fYYlYeKo9YYSnASYXrpSSdCiP
	FY0btNwHdasZmo1beVTsuaP43fxikbNdj8HnvtC4kQ==
X-Google-Smtp-Source: AAOMgpdWmjvvATeWoYIX5jwLeErIfyjBBW/zK52B/lUWql8Oe1NzxU0OhBpNI8qf/Jb1GGqbBDgaQ14dQPTF4j3QjE8=
X-Received: by 2002:aca:3d4:: with SMTP id
	203-v6mr10616261oid.321.1530621185191; 
	Tue, 03 Jul 2018 05:33:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Tue, 3 Jul 2018 05:33:04 -0700 (PDT)
In-Reply-To: <20180703120126.2xrdx77jwcvvfn5b@axis.com>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
	<CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
	<CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
	<CANNYZj-8KYbZw-kcaAU0DQNd9=Lmy4eog75iY+6rtr2as5hEDA@mail.gmail.com>
	<20180629235346.qsg3sjhpsaqqqcxi@axis.com>
	<CANNYZj_t-68JsYddLZDu+8JMBCDggtNLKEEMFLpafDFfwn1WgQ@mail.gmail.com>
	<20180703120126.2xrdx77jwcvvfn5b@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Jul 2018 14:33:04 +0200
Message-ID: <CANNYZj9ocLf4uQXwnLWUZB3UHReFxcv4i0Obzjzfj7=UeVuw9g@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Olof Johansson <olof.johansson@axis.com>
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Tue, 03 Jul 2018 12:33:04 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks, looks good now!

Alex

2018-07-03 14:01 GMT+02:00 Olof Johansson <olof.johansson@axis.com>:
> On 18-06-30 08:37 +0200, Alexander Kanavin wrote:
>> Ideally, "/" should've been replaced with rpmtsRootDir(ts), but ts is
>> not accessible from the function, or from its parent, or parent
>> parent. So yes, I concede this would be too invasive to pass that down
>> the call stack. So if you can amend the above patch of mine with your
>> change, commit message, and SOB, that should be best. These changes
>> really belong together, as a custom fix for the oe build environment.
>
> Thanks for the feedback, I just sent a v2 of the patch. Hope it
> is in line with what you asked for.
>
> --
> olofjn

