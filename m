Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC2B6EEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 12:13:26 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so306799wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 04:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=WKL06/khr3mLFe40mXLVctYhhdGgcN4ewQK4uOhOHmQ=;
	b=EJhn15iCMIJH+ozKYSQ8dJqSlUYg7JN+gs+kB4FziEMKpY3tRYtxJZII5dcPvbcTpo
	U71CA8UMSu6GzilDXYfDn8t7RF0xg7Rz6f+SoH1/QQMEC8Bw/ylUVfVgltKB7yGBku5o
	UQhbQeNg3dGVFhXHA3dzadP10Av/Ev3TD+5LXbm85cD3BiUNgbzIRw4BxmoI4yrgPvZ1
	+OQK118i1QcqgeOMDemrg82QEh5kSV7pJiTT5LJMLIRFbjNkW+cifAo66JpudoizS9et
	Vhs0lK8Yx31p5HVogZ6AOn3KyTfkRsYgxs2uQw8wTAXhadWw5QIWWr78rWY7ih8TDfFS
	CBnQ==
X-Gm-Message-State: ALoCoQlIm8P1jOPPCv7P4psehl24m4iWOuRP5PY8cX+m0gzcjryQyTarpKF7vUSurwaOBXLbbJKx
X-Received: by 10.194.58.180 with SMTP id s20mr2279241wjq.54.1393330406906;
	Tue, 25 Feb 2014 04:13:26 -0800 (PST)
Received: from ?IPv6:2001:610:612::a418:68f0:e87e:d089?
	([2001:610:612:0:a418:68f0:e87e:d089])
	by mx.google.com with ESMTPSA id
	q15sm50253335wjw.18.2014.02.25.04.13.25 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Feb 2014 04:13:25 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 25 Feb 2014 13:13:24 +0100
Message-Id: <C0069BB2-4391-42DA-AB55-E8BF14D57B32@dominion.thruhere.net>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0CDD6.4030904@windriver.com> <5014991.yOqVctVWSl@helios>
	<19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1827)
Cc: Saul Wold <saul.wold@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Tue, 25 Feb 2014 12:13:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 feb. 2014, om 17:38 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Monday 30 December 2013 12:59:26 Paul Eggleton wrote:
>> On Monday 30 December 2013 09:35:18 Robert Yang wrote:
>>> I'm afraid that the standardlinux maybe a little confused with
>>> linuxstdbase, bu I don't have any better idea about it.
>>=20
>> You could be right. I've thought for a long time about renaming this =
and
>> haven't been able to come up with anything better. On the other hand, =
in our
>> current configuration we are actually using the basic/standardlinux
>> packagegroup as part of our LSB images; although that might not be =
the
>> right thing to continue doing - LSB probably ought to be independent.
>>=20
>> FWIW, let's consider this particular patch as RFC, maybe someone else =
has a
>> better idea of what to name it. I am very much convinced that "basic" =
is not
>> the right name though.
>=20
> So, has anyone got any better ideas for the name of core-image-basic =
and=20
> packagegroup-core-basic?
>=20
> The idea is that these are meant to contain things that you might have =
on a=20
> more traditional or full-featured Linux system. Somehow =
"-traditionallinux"=20
> doesn't really work either.

Who does it need to contain 'linux'? OE isn't linux specfic and neither =
are the package groups.=

