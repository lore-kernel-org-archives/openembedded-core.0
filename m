Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id B8D356E64A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 15:46:18 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id l2so86282997qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 08:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FUoMbztUttIFQddjsBQs0f5WF1rCEAW1fnkmlAaVmFw=;
	b=UTnorIbzoKDDMxxpEgpo1cJVBvAbGJgwkSXeyk5qkcA1fWXEwRJdTHu2lHyGhx9Jez
	F6OVerPe7NnT3c6bRE5wObhD98/Y3M8Yt5lfR+SpNL6IkGWA0LUTaqNArVKAwtARIDTZ
	Hn7lMGb0PfPf4cRCOzRTZ+rleSryM0CYqcZeobi/aHgUDGudDclF6xx/ZiblA60V5LeH
	SXG6s7jEmR9CEWmWVs5iYSBqQ2xVSFAQs0GmmoKROPcF4Po0vtkba0ZhUckWQbTRv5iQ
	qLXnc7t7ruqvEGZ77JpGGiCSmOeFVHQt5FMXOEPs1YuqY9M12d3P/eu0xhnclUSxG8rX
	FFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FUoMbztUttIFQddjsBQs0f5WF1rCEAW1fnkmlAaVmFw=;
	b=B446QxZzVOVPPg4w3LCRrOUJA/Q0qXZd9Ceia3drLnRgW/Qg69QkgI4aUhC5IovgEG
	GKpriJxE34ErxeX6g0H3gXYc8DpUN3E+kkPkrPw3i3BBW5rn4NZS1jGlSraV38f2VHeS
	AhrB0ufCjJfyPsyP5PxbUwb5Er53FrkCRPfqigYVP4AHqBJRJfzaxD4+dwHV39+QyHqi
	8vn3/MTy0gYLxm/58eI4bjEZ9rABu/3vKTndc9/j7WJ805l3shmDj+uBR9do+hLCGUbJ
	aEanosdJxljFWV0e6Gvbug9h+5giWz8EkjeSqGDWwrLwfZHktFpYV+TaSMhtkkssCIyP
	XCnw==
X-Gm-Message-State: AEkoouvIXXoC4fAppGLYDUk+awYgdw5b6E4t3v614ZZQVyiQVeidrD5ybzeJSXhNT3uBm1zzJRhac4CLePDxrA==
X-Received: by 10.55.27.106 with SMTP id b103mr23816147qkb.224.1471880778962; 
	Mon, 22 Aug 2016 08:46:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Mon, 22 Aug 2016 08:46:17 -0700 (PDT)
Received: by 10.55.215.13 with HTTP; Mon, 22 Aug 2016 08:46:17 -0700 (PDT)
In-Reply-To: <CAJTo0LYL9eiid4PKOj8OgY81Z3KANhtHkwh1RGGhNQi4+RXehg@mail.gmail.com>
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
	<56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
	<CAJTo0LZJRJFC71=xEa_EQUiOTZNWR8QPGtnJvSWqqGLqM_QjcQ@mail.gmail.com>
	<8b30fc2d-26ea-03bd-58ea-cdbf00e74b36@linux.intel.com>
	<020C25BC-315C-4ED3-8268-DB7CC4C0A52A@gmail.com>
	<CAJTo0LYL9eiid4PKOj8OgY81Z3KANhtHkwh1RGGhNQi4+RXehg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Aug 2016 08:46:17 -0700
Message-ID: <CAMKF1sqHpOyuBrnqG2spbQRqhg1oQx04KrUL7DLffNTXWM4Gag@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Mon, 22 Aug 2016 15:46:19 -0000
Content-Type: multipart/alternative; boundary=001a1147f56afb6202053aaaf2ca

--001a1147f56afb6202053aaaf2ca
Content-Type: text/plain; charset=UTF-8

On Aug 22, 2016 8:20 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 19 August 2016 at 17:52, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> good point, will this class give me some sort of parsing error, if I try
to update to odd version ?
>
>
> No it simply sets the variables so that the recipe reporting service
won't propose an upgrade to a development release.
>
> There may be a good reason for the upgrade to a development release (for
example if you're developing a system and are tracking an upstream
development series), so aborting the build would be overkill.

A parsing note or warning would not hurt imo
>
> Ross

--001a1147f56afb6202053aaaf2ca
Content-Type: text/html; charset=UTF-8

<p dir="ltr"></p>
<p dir="ltr">On Aug 22, 2016 8:20 AM, &quot;Burton, Ross&quot; &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 19 August 2016 at 17:52, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; good point, will this class give me some sort of parsing error, if I try to update to odd version ?<br>
&gt;<br>
&gt;<br>
&gt; No it simply sets the variables so that the recipe reporting service won&#39;t propose an upgrade to a development release.<br>
&gt;<br>
&gt; There may be a good reason for the upgrade to a development release (for example if you&#39;re developing a system and are tracking an upstream development series), so aborting the build would be overkill.</p>
<p dir="ltr">A parsing note or warning would not hurt imo<br>
&gt;<br>
&gt; Ross<br></p>

--001a1147f56afb6202053aaaf2ca--
