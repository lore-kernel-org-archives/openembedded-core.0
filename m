Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBV7M-00044s-W3
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 19:18:53 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Oct 2011 10:10:49 -0700
Received: by wyh11 with SMTP id 11so1947088wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 10:10:47 -0700 (PDT)
Received: by 10.227.29.85 with SMTP id p21mr3476319wbc.84.1317834645847;
	Wed, 05 Oct 2011 10:10:45 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id s30sm3972910wbm.12.2011.10.05.10.10.43
	(version=SSLv3 cipher=OTHER); Wed, 05 Oct 2011 10:10:45 -0700 (PDT)
Message-ID: <4E8C8F91.1000203@intel.com>
Date: Wed, 05 Oct 2011 10:10:41 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com> <1317814555.14671.137.camel@ted>
	<CAEsOVNdOaSFzxMLo1MT-h9rKMQRwuOWTv+hzKCTV-qqub+q3qg@mail.gmail.com>
	<CAMKF1spCqBxZE=TyhremxN5NEC5fa9BuqJWYrCuTf4rk+bw4-Q@mail.gmail.com>
In-Reply-To: <CAMKF1spCqBxZE=TyhremxN5NEC5fa9BuqJWYrCuTf4rk+bw4-Q@mail.gmail.com>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 17:18:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2011 10:06 AM, Khem Raj wrote:
> On Wed, Oct 5, 2011 at 9:48 AM, McClintock Matthew-B29882
> <B29882@freescale.com>  wrote:
>> On Wed, Oct 5, 2011 at 6:35 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org>  wrote:
>>>> this is a gcc built-in define I wonder why you need to add it explicitly
>>>
>>> Are you sure? Is the built-in define not __powerpc64__ ?
>>
>> Further investigation:
>>
>> [mattsm@right build_p5020ds-64b_release (testing $)]$
>> ./tmp/sysroots/x86_64-linux/usr/bin/ppc64e5500-fsl-linux/powerpc64-fsl-linux-gcc
>> -c -E -dM empty.c | grep __p
>> #define __powerpc64__ 1
>> #define __powerpc__ 1
>> [mattsm@right build_p5020ds-64b_release (testing $)]$
>
> yes I was trying it with a differently configured gcc. For linux gcc
> defines __powerpc64__
> and for darwin it has __ppc64__ as builtin define.
>
> I think adding check for __powerpc64__ and __powerpc__
> would be nice and can be submitted to sysprof upstream IMO
>
I think this would be a good fix to have in the upstream sysprof and it 
would remove the CFLAGS_append from the recipe.

Sau!

>>
>> -M
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



