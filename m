Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RHIkw-0002Xe-Or
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 19:19:42 +0200
Received: from mail-qw0-f52.google.com ([209.85.216.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Oct 2011 10:13:47 -0700
Received: by qaea17 with SMTP id a17so6672318qae.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 10:13:47 -0700 (PDT)
Received: by 10.68.33.164 with SMTP id s4mr10051702pbi.72.1319217226511;
	Fri, 21 Oct 2011 10:13:46 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ml4sm32365509pbc.0.2011.10.21.10.13.45
	(version=SSLv3 cipher=OTHER); Fri, 21 Oct 2011 10:13:45 -0700 (PDT)
Message-ID: <4EA1A848.8050105@intel.com>
Date: Fri, 21 Oct 2011 10:13:44 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
	<CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
	<20111021161620.GS3522@jama.jama.net>
In-Reply-To: <20111021161620.GS3522@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 17:19:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2011 09:16 AM, Martin Jansa wrote:
> On Fri, Oct 21, 2011 at 08:40:20AM -0700, Khem Raj wrote:
>> On Fri, Oct 21, 2011 at 1:17 AM, Martin Jansa<martin.jansa@gmail.com>  wrote:
>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>> ---
>>>   .../pulseaudio/pulseaudio_0.9.23.bb                |    1 +
>>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>>> index 4ac2418..2f872b8 100644
>>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>>> @@ -23,3 +23,4 @@ do_compile_prepend() {
>>>      cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
>>>   }
>>>
>>> +ARM_INSTRUCTION_SET = "arm"
>>
>> not averse to patch but it would be nice to know what fails in thumb mode.
>
> selected processor does not support Thumb mode `swp r1,r2,[r3]'
>

As already asked, can you upgrade to 1.1 and verify if this problem 
still exists.  Also if it does, it would be good to have this info in 
the commit message.

Thanks
	Sau!


> Regards,
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



