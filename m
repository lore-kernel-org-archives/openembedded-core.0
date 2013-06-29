Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1CB7A62240
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 17:43:36 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so3376541pbb.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=vm1dbHMonB5MJ9Eoy1CS9luuASKqE2tJ40LR3CWS7hc=;
	b=BG3OcqqzQPcxRhXDziDQ4EGqU5TFJ+V13dLMx8bwEIOAXDYrobF4gRgv6Wv7vn+8rF
	HF2Nh/zMesZaPCE3Xoe3QMICGa4iNEhpYUXNQ5MdULoe4IJlD/QtFhTjroNLqArB+XJj
	r+ap3W7QtKfHyTOvEwZHWMa3BHWqfcGGNsMbAs6tEaroAmHhDonw0+PUAwZXeUoAzO6L
	Vzf/6MS/OPoVKdT5WeOaEnifgAMz0hnBkydDQkqNAvWJi1u532Q1tK6IJ0m5zYCyFHar
	BXt+WXrOsH4FXqLnkT/eQCiVvF70UicMi+V/t69AFpHKBt/6OZMb1uh7PQ/tjnaTx0Z8
	lIGQ==
X-Received: by 10.68.219.130 with SMTP id po2mr16590279pbc.68.1372527816886;
	Sat, 29 Jun 2013 10:43:36 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id v20sm14914361paj.4.2013.06.29.10.43.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 10:43:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130629153101.GV3261@jama>
Date: Sat, 29 Jun 2013 10:43:36 -0700
Message-Id: <FC291AD8-C84F-46CD-B4BF-029DC5DA556A@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Sat, 29 Jun 2013 17:43:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 29, 2013, at 8:31 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Sat, Jun 29, 2013 at 07:11:35AM -0700, Khem Raj wrote:
>>=20
>> On Jun 28, 2013, at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>=20
>>> On Fri, Jun 28, 2013 at 03:03:39PM -0700, Khem Raj wrote:
>>>>=20
>>>> generate-manifest-3.3.py: Add script to generate python 3.3 =
manifests
>>>> python-3.3-manifest: Add python3 manifest file
>>>=20
>>>> classes: Add distutils for python3
>>>> setuptools.bbclass: Use python-distribute instead of
>>>>   python-setuptools
>>>> distutils3.bbclass: Port the distutils class fix to handle =
filenames
>>>>   with spaces
>>>> setuptools3.bbclass: Remove useless multiline comment
>>>> distutils: Introduce PYTHON_ABI variable
>>>> distutils3: Do build_ext as separate step during compile
>>>=20
>>=20
>>> I think these 2 groups could be squashed together for easier review, =
but
>>=20
>> do you mean create just two patches out of those ?
>=20
> Yes
>=20
>>> otherwise great work, thanks for doing it!
>>>=20
>>> I'll add them to jenkins a bit later when I get some better build =
that
>>> what we have now.
>>=20
>> They were added in order that the build keeps working with every =
commit for helping bisects on tree later
>=20
> I meant that e.g.=20
>  classes: Add distutils for python3
> introduces setuptools3.bbclass and
>  setuptools3.bbclass: Remove useless multiline comment
> just 3 commits later fixes that, the same with the left-over commit I
> mentined in other thread which was also resolved by some follow up
> commit, with all new .bbclasses together I would read them just once.
>=20

Yes however I left them for history so we remember how a given problem =
was fixed.
but I have no hard opinion I can squash them

> Cheers,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


