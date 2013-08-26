Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 71A996BAAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 17:27:56 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so3729563pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Qmf/4K8CPgm7BDFuN9Lp+6VeB6CJeweHpG6IOhWmh/c=;
	b=iZpu8lvNy9aq3EIcrzToSEnoKWEsu2mATsxiABLALbU9FlspjxY7JnMIN6ZWiFahdw
	OxaanfJH6kIPmOkS59zJOKOB2htPMKEs4JsXtq6lGW8BrqladMbptUav9+n0jc5yusxZ
	iv4/ubXy8qPtqbyTSZ96ccvpQo9ot4KyW05UEDDuibgCXU86QkcMDMdJ82bVYLfyVeof
	gNTcbS8C5GndQ/qhEpm6i8KcOESfmaqRbQtIJPSVFpQDe7kWUf4h4McykdVd06X1DqSE
	RLLZBfWpPUJjclGUZ/asP1ooB0Xg0ZZFQ1fWLnl+uHY7IjmuI+Jg+r5tDovEWUHkfRkZ
	GMmg==
X-Received: by 10.66.163.2 with SMTP id ye2mr4129313pab.168.1377538077251;
	Mon, 26 Aug 2013 10:27:57 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	py4sm19212932pbb.33.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 10:27:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADkTA4Pit1BhOxw5C1gFobrj-m00CpS-n=WNtCkgdRdCDRymhg@mail.gmail.com>
Date: Mon, 26 Aug 2013 10:28:07 -0700
Message-Id: <8DA5FFBA-9580-444A-AC2F-53C97EF6D105@gmail.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
	<CAMKF1sr+z-f7KW6BqMLbs0RuFu4fhz_crhBVM_++nOqVb=OtnQ@mail.gmail.com>
	<521AA761.4000605@windriver.com> <521ABA1C.9010105@windriver.com>
	<CADkTA4OFMOyAUi5njjFXb1NnTh4ONp4vHT3JZxuL4tiG3OqOiw@mail.gmail.com>
	<CADkTA4Pit1BhOxw5C1gFobrj-m00CpS-n=WNtCkgdRdCDRymhg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] eglibc: ptrace: protect ptrace_peeksiginfo_args from redefintion
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
X-List-Received-Date: Mon, 26 Aug 2013 17:27:57 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 25, 2013, at 7:46 PM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:

> A final (maybe .. hopefully!?) thought on this. Do drop this change,
> but give me a
> few minutes to remove the offending structure from =
linux-libc-headers_3.10. That
> will also protect all users of yocto, regardless of the kernel unless
> they provide
> their own libc-headers .. and then they are on their own :)
>=20
> That leaves the c library alone, and should buy us time to fix the
> offending apps.

this is not again the correct place to fix it. since you will back this =
out say later
when all apps are fixed anyway. If we need to keep it I would rather =
have the app
builds failing and keep it enabled and it should not be the guy who is =
doing the kernel
headers upgrade to fix the whole ecosystem either. So add the headers by =
all means
and leave the old headers in there until the apps work correctly with =
new headers.=

