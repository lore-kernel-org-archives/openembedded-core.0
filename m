Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD5E66007C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 18:00:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r68I0PNu012226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2013 11:00:25 -0700 (PDT)
Received: from [128.224.23.67] (128.224.23.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 11:00:24 -0700
Message-ID: <51DAFE34.3080505@windriver.com>
Date: Mon, 8 Jul 2013 14:00:20 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130706122934.GC3288@jama>
	<1373145886-26565-1-git-send-email-Martin.Jansa@gmail.com>
	<20130706213931.GD3288@jama>
In-Reply-To: <20130706213931.GD3288@jama>
X-Originating-IP: [128.224.23.67]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Mon, 08 Jul 2013 18:00:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-07-06 05:39 PM, Martin Jansa wrote:
> On Sat, Jul 06, 2013 at 11:24:46PM +0200, Martin Jansa wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   scripts/test-dependencies.sh | 250 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 250 insertions(+)
>>   create mode 100755 scripts/test-dependencies.sh
>>
>> +build_all() {
>> +  echo "===== 1st build to populate sstate-cache directory and sysroot ====="
>> +  OUTPUT1=${OUTPUT_BASE}/${TYPE}_all
>> +  mkdir -p ${OUTPUT1}
>> +  echo "Logs will be stored in ${OUTPUT1} directory"
>> +  bitbake $targets | tee -a ${OUTPUT1}/complete.log
>> +}
>
> I've just added "-k" here to bitbake call, more improvements are expected,
> that's why it's only RFC, but I wanted to share it soon in case someone
> else also have access to some builder which is idle during weekends..
>
> It would be nice to test and fix oe-core recipes first, but because my
> target is to run this in dylan I'm running this with more layers
> included already.

Martin,

Such a per-recipe dependency test has been on our to do list!
Once your script is in master, we can run it at least once a week.

// Randy

>
> I'm sending patches for master + blacklisting broken recipes in dylan,
> maybe we should backport them later as missing deps and autodetected
> deps are relatively safe fixes.
>
> Regards,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

