Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7SVW-0001tP-Jx
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 16:47:38 +0200
Received: by eaad12 with SMTP id d12so775964eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+Rut/evRF59UQAvmE8y0BVONn91O+q+oTY76dXQea3w=;
	b=VVcpNFfk27a0g9b/fxZL5qys5ubNaS7Ylhp6x7ziBK86o74a1+Bev7nOG4v12RSn18
	V4oF7zz2RyGDDqQuw2dyC803bViV36tZxyIiRlrOx61ciubRdwhbxDtJwD5rsW17BcDV
	N+kMiFVJ061zSwqjoffigFiPQSGNLF2bwCT8ojP8nZYl1wP1RcOlLXDl1LRsUxXccqm8
	1UFBl2xYvX2i6Dk3BuIZ3qA9yUgfSqQBJtOfc8oeBqS2k5Ee9A3a+p4tKONeYN2yoLRb
	faw45LxxwSIBOqXXbvgYftU3Z9tBiDIEXgsTFi29uJnmv/1B9JsxDJq0KQUdAc5Ppodx
	xnkg==
Received: by 10.14.5.67 with SMTP id 43mr11427267eek.15.1346423721946; Fri, 31
	Aug 2012 07:35:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 31 Aug 2012 07:34:51 -0700 (PDT)
In-Reply-To: <1346423384.2673.102.camel@phil-desktop>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2012 07:34:51 -0700
Message-ID: <CAMKF1spy4YS5=e4Kux7_e04t89nqmb4Y_fEecFZZ02D=ibkATw@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 14:47:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 31, 2012 at 7:29 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-08-29 at 23:22 +0100, Phil Blundell wrote:
>> As far as I know, only Intel have ever expressed any real interest in
>> having this feature work.  My recollection is that there are some
>> supposed "carrier grade" systems where this is, for whatever reason, a
>> requirement.
>
> None of the carrier-grade people (or indeed any others) seem to have
> spoken up in favour of a separate /usr in the past 3 days or so, which
> does rather suggest that nobody actually cares about it.
>
> Maybe the TSC would like to reconsider whether this is in fact a
> worthwhile thing to go on trying to support in oe-core or whether it
> should just assume that / and ${prefix} will be the same filesystem.
>


yes it will be brought forth
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


