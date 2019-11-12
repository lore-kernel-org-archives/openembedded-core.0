Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 04FEA7F555
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 16:19:56 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m125so14920999qkd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 08:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TepZC+QcsHT8AQBVJYiTLHaTXhRStvUqsRn3Yr4gsbM=;
	b=kFzxR1f9YpMWfx5mPE3ATSbtK9ypmEUuG2tnV56j7We6V4VabRmPjHvHad6ddr6Dpq
	aGww8cajpYfTlyeSYb9adFi8N803JeR/SGSt7J6bYlIHBFR1sflK5VA3nswfIWVjlTh8
	qOK3fAxDhD15ac5LibkIAQybYnhobY35OmkzFBYG+v1LWRfJiJ218OY50oUZ05nswC1u
	QqUj8UUb8ybirxfrKHUpCf/lGaeAku9jGVyXjhAa4CazN2IXJ+2y/v+YwxPzX0sPqfdb
	uNA7tl5d24kMY2/vxixHvZ0itxYtfEACJmfxp7zZ+3S3G/vwFtKTeol1dqbqmWRKn/Og
	j+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TepZC+QcsHT8AQBVJYiTLHaTXhRStvUqsRn3Yr4gsbM=;
	b=GJWj6UqkCxCweW+QYpeKIxe5OkXE7MfI23Z+Qoe57IpblpHy98r0IUEAm/xtuflFfB
	vwwwS5fY8DX9kZLBWoO7VAENL6AfeCAUEnHTDnTDsjamq5ZWHUrvRbKQxaLk110xT4Fq
	VOoXGZ7PvZ7IrkSKyiGa871k/PvEs6Yd2Nlzx08mzrDNRmjJv+JGNVneVdOd4Rb9iWXd
	EDg3jt4KAOC2NOZEBzVP2OAxUuf1QkmdYjUEDN0AstTVvogrUe7BSFLldU4iwDMKzQaJ
	xZIoeMIq69LZMkaZXwfBofJ1tGKT/pxDeNEQPzLEkhrwqK0Kysa355dz785SvsS+9j4/
	u86w==
X-Gm-Message-State: APjAAAU+llkFbKbdbPRdd6aHzKJ5uYs+9+MrqVZbBZrW15uldwoNv24n
	NC619CQ1vgbXMDYQpEM2ONcb+swaZBLKxl3MnOc=
X-Google-Smtp-Source: APXvYqz3AFuFHMSEJ91DBkhwR7DyGLn8OyCrlFm5i14HbIuBkZ9B9Hnj7UurF9Lu8GhaO1MYqpvSF+lVwt9bfpAc/U8=
X-Received: by 2002:a37:6554:: with SMTP id z81mr6521582qkb.9.1573575597361;
	Tue, 12 Nov 2019 08:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
	<CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
	<CAKmqyKNtUpuqodwxjsseOwdQn3AhG+yU0kJx1K0DCXH3sc4VBw@mail.gmail.com>
	<CANNYZj8=PbGVmE+9C4mnJv3BW0Y-G8f5zG=AmGD0vDpoPNU2XQ@mail.gmail.com>
In-Reply-To: <CANNYZj8=PbGVmE+9C4mnJv3BW0Y-G8f5zG=AmGD0vDpoPNU2XQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Nov 2019 08:19:25 -0800
Message-ID: <CAMKF1srk1NG6Eu6_CKiw=18fwnZef0GeZUPwj0_vFmv8atq9sQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Tue, 12 Nov 2019 16:19:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 9, 2019 at 7:36 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sat, 9 Nov 2019 at 00:02, Alistair Francis <alistair23@gmail.com> wrote:
>>
>> > right this means glx-tls is not working anymore, and it will fail on
>> > musl at runtime
>> > see
>> > https://gitlab.freedesktop.org/mesa/mesa/issues/966
>>
>> So what do we do here?
>>
>> There are some patches in that issue, but they don't cleanly apply and
>> seem hacky anyway. Can we have two versions of mesa? One for musl and
>> one for others until this is fixed upstream?
>
>
> Maybe we can silence the warning for musl only, via INSANE_SKIP_..._libc-musl = "textrel"?
> ffmpeg does the same already.

in this case, texrel will endup causing sigsegv, this is a mesa issue,
primarily we have been working it around so far.

>
> Alex

