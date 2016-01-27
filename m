Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 33ABB7713E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 17:26:00 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id d63so9628687ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 09:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=A3do41zHgyro8CK/xg8Vu2efWzL3vGHUnf4YNH6Nzig=;
	b=WXMQqc61YWyS3tSOPvsweDOe8ijbV5S6mqObaCUeBzdkhcb4CEGnkZlvZQ5k9alD+L
	61TTsxW71Z7fugtnOPG7D9GpqLh+DqVx2he6Yg8AJSUNRbQOeAPMWkBtktgTLJjWDQa6
	0tcRztDHe/g2V6aVBPX1E0nI+wHVQtIDAciFUWwEPe5s0AHZrAb/4rXusGsTiTPPaugT
	FwYGIGJTdV+ufqFt9uSd7AoANWmEPWvGPK4ffPZPhnsDZJTrSUJpDe5fqfPm9DhE9Rh7
	IKYCR4g+NZ9o6w1sBmm+WYDeiu+FdeRKrwf4ZyxbqEgMZqrdDYGEJLSqShPqIvxTC17H
	fQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=A3do41zHgyro8CK/xg8Vu2efWzL3vGHUnf4YNH6Nzig=;
	b=b39MUQw3j+a2UpJGzJLJ+O/6OGCS8Evy4RTr3JC3i018ZZOdPaPIM19n0iRatvD0M7
	BZ1lsalorm3x7dYxoDqeghG4/UICBRZRhUliSrqZCMtDIh7CVxicuTeEOPw6jT6kykmd
	cJ9MncaSMbozwOooQbYoNPo77vBV9vKtBReycNZ0O1f/+uXFcjtC/yZbi6lhf8+D7JLu
	8RoOwbinmg8BX+ZeWPHEGdWaOwtwdZsJNJWIr1/DMX6mwfyAB36AY03ItS82pSWTeS6T
	AtA0jvNPPMnZpZpNOJQUM+ihVjKgIgAfH5YuxFq/zJGSore1rreMJ0fW/TmD+kfvW41I
	I2vA==
X-Gm-Message-State: AG10YOQVYzckYEknziv/z/dxswa3xFuD6spEZl7+ad3iiY0cqzX6DZKS3ZYV4X0vvgH2S8CkHIBFBiXbIZyWTw==
MIME-Version: 1.0
X-Received: by 10.107.9.224 with SMTP id 93mr28225362ioj.112.1453915561285;
	Wed, 27 Jan 2016 09:26:01 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Wed, 27 Jan 2016 09:26:00 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Wed, 27 Jan 2016 09:26:00 -0800 (PST)
In-Reply-To: <809092932.5736.1453901457659.JavaMail.zimbra@efficios.com>
References: <1037243108.4336.1453770172960.JavaMail.zimbra@efficios.com>
	<51287CFC-6F3C-43B1-9190-84F3B20C192E@gmail.com>
	<433937130.5072.1453838389504.JavaMail.zimbra@efficios.com>
	<CAMKF1sofnyADcNkAc+YrXjPED=ALxf60oPEsuQiJTAY87oB31Q@mail.gmail.com>
	<CAJTo0LZazTzkp94ASdACaBOuC4JpNWCpnf46kAucjY5B+wX2vQ@mail.gmail.com>
	<883932458.5623.1453895978760.JavaMail.zimbra@efficios.com>
	<809092932.5736.1453901457659.JavaMail.zimbra@efficios.com>
Date: Wed, 27 Jan 2016 12:26:00 -0500
Message-ID: <CAMKF1sqEb-G3ENVWkhesEoMkgMJdvKf8wcbvOJ3hDf6EVQb=XQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: lttng-dev <lttng-dev@lists.lttng.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [lttng-dev] Bogus openembedded gcc patch
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
X-List-Received-Date: Wed, 27 Jan 2016 17:26:03 -0000
Content-Type: multipart/alternative; boundary=001a113ebd7c905e82052a541817

--001a113ebd7c905e82052a541817
Content-Type: text/plain; charset=UTF-8

