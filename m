Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id A427B60593
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 07:27:20 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so370688pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2013 00:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=k4/H/+s7xLk+3OUH0u/yXGh1V0sgwEk6rBsfSN3q0kM=;
	b=yCo9YRxH5bRft8Yt731KqoLqeaXUYtEUl0Tjjq14e1hNioo3tab5zrXVEliYENnqur
	Orn9wLJlvsQRBxVc3ZATxtixXsWRcncfJyE1aLt+JtpdfAo2fxI0mXPPOJbC5ApEruWe
	o5EE+gCo7fwOF3xwE1Zt9SKUTF/FawZ4ZEj8coK86l4yBpZbasP8lOUSf5dXO9BeLRRI
	NdBmK2AVZu07Z0Lm9lgwPUCgvdoFd4tQMDz/f9kTOg8UFgmj/C7YygY0RWQbozNcgZZW
	nRImhGybaPAWqcZznqBgEhvIz2qAz6JqRjursZ+keEhFWus2fhkOL5OfcUFYVvJ8ca4n
	waNw==
X-Received: by 10.66.169.172 with SMTP id af12mr9040306pac.23.1375428441339;
	Fri, 02 Aug 2013 00:27:21 -0700 (PDT)
Received: from sa-nc-spg-213.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id bt1sm8599245pbb.2.2013.08.02.00.27.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 02 Aug 2013 00:27:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51FB3B2F.1060908@linux.intel.com>
Date: Fri, 2 Aug 2013 00:27:18 -0700
Message-Id: <45FADA31-8F4F-4BF7-A672-D083C3353813@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
	<51F99839.4020003@linux.intel.com>
	<FEC3604F-BE31-4146-AA6B-A16CB22C8D3F@gmail.com>
	<51FB3B2F.1060908@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Fri, 02 Aug 2013 07:27:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2013, at 9:53 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/01/2013 01:19 PM, Khem Raj wrote:
>>=20
>> On Jul 31, 2013, at 4:05 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>=20
>>> On 07/31/2013 03:51 PM, Khem Raj wrote:
>>>>=20
>>>> On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>=20
>>>>>=20
>>>>> Still seems to failing in Jinja, I wonder if the dependencies are =
correctly sinec it's nooking for native bits and the python3-native had =
not been installed yet.
>>>>>=20
>>>>>=20
>>>>=20
>>>> in my build from scratch several times, I never had this issue. Did =
you do an incremental build to get to this issue ?
>>>>=20
>>>=20
>>> Yes, most of my builds are incremental until I throw them against =
the Autobuilder!
>>=20
>> Saul,
>>=20
>> I was able to reproduce the incremental build issue. I have now fixed =
it and pushed a rebased branch to pull tree
>> in contrib. Please try it out
>>=20
>=20
> Almost there!  It looks like you have a ${PN} in the tarball name =
instead of ${BPN} and it's causing a multilib failure for zeromq.

Yes. Pushed a fix on top of the branch plus another fix that I ran into =
was missing dependency on virtual/libntl



