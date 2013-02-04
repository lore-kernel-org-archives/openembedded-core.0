Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1U2CQF-0008Bf-Tf
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 04:08:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r142qo54005167
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Feb 2013 18:52:50 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sun, 3 Feb 2013 18:52:49 -0800
Message-ID: <510F2282.6020702@windriver.com>
Date: Mon, 4 Feb 2013 10:52:50 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <3826> <1359701137-15892-1-git-send-email-yanjun.zhu@windriver.com>
	<510C15B1.3050103@linux.intel.com>
In-Reply-To: <510C15B1.3050103@linux.intel.com>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio_2.1: when do_compile, pulseaudio needs fftw3.h header file. In order to provide fftw3.h, the dependence of fftw is added.
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
X-List-Received-Date: Mon, 04 Feb 2013 03:08:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/02/2013 03:21 AM, Saul Wold wrote:
> On 01/31/2013 10:45 PM, yanjun.zhu wrote:
>> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>>
>> Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
>> ---
>>   meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb 
>> b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
>> index a576368..5110cca 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
>> @@ -1,8 +1,8 @@
>>   require pulseaudio.inc
>>
>> -PR = "r15"
>> +PR = "r16"
>>
>> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>> +DEPENDS += "libjson gdbm speex libxml-parser-perl-native fftw"
>>
> This looks like a possibly host contamination issue, since oe-core 
> itself does not provide fftw, you could instead add --without-fftw.
>
> This will ensure that fftw is not picked up from the host.
>
> Thanks
>     Sau!
>
OK. I will follow your advice and make a test.

Thanks a lot.
Zhu Yanjun
>>   inherit gettext perlnative
>>
>>
>
>



