Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9175176230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 02:10:30 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id o6so51271325qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 18:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=sHWGD1QMA2FMMzPCxZMsm+4hUgZ83/Pmbl28EoWELTk=;
	b=rrXsr6+YaAFUG7qnUYcciJyD6w1LDOAXcEZOfuSlh2GXu5FxGnWjaG+Lrs4HkuNm1v
	Ge09FR1hxLKdwdJJj/nCRAbF22BDTniqxmqC9ZZdhKgxmFUDv8eegTfNoASpYZ9O0BGS
	+81xO8M+1Pw8RcLdeFdc+7EddepYzINzD2jq5mnB2iN/KYdKZdSx6oGrDzBHc2phP00u
	hzMWE4AIhq0es0Gp4ENVc52sS39OuzOl2i+gzASe8QGTGb5m7Y80d7HrNyb8RjzYiRyO
	34dFjnSN0MWRVjTwJc6vFrggXQVRc9CYzrM0eMkYuzjxoAu7+V3e34cKpYW0xmG7+4qf
	rKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=sHWGD1QMA2FMMzPCxZMsm+4hUgZ83/Pmbl28EoWELTk=;
	b=Z2klj8ClgPn3SjsfUO/BTPQyo4TdOCOLJriGbBXjWBw+TFtJ0dtXrSq1Xm2lj9R+hA
	6fR91ruD2MVXi+WF7zOgzFPKwe5OKrs6RSlh9UW2s0CNGrkXJ4RxgvnOdzJpTGxAFD+J
	nnbinaPymPamHhIvkLZJ8xj29OgNclqgr0c1mBxlI9Ilylj+0/pJ5iVFfCUO7lEs1EhU
	RI1mJAUz+Xt71JhvFeBjyfve/XqhoP4kXi5gi16p0WGo4ZXisTFLVCo6iAV33+GQhAnf
	wg4x8MQiy1bvcKs6Bqv2seLjB1twDynj9QHrytZcQ14Idiid9JcC2kJou3aU7Qufx2Bq
	dWIg==
X-Gm-Message-State: AG10YORs4TbQnWmAEf9BZDBQbg5XdVVX2Psa+i/jU4qxf1ryK1bb/1H5hDZZHoz1/ZsR+EVFABhaBJDJBlfXIw==
X-Received: by 10.55.73.199 with SMTP id w190mr31124199qka.77.1456107031407;
	Sun, 21 Feb 2016 18:10:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 21 Feb 2016 18:10:02 -0800 (PST)
In-Reply-To: <CALbNGRTcuFWpTEpwu1V=m6U2cz+3RiQNFmyXtaV1sg8wxx91Kg@mail.gmail.com>
References: <1455460128.16142.400.camel@linuxfoundation.org>
	<CAP9ODKryst11Tr3QpuCA87pDYdsezEjTwxpb2HOwcVvi32f+pg@mail.gmail.com>
	<CALbNGRTcuFWpTEpwu1V=m6U2cz+3RiQNFmyXtaV1sg8wxx91Kg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Feb 2016 18:10:02 -0800
Message-ID: <CAMKF1sp+xLsACBHv9NPYhOp8MEo3HcYT6Qw6ey5KEGH8b8-zOA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/distro/include: Add no-static-libs.inc
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
X-List-Received-Date: Mon, 22 Feb 2016 02:10:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 2:05 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Feb 15, 2016 at 2:44 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Sun, Feb 14, 2016 at 12:28 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Maintaining this list in a common location is more desireable than
>>> everyone doing it themselves. Poky will switch to using this, OE-Core
>>> will need to discuss that as its default.
>>
>> I support this being enabled by default on OE-Core as well.
>>
> Does 'support' mean you are taking care for recipes this is will break
> throughout our layers?

The ones that fall into distros I care, I will help, however such changes
require many hands.

