Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVZV7-0002NE-B9
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 03:02:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAU1te2p014119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 17:55:40 -0800 (PST)
Received: from [128.224.162.191] (128.224.162.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 29 Nov 2011 17:55:40 -0800
Message-ID: <4ED58D1D.6060903@windriver.com>
Date: Wed, 30 Nov 2011 09:55:41 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1322554339.git.wenzong.fan@windriver.com>	<ba86babf9425bb34f62c879e2c44febf7308a543.1322554339.git.wenzong.fan@windriver.com>	<CAEsOVNcZYhLayMYXcwm8fYFpqJ=dVTfbyDjvM+Ox_qqVOmEn_w@mail.gmail.com>
	<1322589860.7964.7.camel@ted>
In-Reply-To: <1322589860.7964.7.camel@ted>
Subject: Re: [PATCH 2/5] m4: Add m4-nativesdk recipes
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
X-List-Received-Date: Wed, 30 Nov 2011 02:02:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2011 02:04 AM, Richard Purdie wrote:
> On Tue, 2011-11-29 at 17:48 +0000, McClintock Matthew-B29882 wrote:
>    
>> On Tue, Nov 29, 2011 at 2:38 AM,<wenzong.fan@windriver.com>  wrote:
>>      
>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>
>>> [YOCTO #1603]
>>>
>>> m4-nativesdk is required by autoconf-nativesdk.
>>>        
>> Is there a reason we don't just extend the m4 recipe for native and
>> nativesdk? (I'm just curious)
>>      
> Its a good question, BBCLASSEXTEND = "nativesdk" should really work and
> those recipes look wrong (they shouldn't need to set
> INHIBIT_AUTOTOOLS_DEPS = "1" or have the custom do_configure).
>    

Ah, this works. I'll extend the m4 recipe to support 'nativesdk'
> The m4-native recipe is a little tricker as its one of the early
> bootstrap dependencies required by autotools. This is why it does need
> the INHIBIT_AUTOTOOLS_DEPS and custom do_configure line although those
> should be possible with modern BBCLASSEXTEND...
>
>    

Thanks for let me know the story, this really confused me when I 
deciding copy/extend for the m4-nativesdk.

Wenzong
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>    



