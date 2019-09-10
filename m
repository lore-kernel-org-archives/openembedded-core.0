Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 85BEB7F32C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:57:34 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v11so21005677qto.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cZ18VNA176rNG2J5+7awufJbCNHc3Q6g5j7noEYhKzw=;
	b=XhO3tk6ynJX9jvpz4p5iJB4iCtuzF0XD9fYM3K6mri/LZ8ChFSpbObbe5/zmC9xZbX
	nAtigPgPfLG8wGg/jkI59/CwP6ojIFZ1Z6ArWx8NUK3GTeKR5dogD+ZI95Yqnj+gD4+m
	MOQhZgWorZc3x5d9Ss5FIB1QTQfFDBAkVveMbTcyNCcQm17KIDJaKbpM9G2gR+KpvHxZ
	OPZvRuCekJNqrM1wTS/tXUC1dhCS12YrSZVfAsq5sEMKGPJZqXeaVuSj+cEb9I5g8vhs
	G/bTfKOIaoBNg8642bzz9IKKeLDVzgPHeik4t8/bqt3wMbfYSP0sOrDW0OBelN9wQ8G7
	o7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cZ18VNA176rNG2J5+7awufJbCNHc3Q6g5j7noEYhKzw=;
	b=MWHd54ggQRtQbVW0gUMke5+iMifqvQ36rzhKJvgi7Rzw2LNuYebZSsLcX8DuQaZu07
	L+IIUUdCAVF5ZgjgUAakXPHoFG5UfrBbLxZId/0OsxZGkUwsjptSNKfkBrZiMTjo2f4c
	3ieG9gw9SaQtV95VFrG07I2fUuCxpDvuloIG9yEC5lvZfw/Ai4J2VZ9bYO+diS9ocpfT
	eHy4tIJ2amQF4lamSdz2ulee7+nVTwCBPuPL/6j12jJF9X6JzJCHU8aXxkc2WghqbW6D
	7WpmjnE6fCopBPneysDgsR1jX4FXKfjowKN2nt2QdpuE3o+pI1TENxK9fhk4vy73Czco
	7DXA==
X-Gm-Message-State: APjAAAUZ3cSTbIPIz6/z1mfbDXeTZuBlDH/WL1uUfA1+AvVaca5OZFZB
	udw8D5VXDBjsk2O8dILiLTddhSu4Hpj/CXZg6YvgVA==
X-Google-Smtp-Source: APXvYqyuckZi9lM6JyXxXM9EamHiw5FOk4bO5aD5nrYqTuvUkItOicYD5KaXeFxwWvKO2moU5yf+ISJgZ2f1HJzJv3A=
X-Received: by 2002:a0c:a988:: with SMTP id a8mr7904982qvb.34.1568127455329;
	Tue, 10 Sep 2019 07:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
	<CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
	<CAAPZna02yCZxxG3Y1_St-G6mq2wJr5tJxyEzyN-f4E97M=-yNw@mail.gmail.com>
	<CANNYZj84-U+6yE4NCXTETKbNdDWjNw8-bsXNPT1WeoLHWdhrfw@mail.gmail.com>
In-Reply-To: <CANNYZj84-U+6yE4NCXTETKbNdDWjNw8-bsXNPT1WeoLHWdhrfw@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 10 Sep 2019 11:57:19 -0300
Message-ID: <CAAPZna1Br6X5d2QmZzQNgR-uO6Gs1Q78jR3KZL94O_nx7g43cA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Tue, 10 Sep 2019 14:57:34 -0000
Content-Type: text/plain; charset="UTF-8"

Because I was a little confused about find_installation() function,
but your comment above clarifies.

Thanks!

On Tue, Sep 10, 2019 at 11:24 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> The best way is like in your latest patch - inherit python3native and DEPENDS = "python3". No need for further tweaks, why did you try them?
>
> Alex
>
> On Tue, 10 Sep 2019 at 15:59, Fabio Berton <fabio.berton@ossystems.com.br> wrote:
>>
>> Adding python3-native doesn't work.
>>
>> Hmm... it seems that adding "export STAGING_LIBDIR =
>> "${STAGING_LIBDIR_NATIVE}"" and removing python3 from DEPENDS worked.
>>
>> Alexander, I don't know what is the best way to do this, maybe you can
>> help here.
>>
>> Thanks!
>>
>> On Tue, Sep 10, 2019 at 7:40 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > On Tue, 10 Sep 2019 at 11:50, Ross Burton <ross.burton@intel.com> wrote:
>> >>
>> >> On 09/09/2019 19:41, Alexander Kanavin wrote:
>> >> > and find_installation() method of meson does not merely look for the
>> >> > native python binary, it runs the binary with a meson-supplied python
>> >> > script designed to obtain all sorts of information, including
>> >> > target-specific things that we patch native python to report. If the
>> >> > target python installation is not present in sysroot, the script will
>> >> > fail, and meson will declare that 'there is no valid installation of
>> >> > python on your system'.
>> >>
>> >> So the python3-native pokes around the target python3 to get the right
>> >> values?
>> >
>> >
>> > Yes, if STAGING_LIBDIR is set, via this patch:
>> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
>> >
>> > (don't shoot the pianist, it was working like this pre-rewrite as well).
>> >
>> > Alex
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

