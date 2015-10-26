Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1F216013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 19:18:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9QJIDWJ003881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Oct 2015 12:18:13 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 12:18:13 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1445873454-108723-1-git-send-email-mark.hatle@windriver.com>
	<1445873454-108723-2-git-send-email-mark.hatle@windriver.com>
	<20151026181521.GF2554@jama>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <562E7C74.5090105@windriver.com>
Date: Mon, 26 Oct 2015 14:18:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151026181521.GF2554@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [jethro/master][PATCH 1/1] local.conf.sample: Disable image-prelink by default
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
X-List-Received-Date: Mon, 26 Oct 2015 19:18:21 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/26/15 1:15 PM, Martin Jansa wrote:
> On Mon, Oct 26, 2015 at 10:30:54AM -0500, Mark Hatle wrote:
>> Due to problems with the prelinker itself, we need to disable the
>> image-prelink by default.  This will hopefully be re-enabled in the near
>> future.
> 
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> We had to disable it in our builds back in Dylan days.

FYI this is working just fine in Dizzy.  I've heard reports it works in Fido.
This is the first that I know it's universally broken.  (It's possible there
were some issues in Fido, as I have not verified it either way.. but Dizzy
definitely works and passes expected testings.)

--Mark

> Regards,
> 
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/conf/local.conf.sample | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>> index 3ae24ab..9d1480e 100644
>> --- a/meta/conf/local.conf.sample
>> +++ b/meta/conf/local.conf.sample
>> @@ -128,7 +128,9 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>>  #   - 'image-swab' to perform host system intrusion detection
>>  # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>>  # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>> -USER_CLASSES ?= "buildstats image-mklibs image-prelink"
>> +# NOTE: image-prelink is currently broken due to problems with the prelinker.  It is advised
>> +# that you do NOT run the prelinker at this time. 
>> +USER_CLASSES ?= "buildstats image-mklibs"
>>  
>>  
>>  #
>> -- 
>> 1.9.3
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


