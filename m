Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 661F073954
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 17:18:28 +0000 (UTC)
Received: by pabli10 with SMTP id li10so74151098pab.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=O7rmkCPRxSdIJA+lvjR1km9WdG/B4O8Zrg4u3ETlYV8=;
	b=XE1IQALEMJYaRasjvbnKGfFOuUyIVOyB262IFiH8LiWlXM2bLJcZBLS7JX25RA8UFC
	cNWSwgLtR9J93T2lYoEIT0UOp/nwitw6tS2enmaFOTYRLCyKgGMotNf09q2gwzqZMYYN
	FROG5TtOU2jUyIuPdKwbhfoQPfNAWt8Q7BEbz3SmStU4LChedw0mQywt1C+C3o096Fs/
	jfLLKH7rRbsfUA2t5Vm7rAWJRRQsee9mI+gX6m56tRGuU0f2kI2LPj5RSet7M8TL/blB
	2AuWDh5JIlRafgyjG9Lj0Bjr6VYAbtNrIGY16spAqsaSA/4SgwYJ5j8s3egjgGrtacYY
	Gnpw==
X-Received: by 10.66.132.6 with SMTP id oq6mr57024889pab.29.1425921510191;
	Mon, 09 Mar 2015 10:18:30 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:5dec:324d:fc8d:ab4d?
	([2601:9:3580:84c:5dec:324d:fc8d:ab4d])
	by mx.google.com with ESMTPSA id
	n10sm20179758pdp.18.2015.03.09.10.18.29
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 10:18:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1425920826.2831.32.camel@bottazzini-ThinkPad-T430>
Date: Mon, 9 Mar 2015 10:18:28 -0700
Message-Id: <04F2A216-6397-4434-9D9E-6C23AD1A596B@gmail.com>
References: <bruno.bottazzini@intel.com>
	<1425678686-5469-1-git-send-email-bruno.bottazzini@intel.com>
	<CAMKF1spHsw-9DXLUy1EzfVQDFt5XGdyaLvXC6McVg05RWjVi5w@mail.gmail.com>
	<1425920826.2831.32.camel@bottazzini-ThinkPad-T430>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: 219 -> stable-219
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
X-List-Received-Date: Mon, 09 Mar 2015 17:18:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 9, 2015, at 10:07 AM, Bottazzini, Bruno =
<bruno.bottazzini@intel.com> wrote:
>=20
> On Sex, 2015-03-06 at 14:49 -0800, Khem Raj wrote:
>> On Fri, Mar 6, 2015 at 1:51 PM, Bruno Bottazzini
>> <bruno.bottazzini@intel.com> wrote:
>>> The upstream systemd git repo only contains the main systemd branch =
that
>>> progresses at a quick pace, continuously bringing both bugfixes and =
new features.
>>>=20
>>> Distributions usually prefer basing their releases on stabilized =
versions
>>> that receive the bugfixes but not the features.
>>=20
>> Thats good, although we have to be open on stable branch to do SRCREV
>> updates which we hardly do. We only backport fixed via master
>> so I see this as pointless from that angle.
>=20
> Alright! Can I get all the patches for the stable version and apply
> it ?=20
> In the end we will get the stable version via master.
>=20
> What do you think ? Would this be better ?

that would be fine.=

