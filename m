Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7UYF-0005Es-HU
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:58:35 +0200
Received: by eekb57 with SMTP id b57so1089271eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XKmN57RwgbtN6Ai5g2qGefVCn2hZIAZY3CymtPmGuvU=;
	b=qZGtUCuZCe2L6yfM47jm4cs1Lyk4MbwdZYZe2h1AYRJ4eM2kV+uhHZGZOi7XNcPKPI
	6urAXFKXNXWT176yM+1kutRQMjDXhUspVi27MT0GHJ+XjO14Jl1jiJeKA7MKjYkeRNyS
	1nR4bznOgAchfe0WWGXNW37tYsVh+oOSBUyAT55brKWaebgIOwlGdYKXZeH99kqaWtta
	SqgI/74psEcvDtBE9S+zMbuO2CNhFCksQ6ncqOxYo93AWucHKY3MXaZq613zl96y1jjH
	yYi5ATMCKxDu1GOIUIm85Z80NqGx0W+iGMApbW7KfakZaoDtlDYb/15M/V/2AYCZy9mg
	lzoA==
Received: by 10.14.202.131 with SMTP id d3mr12154922eeo.32.1346431578782; Fri,
	31 Aug 2012 09:46:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 31 Aug 2012 09:45:48 -0700 (PDT)
In-Reply-To: <1346428885.16485.29.camel@ted>
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
	<1346428885.16485.29.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2012 09:45:48 -0700
Message-ID: <CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 31 Aug 2012 16:58:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 31, 2012 at 9:01 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I don't think dropping support for / and ${prefix} makes sense as long
> as it doesn't excessively hurt us

we already have, done special things to support it look how many
libraries appear in /lib now a days despite their original build
system wanting it in /usr and I still get atleast 50 warnings on it
wanting more in /lib and I am sure someone will send patches
for it because they hate the warning and then we will have this
growing pile of patches
to maintain. So IMO it has already started to hurt us.


