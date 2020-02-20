Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD806105E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:00:57 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id c15so6566vko.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=C+A4+Th585jxzb+rxFDOJq2T1IhGkTWGMWXuGhgOJu0=;
	b=WvAGSeA8hEe6Loe3WJduPTcVfUyGLNICA2swI/DGJN/1DsFiOIFXegwr9viH236hTj
	WHlYcX9K4YpTon+g7cBEqOuVjjAt0TwJS4FKnWOMEZnI2fW3DRvnW7vrYV9lT5jCknPq
	/wQaT1PgCBDcL7dQGcsMbnuiJBek9J+Gl36NX/kB6o4RbP0idKtLf3f0CW+hnUICHZgE
	/8fX6mUXujNwpLmsniI6gv63ZJB5sgVQBmLPrH5b0j9FYWp8A0ycIR+zILSXbj5vkLWo
	HMvRe2XoVrcm7bH3TrH+7f43LQJvrKfzwzTj5PcRfb3w9wA6mBoBNKb5abCfmLaaxPgr
	FErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=C+A4+Th585jxzb+rxFDOJq2T1IhGkTWGMWXuGhgOJu0=;
	b=Nfl3q1/1zLMIxAtfZJa+GcYlF3yvyXASDKuIyHVZz/xwOCMLOLeSkyqKuErxvjA3IC
	KSNpjAeNH9tTxG8plZmxYaek+wSAKV4BvveVjcZ0aEiLxEPwkR8OReEEXkBeF5Os2yrM
	z5qKoKzQaaJCRqNxhwhYuz3E9neO3Lbnnu2eusOIiWaDLjJKpYIVbZZxYhl365QrW15I
	wujC2uRE29LMqiheKwbzJQ7HXlsdXoO4fl4AgqJIs2DZ7AwAEYLgJ/FqIMg8KKZeTwqO
	504g+ZsZuXFau4ifPlIiuFGRZ3YC75NUcMxlQL8x5zBFaFWQjcdaM0vDefvt+z66Mkuu
	+Qkw==
X-Gm-Message-State: APjAAAV4E7xuEGAD2KSsDy9QIL0gBzyL/DCQ53WARKhUn3XuOeZn/kp9
	/x7JmTTCq836emCvmALFAdvx6agJ/PTwH/AggjU=
X-Google-Smtp-Source: APXvYqwiFhChDyEqSLM0HW8gYSi+2PVZF0K9y3L57xt+8snqyUnShtxfys6ZbC6ElHGqlAe8i8xRXCc4AvKyNSRbzgo=
X-Received: by 2002:a1f:94c1:: with SMTP id w184mr15874036vkd.43.1582236058327;
	Thu, 20 Feb 2020 14:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
	<CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
	<CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
	<CALbNGRSFZcsh0ZKBgyRX+eg3ThZbRf1ryiVbHU5Y0vZgd0BkTg@mail.gmail.com>
	<CAMKF1srmsrx8Nq4gSj5ZDK0o1d4t8AtDWnjtDgzT1Py8i=Njtg@mail.gmail.com>
In-Reply-To: <CAMKF1srmsrx8Nq4gSj5ZDK0o1d4t8AtDWnjtDgzT1Py8i=Njtg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 20 Feb 2020 14:00:46 -0800
Message-ID: <CAJ86T=URADiQr=_iOdw990WWCHhkDL0sAS-oD1JEtyV9UOHGXg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 22:00:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 12:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 20, 2020 at 12:24 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>>
>> On Thu, Feb 20, 2020 at 1:45 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>> >
>> > On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin
>> > <alex.kanavin@gmail.com> wrote:
>> > >
>> > > You need to at the same time drop the introspection enablement logic=
 from EXTRA_OECMAKE I think?
>> > > This line:
>> > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sat=
o/webkit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70
>> > >
>> > > And for consistency, it would be good to do the same for gtk-doc.
>> >
>> > This is odd: I fell over this because there was no gir created. Did
>> > not notice it was few lines below. Need to check that - maybe I am a
>> > bit off-sync to master or something is wrong elsewhere.
>> >
>> > Will sync to master and send V2 then.
>> >
>> Finally had time to look into again. In the recipe there is
>>
>> GI_DATA_ENABLED_armv7a =3D "False"
>> GI_DATA_ENABLED_armv7ve =3D "False"
>>
>> =3D> My patch is wrong it overrides above accidentally - thanks Alex!
>>
>> Since webkit builds gir fine (my machine is armv7ve) that does not
>> seem necessary any more. I would like to send out a patch removing at
>> least armv7ve - shall I take the risk to remove armv7a - maybe as two
>> patches?

These two should be equivalent for all practical purposes and so
should be updated together. ie remove them both, one patch.