On Jan 27, 2016 8:30 AM, "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>
wrote:
>
> ----- On Jan 27, 2016, at 6:59 AM, Mathieu Desnoyers <
mathieu.desnoyers@efficios.com> wrote:
>>
>> ----- On Jan 27, 2016, at 6:31 AM, Burton, Ross <ross.burton@intel.com>
wrote:
>>>
>>>
>>> On 26 January 2016 at 23:14, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>> > Yes, we have narrowed down our problem to this specific patch by
>>>> > removing the patch from the OE gcc patches, rebuilding gcc, and
>>>> > then building our test program with that gcc. The problem goes
>>>> > away when we do so, which points directly to that patch as a
>>>> > culprit.
>>>> >
>>>> > Test program is attached.
>>>>
>>>> Ok I think we can remove this from master and jethro release
>>>
>>>
>>> Mathieu, as you found this do you want the glory by submitting a the
removal patch?
>>
>>
>> Thanks for asking, but for me a
>>
>> Reported-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>>
>> in the patch commit messge is good enough.
>> You'll probably want to have a link to this discussion thread
>> also in the commit message.
>
>
> I have a few minutes in front of me, I'll prepare a patch.

Ok. I think for jethro and master its ok, for other branches. This needs
testing
>
> Thanks,
>
> Mathieu
>
>>
>>
>> Thanks,
>>
>> Mathieu
>>
>>>
>>> Cheerss,
>>> Ross
>>>
>>
>> --
>> Mathieu Desnoyers
>> EfficiOS Inc.
>> http://www.efficios.com
>>
>> _______________________________________________
>> lttng-dev mailing list
>> lttng-dev@lists.lttng.org
>> http://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev
>
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com

--001a113ebd7c905e82052a541817
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Jan 27, 2016 8:30 AM, &quot;Mathieu Desnoyers&quot; &lt;<a href="mailto:mathieu.desnoyers@efficios.com">mathieu.desnoyers@efficios.com</a>&gt; wrote:<br>
&gt;<br>
&gt; ----- On Jan 27, 2016, at 6:59 AM, Mathieu Desnoyers &lt;<a href="mailto:mathieu.desnoyers@efficios.com">mathieu.desnoyers@efficios.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; ----- On Jan 27, 2016, at 6:31 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 26 January 2016 at 23:14, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt; Yes, we have narrowed down our problem to this specific patch by<br>
&gt;&gt;&gt;&gt; &gt; removing the patch from the OE gcc patches, rebuilding gcc, and<br>
&gt;&gt;&gt;&gt; &gt; then building our test program with that gcc. The problem goes<br>
&gt;&gt;&gt;&gt; &gt; away when we do so, which points directly to that patch as a<br>
&gt;&gt;&gt;&gt; &gt; culprit.<br>
&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt; &gt; Test program is attached.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Ok I think we can remove this from master and jethro release<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Mathieu, as you found this do you want the glory by submitting a the removal patch?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks for asking, but for me a<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: Mathieu Desnoyers &lt;<a href="mailto:mathieu.desnoyers@efficios.com">mathieu.desnoyers@efficios.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; in the patch commit messge is good enough.<br>
&gt;&gt; You&#39;ll probably want to have a link to this discussion thread<br>
&gt;&gt; also in the commit message.<br>
&gt;<br>
&gt;<br>
&gt; I have a few minutes in front of me, I&#39;ll prepare a patch.</p>
<p dir="ltr">Ok. I think for jethro and master its ok, for other branches. This needs testing<br>
&gt;<br>
&gt; Thanks,<br>
&gt;<br>
&gt; Mathieu<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt;<br>
&gt;&gt; Mathieu<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Cheerss,<br>
&gt;&gt;&gt; Ross<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Mathieu Desnoyers<br>
&gt;&gt; EfficiOS Inc.<br>
&gt;&gt; <a href="http://www.efficios.com">http://www.efficios.com</a><br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; lttng-dev mailing list<br>
&gt;&gt; <a href="mailto:lttng-dev@lists.lttng.org">lttng-dev@lists.lttng.org</a><br>
&gt;&gt; <a href="http://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev">http://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev</a><br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; Mathieu Desnoyers<br>
&gt; EfficiOS Inc.<br>
&gt; <a href="http://www.efficios.com">http://www.efficios.com</a></p>

--001a113ebd7c905e82052a541817--
