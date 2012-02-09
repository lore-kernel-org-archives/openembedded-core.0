Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RvcGm-0005nn-Mw
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 23:15:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Feb 2012 14:07:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="65007034"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Feb 2012 14:07:06 -0800
Message-ID: <4F344389.7060005@linux.intel.com>
Date: Thu, 09 Feb 2012 14:07:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120201151531.BE60410330@opal>
	<20120201153742.GA6969@jama.jama.net>
In-Reply-To: <20120201153742.GA6969@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe-commits] Saul Wold : opkg-utils: convert to git repo at git.yoctoproject.org
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
X-List-Received-Date: Thu, 09 Feb 2012 22:15:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2012 07:37 AM, Martin Jansa wrote:
> On Wed, Feb 01, 2012 at 03:15:31PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: b44717c29c4f50917570039adf896680d24bb216
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b44717c29c4f50917570039adf896680d24bb216
>>
>> Author: Saul Wold<sgw@linux.intel.com>
>> Date:   Tue Jan 31 10:27:53 2012 -0800
>>
>> opkg-utils: convert to git repo at git.yoctoproject.org
>>
>> The svn.openmoko.org site seems to have become unstable, make a copy
>> and convert to git at git.yoctoproject.org to preserve history
>>
>> [YOCTO #1867]
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>
>> ---
>>
>>   .../{opkg-utils_svn.bb =>  opkg-utils_git.bb}       |   10 +++++-----
>>   1 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> similarity index 82%
>> rename from meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
>> rename to meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> index 9702131..d2dfda6 100644
>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
>> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>> @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>                       file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
>>   RDEPENDS_${PN} = "python"
>>   RDEPENDS_${PN}_virtclass-native = ""
>> -SRCREV = "4747"
>> -PV = "0.1.8+svnr${SRCPV}"
>> -PR = "r7"
>> +SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
>> +PV = "0.1.8+git${SRCPV}"
>
> Should this be +git or +gitr?
>
I believe that ultimately it should be +git, but we can't just changes 
these as it will cause the PV to go backwards.  I would suggest that as 
we move forward and PV's get updated we can move to +git instead of 
+gitr for oe-core

I would suggest the same for meta-oe and as we migrate other recipes 
from OE-classic and update PV they get converted.

Sau!

> in OE-classic we have mostly +gitr, +git is used only without SRCPV:
> OE @ ~/oe $ git grep "+git\\$" | wc -l
> 22
> OE @ ~/oe $ git grep "+gitr\\$" | wc -l
> 368
>
> meta-oe has always +gitr:
> OE @ ~/meta-openembedded $ git grep "+gitr\\$" | wc -l
> 24
> OE @ ~/meta-openembedded $ git grep "+git\\$" | wc -l
> 0
>
> and oe-core has mostly +git:
> OE @ ~/openembedded-core $ git grep "+gitr\\$" | wc -l
> 9
> OE @ ~/openembedded-core $ git grep "+git\\$" | wc -l
> 78
>
> It's only cosmetics but we should use one format if possible.
>
> http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.html
> doesn't say anything about SRCPV (only SRCREV) so nothing about prefered
> +git(r).
>
> BTW: there are also 2 recipes not using SRCPV
> meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb:PV = "2.0.pre11+git${SRCREV}"
> meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb:PV = "v2.0.pre16+git${SRCREV}"
> 1 in meta-oe
> meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb:PV = "3.4.0-${PR}+gitr${SRCREV}"
>
> Cheers,
>
>> +PR = "r0"
>>
>> -SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
>> +SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=git \
>>              file://index-ignore-filenotfound.patch \
>>              file://mtime-int.patch \
>>              file://add-license-field.patch \
>> @@ -18,7 +18,7 @@ SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
>>              file://shebang.patch \
>>              "
>>
>> -S = "${WORKDIR}/opkg-utils"
>> +S = "${WORKDIR}/git"
>>
>>   # Avoid circular dependencies from package_ipk.bbclass
>>   PACKAGES_virtclass-native = ""
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


