Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 693656C119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 13:25:00 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id r200so6595582iod.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 05:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xfbdShTd/+tq2lFLK+z63OiiihyytDPgsJ/1QjGyQq8=;
	b=HNwisvhnbYwGI1xLgjQcOD+p4Drkxy2fFMSzo/bN+XEKg6gcXWMf71H987l9AOE+jw
	+FNR/GOZzle/GSvA9t6IEnxvMfjrIw4jySg7+i1wjsTfohF8hgRYxMDMWd2fkJpSo8q/
	SBix09fyXmwj+1TQ0cQzjwcm6O3YouwAxMNMQWalYL/7Gpo67Ogp9iG+NPxl2RWlhJFu
	ZLAY2+vbbzZa0Vm1PT24AENcFFtSX6WncHfxJq1SNDLV30RQnMPckSwW1XqmDxaUeWex
	CcRQIt5wArY2CslbSAfhHiPVaVE317djwc688/iPSDCL3w5Wui2Ocfb9VU1cWtMX4rRS
	i19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xfbdShTd/+tq2lFLK+z63OiiihyytDPgsJ/1QjGyQq8=;
	b=h1Eu41QWhUaT7hOd3Ur90PQkvG1GyVmlp+hJtZiMnKcTyN+pwieQX3RVaFXTgwJInz
	ncR7PZ7BZET9uiAlC12BWYcgxWN6bCj3kRk1PWEJKyv5a0FY52syfdvnS23uNmWCQN9q
	0Wwub482cFLpj3flT2DNdx20shvmU7LVY27LI2gb0jz1UC2Nzs6gKGxoJj/Pns9LHyvc
	NoG+n2BYt8Zfr4vP3rcwuP5nI0UEOzFOkGv7AD13GIywOJOEEoLQa2uG/YVTQDmFKoq2
	NhHqOsx1WQj1/BUkylZGl1UdQCTODcWOEbO/nqXI96lvm27ZWo0thKoE40eDLJ5Nsq4h
	Hpyw==
X-Gm-Message-State: AA+aEWbjCDOeTuZfFutXLqsFxA3ZQ18rIovAARquOJIlUXHl/6Bd9oTb
	Y3sWoe1e639PMiZfZhMln/tj4EkIgTv3v8ofcDzxjFy1UT0=
X-Google-Smtp-Source: AFSGD/VM3ZW2L85iaTu35IkjCYwHFEvF0m6WEbhcK/C2SSdLo5k3O5N86K79YCW7H2Vm2lWZicc/55nq9yM+AVfhxoQ=
X-Received: by 2002:a6b:b844:: with SMTP id i65mr7903355iof.20.1542893101441; 
	Thu, 22 Nov 2018 05:25:01 -0800 (PST)
MIME-Version: 1.0
References: <20181121223322.24819-1-douglas.royds@taitradio.com>
	<20181122003308.2329.32709@do>
	<a4eb28aa-e155-3d79-8045-0bba3214d5a9@taitradio.com>
In-Reply-To: <a4eb28aa-e155-3d79-8045-0bba3214d5a9@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Nov 2018 13:24:49 +0000
Message-ID: <CAJTo0LbxOJT6UZL-5ZokCeMMOn3e7MQ2ZLs7=iy=WJT7QZSaww@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGJvb3N0LWNvbnRleHQ6IFJlcHJvZHVjaWJpbGl0eTogU2V0IC5maWxlIHNlY3Rpb24gZm9yIGFsbCAqX2VsZl9nYXMuUyBmaWxlcyAocmV2Mik=?=
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
X-List-Received-Date: Thu, 22 Nov 2018 13:25:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Nov 2018 at 00:38, Douglas Royds <douglas.royds@taitradio.com> wrote:
>
> On 22/11/18 1:33 PM, Patchwork wrote:
>
> > ...
> >
> > * Issue             Upstream-Status is Submitted, but it is not mentioned where [test_upstream_status_presence_format]
> >    Suggested fix    Include where reproducibility-add-file-directive-to-assembler.patch was submitted
>
> Yes it is ...
>
>
> >    Current          Upstream-Status: Submitted https://github.com/boostorg/context/issues/91
> >    Standard format  Upstream-Status: Submitted [where]

The [] is not syntactic markers but literal characters, i.e. it expects to see:

Upstream-Status: Submitted [https://github.com/boostorg/context/issues/91]

Yes, this test could be considered overly pedantic, but I'm also aware
that raising and formalising this would be a bikeshed of epic
proportions...

Ross

