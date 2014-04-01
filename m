Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5D26F242
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 14:57:51 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rl12so8915916iec.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=kh6qLxU1jEcip1NVWsUOMHTAzbWzdOWnN0H9GzrVqys=;
	b=TuEYaRhCyhaIA5IXDKqeAq8QZLHmkaPtroaaiVi9hsLnNUg7NEfCntpO+9Fj3YsGhS
	rLznrpiaGT2sqbqNNrrZjtSwj6H1A9CET5BSwrQy6Mxn8/fOpHvyiBV4MXBPp5cBnrKP
	KOnZSAI0JjtVHmmIr9NvIHN/R+Wlt+usFKWvxLpuu9Dlqyqhcl7Zdh4fFCFnvXDotm0H
	JjQWhmT0lonVtEy0VQi6gvbcKf/ZH3D4ul0yyjEpn5/5A9DmsMQz+22DpaDsJQKyYDPK
	fKJkMcomU/8MSyHQfC4IOGhH/WWmB6qFfD/6krPuKaLLUSeyRn9XEXwC/spiBSoGhZQv
	cGXg==
X-Received: by 10.42.203.202 with SMTP id fj10mr30955119icb.51.1396364272731; 
	Tue, 01 Apr 2014 07:57:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 1 Apr 2014 07:57:20 -0700 (PDT)
In-Reply-To: <533A6D67.9060608@windriver.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
	<eedfe13af69c82c667fb78152bb070b0cc448bc2.1395997035.git.hongxu.jia@windriver.com>
	<CAMKF1sozZEVsJ=oaBW-mqex27LvOTfOGW90+g_9gkPg27OJEhA@mail.gmail.com>
	<533A6D67.9060608@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2014 07:57:20 -0700
Message-ID: <CAMKF1sps5Bu26iN7ak76t-QZQnhrm1wTvhAcHWs94xnz035BvQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libarchive: fix CVE-2013-0211
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
X-List-Received-Date: Tue, 01 Apr 2014 14:57:54 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 1, 2014 at 12:40 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> On 04/01/2014 01:30 PM, Khem Raj wrote:
>>
>> On Fri, Mar 28, 2014 at 2:43 AM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> ++      const size_t max_write = INT_MAX;
>>
>> I think INT_MAX is a mismatch here size_t may not be defined 'unsigned
>> int' on all kind of architectures.
>
>
> How about test the size of size_t and assigned the related MAX value:
>
> const size_t max_write = (sizeof(size_t) >=
> sizeof(int))?INT_MAX:(sizeof(size_t) == sizeof(short))?SHRT_MAX:CHAR_MAX;
>

you could use something like (size_t)-1 to denote SIZE_MAX

> //Hongxu
>

