Return-Path: <raj.khem@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 11AF3724B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 01:55:27 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id x12so626538qac.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 17:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ggwe7DII8E78buA2uEIs6gRPoBr16y3WBSLTfqkyHp8=;
	b=ALoTF0MTQdZyZZB7WnBh1thweKz+wpP5kQyrZ30npEyNElVK9XNXHkzFoLN+FR8NmF
	zm45FRrhaKn7ecosCS0QSlWdYRMa0F1FEuUnviw3gfddMd2AujND+LiWDD+zG/dTsqyY
	tXMtLRwMvD+18hczRJfjy+acR07RSHIFNZnQPcGLkFdQJauvyyIt+PCgtEYs04D7TCWU
	KbLLAxO3iXnTKX5PbQivWM8es2OpdeiDFhDkbQvWf3wCW/UOwyE012EvuQP2LmVSK6Wq
	dUdf2ikl7xCL7GpA1oSk4hH/m3iKtRx37Krl28qIhn8GddcUtw4VTUnmT/mZiDjG7eZF
	z86w==
X-Received: by 10.224.23.133 with SMTP id r5mr10682330qab.88.1420682127703;
	Wed, 07 Jan 2015 17:55:27 -0800 (PST)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id j6sm2792004qga.9.2015.01.07.17.55.26
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Jan 2015 17:55:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <54ADE119.6060008@windriver.com>
Date: Wed, 7 Jan 2015 17:55:24 -0800
Message-Id: <06BCD4D4-D179-401A-A39C-1881F2F69B65@gmail.com>
References: <54ADE119.6060008@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About update binutils (2.24 to 2.25)
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
X-List-Received-Date: Thu, 08 Jan 2015 01:55:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 7, 2015, at 5:44 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
> Hi Khem,
>=20
> I'm trying to upgrade binutils from 2.24 to 2.25, there is
> a patch binutils/libtool-2.4-update.patch which has 19317
> lines, do you have any ideas on how did we make it in the past,
> please ?

what conflicts are you seeing ? if they are just in configure files then =
you
need to autoteconf them manually one by one using the appropriate =
version of auototools as recommended
for bintutils 2.25 usually gcc/binutils don=E2=80=99t use latest auto =
tools.

but if they are reporting changes in other files then its a different =
problem needs to be looked at.


>=20
> $ diffstat ./binutils/libtool-2.4-update.patch
> bfd/configure        | 1314 +++++++++++++++++-----
> bfd/configure.in     |    2
> binutils/configure   | 1312 +++++++++++++++++-----
> configure            |    2
> gas/configure        | 1312 +++++++++++++++++-----
> gprof/configure      | 1317 +++++++++++++++++-----
> ld/configure         | 1693 ++++++++++++++++++++++-------
> libtool.m4           | 1094 +++++++++++++------
> ltmain.sh            | 2925 =
++++++++++++++++++++++++++++++++++-----------------
> ltoptions.m4         |    2
> ltversion.m4         |   12
> lt~obsolete.m4       |    2
> opcodes/configure    | 1314 +++++++++++++++++-----
> opcodes/configure.in |    2
> 14 files changed, 8937 insertions(+), 3366 deletions(-)
>=20
> --=20
> Thanks
>=20
> Robert


