Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Tvn6K-0003b8-Pg
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 11:54:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0HAcGGu018099
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2013 02:38:16 -0800 (PST)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 17 Jan 2013 02:38:16 -0800
Message-ID: <50F7D496.3060601@windriver.com>
Date: Thu, 17 Jan 2013 18:38:14 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<0392b32826d8e307a1e2d2af187979f453279001.1358406049.git.hongxu.jia@windriver.com>
	<CAJTo0La=D3TTZBkEytV3WoYHYFZOX8Ubs3C_rGfhdMHjj6NDzg@mail.gmail.com>
In-Reply-To: <CAJTo0La=D3TTZBkEytV3WoYHYFZOX8Ubs3C_rGfhdMHjj6NDzg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-immodules-cache.bbclass:fix support postrm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 10:54:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2013 05:52 PM, Burton, Ross wrote:
> On 17 January 2013 07:07, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Let gtk_immodule_cache_postrm exit with ok at image creation time
>>
>> [YOCTO #3633]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/gtk-immodules-cache.bbclass |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
>> index 9ffb03b..6e1f5ef 100644
>> --- a/meta/classes/gtk-immodules-cache.bbclass
>> +++ b/meta/classes/gtk-immodules-cache.bbclass
>> @@ -31,7 +31,7 @@ fi
>>
>>   gtk_immodule_cache_postrm() {
>>   if [ "x$D" != "x" ]; then
>> -    exit 1
>> +    exit 0
>>   fi
>>   if [ ! -z `which gtk-query-immodules-2.0` ]; then
>>       gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> Surely you still want to run the postrm, and by exiting with 0 you're
> not deferring it.  Can't this use the same logic as the postinst to
> run on both build machine and target?
>
> Ross
No problem, I will use the same logic as the postinst to do that.

Thanks,
Hongxu


