Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id EC0036FFDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 18:33:46 +0000 (UTC)
Received: by vkha189 with SMTP id a189so95432167vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EyDrVyr6JC5B6X6Thn52Z6nkh27hy992b6QJFhbVb+A=;
	b=F7UG+cSIqUL6kleVPpg0nb8HMBOkYz3cBFE9muDIsdR+tjv0fp0woAjwuH73sH3gp0
	f2eBOYBel2AMwA3FEoa/IJoO+9SqGjciSv5GGrs4/5YSTZI53Ozs/wnd5Y41y64yy3CR
	1hdqb+989h/pfWMb/6x6ILPsI7wYbc5DY6HovsRc6ISQLt65H6ifzmWicKMtLs0l75oD
	2aNeTT6U45PlTs6RzKE7+0sPWouE4jnsR4vmAq5M+yj/96L6pavPhk60ybR8XMgL9B/0
	veHxJJYBWVWGgLlxeVz58ZUS1+pnnw7XCAwS+35+fdc3hSD47FliOEb89xaO+GWjzCZm
	cc4Q==
MIME-Version: 1.0
X-Received: by 10.31.49.147 with SMTP id x141mr11225140vkx.1.1449772427068;
	Thu, 10 Dec 2015 10:33:47 -0800 (PST)
Received: by 10.103.37.196 with HTTP; Thu, 10 Dec 2015 10:33:46 -0800 (PST)
Received: by 10.103.37.196 with HTTP; Thu, 10 Dec 2015 10:33:46 -0800 (PST)
In-Reply-To: <CABcZANn0wr+1GgYiPVkpTbqVLfOZOK44xZEtPDxdLfSaJgx6Qg@mail.gmail.com>
References: <cover.1447371049.git.chris_larson@mentor.com>
	<130d9a6c1f4ecea86748a44b73f51d8ddb2e63da.1447371049.git.chris_larson@mentor.com>
	<05b7cc8c957a9756e7af964a09bc2a89e0aedd9f.1447371049.git.chris_larson@mentor.com>
	<CACS+7ZR-KmxgSjSOptx_E3w4dFbMz_90munhQPcCfcEmvdV2DA@mail.gmail.com>
	<CABcZANn0wr+1GgYiPVkpTbqVLfOZOK44xZEtPDxdLfSaJgx6Qg@mail.gmail.com>
Date: Thu, 10 Dec 2015 12:33:46 -0600
Message-ID: <CACS+7ZSF4Z3HPg8YesgQ2hADevRyzC5=obKFUADy_ZgixvurqQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: add myhostname to nsswitch.conf
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
X-List-Received-Date: Thu, 10 Dec 2015 18:33:47 -0000
Content-Type: multipart/alternative; boundary=001a114383468549c805268f720a

--001a114383468549c805268f720a
Content-Type: text/plain; charset=UTF-8

On 7 Dec 2015 1:49 p.m., "Christopher Larson" <kergoth@gmail.com> wrote:
>
>
> On Tue, Nov 17, 2015 at 8:49 PM, Dan McGregor <danismostlikely@gmail.com>
wrote:
>>
>> On 12 Nov 2015 5:41 p.m., "Christopher Larson" <kergoth@gmail.com> wrote:
>> >
>> > From: Christopher Larson <chris_larson@mentor.com>
>> >
>> > We don't need nss-myhostname on systemd systems, because systemd
already
>> > provides myhostname, but we weren't configuring nsswitch to use it.
Being able
>> > to resolve the hostname is useful for a number of different
applications, so
>> > enable it using the same postinst/prerm bits which are in
nss-myhostname.
>>
>> I have this and a similar change for resolved in an append at work.
Would others be interested in that too?
>
>
> I'm sure there are folks that would find that interesting. I'm sure not
everyone uses resolved, but I'm sure we want it to work well for folks taht
do want to use it.
>

Cool. I'll post my change. nss_resolve can be used unconditionally if it's
there. If resolved isn't running it falls back to nss_dns.

--001a114383468549c805268f720a
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On 7 Dec 2015 1:49 p.m., &quot;Christopher Larson&quot; &lt;<a href="mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Nov 17, 2015 at 8:49 PM, Dan McGregor &lt;<a href="mailto:danismostlikely@gmail.com">danismostlikely@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 12 Nov 2015 5:41 p.m., &quot;Christopher Larson&quot; &lt;<a href="mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Christopher Larson &lt;<a href="mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We don&#39;t need nss-myhostname on systemd systems, because systemd already<br>
&gt;&gt; &gt; provides myhostname, but we weren&#39;t configuring nsswitch to use it. Being able<br>
&gt;&gt; &gt; to resolve the hostname is useful for a number of different applications, so<br>
&gt;&gt; &gt; enable it using the same postinst/prerm bits which are in nss-myhostname.<br>
&gt;&gt;<br>
&gt;&gt; I have this and a similar change for resolved in an append at work. Would others be interested in that too?<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m sure there are folks that would find that interesting. I&#39;m sure not everyone uses resolved, but I&#39;m sure we want it to work well for folks taht do want to use it.<br>
&gt;</p>
<p dir="ltr">Cool. I&#39;ll post my change. nss_resolve can be used unconditionally if it&#39;s there. If resolved isn&#39;t running it falls back to nss_dns.</p>

--001a114383468549c805268f720a--
