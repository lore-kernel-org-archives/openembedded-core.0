Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 285F1737A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 06:47:59 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so45401420iec.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2015 22:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=P2yPTBopPOV6p4zzcHYn8RqYxLXWatnv9NFm3XFqXkI=;
	b=dpbW2gHgNnbXHPx8htHFyvFii/YHzW/CEPq8Ml8ADYPeLUqgNEpDWcBFpM1j+552QR
	S9YsPshqc+57w5NBuHuSsVOioIktw4NHdna2QnqCccg1EeRM8HT4gQhcNNDadRlw2Jvx
	AohOOzfs36w0mF46nMzr0WwkwAW6r8h2vNLWdm5XttNhkBw5QN4Oo6uTpZJGKp0fwBIS
	VNA975xdJO8e/tIxERN+WKzoHhRKBaU+GDAYNKHj59BY/P93Q1QZfUAsSriR6m5fTFfA
	vlrasCAw5iJH7uycfDahIRp0386inj2lXnRGP7MO7ro/EIZKF8T2G1msI9DCLnrgpxLX
	uPDA==
MIME-Version: 1.0
X-Received: by 10.43.1.67 with SMTP id np3mr29285447icb.24.1425278880847; Sun,
	01 Mar 2015 22:48:00 -0800 (PST)
Received: by 10.50.117.7 with HTTP; Sun, 1 Mar 2015 22:48:00 -0800 (PST)
Received: by 10.50.117.7 with HTTP; Sun, 1 Mar 2015 22:48:00 -0800 (PST)
In-Reply-To: <54F3E88E.3080703@urbanec.net>
References: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
	<54F3E5D4.7070808@urbanec.net> <54F3E88E.3080703@urbanec.net>
Date: Sun, 1 Mar 2015 22:48:00 -0800
Message-ID: <CAMKF1spYQ4smQUX8RfrcPTNNPMEPByG4Qpch-SXPGKdwxHsQjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Mon, 02 Mar 2015 06:48:00 -0000
Content-Type: multipart/alternative; boundary=bcaec50e5f1d66277c0510489958

--bcaec50e5f1d66277c0510489958
Content-Type: text/plain; charset=UTF-8

On Mar 1, 2015 8:35 PM, "Peter Urbanec" <openembedded-devel@urbanec.net>
wrote:
>
> On 02/03/15 15:23, Peter Urbanec wrote:
>>
>> I think there's a typo here which prevents this from working as
>> intended. The second check is done on "-O0" when it's supposed to be
"-Os"
>
>
> Tested patch submitted.
>
Thanks

--bcaec50e5f1d66277c0510489958
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Mar 1, 2015 8:35 PM, &quot;Peter Urbanec&quot; &lt;<a href="mailto:openembedded-devel@urbanec.net">openembedded-devel@urbanec.net</a>&gt; wrote:<br>
&gt;<br>
&gt; On 02/03/15 15:23, Peter Urbanec wrote:<br>
&gt;&gt;<br>
&gt;&gt; I think there&#39;s a typo here which prevents this from working as<br>
&gt;&gt; intended. The second check is done on &quot;-O0&quot; when it&#39;s supposed to be &quot;-Os&quot;<br>
&gt;<br>
&gt;<br>
&gt; Tested patch submitted.<br>
&gt;<br>
Thanks<br>
</p>

--bcaec50e5f1d66277c0510489958--
