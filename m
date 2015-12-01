Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC4E601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:30:11 +0000 (UTC)
Received: by igcto18 with SMTP id to18so2135005igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 01:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wS6iJ6n1T/w+HcSQv5Q2JUpY4rt3DSdt1SW3i4rwTso=;
	b=fvx5xbU+qjB4QQn99ksrvGyaK7kThBlFylbe+/vmLr0QH1hkhkEyRRBtujYyrkAawE
	8Bs0qGPcAmoycw02qFuO+k5NpvXuDv4GYG+/I//ITFa/zyZqTITpMED+wgveBv0AhH5I
	yZwnI/nri0XxGIbLvDfeBFlZTNRFgKmokOQ6o2dSuyF9WRn1UT10nT2WevZGVe89Izfo
	xkb0yMhH0naf/XirniJbld3HRhunQijR4NfbsQurHpLkjJ8DQp/CtZHumE/yDYVCm/lv
	azMozEdRhe9h+eFMHZNpB2Y8IvDkabtMurPw95ei1urEgyrQZEXNzQ8WUf7TndUMXzFf
	RpZg==
X-Received: by 10.50.143.10 with SMTP id sa10mr26940435igb.77.1448962212514;
	Tue, 01 Dec 2015 01:30:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 1 Dec 2015 01:29:43 -0800 (PST)
In-Reply-To: <20151201092706.GA15462@ad.chargestorm.se>
References: <1448885472-24350-1-git-send-email-maxin.john@intel.com>
	<20151201092706.GA15462@ad.chargestorm.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Dec 2015 01:29:43 -0800
Message-ID: <CAMKF1srkTNBtULap+gz=S=NXWbjd_6MbYsKHSYtY0ygXY7_9RQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] iproute2: enable previously unselected utilities
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
X-List-Received-Date: Tue, 01 Dec 2015 09:30:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 1, 2015 at 1:27 AM, Anders Darander <anders@chargestorm.se> wrote:
> Hi,
>
> Just a couple of questions.
>
> * Maxin B. John <maxin.john@intel.com> [151130 17:59]:
>> Include below listed utilities that are not yet enabled/packaged
>> in the iproute2 recipe:
>
>> lnstat
>> ifstat
>> genl
>> rtacct
>> nstat
>> ss
>
> When you enable those, how much does the size ofthe iproute2 package
> increase?
>
> Perhaps those extra tools should be placed in e.g. ${PN}-tools, or
> some package like that?

I think its better to package each one in separate package of its own.

>
> Cheers,
> Anders
>
>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> ---
>>  meta/recipes-connectivity/iproute2/iproute2.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
>> index 29f9062..abaff3f 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>> @@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native iptables elfutils"
>
>>  inherit update-alternatives
>
>> -EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>> +EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>
>>  do_configure_append () {
>>      sh configure ${STAGING_INCDIR}
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

