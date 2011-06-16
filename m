Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QXLnY-0003cA-3h
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 01:16:28 +0200
Received: by pvc30 with SMTP id 30so34028pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=I/nwOWnTTCaXF9kDFK0+ul/smR3JWboWrTqdQo6rIKA=;
	b=GNLl0qS/wH18Hwr/bLdYsph+9n2FX2dSMZE2NL/v2aKfJ2kFmr72dDhAujbEj/497W
	TffH+B9bJdgNKxYyT3MUqC7YQczvF2ssdq/3F/7W/5pumKdzaXUB7lfliqLRp7WSSexU
	QkunfWATAKAJ2hHJYDaoYIhk9JDIFgoSpPUpM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=o93vtJ39qaANvrdRLuRdEc8W4m3QNFq1aqC0Jg/XfpUiZZMHnX0utsufVj4HC9ibR6
	6cmtMadMe6jikTkIIzNfhSx4824kk3oK08mHaoJJfwpKduQmEKVXvlDQFbECNW20ahkq
	3Fx46Z7N8lIy+XBE5m923oqPOnjMpddUp8TY4=
Received: by 10.142.61.29 with SMTP id j29mr270652wfa.397.1308265978674;
	Thu, 16 Jun 2011 16:12:58 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id z39sm1386731wfd.23.2011.06.16.16.12.54
	(version=SSLv3 cipher=OTHER); Thu, 16 Jun 2011 16:12:54 -0700 (PDT)
Message-ID: <4DFA8DF5.90401@gmail.com>
Date: Thu, 16 Jun 2011 16:12:53 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308215406.git.dongxiao.xu@intel.com>	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>	<1308216925.25285.4101.camel@phil-desktop>	<4DFA08A2.3010504@gmail.com>
	<ED0EBCC5-D086-4F71-AC7A-F733111C4B6D@dominion.thruhere.net>
In-Reply-To: <ED0EBCC5-D086-4F71-AC7A-F733111C4B6D@dominion.thruhere.net>
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2011 23:16:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2011 07:00 AM, Koen Kooi wrote:
>
> Op 16 jun 2011, om 15:44 heeft Khem Raj het volgende geschreven:
>
>> On 6/16/2011 2:35 AM, Phil Blundell wrote:
>>> On Thu, 2011-06-16 at 17:20 +0800, Dongxiao Xu wrote:
>>>> Enable ofono plugin into sato image.
>>>
>>> [...]
>>>
>>>> --- a/meta/recipes-connectivity/connman/connman.inc
>>>> +++ b/meta/recipes-connectivity/connman/connman.inc
>>>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>>>                       file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
>>>>
>>>>   DEPENDS  = "libgdbus dbus glib-2.0 hal iptables"
>>>> -RDEPENDS_${PN} = "wpa-supplicant resolvconf"
>>>> +RDEPENDS_${PN} = "wpa-supplicant resolvconf ofono"
>>>
>>>> --- a/meta/recipes-connectivity/connman/connman_0.65.bb
>>>> +++ b/meta/recipes-connectivity/connman/connman_0.75.bb
>>>> @@ -16,14 +16,14 @@ EXTRA_OECONF += "\
>>>>     --disable-udev \
>>>>     --disable-polkit \
>>>>     --enable-client \
>>>> +  --enable-ofono \
>>>>     --prefix=/usr --sysconfdir=/etc --localstatedir=/var"
>>>
>>> These changes look like they will have a rather wider impact than just
>>> the sato image.  I'm not sufficiently au fait with connman to say
>>> whether this is a good thing or not (although my immediate reaction to
>>> adding extra RDEPENDS tends to be that it is not), but if they're going
>>> to be added globally then the checkin comment ought to reflect that and
>>> explain why it's being done.  Alternatively, you could do this in your
>>> distro layer and/or image recipes.
>>>
>>
>> I would say put ofono as a DISTRO_FEATURE
>
> You don't need to build ofono to have ofono support in connman. Angstrom (and hence meta-oe) build with it enabled by default to support people who want to use the plugin on their phones. Since it's a nicely seperated plugin,

even better

  DISTRO_FEATURE would be the wrong thing to do.

in such case DISTRO_FEATURE might be secondary choice yes

>
> That's why I keep saying "look at the connman recipe in meta-oe", that's being used by angstrom and SHR with good success.
>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



