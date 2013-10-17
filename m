Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3F176D041
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 01:20:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H1Kb7m018836
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2013 18:20:38 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 16 Oct 2013 18:20:37 -0700
Message-ID: <525F3B62.3080305@windriver.com>
Date: Thu, 17 Oct 2013 09:20:34 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1381917496-28055-1-git-send-email-ming.liu@windriver.com>
	<1381917496-28055-2-git-send-email-ming.liu@windriver.com>
	<525EDBEF.6060108@linux.intel.com>
In-Reply-To: <525EDBEF.6060108@linux.intel.com>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] screen: add pkg_postinst to register entry to /etc/shells
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
X-List-Received-Date: Thu, 17 Oct 2013 01:20:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2013 02:33 AM, Saul Wold wrote:
> On 10/16/2013 02:58 AM, Ming Liu wrote:
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-extended/screen/screen_4.0.3.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb 
>> b/meta/recipes-extended/screen/screen_4.0.3.bb
>> index 1a7eb20..456f970 100644
>> --- a/meta/recipes-extended/screen/screen_4.0.3.bb
>> +++ b/meta/recipes-extended/screen/screen_4.0.3.bb
>> @@ -41,3 +41,8 @@ do_install_append () {
>>           fi
>>       done
>>   }
>> +
>> +pkg_postinst_${PN} () {
>> +        touch $D${sysconfdir}/shells
>> +        grep -q "usr/bin/screen" $D${sysconfdir}/shells || echo 
>> /usr/bin/screen >> $D${sysconfdir}/shells
>> +}
>>
> should you be using ${bindir} here instead of usr/bin? since it's 
> possible to have different ${prefix}.

Yes, you are correct, I will send the V1.

//Ming
>
> Sau!
>
>
>


