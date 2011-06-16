Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QXCv0-0005He-0U
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 15:47:34 +0200
Received: by pzk36 with SMTP id 36so1207409pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 06:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NfKuelRsOKY18TMgw8MM8gfFiCNYJ24Hg5U+v71m67c=;
	b=YE88+6N1dlogQV6w7wB117lZ9RoHssIx6lq9AZIjI76ITu+u0WigTwRQsVRvUJ1bUp
	PJlfPCOStGgj7NuLaAPbBBu8J/9s2rtzFTycDUj5Py2qQixMh9Rs24BmZgXsM+PaGMH/
	+mXfvbAHBl/Z4S0gtgW0JvkBD/IBRzskx3H5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=RNLkNy040Hn79R2fvYmbOeM5IQgETcwDfvJeor1BEzBmwbRDYmdW/BHdhoQX0TtiLt
	zLzr7VR1bnguvvSy+zrZaNxyEcgJ2g3JIMiggcK8EoFxUpPw6SF5s6KmzrizU8qhiCJn
	ydcGxqn80oFE/6UyH4Kh9J/OgdMwuaPZVMxeM=
Received: by 10.142.192.8 with SMTP id p8mr126719wff.322.1308231844378;
	Thu, 16 Jun 2011 06:44:04 -0700 (PDT)
Received: from [192.168.1.82] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n9sm1647556wfk.8.2011.06.16.06.44.02
	(version=SSLv3 cipher=OTHER); Thu, 16 Jun 2011 06:44:02 -0700 (PDT)
Message-ID: <4DFA08A2.3010504@gmail.com>
Date: Thu, 16 Jun 2011 06:44:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308215406.git.dongxiao.xu@intel.com>	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
	<1308216925.25285.4101.camel@phil-desktop>
In-Reply-To: <1308216925.25285.4101.camel@phil-desktop>
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
X-List-Received-Date: Thu, 16 Jun 2011 13:47:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/2011 2:35 AM, Phil Blundell wrote:
> On Thu, 2011-06-16 at 17:20 +0800, Dongxiao Xu wrote:
>> Enable ofono plugin into sato image.
>
> [...]
>
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>                       file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
>>
>>   DEPENDS  = "libgdbus dbus glib-2.0 hal iptables"
>> -RDEPENDS_${PN} = "wpa-supplicant resolvconf"
>> +RDEPENDS_${PN} = "wpa-supplicant resolvconf ofono"
>
>> --- a/meta/recipes-connectivity/connman/connman_0.65.bb
>> +++ b/meta/recipes-connectivity/connman/connman_0.75.bb
>> @@ -16,14 +16,14 @@ EXTRA_OECONF += "\
>>     --disable-udev \
>>     --disable-polkit \
>>     --enable-client \
>> +  --enable-ofono \
>>     --prefix=/usr --sysconfdir=/etc --localstatedir=/var"
>
> These changes look like they will have a rather wider impact than just
> the sato image.  I'm not sufficiently au fait with connman to say
> whether this is a good thing or not (although my immediate reaction to
> adding extra RDEPENDS tends to be that it is not), but if they're going
> to be added globally then the checkin comment ought to reflect that and
> explain why it's being done.  Alternatively, you could do this in your
> distro layer and/or image recipes.
>

I would say put ofono as a DISTRO_FEATURE

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



