Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id BDA316025E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 11:09:07 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 188so138948540iti.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 04:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p/9Yf/RAHDV4+WMvDD3FCFQcrHnjFXq7IjafHM3UCB0=;
	b=jetlC4S+G8PVRP5t+hbz+W97LwySYkqKajlz0t5Nz7qBzm3gaWhEY2hdX1RK0NAyJa
	3AzV1aj8KiEWGx9C0sqR4QdG5rDqCRO6AJJw/J4LxTSb6EtDtSB99oQVlLYipTkYk0Ik
	HexduuqZ02SkVP6FxEWZhrz++AoKb8xfFweYoeiKh6jCfa70ISZp1Oas39iWl8tBBQ2x
	N4uDC3Mxf7IvOM2v9rMPTHkfnjxdnYJsobWMzLuo7e+CEc244kOe+5mCtxISQ0PEbjX7
	jFSEieEU7MM6KWwloO81f2Fk8VJMSGWHzFhgEiV57bF7JdQYROdwcIc7Z6fP0l7i3FOn
	xAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p/9Yf/RAHDV4+WMvDD3FCFQcrHnjFXq7IjafHM3UCB0=;
	b=e9P5TovXt1zvdFKfSo3qxTKX0PB0aGz+7O5OSY5rMO/BTK8j0GogrU7EBExCyNrs85
	4ETHzMM6IluxHxQcUuLqACkOuT0u9wykfGKa5lFChKkJ2jDJbzMYluXDEglTG3vxbcso
	7msXIzJpbPUewibmz+Npw9jJYVtKbLCTjURSLbKRJOyzSumHGU2e5XvEqqX5eVOsNpnZ
	KKqeimbHKmIgXOPlUUJMhTFrNQqGgTqV0xu2Hfmn1ZQ6eYaujs7d26xP5zlqc/3BeU4E
	Zb/64YohGib5k2VRg9v/VLqC85XXyrCXIX2z+6b9N7e80JT1jnUmacTtZnLjKQz8C5fB
	cebQ==
X-Gm-Message-State: AA6/9Rla9R73wSOwktNDVXEcMLLnK9DPyG3l10V20F0UzX0OTHyoebvdy9Z40kCLEXFITSy/M6mkMfEEL0BlTXiI
X-Received: by 10.36.133.65 with SMTP id r62mr13737511itd.29.1475752148878;
	Thu, 06 Oct 2016 04:09:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 6 Oct 2016 04:08:48 -0700 (PDT)
In-Reply-To: <af4989df-0bc6-55b8-fd44-8a696db3c174@jp.fujitsu.com>
References: <1475735370-22935-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0La6k5GVtoHWUWvTnYcePMCSPLXGunkZvBoZVuP6YnJTLQ@mail.gmail.com>
	<af4989df-0bc6-55b8-fd44-8a696db3c174@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Oct 2016 12:08:48 +0100
Message-ID: <CAJTo0LbsncGZE+PAXX+kRdG6bdJz+neTA-ssYxAGnzGeG-1djg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: Upgrade 20160126 -> 20160920
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
X-List-Received-Date: Thu, 06 Oct 2016 11:09:07 -0000
Content-Type: multipart/alternative; boundary=94eb2c05b7469c74d3053e30525c

--94eb2c05b7469c74d3053e30525c
Content-Type: text/plain; charset=UTF-8

On 6 October 2016 at 11:54, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> Delete because they've all been merged upstream, or because they
>> conflict and you don't want to rebase?
>>
>> Delete the unnecessary patch files because
> 1. Some of patch files have been merged into upstream.
> 2. Upstream drop some test cases where these patch adapt to, so the patch
> files become unnecessary and nowhere to adapt.


Please list these in the commit message.


> The patches I looked at either had no or pending Upstream-Status, so I
>> can't trivially check that they have been submitted upstream and are now
>> redundant.
>>
>
> Did you mean that Upstream-Status should be added for each patch file ?
>

For all remaining patches that would be very useful, so we can identify
patches which are backports / inappropriate for upstream / should be
submitted upstream.

Ross

--94eb2c05b7469c74d3053e30525c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 October 2016 at 11:54, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto=
:fan.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Delete because they&#39;ve all been merged upstream, or=
 because they<br>
conflict and you don&#39;t want to rebase?<br>
<br>
</blockquote>
Delete the unnecessary patch files because<br></span>
1. Some of patch files have been merged into upstream.<br>
2. Upstream drop some test cases where these patch adapt to, so the patch f=
iles become unnecessary and nowhere to adapt.</blockquote><div><br></div><d=
iv>Please list these in the commit message.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The patches I looked at either had no or pending Upstream-Status, so I<br>
can&#39;t trivially check that they have been submitted upstream and are no=
w<br>
redundant.<br>
</blockquote>
<br></span>
Did you mean that Upstream-Status should be added for each patch file ?<br>=
</blockquote></div><br>For all remaining patches that would be very useful,=
 so we can identify patches which are backports / inappropriate for upstrea=
m / should be submitted upstream.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05b7469c74d3053e30525c--
