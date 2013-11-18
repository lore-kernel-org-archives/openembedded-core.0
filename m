Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1B8D6D8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:59:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAICxvaA007970
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 04:59:57 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 18 Nov 2013 04:59:56 -0800
Message-ID: <528A0F36.7070605@windriver.com>
Date: Mon, 18 Nov 2013 20:59:34 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Saul Wold <sgw@linux.intel.com>
References: <1384480333-7671-1-git-send-email-sgw@linux.intel.com>
	<CAP9ODKquaOQJRyfOU=1RXqa=G2=hPfVjh4ae=u+6kDt0-7s7PA@mail.gmail.com>
In-Reply-To: <CAP9ODKquaOQJRyfOU=1RXqa=G2=hPfVjh4ae=u+6kDt0-7s7PA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sysvinit: unmount the psplash lazyily
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
X-List-Received-Date: Mon, 18 Nov 2013 12:59:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/15/2013 09:29 PM, Otavio Salvador wrote:
> On Thu, Nov 14, 2013 at 11:52 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> There is an race condition where psplash is not quite exited before the unmount occurs
>> causing a umount: /mnt/.psplash: target is busy message to appear, it's ok to lazyily
>> unmount and not get this message
>>
>> [YOCTO #5244]
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> Agreed.
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Robert, please consider it to be included in dora. This is a simple
> and nice bugfix.
>

Hi Otavio,

Thanks, I will try to add it in dora.

// Robert

