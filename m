Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SU4dj-0005z5-UY
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 01:25:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4ENFKl2015086
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 16:15:20 -0700 (PDT)
Received: from msp-dhcp25.wrs.com (172.25.34.25) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 16:15:19 -0700
Message-ID: <4FB19206.60603@windriver.com>
Date: Mon, 14 May 2012 18:15:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<4FA8611B.8060609@intel.com>
	<CAF6bG8dN1ZF_khQQirs1OysQP1BUiESrTqT3ucn9YexKN1WvXw@mail.gmail.com>
In-Reply-To: <CAF6bG8dN1ZF_khQQirs1OysQP1BUiESrTqT3ucn9YexKN1WvXw@mail.gmail.com>
Subject: Re: [PATCH 1/6] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Mon, 14 May 2012 23:25:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/12 5:51 PM, Marko Lindqvist wrote:
> On 8 May 2012 02:56, Scott Garman<scott.a.garman@intel.com>  wrote:
>>
>> I can understand why we're trying to ensure our build system doesn't require
>> /bin/sh to be bash, but I think support scripts like runqemu might be a
>> special case.
>>
>> What do other people in the community think of this? The runqemu script
>> isn't trivial, and it has to run in a lot of different contexts. Should we
>> put the time in to make it shell-agnostic, or allow it to require bash?
>
>   1) Do not require /bin/sh to be bash
>   2) It's ok, and for "right tool for the job" -reasons often prefered,
> to require that development machine has also bash installed.
>
>   So I'm happy with how runqemu currently has #!/bin/bash shebang. It
> requires bash to be present, but not necessarily as /bin/sh

I don't mind it using bash as long as it has bash-isms.  Note, the recent =~ 
stuff didn't work on my machine, even with bash.

--Mark

>
>   - ML
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



