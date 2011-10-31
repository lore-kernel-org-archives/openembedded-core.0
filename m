Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RKvTO-00019o-LF
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:16:34 +0100
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 31 Oct 2011 10:10:26 -0700
Received: by wye20 with SMTP id 20so1086749wye.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:10:25 -0700 (PDT)
Received: by 10.216.89.139 with SMTP id c11mr4879004wef.37.1320081024501;
	Mon, 31 Oct 2011 10:10:24 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ff6sm33561465wbb.10.2011.10.31.10.10.22
	(version=SSLv3 cipher=OTHER); Mon, 31 Oct 2011 10:10:23 -0700 (PDT)
Message-ID: <4EAED67C.2020108@intel.com>
Date: Mon, 31 Oct 2011 10:10:20 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319510805.git.wenzong.fan@windriver.com>
	<1848a21e3972096a5169697c16abf2dd9edd17ba.1319510805.git.wenzong.fan@windriver.com>
	<4EAED524.50306@intel.com>
	<406DBB9E-C6C4-4CAC-9A6B-6C796C5ACBA6@dominion.thruhere.net>
In-Reply-To: <406DBB9E-C6C4-4CAC-9A6B-6C796C5ACBA6@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Mon, 31 Oct 2011 17:16:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2011 10:06 AM, Koen Kooi wrote:
>
> Op 31 okt. 2011, om 18:04 heeft Saul Wold het volgende geschreven:
>
>> On 10/24/2011 07:49 PM, wenzong.fan@windriver.com wrote:
>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>
>>> Update packages tracking fields including ccache, chkconfig.
>>>
>>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>>> ---
>>>   .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
>>>   1 files changed, 12 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
>>> index 1f3540e..f053f87 100644
>>> --- a/meta/conf/distro/include/distro_tracking_fields.inc
>>> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
>>> @@ -5976,6 +5976,18 @@ RECIPE_MANUAL_CHECK_DATE_pn-libsdl = "Jul 28, 2011"
>>>   RECIPE_MAINTAINER_pn-libsdl = "Kai Kang<kai.kang@windriver.com>"
>>>   DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
>>>
>>> +RECIPE_STATUS_pn-ccache = "green"
>>> +RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan<wenzong.fan@windriver.com>"
>>> +RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
>>> +RECIPE_LAST_UPDATE_pn-ccache = "October 19, 2011"
>>> +RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 25, 2011"
>>> +
>> This should be MMM (as in Oct), not spelled out, please fix.
>>
>> (Koen: Yes I saw your email about the date, not address that at this time as we are re-thinking the whole distro_tracking_fields.inc file).
>
> When the month is spelled out ordering becomes less of an issue.
>
That's kind of why we chose this, we are still parsing this file, so 
spelling can be an issue sometimes, which is why we want the MMM format.

Sau!

> regards,
>
> Koen
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



