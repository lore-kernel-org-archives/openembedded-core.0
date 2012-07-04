Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SmQ8t-0002pT-0n
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 16:01:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id CADD8315D847;
	Wed,  4 Jul 2012 15:50:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id rb6V+FsM1LVk; Wed,  4 Jul 2012 15:50:02 +0200 (CEST)
Received: from [172.22.22.61] (ip-88-153-5-144.unitymediagroup.de
	[88.153.5.144])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8364B315D844;
	Wed,  4 Jul 2012 15:50:02 +0200 (CEST)
Message-ID: <4FF44A09.6040603@opendreambox.org>
Date: Wed, 04 Jul 2012 15:50:01 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1335478762-14532-1-git-send-email-obi@opendreambox.org>
	<1772332.Hc46G99qAB@helios>
In-Reply-To: <1772332.Hc46G99qAB@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-collateral: import fixes from OE-Classic
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
X-List-Received-Date: Wed, 04 Jul 2012 14:01:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03.07.2012 22:14, Paul Eggleton wrote:
> On Friday 27 April 2012 00:19:22 Andreas Oberritter wrote:
>> * Set lists_dir to /var/lib/opkg
>>
>>   commit 16808bc4817492beba512f4e73bce8c232d1eafa
>>   Author: Marcin Juszkiewicz <hrw@openembedded.org>
>>   Date:   Mon Mar 17 23:40:48 2008 +0000
>>
>> * Update new options sample and move the opkg.conf to correct place
>>
>>   commit cc9825d97962287df75e164aec456901292e1b7f
>>   Author: Tick Chen <ticktock35@gmail.com>
>>   Date:   Mon Dec 29 19:41:47 2008 +0800
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  meta/recipes-devtools/opkg/opkg-collateral.bb      |    8 +++++---
>>  meta/recipes-devtools/opkg/opkg-collateral/lists   |    2 +-
>>  .../opkg/opkg-collateral/opkg.conf.comments        |    3 +++
>>  3 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb
>> b/meta/recipes-devtools/opkg/opkg-collateral.bb index e3e0b5f..251c535
>> 100644
>> --- a/meta/recipes-devtools/opkg/opkg-collateral.bb
>> +++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
>> @@ -2,6 +2,8 @@ DESCRIPTION = "opkg configuration files"
>>  SECTION = "base"
>>  LICENSE = "MIT"
>>  LIC_FILES_CHKSUM =
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +PR = "r1"
>> +
>>  SRC_URI = "file://opkg.conf.comments \
>>  	   file://lists \
>>  	   file://dest \
>> @@ -15,8 +17,8 @@ do_compile () {
>>  }
>>
>>  do_install () {
>> -	install -d ${D}${sysconfdir}/
>> -	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg.conf
>> +	install -d ${D}${sysconfdir}/opkg
>> +	install -m 0644 ${WORKDIR}/opkg.conf ${D}${sysconfdir}/opkg/opkg.conf
>>  }
>>
>> -CONFFILES_${PN} = "${sysconfdir}/opkg.conf"
>> +CONFFILES_${PN} = "${sysconfdir}/opkg/opkg.conf"
>> diff --git a/meta/recipes-devtools/opkg/opkg-collateral/lists
>> b/meta/recipes-devtools/opkg/opkg-collateral/lists index 3c524f8..f8aecd8
>> 100644
>> --- a/meta/recipes-devtools/opkg/opkg-collateral/lists
>> +++ b/meta/recipes-devtools/opkg/opkg-collateral/lists
>> @@ -1,2 +1,2 @@
>> -lists_dir ext /var/lib/ipkg
>> +lists_dir ext /var/lib/opkg
> 
> Unfortunately, it seems this change has caused bug 2595 - moving the config file 
> to /etc/opkg means that it is always read regardless of whether -f is specified 
> or not (as it is during do_rootfs in order to specify our own generated config 
> file), and this means that after opkg-collateral is installed into the rootfs, 
> this version of the config is used, resulting in opkg ignoring the lists it has 
> already downloaded (since it now sees list_dir as var/lib/opkg instead of 
> var/lib/opkg/lists) and thus it fails to install any of the "attemptonly" 
> packages (including *-dev, *-dbg, etc.).

Would it be possible to download the lists to var/lib/opkg instead, if
that's the only difference? I'm not familiar with the use of
opkg-collateral during the creation of the rootfs.

> The question is, should opkg be fixed to not load anything from etc/opkg/ when 
> -f is specified?

I think this would work only if other files than opkg.conf in etc/opkg/
aren't needed, which I guess is not the case.

Maybe a new option to specify a config directory instead of a file would
be more straightforward to implement, if opkg always loads
$configdir/*.conf (i.e. there's no special handling for a file named
"opkg.conf", AFAIR). You could then copy etc/opkg to a temporary
location and overwrite opkg.conf.

Regards,
Andreas


