Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7Z0S-0002LW-VV
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 23:44:01 +0200
Received: by eekb57 with SMTP id b57so1156341eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 14:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XjxQC6T17DTdq4yfH7xLLKbDJthnWbciQSQZgOcjJNM=;
	b=mMibdonybtEPD5t64f84xwdkF2Hyn5490HfraAOmGA4IOfAWKPMbE23T/k5STennVW
	FpbxNp0wT7lAWjb1TJtzgILZrz2Gegj7HBGemWy51ILb8cQG0du86feypgWX9FZgJEKa
	IIN41vnJS7APX/cqTOwSqNkNLqkgqPpaSpwOE+d50TNbEwuJEUclje394y9GoS38z9up
	l5MAEmaJyS4msqzueuPchmb5k3viYmnF3O9Tfwnsc47t7goPSSXFTs515JuYEu7+HnaP
	iMTJkq4faDejgXtEZgpROW6KbmkVFC46g37kyOOOa6vA+d1ZSMw1eNH6CwnC8zVaBAKe
	Kyrg==
Received: by 10.14.211.3 with SMTP id v3mr12713294eeo.43.1346448704061; Fri,
	31 Aug 2012 14:31:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 31 Aug 2012 14:31:13 -0700 (PDT)
In-Reply-To: <CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
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
	<CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2012 14:31:13 -0700
Message-ID: <CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
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
X-List-Received-Date: Fri, 31 Aug 2012 21:44:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 31, 2012 at 9:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 31, 2012 at 9:01 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> I don't think dropping support for / and ${prefix} makes sense as long
>> as it doesn't excessively hurt us
>
> we already have, done special things to support it look how many
> libraries appear in /lib now a days despite their original build
> system wanting it in /usr and I still get atleast 50 warnings on it
> wanting more in /lib and I am sure someone will send patches
> for it because they hate the warning and then we will have this
> growing pile of patches
> to maintain. So IMO it has already started to hurt us.

just to quantify it. I have 11 warnings reported about it.

WARNING: QA Issue: .... installed in the base_prefix, requires a
shared library under exec_prefix (/usr)

this is very custom image but very much similar to core-image-minimal
now if I fix this 11 warnings. For the sake of it I fixed these 11 warnings
by hacking patches for packages or recipes to move these files into
base_prefix and it now gives me 16 more warnings about same but
different files it wants to bring along into base_prefix

its quite slimy :/


