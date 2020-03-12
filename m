Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id CDD9D60B2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 18:05:41 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id du17so3087257qvb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 11:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UGh04BKHm+d4naCVWqdeviMZjW4YMG6eVHFBCTnpNUg=;
	b=Gtw5unG0WjCJXHGoaRFFRQ88ByRKtC88xfohyZLbPQLqYcDoB6qBJBnnKmYu/guX25
	kM4EwiORaeSWcJZzAw1eAvgO1z07NWv84x+O0GoqeCFGnPIWbhZt6ixn4PgkacRmXLsB
	MgeR2VN5idMIVk1MKYAVX/wCuB26TxxZ4IcheNgOUHTBHwJX9o1th85DCZcaxcwUTU8q
	7BwtLNJX6kh0fabw7MYW4dZ/8TZIVzWuUW3cg2LAbCTbRSc1I8F8+S5tAaRV4Nxgf4LN
	Jz+l0Xxt9qHfhsk6QlPk4HcMrAdVJNiAe8PT0LjrEKt3cxpmG/KIikPQS0bpyVGPpAUh
	JiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UGh04BKHm+d4naCVWqdeviMZjW4YMG6eVHFBCTnpNUg=;
	b=FioMYposHJRyrquCX48JKm0N8kiyM4RX6BD7ICBfU0ClYRZtQ2yIjZH5dPFQCUuUJ7
	uw0IyvEb86eWe1PYPM0I/oUkAW2mXX/LxMwBZDJvR3j2FWxjZT2WpDNinH79GC2xS/6+
	8mEeukq8UTWI8Qhu8bHDkFoQDw32wxENBWx6rNMFTyl6JYZ9A/zbLjCMRtXTIoNYaZVN
	eb5wYWitTZsWftoGhBi+32IGb1dDPmGau9jCrRkdFCe8L/od5PCHXhoJpYXKqngHz6I6
	nmB9D5yQL/yJni+z1XYKFHCDBLtPdwfUK+ZQTohxayZUCelhmQDxGlmZxhvRAPDgFOQ1
	C1kA==
X-Gm-Message-State: ANhLgQ2mtJEfUIK+Pi6+oOeQ8S0RxuZFE/iRbnZBQG7w7ZnYCiGgBRCN
	g9Z3KM4mr4l7e1sauaumT3nxQxZN7gf8yAKs8DvnDH62
X-Google-Smtp-Source: ADFU+vufyLjA+ef3tpM6OQjjQLotaWrz9GDccs6yIzDVh7A1QBeesnMUbbgVSfUWq2PCCZK0PCedM7huXm9aYi9RB/o=
X-Received: by 2002:ad4:45a7:: with SMTP id y7mr8649107qvu.146.1584036342311; 
	Thu, 12 Mar 2020 11:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <1583983272-116095-1-git-send-email-mingli.yu@windriver.com>
	<CANNYZj8uQeTRf4n1rkCkKkGc7n4KWrH5MdT13uAzivrBHDAsZA@mail.gmail.com>
	<35d02004-68f2-eac7-16e5-8e51d98d7a1d@gmail.com>
	<CANNYZj_xSpmzHCsZ=JK9phne5ZC_kzfwaNk4tSDPfaebGZdyOw@mail.gmail.com>
In-Reply-To: <CANNYZj_xSpmzHCsZ=JK9phne5ZC_kzfwaNk4tSDPfaebGZdyOw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Mar 2020 11:05:16 -0700
Message-ID: <CAMKF1sqfb5tnWhQBEJJoc0djfOH1iSdQY+esHDmQfYtCijP9hw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] netbase: use snapshot.debian.org
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
X-List-Received-Date: Thu, 12 Mar 2020 18:05:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 12, 2020 at 9:25 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 12 Mar 2020 at 17:08, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > This will break version checks and automated upgrades. Is it possible to
>> > build from git instead?
>> > Specifically: https://salsa.debian.org/md/netbase
>>
>> That repo is debian build metadata sources for netbase.
>
>
> Nope. It is the actual sources too, in etc/.
>

Right, I oversaw that, perhaps git fetch with right SHA1 for release
tag might be ok to use

> Alex

