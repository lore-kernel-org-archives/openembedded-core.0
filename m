Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 08A43702CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 12:53:02 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id gi9so7001504lab.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Uk0029JcTlykCAFz/KEx2C/N7yypwqFW1/rdps4TtnQ=;
	b=Rd6h2/ZlaMnCrKPTpOgopQBGq3/9BJQqMTyQT+HcmuJ9mx5QzymOqxPasTduLWdV0R
	c+k7+naJG81XACeCxlFWi6vKd9guSIv/LpxU7pAljBuU88NtFWdbhSHvEJjFbOYmRMTv
	GQ0FBhSyh2gdZwaw897VvjnnMK6YHHTTvelPvOHCPl9zzSyqfz+7FGSlfRl5ORaybRF6
	eR/Hr9qfFbnmgqAuUW/NKAP6hTwV6V6nmt/VqOuyX3rmkMqM2BkgWf5+QCISO/9PRiAe
	FGi4j3rR+SMWvihQJ7/8GcCBVdkNlohqUMy2XMEQZZBxbOp+xbvPtKcu04nwOSP5wwgk
	anyA==
MIME-Version: 1.0
X-Received: by 10.112.76.6 with SMTP id g6mr11155796lbw.22.1410267182435; Tue,
	09 Sep 2014 05:53:02 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Tue, 9 Sep 2014 05:53:02 -0700 (PDT)
In-Reply-To: <CAJTo0LaexRywk_BscfMZKbOOA061_4BnvYrw_j4cK3eo09D8bA@mail.gmail.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
	<6df082a8d4a4b54ab2967a5746b37a20dc7f6834.1410205901.git.bruce.ashfield@windriver.com>
	<CAJTo0LaexRywk_BscfMZKbOOA061_4BnvYrw_j4cK3eo09D8bA@mail.gmail.com>
Date: Tue, 9 Sep 2014 08:53:02 -0400
Message-ID: <CADkTA4MdJyygE7+BLfZ9yeya-n8LVPz6ahY6U7EdePgkBjgtgw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] lttng-modules: fix compilation for 3.17-rcX
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
X-List-Received-Date: Tue, 09 Sep 2014 12:53:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 9, 2014 at 7:40 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 8 September 2014 20:55, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>> +++ b/meta/recipes-kernel/lttng/lttng-modules/Fix-noargs-probes-should-calculate-alignment-and-eve.patch
>> @@ -0,0 +1,127 @@
>> +From d3de7f1468be0b18145ff85b3c1a7c7fb1d48c15 Mon Sep 17 00:00:00 2001
>> +From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>> +Date: Fri, 25 Jul 2014 12:30:43 -0400
>> +Subject: [PATCH 1/3] Fix: noargs probes should calculate alignment and event
>> + length
>> +
>> +A noargs probe could have event fields. noargs just means that the probe
>> +does not receive any argument as parameter. However, it could very well
>> +serialize data into fields (global variables, constants, etc).
>> +
>> +It just happens that LTTng does not serialize any data in noargs events
>> +at the moment, but this may very well change.
>> +
>> +The if (0) with (void) variable access strategy to stop compiler from
>> +complaining from unused variables does not seem to work as expected with
>> +gcc 4.9.1. Use "unused" attribute instead.
>> +
>> +Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>
> These patches need Upstream-Status: Backport and your s-o-b.

I've never done that before .. and will be on the road until Friday,
so they'll have
to wait until then.

Bruce

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

