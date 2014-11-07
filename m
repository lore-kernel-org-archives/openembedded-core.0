Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id DC02B6017E;
	Fri,  7 Nov 2014 23:55:41 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id hl2so6317891igb.10
	for <multiple recipients>; Fri, 07 Nov 2014 15:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fyaH2dO5l8BKqhIaYTWl+8MQoun/HqAWxx8YgisJx7U=;
	b=jfvusEQz8No+AC/iOVHBmXAwoXZeEqndngz5H8d5DGsnWJaC+FgJ68+vC43/DQ769O
	8u409gw9cx3ZwyFKv17/inn8JvYmsJ93Q4IaCMvFnphab55DhS9/sQDyZiK3TAXYoYfI
	9DJIXMmz1WQBqFdgcn3DXAi4d1qXwFixcXpfVkQHTlPF7/PaVoVfKA8YsOfX/Iz6u0+5
	A4A++s6MIG3//PuZiVFQkxq43GdVZjxu1ZTSEMTlqEtBKrQ9oeMc/mvOqeHglHLOsSK9
	Y6KuK8bNkZkGoKbwYNUwnFBqiokud9D3bhf0VC6zwrQUABVy5Pm4f9Qf9U0U9SHpNupt
	oDdw==
X-Received: by 10.107.152.15 with SMTP id a15mr16880535ioe.39.1415404542257;
	Fri, 07 Nov 2014 15:55:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Fri, 7 Nov 2014 15:55:12 -0800 (PST)
In-Reply-To: <CAJTo0LZeqimJ5CX7Fg_3qEDo=-ihyh2pZ+vMOftoYR0MMc2uAw@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
	<CAMKF1sqUOM=FrvXkhoEkFpxMd0=GZ4deAoJnKDdCQkhesRuc0g@mail.gmail.com>
	<CAMKF1so1Bv-1EuDHGhLOmQ_XBhm38i-vu=m3fERN4ztgw573pQ@mail.gmail.com>
	<CAJTo0LZeqimJ5CX7Fg_3qEDo=-ihyh2pZ+vMOftoYR0MMc2uAw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Nov 2014 15:55:12 -0800
Message-ID: <CAMKF1spCz-6DoxV_QfqMaW7Uq5yAg3570EvM=vwxDSyNcq_RgQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 23:55:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 7, 2014 at 3:48 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Khem,
>
> On 7 November 2014 15:58, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I have been creating copies of it in meta-clang where I was trying to
>> get clang based
>> cross compiler working.
>
>
> I've not looked into detail as to how llvm/clang/etc are built, would a
> branch importing meta-clang into oe-core be a suitable starting point?  Or
> is the llvm recipe in meta-oe more current/usable?

certainly bring from meta-oe.

>
> (let's cut to the chase: would you be interested in and able to help merge
> LLVM into oe-core?)

heh :). I can

>
> Thanks,
> Ross

