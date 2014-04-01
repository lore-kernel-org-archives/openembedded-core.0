Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3CF6084B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 01:40:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s311eudx029278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 18:40:57 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 31 Mar 2014 18:40:56 -0700
Message-ID: <533A1924.4090903@windriver.com>
Date: Tue, 1 Apr 2014 09:40:52 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<1396275649-32352-2-git-send-email-kai.kang@windriver.com>
	<20140331151018.GG2425@jama> <1396283535.14790.78.camel@ted>
In-Reply-To: <1396283535.14790.78.camel@ted>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Tue, 01 Apr 2014 01:41:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年04月01日 00:32, Richard Purdie wrote:
> On Mon, 2014-03-31 at 17:10 +0200, Martin Jansa wrote:
>> On Mon, Mar 31, 2014 at 10:20:49PM +0800, Kai Kang wrote:
>>> From: Roy Li <rongqing.li@windriver.com>
>>>
>>> When native package is built, use the uname to return the kernel version.
>>>
>>> When target is built, read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion
>>> to avoid to use the hardcode kernel version.
>> Doesn't it make nss MACHINE_ARCH like most virtual/kernel providers are?
> Agreed. I rejected this patch a while ago due to this and I'll reject it
> again.

Got it. Thanks for all of your comments.

--Kai

>
> Cheers,
>
> Richard
>
>
>


-- 
Regards,
Neil | Kai Kang


