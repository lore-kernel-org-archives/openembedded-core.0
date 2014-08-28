Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id EBCAD70F06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 13:50:17 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so914486wib.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 06:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=rnoVFzzoQqZjYID3gwzHO7R1iUAg9F09rOLph3Qsl2k=;
	b=gMh9sdhqVVEeTMKR+Riebiw1JT3xAuHo9HB6stjhE9IdSTXvZOk4emlYA3t7pZR8cm
	MxZS/6lt2dkeExgoRR/a3CrTphFSqfYDBc/zvsTNGmIWfmr7N1BtlKp7inqLv5a8OUho
	pDUBJG+pUlPxMhj2s3MyYJ7qhwLC6vUaDz766jVCMVglM0xLbZehXRMJWSVOIUTpQsze
	6UgqfxmnsySvy1o3pTQn9HBlAW3OF0CnYXPNbKuKfW8TWg7288u/CponiKOPw/Masq3M
	JjJBgBW/qlsX+VdnqfXUdONN8J+M3RxJ3eku/pXYsr7+Vpu7KG+Q7pEQzjrQNrCkvwX9
	5HWQ==
X-Gm-Message-State: ALoCoQkCEMSc+n9tiCqcW6F7WHG/TFooG9c++FThgAqL4QZ9LqNY3a0WreILr+oSrgIX15ET0GFj
X-Received: by 10.180.101.129 with SMTP id fg1mr37083403wib.20.1409233815656; 
	Thu, 28 Aug 2014 06:50:15 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d1ac:ee01:c702:e868?
	([2001:610:612:0:d1ac:ee01:c702:e868])
	by mx.google.com with ESMTPSA id
	xn15sm35839727wib.13.2014.08.28.06.50.14 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 06:50:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53FB8A87.1010202@windriver.com>
Date: Thu, 28 Aug 2014 15:50:12 +0200
Message-Id: <53F8A551-7665-45B9-A386-DFA43D57E04F@dominion.thruhere.net>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org>
	<20140822133349.76751634@e6410-2> <20140822193910.GD20524@jama>
	<20140822154954.04d4fc02@e6410-2> <20140822214626.GF20524@jama>
	<20140822170626.13280b11@e6410-2> <20140822222642.GG20524@jama>
	<53FB8A87.1010202@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Thu, 28 Aug 2014 13:50:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 aug. 2014, om 21:12 heeft Mark Hatle <mark.hatle@windriver.com> =
het volgende geschreven:

> On 8/22/14, 5:26 PM, Martin Jansa wrote:
>> On Fri, Aug 22, 2014 at 05:06:26PM -0500, Peter Seebach wrote:
>>> On Fri, 22 Aug 2014 23:46:26 +0200
>>> Martin Jansa <martin.jansa@gmail.com> wrote:
>>>=20
>>>> changing
>>>> default DEFAULTTUNE (and TUNE_PKGARCH with that) to have thumb =
while
>>>> still building with -marm doesn't make much sense to me and is only
>>>> confusing.
>>>=20
>>> I think the distinction is that if you use armv7at-neon, you *can* =
build
>>> specific packages with thumb. Mostly, I guess, I don't think it =
makes sense
>>> to use a tuning that specifically states that it can't run thumb =
code for
>>> processors which can. Although... May not be an important =
distinction, really,
>>> as you note.
>>=20
>>> I don't think it makes sense to use a tuning that specifically =
states
>>> that it can't run thumb code
>=20
> The defaulttune is supposed to supply what the processor and ABI are =
capable of.
>=20
> So in the case of armv7a, it's saying no thumb support at all, this =
included thumb interwork.
>=20
> armv7at says that the processor supports thumb, and interwork -should- =
be enabled.  (It can of course be manually disabled, but that's another =
issue to be dealt with...)
>=20
> armv7at doesn't say it actually includes thumb combines binaries.  (I =
argued originally it should, but was overruled for a variety of =
reasons... not the least of which is the interwork enabled, and multilib =
issues with 'same abi' configurations.)
>=20
> So I agree the default should be armv7at or armv7at-neon, unless there =
is a compelling reason to leave it as a default with interwork disabled.
>=20
> As for the hard float question.  I'm torn on this.. for compatibility =
a lot of the industry is still soft-float based, and frankly I've not =
exactly encouraged it with my customers.. (I'm not seeing general =
performance improvements, only improvements in select artificial =
benchmarks, or specific pieces of code.)

Again, softfloat !=3D softfp. The current OE default of softfp *does* =
use the VFP, it just passed the floats in the integer registers. Which =
is why you will see no difference with hardfloat except for benchmarks =
and povray.=

