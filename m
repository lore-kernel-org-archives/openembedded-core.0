Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id A7FFE6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 17:41:12 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so28485346qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9Jl79eXmbslaP21r3dbu6hwndOlUgk5EZmi8kPjKi4Y=;
	b=GqqRET4Qnl0ovGG8z/NDCfSTZQiYnMWMzXdytMOriB9RkMcqmZZ0/NpnJlTmAXE93N
	ZpNKuHyGYRVJ8DRmFOkyG3EbjIyBLZFB8JXbTwMLORfaafUQouFBxxrI4U5ZTk+QptYg
	fWDNnhnFekIjXF69yY8cQIN5kOAFjTk8bmLXd1vXns3YiiD7by0XZkZau3wQrnCGQvQ7
	NT6cP5uGUaKqRX6A11FzabWt26YQN8FTfX1Ii8fpZuLycsg1DWKSUDmuhGjk9h7sZ5de
	N2f/zVod4tEaN/Ma3JpNxjjfldo9+BoimQG4jqqaO3XoRSspeRQ7jY5WTnl7oIbfAhPo
	yq/Q==
X-Received: by 10.140.237.194 with SMTP id i185mr26894957qhc.53.1429033248466; 
	Tue, 14 Apr 2015 10:40:48 -0700 (PDT)
Received: from [10.101.1.4] ([38.122.23.194]) by mx.google.com with ESMTPSA id
	k126sm1169265qhc.42.2015.04.14.10.40.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 Apr 2015 10:40:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <552D4D85.9010104@linux.intel.com>
Date: Tue, 14 Apr 2015 13:40:45 -0400
Message-Id: <17C7BB5A-DD92-44F5-A463-F36F9A45522E@gmail.com>
References: <552D4D85.9010104@linux.intel.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Should disabling features in glibc also disable the corresponding headers?
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
X-List-Received-Date: Tue, 14 Apr 2015 17:41:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 14, 2015, at 1:25 PM, Tanu Kaskinen =
<tanu.kaskinen@linux.intel.com> wrote:
>=20
> Hello,
>=20
> oe-core's version of glibc allows configuring out some libc features. =
Currently, if a feature is disabled in glibc, glibc still installs the =
header for that feature. This means that applications using glibc can't =
rely on checking just the header presence in their configure scripts, =
they also need to check whether the function implementation is present. =
Is there some good reason why glibc works that way, or should glibc be =
fixed so that disabling a feature disables the header too?
>=20
> At least alsa-lib requires patching[1] for this reason, and I wouldn't =
be surprised if there were many other similar cases in other packages.
>=20
> [1] =
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-multimedi=
a/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
>=20

checking for functions is the right thing. And it would fail to link if =
you passed configure check.

> --=20
> Tanu


