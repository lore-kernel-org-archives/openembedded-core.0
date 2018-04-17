Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 54808744C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 13:49:46 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id d9-v6so21411168oth.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BDQ4Pxok5HfgAuDUK+ZXedP3PQjGsH13GngXwMnYN6o=;
	b=FGObpAd0NUgkMcBtfpIjYfRgFDgLIjB3BPnM8/h/zLjK+V2vkdcTLOQtJK6myy6syF
	/4OePaKwg5Zdj/LOAYu4GgmIfGf6TOLcXoEaGjHpJJO3KlrsOAH8kOAO1qGTS2mYGR2z
	a38ruv08A/xg8liCWIYRfTSBFTGS0kZBkoVt2b96++BnHrZn4Ky7YTRHqhQKzqPwj4f1
	xgJif+VywjOdwnMN2fjqg5N2dpOuHb3rMZG4x7OHbsvwaF/CWa1hrAF3R58pXFr2Znsu
	o22Dj7M1Jsb4Kq9JnvKILcmwZjaw3gZOGQt4ypw2IyZUusnG31Lok6T8wNRzaMsODvOG
	IaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BDQ4Pxok5HfgAuDUK+ZXedP3PQjGsH13GngXwMnYN6o=;
	b=dwFwnVzM7TQyZEu56TFimtx9u7XE+ewDKBVLGTZMMdx1IGNFm8NQ2oV9Xxpl5ukUpW
	J7iNZ1zKNGYWKxJWwan/aTwmWzYxn7dw7weMpMxrrrsjawJuXcPW07NJ0c0rujmi1bBK
	5uwzJhKy7RXWtcQl3O4qBXoMuJjLlepBEk7oYMuCeX9bDajnoYMa7vibxLaFB0MRyd5S
	31FlpEDbgGRXuUsvuTniNp1OewfKr4b1/E9fhdmulmLVg0L/Zyh09KnpxbLOUXERblL/
	YiBDpI/5XUmefmEVNr8P+QtBcKaBB15qoSsYHvrfbDGK2jYbfasdrJmwC7Lj2VzjgVrW
	ZbMw==
X-Gm-Message-State: ALQs6tCaAAqjMlnPPcsxIUE3lO1dNUJlJoou+o3450U7eG5fMTZTr4W5
	RHjASDecihp8tmU6uAO2Z/+QkO8VfC/eqWk1BkQ=
X-Google-Smtp-Source: AIpwx4975Cq6yaVEUiGJlK9XIasDyhhsEVG0bNgUPKmCtF9rCpJWFwmPU2YxqTIjPRyZbVwnDGZVbzWqPTEf0uHksO0=
X-Received: by 2002:a9d:1eea:: with SMTP id n97-v6mr995308otn.73.1523972987761;
	Tue, 17 Apr 2018 06:49:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Tue, 17 Apr 2018 06:49:46 -0700 (PDT)
In-Reply-To: <CAMKF1srXTmfT-k5+Qj5J=qNUWyYGpnZ_rRsr0R-WOTqaeHhuPw@mail.gmail.com>
References: <CALbNGRQ6Av0QFfDdiAk7Hc+9Tqoa7Zz0CTu-uigtfa=MLk93CA@mail.gmail.com>
	<b3c4df1f-602c-af55-5d64-5b0498ca3d53@windriver.com>
	<CAMKF1srXTmfT-k5+Qj5J=qNUWyYGpnZ_rRsr0R-WOTqaeHhuPw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 17 Apr 2018 15:49:46 +0200
Message-ID: <CALbNGRQK-vMk7ccHHMOvdRMkzBNxv7N_SyqOkkkjCrtgT8uu5g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl patches
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
X-List-Received-Date: Tue, 17 Apr 2018 13:49:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2018 at 4:53 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Apr 16, 2018 at 7:02 PM ChenQi <Qi.Chen@windriver.com> wrote:
>>
>> On 04/16/2018 07:05 PM, Andreas M=C3=BCller wrote:
>> > Hi,
>> >
>> > I am not happy plastering patches around for musl. This gets even
>> > worse when I see patches like this [1]: Just wipe away security checks
>> > unconditionally - the developers did introduce this check not just for
>> > fun I guess...
>> >
>> > I have seen this already elsewhere so: musl maintainers please take
>> > care not to modify code for glibc!
>
>
> The idea of musl is not to create a cocoon and live in it but on the
> contrary it=E2=80=99s about fixing the packages such that they work on an=
y posix
> complaint libc regardless having said that there are packages which are
> coded for glibc and we
> Might have to keep trying to fix them upstream
>
> So in the spirit we are making changes such that
> They work across the board and then also push
> These patches to respective upstreams so far we
> Have done good job and upstreamed a whole bunch of patches this would not
> have been possible if we did the conditional approach
>
> We would not like to introduce regressions for sure and if you see
> regressions please report them ASAP and if you have fixes even better
>
> I am hoping that in the end applications will
> Become more portable and we will also see
> The cruft clearly that has gone into glibc over the years and be able to
> address it as you can see  there is lot of cleanup happening in glibc
> already as a result
>>
>>
>> >
>> > [1]
>> > https://github.com/openembedded/openembedded-core/blob/master/meta/rec=
ipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-avai=
lable.patch
Let's talk about this patch (same in meta-network/networkmanager):
Without further wisdom I cannot see the 'spirit' of this. It just
opens the chance of vulnerabilities for glibc builds and this for
components as systemd and networkmanager. I wonder what upstream would
say about this patch...

So as long as musl (or clean for posix) patches are not upstreamed I
would ask to keep glibc builds as are designed and tested upstream
either by

* SRC_URI_append_libc-musl or
* #if defined(__GLIBC__) in the code

My 2ct...

Andreas

