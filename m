Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id A982961938
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:28:13 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id 7so1507019vsr.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ntVvrCdyxXnqea0RDD0Ll7xxKwX2lfy5f6Bh8pbtTp8=;
	b=qeaIfiH9bD/QjR4+FJs1HU4fOaRpQxJpkIp3Ee3GWCQl3mVy7AAA089YWZJNqQg3Rx
	AGKT1QGfFKt15Y1j2OgdArsXAtp9zqru5KlNtbfQC73C7MkW6b0AlS5yTj/OUafkhMB1
	+efkodHrsBAj8A88SWxOa/mJH7ZtAdBR3shF0ZCa0fKL8fx6Zx5hh94mvalrLlWsA32Z
	+N4lok6NqGGAFudjRhLeJzmGAsF1TegJjOTb4GbWUfnzXKHdYhV/NBag0WgqHSR59ulZ
	xtWP1uemlvIkvjs8Q43PR97M4n49PmMep4DSKYlECrY8PF2hRCxZxGh0RWHQ0GJ9hAES
	p+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ntVvrCdyxXnqea0RDD0Ll7xxKwX2lfy5f6Bh8pbtTp8=;
	b=ISNHODoIN+1pwRrMXnc0n1qJkcJPHboWjYc2qJBWEnVmEMWlRa/5rQtweCn4L661or
	0b1MmsG5spd0un+iI+x4pO46m+Qiidzq3j6BrUKa2/eCdKk++WryQYsyQ3su7wVQKJp+
	lvqINyXQFGnuqNs9R2YOvWvTIYC2+EvF5pk2zgtYZ/25s2KhCuq8jvQawdJ1IuaG+oWy
	NCy5SCwytJzIzqYTg5SA/7wj3bC9U7dCrToLZ2T9vWCWOL2S1oJCH9ukuvbU0j2b/TTg
	ZtJBQwPM+4AOIZPeK1hR4dddGF+XM1N7wyqXPt8ZczkCWhyWZveDrmCEdEY+IZC/7fqp
	P+eQ==
X-Gm-Message-State: ANhLgQ0ygjYt1xwANsmPYwYO9KxhQnaDZNc96i6wGpvgqUJYgUi949YF
	pYcXRFoSUjds1QmbgZ9u5Y0E1hRXwRyKdVCjFdVDLw==
X-Google-Smtp-Source: ADFU+vsP5pr0qkQ5ngMbZLb1PrJf3vuAxBgiswQr9obJyvubrppklgvRUTyLbPPypwADfoDqWWsOUCOUzXFTQXLujBs=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr2039761vsq.94.1582882094482; 
	Fri, 28 Feb 2020 01:28:14 -0800 (PST)
MIME-Version: 1.0
References: <20200226183902.3616626-1-trevor.gamblin@windriver.com>
	<d3d3f4a4-e792-397c-4444-c39630afaf74@windriver.com>
	<2fd5b0c062bfee215cd7a4d15789a20293cee8aa.camel@linuxfoundation.org>
	<6ac82a00-615a-4cc5-c4b9-46f37e12bbac@windriver.com>
In-Reply-To: <6ac82a00-615a-4cc5-c4b9-46f37e12bbac@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Feb 2020 10:28:02 +0100
Message-ID: <CANNYZj8bHKVgo=gUzYsATzZgSa0KC01851seBkg8yDcjKdDqzw@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgpg-error: upgrade 1.36 -> 1.37
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
X-List-Received-Date: Fri, 28 Feb 2020 09:28:13 -0000
Content-Type: multipart/alternative; boundary="000000000000f6888a059f9f7497"

--000000000000f6888a059f9f7497
Content-Type: text/plain; charset="UTF-8"

Patch sent. :)

Alex

On Fri, 28 Feb 2020 at 00:42, Trevor Gamblin <trevor.gamblin@windriver.com>
wrote:

>
> On 2/27/20 6:14 PM, Richard Purdie wrote:
> > On Thu, 2020-02-27 at 11:24 -0500, Trevor Gamblin wrote:
> >> Looks like I got beat by a day!
> > Does your version work on x32 though? :)
> >
> > We need one that does...
>
> They look the same, unfortunately.
>
> Will take a look in between some other tasks, unless Alex gets to it
> first (he usually does, that guy's a machine).
>
> >
> > Cheers,
> >
> > Richard
> >
>

--000000000000f6888a059f9f7497
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Patch sent. :)</div><div><br></div><div>Alex<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, 28 Feb 2020 at 00:42, Trevor Gamblin &lt;<a href=3D"mailto:trevor.=
gamblin@windriver.com">trevor.gamblin@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2/27/20 6:14 PM, Richard Purdie wrote:<br>
&gt; On Thu, 2020-02-27 at 11:24 -0500, Trevor Gamblin wrote:<br>
&gt;&gt; Looks like I got beat by a day!<br>
&gt; Does your version work on x32 though? :)<br>
&gt;<br>
&gt; We need one that does...<br>
<br>
They look the same, unfortunately.<br>
<br>
Will take a look in between some other tasks, unless Alex gets to it <br>
first (he usually does, that guy&#39;s a machine).<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
</blockquote></div>

--000000000000f6888a059f9f7497--
