Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9B68477C20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:20:02 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id h67so1933753qke.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o49sZ9Pyee9GeVTUskLSWfLegbhhtroty1+J+c1QT9c=;
	b=evMAUprzKk+2tsl23CWY7UA5N2uGw5e1DMMjt3XY2syQsWQJ5ATvY0gOQOKqM3mrNS
	coQkyLk8DeQol9Tv3OoZgZXm3hCaYdpKqh2o+4DRX6zOAFlTFsjnnvz1wmxBpmoparVn
	QjBf+AEBpF+hhMwh29gvTpZN9DQOInxXvjhwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o49sZ9Pyee9GeVTUskLSWfLegbhhtroty1+J+c1QT9c=;
	b=Xn7VkPjxVGuEkXamo3wiD4n3b9Yzz0uw9W/2zZHDXfNzOF/qKBG5dN/0HIlVNsjzne
	M4ObMfNDJB2+JUQwxkKgvLmJMDJrrwaG38JB1KL8KILR2JtUEvfzrYHtrHYbJ1RsStMe
	4OG9pJYBhmJHpJ9rvjqI8Ers2Gh7r8K4qWkYIb690/wxQxq3lD5u3qcLsSKL4wWziRez
	p262qQRsdmVLnLf05QbSAlvXojrJjNurZRTCbl7VlcsGOYZiGSq/T+DnJxFZ33qTAY9T
	Tp5cURI3hNBScWnQCbhwrmmkA3q/xdsngflKdCzIx294TjHfhdF+Cmk4kMPkmgJXfLKF
	saRw==
X-Gm-Message-State: AN3rC/4GoXD7bcz9p3q2GwJ1Dhq2GxOdDYU8OawnlwxCE8T70+FAtwY0qwibYnG+iFzVRJUEwapxSFHGk8tGHOCo
X-Received: by 10.55.109.199 with SMTP id i190mr24080629qkc.91.1491927603892; 
	Tue, 11 Apr 2017 09:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.84.168 with HTTP; Tue, 11 Apr 2017 09:19:43 -0700 (PDT)
In-Reply-To: <77e0f2a1-520d-5a0d-b1c0-d231622cfe79@pseudoterminal.org>
References: <1491897285-6179-1-git-send-email-dv@pseudoterminal.org>
	<8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
	<77e0f2a1-520d-5a0d-b1c0-d231622cfe79@pseudoterminal.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 11 Apr 2017 18:19:43 +0200
Message-ID: <CAP71WjzJ63peDwzhuLZ7D3GWnk7tc6BUS+XKk7C9ZcWY+knXPg@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmscube: add recipe
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
X-List-Received-Date: Tue, 11 Apr 2017 16:20:05 -0000
Content-Type: multipart/alternative; boundary=001a114fe878dc7b05054ce676df

--001a114fe878dc7b05054ce676df
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 11, 2017 at 10:30 AM, Carlos Rafael Giani <dv@pseudoterminal.org
> wrote:

> On 2017-04-11 10:26, Alexander Kanavin wrote:
>
>> On 04/11/2017 10:54 AM, Carlos Rafael Giani wrote:
>>
>>> This is a useful tool to test KMS and GBM-based EGL & OpenGL ES drawing
>>>
>>
>> Sorry, but the bar for adding recipes to oe-core is higher than a single
>> all-purpose word 'useful'. Useful to whom? What does the tool do? Is it
>> essential for making an embedded system? You really should write a (much)
>> longer commit message, for a start.
>>
>> Alex
>>
>>
> Well it is sort of an equivalent of glxgears for checking whether or not
> GBM-based rendering actually works. We have piglit for testing, eglinfo for
> getting information about the EGL & GLES support, and kmscube also adds a
> visual output to see that rendering actually behaves nicely.


I am also using kmscube to test/debug mesa on our boards. i am also in
favor of having the recipe in oe-core, for the reason stated above.
nico

--001a114fe878dc7b05054ce676df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 11, 2017 at 10:30 AM, Carlos Rafael Giani <span dir=3D"ltr">&lt=
;<a href=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudotermin=
al.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 2017-04-11 10:26, Alexander Kanavin wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 04/11/2017 10:54 AM, Carlos Rafael Giani wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This is a useful tool to test KMS and GBM-based EGL &amp; OpenGL ES drawing=
<br>
</blockquote>
<br>
Sorry, but the bar for adding recipes to oe-core is higher than a single al=
l-purpose word &#39;useful&#39;. Useful to whom? What does the tool do? Is =
it essential for making an embedded system? You really should write a (much=
) longer commit message, for a start.<br>
<br>
Alex<br>
<br>
</blockquote>
<br></span>
Well it is sort of an equivalent of glxgears for checking whether or not GB=
M-based rendering actually works. We have piglit for testing, eglinfo for g=
etting information about the EGL &amp; GLES support, and kmscube also adds =
a visual output to see that rendering actually behaves nicely.</blockquote>=
</div><br>I am also using kmscube to test/debug mesa on our boards. i am al=
so in favor of having the recipe in oe-core, for the reason stated above.</=
div><div class=3D"gmail_extra">nico</div><div class=3D"gmail_extra"><br></d=
iv></div>

--001a114fe878dc7b05054ce676df--
