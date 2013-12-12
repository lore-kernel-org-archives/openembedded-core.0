Return-Path: <sakoman@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4C66C6CEEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 23:43:45 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id gq1so1230261obb.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 15:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Aeec0eNCiaaycuIAi5dT06kDvq3MwaP0tzbFghSaUdM=;
	b=XtntOlzXKXeXZt/kHV/HEKHx1oTD4PUFRHV3xeLAadEryzvPaffx6kH5jEwdUf/twz
	rkzbS6jUFP79ToaEb6I0+1ThuL310K0xqrhT7OFnWiA0AG/NUFpzR2Y3mb4vXsyxa2JF
	xlk8uVKrXmP2cfAUxGbhJSZc9ZPc5uiCvoMkKZCIDYEhjmY07FKUIdmcMTQnT874MRL8
	yZA2ihtYFgiKPHuQnrR1Z63cnsoo1QOuiKdpn1bj5VqrdnFR58boPZnWVGpgAzaRNpnf
	gTqOSUk0eKDHTkeChx2rnx/xS5eAUcP6Uxe3LGOBiupk/gzBa1rRkzfFlJnKcDM96wqM
	bS/g==
MIME-Version: 1.0
X-Received: by 10.60.84.138 with SMTP id z10mr7568783oey.4.1386891824936; Thu,
	12 Dec 2013 15:43:44 -0800 (PST)
Received: by 10.182.120.201 with HTTP; Thu, 12 Dec 2013 15:43:44 -0800 (PST)
In-Reply-To: <1386891243.504.47.camel@ted>
References: <cover.1386752561.git.liezhi.yang@windriver.com>
	<1386771992.4332.76.camel@ted> <1386772701.4332.80.camel@ted>
	<52A95C72.3030605@windriver.com> <1386891243.504.47.camel@ted>
Date: Thu, 12 Dec 2013 15:43:44 -0800
Message-ID: <CAGDS+nnZqEr2Cjm_=ySjy7B7AWzE+8CmCNWGpyybdZfgK6EV4w@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Thu, 12 Dec 2013 23:43:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

For those of us who use wifi with connman, this patch would be nice to
include too since wifi is broken without it:

wpa-supplicant: enable CONFIG_CTRL_IFACE_DBUS_NEW

I submitted it in early November.

Steve



On Thu, Dec 12, 2013 at 3:34 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2013-12-12 at 14:49 +0800, Robert Yang wrote:
>> > That leaves the following we need to investigate:
>> >
>> > + 20c0a87c19cf51bcd849fb4de91421cae0f97ae4 mdadm: Disable the RUN_DIR check
>>
>>  From OE-Core master rev: d62882794890eeee8e8d5c9ba4837ec77a58d787
>>
>> > + cc225f0e74865623714461cd38bec3b6557c6df7 mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for powerpc64
>>
>>  From OE-Core master rev: d3caab6eb03264b4f4d744f914598022299011ba
>>
>> > + d912ce035beb0da28d83719920a2cebfda8b3073 ethtool: Fix ptest compile
>>
>>  From OE-Core master rev: 5dd8653fdcda5e0e8b4f3c37a46f357bc97ec66c
>
> Thanks, these are all fine.
>
>> > + 1cff575511f32935a69ec1c9ef966311ad409e2f gdb-7.6: fix cygwin check in configure script
>>
>> This one is sent by Steffen, for dora only.
>
> I took a closer look at this. Whilst the version of gdb in master is
> different, the issue still exists. I've ported the patch to master and
> merged it there. We can now backport it.
>
> Please don't take anything into dora until we have something equivalent
> in master.
>
>> > + 5a13d607954fb2099a82c5f1f4135be6cb6ca4d3 dpkg: Fix a build error for dpkg-native on CentOS 5.8.
>> > + c37ab9c220b8f1d2045b1aaf9cd03c1f9a899390 dpkg: Fix a link problem for dpkg-native on CentOS 5.8.
>>
>> They are sent by Mark for dora only.
>
> These were sent as an RFC for compliance purposes. They're not in
> master, they can't go into dora. I've dropped these.
>
> Other than the patches I've mentioned, things should be merged in the
> dora branch. We've found some build issues. I've pushed a fix for the
> qt3 one, we also have one with lttng-modules which we don't have a fix
> for yet.
>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

