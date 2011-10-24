Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RIDbv-0005RE-0Q
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 08:02:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9O5uCmt016712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Oct 2011 22:56:12 -0700 (PDT)
Received: from [128.224.162.191] (128.224.162.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 23 Oct 2011 22:56:12 -0700
Message-ID: <4EA4FE36.80307@windriver.com>
Date: Mon, 24 Oct 2011 13:57:10 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1319090166.git.wenzong.fan@windriver.com>
	<79447d2d8514eb75a5cda1a32d7b25d7fc66e50c.1319090166.git.wenzong.fan@windriver.com>
	<4E9FD119.4030307@intel.com>
In-Reply-To: <4E9FD119.4030307@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3 v2] distro_tracking_fields: update packages tracking fields
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
X-List-Received-Date: Mon, 24 Oct 2011 06:02:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2011 03:43 PM, Saul Wold wrote:
> On 10/19/2011 10:59 PM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>
>> Update packages tracking fields including ccache, chkconfig.
>>
>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>> ---
>>   .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
>>   1 files changed, 12 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/distro_tracking_fields.inc 
>> b/meta/conf/distro/include/distro_tracking_fields.inc
>> index abc2cbf..a7c2db5 100644
>> --- a/meta/conf/distro/include/distro_tracking_fields.inc
>> +++ b/meta/conf/distro/include/distro_tracking_fields.inc
>> @@ -5914,6 +5914,18 @@ RECIPE_LATEST_RELEASE_DATE_pn-gettext = "Jun 
>> 06, 2010"
>>   RECIPE_LAST_UPDATE_pn-gettext = "May 24, 2011"
>>   RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Sep 29, 2011"
>>
>> +RECIPE_STATUS_pn-ccache = "green"
>> +RECIPE_MAINTAINER_pn-ccache = "Wenzong Fan<wenzong.fan@windriver.com>"
>> +RECIPE_LATEST_VERSION_pn-ccache = "3.1.6"
>> +RECIPE_LAST_UPDATE_pn-ccache = "June 24, 2011"
> You just updated this package, so this should be today's date
> Do you mean theis to be RECIPE_LATEST_RELEASE_DATE of June?  Is that 
> when the 3.1.6 tarball was released?

Oh, sorry I misunderstand the '_LAST_', June is the last update time for 
previous version 3.1.5.

I'll fix that.

Thanks
Wenzong
>
>> +RECIPE_MANUAL_CHECK_DATE_pn-ccache = "October 11, 2011"
>> +
>> +RECIPE_STATUS_pn-chkconfig = "green"
>> +RECIPE_MAINTAINER_pn-chkconfig = "Wenzong 
>> Fan<wenzong.fan@windriver.com>"
>> +RECIPE_LATEST_VERSION_pn-chkconfig = "1.3.55"
>> +RECIPE_LAST_UPDATE_pn-chkconfig = "May 24, 2011"
> Same as above!
>
> Sau!
>> +RECIPE_MANUAL_CHECK_DATE_pn-chkconfig = "October 11, 2011"
>> +
>>   RECIPE_STATUS_pn-pseudo = "green"
>>   RECIPE_LATEST_VERSION_pn-pseudo = "1.1.1"
>>   RECIPE_LAST_UPDATE_pn-pseudo = "Jun 06, 2011"
>
>



