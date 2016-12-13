Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6297A71DE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 17:46:13 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so7779983vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Qws5VeN5I+WZV/P8wINPOeizSbxh2MPbrAecMEqoKLU=;
	b=AU2x9xSsBiz9tWvDKKu/3fs5J0GD/SQ9cLYntEsKzswHQudX0tLdG76i6o7VFS7ZgP
	fqAXmSrFUZLwihhAD4N9iySTw8QR5tRuU9u7RApicivXqNe4yjUEh4HnUa5qwfXUjeBJ
	mvg9Kk5XvZKux5IYtY/u+MFjWvWCQdKfMYBuylyvjpNtXlYh0oZIUkJQQ3bkpKbdPadE
	A3HRphVKc6ZxvUTOBBtb3jDICMpg9THnvOlsodQK7lVbvnrTt9622Ebo9qPzwKt9dd0R
	R891KyVciKemts6td/o4rGvUBR4Mk2FFVm1Alqym+mkGx3jqUlT0OUg7ZkX2IlSSQazP
	LuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Qws5VeN5I+WZV/P8wINPOeizSbxh2MPbrAecMEqoKLU=;
	b=XT2Zox0d38RrCY9Cvs/ZKsgyp7EPFnfo/bys2x3HxlB6XS65yJWtHQYvct848/woRQ
	V7Ta9y0uzeVdxEvK0rtXNe/za6Ft5nUlN21CMWDu3frbBxNiFLbDQNWJe9Xe3PSi4Ux2
	dwEtgXdSQMigsemQ0/IS1/G+Eg8S5aMIojSetK393dLvew7DgKOVE/4/3j7iXYaXSTS6
	SWZzfagyW+MbZIuatx8v8Wm+xicyCM9Z/8dmz9Vm+an9juQpDtsiV9kXPaa6maCxGY0k
	mFJbC+x96VHOuGnMvT2Qez+potJQRpuuAaAd643Chea5gGk1rOwi5+ze1fynixTOhOQt
	msUg==
X-Gm-Message-State: AKaTC02ufU3S1Ie5S8WgG9PNMyQte1eRH3ByDvL2gcMyZX8Qs+2ICRZK8YGrIhPeDua0pma9RI6fIGIM4iq5Fw==
X-Received: by 10.31.75.198 with SMTP id y189mr34975523vka.51.1481651174843;
	Tue, 13 Dec 2016 09:46:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 13 Dec 2016 09:46:14 -0800 (PST)
In-Reply-To: <CAJTo0LZ-3hpYZcibQQX=D6o-wMRZbVeTGVSs9rkKNpEmOoqoZg@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
	<CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
	<CAJTo0LZ-3hpYZcibQQX=D6o-wMRZbVeTGVSs9rkKNpEmOoqoZg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 13 Dec 2016 18:46:14 +0100
Message-ID: <CALbNGRSCR4bNEwKmH_cjEdoQqUUyarOJ+zp-0EP2bvFp5LXByA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 13 Dec 2016 17:46:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 5:10 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 13 December 2016 at 15:42, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> Strange - something must be wrong on your machine :)
>
>
> config.log says:
>
> configure:19371: checking for Wayland support
> configure:19382: checking for wayland-scanner
> configure:19415: result: no
> configure:19425: result: yes
>
> which results in:
>
> WAYLAND_SCANNER =3D
>
> This should be fatal, but you're just missing a dependency on
> wayland-native.  I'll squash it into the patch now.
>
> Ross
I thought wayland depends on wayland-native already. Is it possible
that you don't have wayland in your DISTO_FEATURES - honestly have not
tested that on a machine with missing wayland-scanner.

Andreas

