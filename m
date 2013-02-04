Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2UD7-0002TK-Di
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 23:08:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Feb 2013 13:52:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="286498491"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2013 13:52:30 -0800
Message-ID: <51102D9E.1000305@linux.intel.com>
Date: Mon, 04 Feb 2013 13:52:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Iorga, Cristian" <cristian.iorga@intel.com>, 
	Lei Yang <yanglei.fage@gmail.com>
References: <1359731346-16190-1-git-send-email-cristian.iorga@intel.com>
	<258C02DC-9331-432A-93B2-4173DA69968D@gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161F3065@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB161F3065@IRSMSX102.ger.corp.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] net-tools: upgrade to v1.60-24.2
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
X-List-Received-Date: Mon, 04 Feb 2013 22:08:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2013 01:10 AM, Iorga, Cristian wrote:
> See my answers below.
>
> -----Original Message-----
> From: Lei Yang [mailto:yanglei.fage@gmail.com]
> Sent: Sunday, February 03, 2013 4:15 AM
> To: Iorga, Cristian
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2
>
>
>
> Sent from my iPhone
>
> On 2013-2-1, at 23:09, Cristian Iorga <cristian.iorga@intel.com> wrote:
>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> ---
>> .../net-tools-config.h                                           |    0
>> .../net-tools-config.make                                        |    0
>> .../net-tools/{net-tools_1.60-23.bb => net-tools_1.60-24.2.bb}   |    6 +++---
>> 3 files changed, 3 insertions(+), 3 deletions(-) rename
>> meta/recipes-extended/net-tools/{net-tools-1.60-23 =>
>> net-tools-1.60-24.2}/net-tools-config.h (100%) rename
>> meta/recipes-extended/net-tools/{net-tools-1.60-23 =>
>> net-tools-1.60-24.2}/net-tools-config.make (100%) rename
>> meta/recipes-extended/net-tools/{net-tools_1.60-23.bb =>
>> net-tools_1.60-24.2.bb} (94%)
>>
>> diff --git
>> a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
>> b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config
>> .h
>> similarity index 100%
>> rename from
>> meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
>> rename to
>> meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.h
>> diff --git
>> a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.m
>> ake
>> b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config
>> .make
>> similarity index 100%
>> rename from
>> meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.mak
>> e rename to
>> meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.m
>> ake diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>> b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
>> similarity index 94%
>> rename from meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>> rename to meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
>> index bc61d21..4040e1a 100644
>> --- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb
>> @@ -5,7 +5,7 @@ BUGTRACKER = "http://bugs.debian.org/net-tools"
>> LICENSE = "GPLv2+"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>>                      file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
>> -PR = "r3"
>> +PR = "r0"
>>
>
> Is there a reason to change it back to r0
> Yes, because an upgrade has been done.
>
>
> Lei
>
>> SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
>>
>> ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=p
>> atch \
>
> Not sure why it not apply but not remove it.
> Sorry, I don't understand your comment.
> This package is distributed as a "base" tarball + patches to higher versions.
> Hence, I don't understand your comment.
>
Cristian:

A couple of questions that further need answering:

It seems that 1.60-24.2 is a testing/unstable version. Although it also 
seems that whezzy and Sid are running with this version.

Lei:

If you look at the full recipe, you will see that net-tools has it's own 
do_patch to deal with the downloaded version diff patch, therefore not 
applying during normal patching is correct.

In this case as Cristian points out, the .diff.gz is the "update"

Sau!


>
> Lei
>
>> @@ -17,8 +17,8 @@ S = "${WORKDIR}/net-tools-1.60"
>> SRC_URI[tarball.md5sum] = "ecaf37acb5b5daff4bdda77785fd916d"
>> SRC_URI[tarball.sha256sum] = "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc9aa3095d5c591f302c2de0f5"
>>
>> -SRC_URI[patch.md5sum] = "2412e55c20308d5fbd28bfadd18c075f"
>> -SRC_URI[patch.sha256sum] = "d678b3ea97d6c7ca548918994642bfc6b5511ab02f3a5881dfcca00c88bfd73b"
>> +SRC_URI[patch.md5sum] = "524658bb8df5ff92c4a991f5edcaf240"
>> +SRC_URI[patch.sha256sum] = "170cc024fcb34329f4c25fd88b5f160a06be5d6d3eaf0bc976650fd1b1a6235d"
>>
>> inherit gettext
>>
>> --
>> 1.7.10.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


