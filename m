Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 405AC77A2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 21:09:48 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id q78so3187980vke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PTppp0cqMzUmK9ATG9oBuSv3IMDwy68FDXaa5SU5Rn0=;
	b=BmFRRnYC0j6k70UiYtso1K4VrKL7OiJ4FmxMTMJNhW6L0eqA63TBHIwflNLY9UMsen
	BeKvQKXrp5QXC6m3zmpTqSAltXnrOqjTHyT4BpF5dPFIQ2axZijID4/9/XEj7sSoQrof
	EYBbcLmejFGttxs0+BvCJsOZEWqRN62YoC6GuLGRjy7GwR2vKjzL1L92oZfMembQHTG0
	H4EBwrWXo8gM/XxLIfu4z8p1CF0Nzq1TiDiKDk7IkO2n+JUMMZRs7XkXQbTzUiPVXXic
	XjBpC6pga6uBrcAwVVn50aOw8GWLbb1f52yLsjnMqrH51tkX2bkABkP2/V7phRK4C9+H
	mBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PTppp0cqMzUmK9ATG9oBuSv3IMDwy68FDXaa5SU5Rn0=;
	b=hiLCdXX2ktN58/HVFTiD/kg/oIlC1h5AFmZYjrqDN9cEpUfSNOj8nt3NI0YWfFcDTL
	Et8W1BF6xajX+ZStuXRZIZ1VwnmDjq5StB/kUrZFHDuwL8mIema7pl6vlnV5xwhCYKkw
	qalZhLmN2aH0Ob3c3vnOfApmXxRbV3/ywZ+N2H07+AULU+lgDvrGWjnulFTp8MCOJArI
	0K0pc2YIPnss4QXToQyTyZj7SAh2u0bBc6dG5ywS4A8YrPiUUzXqEt6TI7OHWOw+yG1Q
	6cpL+igAcHZB0DWadcatpAvGuLgSFY9dGj+ZafuFBD9AbXRp6kD2JpOQ/dZI/fjPDDnn
	mVWQ==
X-Gm-Message-State: AN3rC/7E11LjdHevnJavERmXfVdSGA2I9aSOgzZL1eESJ4t8D2VlADvW
	nVzHA/0RNchS6A+0E/zoZI18C/VuYw==
X-Received: by 10.31.3.9 with SMTP id 9mr1778985vkd.64.1492117789998; Thu, 13
	Apr 2017 14:09:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.81.53 with HTTP; Thu, 13 Apr 2017 14:09:49 -0700 (PDT)
In-Reply-To: <CAJ86T=VN2mDsMSA4O_AjB+6rg12-SPmh=Go6ZsjNu3cLpLxY7w@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
	<CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
	<CALbNGRRoXXroY1_Kxc-2uunttn3dN+K4t68WWb1m0WwMvnrUBg@mail.gmail.com>
	<CAJTo0La4Uf5VWhz0Ou7_MH2AYFnBPs2OObt-FAkKJuYhJE49KQ@mail.gmail.com>
	<CALbNGRSe-WDecX=v+uj=PCnGe6hTTJ7J2MK4j3=ynF=mkbLZmA@mail.gmail.com>
	<CAJ86T=VN2mDsMSA4O_AjB+6rg12-SPmh=Go6ZsjNu3cLpLxY7w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 13 Apr 2017 23:09:49 +0200
Message-ID: <CALbNGRRQevSS6-abd8NP-JCyD26kJ=XT8yd5RVR1nTa6jfL0jw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 21:09:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 10:58 PM, Andre McCurdy <armccurdy@gmail.com> wrote=
:
> On Thu, Apr 13, 2017 at 1:34 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Thu, Apr 13, 2017 at 5:57 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>>> On 13 April 2017 at 16:53, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com>
>>> wrote:
>>>>
>>>> OK - but why do I see this error in do_unpack?
>>>
>>> What recipe and task?
>>>
>>> Ross
>>>
>> It is not that simple and it drives me mad (as usual :)
>>
>> Failing recipes were [1-2]. They failed in task (do_)unpack.
>
> [1] SRC_URI =3D " \
>     http://.../latest/download;downloadfilename=3Dpolyphone-1-8-src.zip \
>
> base.bbclass tests the end of the URI path, not downloadfilename, so
> it's not going to detect this dependency correctly.
Yes I thought same but why does it work now? log.do_unpack says

| NOTE: Unpacking /home/superandy/data/download/polyphone-1-8-src.zip
to /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-=
linux-gnueabi/polyphone/1.8-r0/
>
> [2] SRC_URI =3D " \
>     http://.../hires-sounds.7z;name=3Dsound \
>
> base.bbclass doesn't test for .7z extensions, so won't detect this
> dependency either.
>
Correct - but note that 7z extractor p7zip-native is not (yet) in oe-core.

> In both cases, the fix should probably go in base.bbclass.
>
Andreas

