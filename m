Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBAF60125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 00:46:33 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so9663653pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 16:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=2q1XVZUtrXEo8favK/Ouk2QWbbS2GlZd5Bx61UULWDk=;
	b=ltqtIeTvCvQ+RdOHik8nR2Xd1bnOLc4IhDkRNUaWcA8cA4aToca0iCFF07u+SBBon8
	vW5bOmSQFJuael3B190yqru1pAg7q3qo09UaUleEDwm/ZmAgHFioLKSa4lwqyA2N8Ge7
	lbPrzXRd7kBVytOrY8Exe9zntgw7X7dVKCFp79A6pK3dl370obZkdZJAMzhh/2IdHGoZ
	ZlCzFaIv/H+8v0y8KfaimHajomcufa9sq3LiDTRG2STjQBj6Z+3G0y58CKWs9QvpxoEo
	S8FuaQg+8l9sIippFW3K5rgCcEu2LsznExTkJNnn7B4wzfAUH9AzLItq6b68hRwOas14
	otnw==
X-Received: by 10.66.194.16 with SMTP id hs16mr36998164pac.93.1446597993748;
	Tue, 03 Nov 2015 16:46:33 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	bc2sm31730263pbd.2.2015.11.03.16.46.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Nov 2015 16:46:32 -0800 (PST)
To: Ruslan Babayev <ruslan@babayev.com>
References: <87d1vqk67s.fsf@babayev.com> <5639431F.6000408@gmail.com>
	<878u6ek2k2.fsf@babayev.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56395567.6010405@gmail.com>
Date: Tue, 3 Nov 2015 16:46:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <878u6ek2k2.fsf@babayev.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Add LibreSSL support
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
X-List-Received-Date: Wed, 04 Nov 2015 00:46:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ruslan,

On 11/03/2015 04:53 PM, Ruslan Babayev wrote:
> Hi Armin,
> 
> It is the latest stable. And it looks like this patch has made it into
> 2.2.4

Thanks for double checking.

- armin

> http://ftp.openbsd.org/pub/OpenBSD/patches/5.8/common/007_obj2txt.patch.sig
> 
> akuster808 writes:
> 
>> Ruslan,
>>
>> any reason version 2.3.1 was not picked?
>>
>> I believe 2.2.4 is missing  (CVE-2015-5333 and CVE-2015-5334)
>>
>> - armin
>>
>> On 11/03/2015 03:34 PM, Ruslan Babayev wrote:
>>> Please find attached the patch to add support for LibreSSL.
>>>
>>> OpenSSL is still preferred, so you'd have add these to your local.conf
>>>
>>> PREFERRED_PROVIDER_openssl ?= "openssl"
>>> PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
>>> PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
>>>
>>>
>>>
> 

