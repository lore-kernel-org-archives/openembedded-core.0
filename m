Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 300D36059B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 21:40:37 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rp18so103093iec.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gaN51gzlcscXZOrrc/uJCaqRfiKO6iUrvLWl02AWLk4=;
	b=tt/M9YNMNG2M29LtOvYybjXWkysB+RTb8gMGsFBP9KPTULftItO4waUZ4HXyhU6c7I
	Bcz6GXNMVUrCLmwHgA9DDxtKpH8I4UG1DwvuxUcszQdQPKrGpwcBHcqOw87H8MgXgtDf
	XppGKTHjjIsVZoRTjBwblXUe5bw09oKJDvRyaGX6imoy5+qRp4GTL7ckX8dAKXLd8lHQ
	vmDX0fYm/ljYshnTqyKvPFSI5vGOww2Z6BJwVfjXHOFi4g7Lc9h2pBC2PRnZr5rdsFqX
	rj9IiUf0k6RfBEPo3g3nZVkPKS5bt9j6dGHklHRLrWdLUFfEQjHhBX/beSiokIkOUCDc
	ktTw==
MIME-Version: 1.0
X-Received: by 10.50.43.225 with SMTP id z1mr35749751igl.29.1399412438843;
	Tue, 06 May 2014 14:40:38 -0700 (PDT)
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 14:40:38 -0700 (PDT)
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 14:40:38 -0700 (PDT)
In-Reply-To: <5369533B.9010209@windriver.com>
References: <536899F5.1030104@gmail.com> <20140506205518.GE11339@denix.org>
	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
	<5369533B.9010209@windriver.com>
Date: Tue, 6 May 2014 14:40:38 -0700
Message-ID: <CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 21:40:45 -0000
Content-Type: multipart/alternative; boundary=089e010d8dd64fc5c804f8c21973

--089e010d8dd64fc5c804f8c21973
Content-Type: text/plain; charset=UTF-8

On May 6, 2014 2:25 PM, "Mark Hatle" <mark.hatle@windriver.com> wrote:
>
> On 5/6/14, 3:56 PM, Khem Raj wrote:
>>
>> On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org>
wrote:
>>>
>>> Do you know that OE toolchain is not relocatable?
>>
>>
>> is that true ?
>>
>
> It's the load path of the executables, they use the libc-nativesdk, so
they need a hard path to the correct ld.so to get started.

isnt this fixed by the installer when it is run
>
> --Mark
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--089e010d8dd64fc5c804f8c21973
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On May 6, 2014 2:25 PM, &quot;Mark Hatle&quot; &lt;<a href="mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/6/14, 3:56 PM, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko &lt;<a href="mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Do you know that OE toolchain is not relocatable?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; is that true ?<br>
&gt;&gt;<br>
&gt;<br>
&gt; It&#39;s the load path of the executables, they use the libc-nativesdk, so they need a hard path to the correct ld.so to get started.</p>
<p dir="ltr">isnt this fixed by the installer when it is run<br>
&gt;<br>
&gt; --Mark<br>
&gt;<br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</p>

--089e010d8dd64fc5c804f8c21973--
