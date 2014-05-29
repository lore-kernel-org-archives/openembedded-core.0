Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7B76FCB7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 16:50:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 May 2014 09:50:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,935,1392192000"; d="scan'208";a="546842567"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 29 May 2014 09:50:20 -0700
Message-ID: <5387654C.5090309@linux.intel.com>
Date: Thu, 29 May 2014 09:50:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Diego Sueiro <diego.sueiro@gmail.com>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
	<53875026.60107@linux.intel.com>
	<CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
In-Reply-To: <CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 16:50:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/29/2014 09:36 AM, Diego Sueiro wrote:
> Hi Sau!,
>
> On Thu, May 29, 2014 at 12:20 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 05/29/2014 06:17 AM, Diego Sueiro wrote:
>>
>>> Folks,
>>>
>>> I'm facing with a strange error on daisy branch.
>>> Some native recipes are failing on do_configure step with this message:
>>>
>>> checking for intltool >= 0.35.0...
>>> /<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
>>> configure: error: Your intltool is too old.  You need intltool 0.35.0 or
>>> later.
>>> Configure failed. The contents of all config.log files follows to aid
>>> debugging
>>>
>>>
>>> But intltool-native version is 0.50.2.
>>> What am I missing?
>>>
>>>
>>>   What is your Host OS in this case, it seems like you might be having
>> somekind of host contamination issue.
>>
>
> Ubuntu 14.04 x86_64. I have installed intltools (0.50.2) on host too.
>
>
>> Can you also look at your config.log and see what it was actually testing
>> for.
>>
>
> Do you mean the recipe's log.do_configure?
>
No I mean the actual config.log file from the configure process.  Also, 
I forgot to ask what's the recipe (if it's public).  It's also possible 
that the package's configure is looking for a more precise match and we 
are actually too new!

Sau!

>
>>
>> Or attach your config.log for us to review
>>
>> Thanks
>>
>> Sau!
>>
>
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>
> /*long live rock 'n roll*/
>

