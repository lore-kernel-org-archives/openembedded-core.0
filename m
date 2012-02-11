Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RwFkM-0007ou-Bt
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 17:24:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E6FB63158935
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 17:16:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id VK8RgFChIAqS
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 17:16:09 +0100 (CET)
Received: from [172.22.22.61] (drms-590cf567.pool.mediaWays.net
	[89.12.245.103])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 00B983158B33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 17:16:08 +0100 (CET)
Message-ID: <4F369448.2070900@opendreambox.org>
Date: Sat, 11 Feb 2012 17:16:08 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F35945D.7020900@opendreambox.org>
	<20120211020917.GF2095@sakrah.homelinux.org>
In-Reply-To: <20120211020917.GF2095@sakrah.homelinux.org>
Subject: Re: [PATCH] consolekit: depend on libx11
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
X-List-Received-Date: Sat, 11 Feb 2012 16:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11.02.2012 03:09, Khem Raj wrote:
> On (10/02/12 23:04), Andreas Oberritter wrote:
>> * Fixes the following error at configure time:
>>
>> |checking for TOOLS... no
>> |configure: error: Package requirements (x11 >= 1.0.0
>> |  glib-2.0 >= 2.14
>> |) were not met:
>> |
>> |No package 'x11' found
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> * Note that I didn't build test this, because I'm building
>>   without x11. I just looked up the package of x11.pc, which
>>   at least in Ubuntu is libx11.
>>
>>  .../recipes-support/consolekit/consolekit_0.4.5.bb |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> index 3ded6df..3a4b04f 100644
>> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>> @@ -13,7 +13,7 @@ POLKIT_libc-uclibc = ""
>>  POLKITCONF = ""
>>  POLKITCONF_libc-uclibc = "--disable-policykit"
>>  
>> -DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>> +DEPENDS = "glib-2.0 dbus ${POLKIT} ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} virtual/libx11"
> 
> should this depend on if x11 is in DISTRO_FEATURES ?

If it was conditional, someone would have to fix consolekit first in
order to make it build without x11. This would be no problem for someone
interested in it, but it can still be done later.

>>  RDEPENDS_${PN} += "base-files"
>>  
>>  inherit gnome
>> -- 
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 



