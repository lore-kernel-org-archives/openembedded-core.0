Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lei.Yang@windriver.com>) id 1TsESi-0008CN-CL
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 16:18:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r07F2qND008135
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jan 2013 07:02:52 -0800 (PST)
Received: from [128.224.158.164] (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 7 Jan 2013 07:02:52 -0800
Message-ID: <50EAE3B7.10006@windriver.com>
Date: Mon, 7 Jan 2013 23:03:19 +0800
From: Lei Yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1357556076-17485-1-git-send-email-lei.yang@windriver.com>
	<1357565899.25855.13.camel@ted>
In-Reply-To: <1357565899.25855.13.camel@ted>
X-Originating-IP: [128.224.158.164]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH:V2] Remove the redundant "/" in base-files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: lei.yang@windriver.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 15:18:05 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 09:38 PM, Richard Purdie wrote:
> On Mon, 2013-01-07 at 18:54 +0800, lei.yang@windriver.com wrote:
>> From: Lei Yang<lei.yang@windriver.com>
>>
>> I'm working on my virt-test,when I check this file find it has
>> redundant "/"
>>
>> Signed-off-by: Lei Yang<lei.yang@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files_3.0.14.bb |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
> The subject line should be:
>
> base-files: Remove the redundant "/"

Thanks for this info

Lei

> with the recipe/files being changed at the start, as per the commit
> guidelines.
>
> I've fixed it this this and merged it.
>
> Cheers,
>
> Richard
>
>
>



