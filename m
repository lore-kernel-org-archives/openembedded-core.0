Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C81478954
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 06:51:54 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id y8-v6so11341463pll.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 22:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QN15bqPTMB+NVyD+NNQVHJXWOnfRZ7c+GhrNZrlha1M=;
	b=DWUZ0NhtN1su+9/R0KRHwG65HPsLvZFsAAsWfozmKXeuh9rs5d79QlZNj/e0ctFXdU
	pBy4jFEIQ/ooCbY0VI4CZ1TRG+mzI9sceYJ3MUTZLbsB5x3zxxLPvQk2E2j0lB++Bk+n
	YAZzQFvrhNYj6YyJLtkSUABqWbBjP9QhGAnXTJ7Xzkx/nZNsgQIP1e2zUMHF5Ipc0V5O
	ioCtFCrYjDQmfVzFMSZxT6TzHAHJZpXBpYLL6w2Y7hBCGGA3m1lWxUdhZI+LK1tB6GyT
	SAmavU905Lo7sN+dtmIKIJ+zpNv/3QGdETiZI6TbAzQ9mj1kStfqpW2+HMbQfhf9QdO2
	/FBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QN15bqPTMB+NVyD+NNQVHJXWOnfRZ7c+GhrNZrlha1M=;
	b=drzqy3Znk2LwfD+k5wL5Tpfn5z5PoNded/TYkfjgJNtLOF/hqmBbJZPdnMmRDMRtpu
	PFo3EXV8AcCCH50WEJhKrt0kfAWkgqIp8qEn2cSFKzOaCjgC/ZOG9plrR/zC00TxLwcY
	Km3lqockSW1C+ZirnNmNZ37SqM6YCkh7MW/caXwzlXJWPXgL6yRrfpkcfi7YI1CQNfzS
	fKRFJI26HDC9tmLDWZTGQs/+WlkHFusHJvss+eKmUa4uyYvBCSLiWtd15uNjJJJ9oHuy
	xc4rMcI7fQ48ZdKsKY0UFTp2SkEIvta1S6nP7djHzgmPf0QLJl+AF7IrTEFCBj2AW6nb
	hbtw==
X-Gm-Message-State: APf1xPB0enwXSYLut+cCFdUMlDV0Uc/JXOZcNdGoaVA1TO5CIAPuCmYM
	/ayKLLk66ucqfY3jrsh5aLOWFS0cwDzx4FAeh0g=
X-Google-Smtp-Source: AG47ELtvCTgBgxbS7Uf2DUDSLbdrVxcsvFfuUKhY/Jf965tMBVqS6ith4+9S4HSSHHKf21LZGf+Y4ZgEbUgsaAgntx4=
X-Received: by 2002:a17:902:9009:: with SMTP id
	a9-v6mr15440673plp.272.1520319115646; 
	Mon, 05 Mar 2018 22:51:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Mon, 5 Mar 2018 22:51:25 -0800 (PST)
In-Reply-To: <alpine.LRH.2.00.1803052231250.22668@sjc-ads-6991.cisco.com>
References: <1520286611-27418-1-git-send-email-kamensky@cisco.com>
	<CAMKF1so6ZxGFD-9BOH_g0jO=Zu0wOP1r9+2SdQ5dZGc34uaoVQ@mail.gmail.com>
	<alpine.LRH.2.00.1803052231250.22668@sjc-ads-6991.cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2018 22:51:25 -0800
Message-ID: <CAMKF1sr-wwj4LTMiqL4Q_i9=EJZSCegFXb1NPHCgD=LyWrNnPQ@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] systemtap: supports mips starting with version 3.1
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
X-List-Received-Date: Tue, 06 Mar 2018 06:51:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 10:47 PM, Victor Kamensky <kamensky@cisco.com> wrote:
> Hi Khem,
>
> On Mon, 5 Mar 2018, Khem Raj wrote:
>
>> On Mon, Mar 5, 2018 at 1:50 PM, Victor Kamensky <kamensky@cisco.com>
>> wrote:
>>>
>>> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>>> ---
>>>  meta/recipes-kernel/systemtap/systemtap_git.inc | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc
>>> b/meta/recipes-kernel/systemtap/systemtap_git.inc
>>> index c938760..d122359 100644
>>> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
>>> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
>>> @@ -15,8 +15,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
>>>
>>> file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
>>>             "
>>>
>>> -# systemtap doesn't support mips
>>> -COMPATIBLE_HOST =
>>> '(x86_64|i.86|powerpc|arm|aarch64|microblazeel).*-linux'
>>> +COMPATIBLE_HOST =
>>> '(x86_64|i.86|powerpc|arm|aarch64|microblazeel|mips).*-linux'
>>>
>>
>> Looks ok. Can we enable mipsel as well ?
>
>
> Above expression, effectively 'mips.*-linux', does match 'mipsel' as well,
> does not it? It matches mips64.
>
> I did test basic systemtap operations on qemumips, and
> qemumips64 machines, worked ok to me. I noticed some small quirks but they
> were similar to one that arm machine has. I am not saying
> that MIPS support in systemtap is perfect, it is new architecture
> for systemtap after all, there could be some bugs. But I believe
> it is good enough to be enabled in OE.
>
> I don't see any easy virtual mipsel based machine so I cannot test
> it right away. But I don't see a reson why it would not work in LE
> mode.

ok thanks for clarifying. I wanted to ask if it works on mipsel
or not, not about the regexp, but I see I could have framed it better

