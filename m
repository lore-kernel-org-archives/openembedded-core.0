Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Rk64l-0001SV-Q3
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 04:39:12 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q093VeHE011888
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Jan 2012 19:31:40 -0800 (PST)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Sun, 8 Jan 2012 19:31:40 -0800
Message-ID: <4F0A5F9A.9050408@windriver.com>
Date: Mon, 9 Jan 2012 11:31:38 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: <philb@gnu.org>
References: <cover.1325837822.git.wenzong.fan@windriver.com>	<b63c8a5a0cf70a797fd49844b7854151a58f579e.1325837822.git.wenzong.fan@windriver.com>
	<1325871597.12160.13.camel@phil-desktop>
In-Reply-To: <1325871597.12160.13.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] archive.bbclass: archive work directoryDistribution
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
X-List-Received-Date: Mon, 09 Jan 2012 03:39:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2012 01:39 AM, Phil Blundell wrote:
> On Fri, 2012-01-06 at 16:20 +0800, wenzong.fan@windriver.com wrote:
>    
>> +    if [[ -d ${S}&&  ${S} != ${WORKDIR} ]]; then
>> +        if [[ ${S} =~ "/work-shared/gcc" ]]; then
>> +            # Create temporary sources directory for gcc
>> +            mkdir -p ${PF}/temp
>> +            cp -r ${S} ${PF}
>> +            cp -r ${S}/../temp/* ${PF}/temp
>> +            cp -r ${WORKDIR}/temp/* ${PF}/temp
>> +            tarbase=`pwd`
>>      
> Special-casing gcc like this seems a bit lame.  Is that check really
> needed?
>    

Oh, we might have other packages under this dir, so I'll remove the 
special-casing 'gcc' here.
> Also, will the above code work with all shells?  It looks a bit
> bash-specific to me.
>    
I assume that the bitbake have to run with 'bash', looks like this is 
not right on all distributions.

I'll update this.

Thanks
Wenzong

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>    



