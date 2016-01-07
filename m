Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4F260112
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 09:44:19 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 1so199803850ion.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k+/XdbYMmsNJO+LECea9JBNh3ymQ7TTnJrGm1tCOBzE=;
	b=tsPUDZZQOjYiwkdeIs9H2yB5Q6RpcGM0u/z9NNTTklyA60w9tDfn5NW8pIL2KH3Hab
	cVJ/19JEDIW1bTwZwOatFZsXAvM6bh+xz0VvoTC9vZhMFBuwfTHP4A0LRJXR+1OeAY9O
	uEHT78i6Q+R7brE7/3r2DGHgaz1Cf2HDQaSvbz/u8leNg4xTmKGv7vhWnuB2XMEuUB5x
	W+o/2Zl5vtaAOHOvnpeJT/NLunKrWKzsaMB2CaJk08e4SZ5sW48zNPscDX4zsv08+d8U
	58ZA5WJ9xBEbwrUsz+T8ZNBNKQccKhjvgiBKSYpc1AY139G/akzCVWujgTURb5+igkUz
	owjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k+/XdbYMmsNJO+LECea9JBNh3ymQ7TTnJrGm1tCOBzE=;
	b=W99MqUaShMLcLu6NocsPLuoNmnZCLxn36m+g8WphTPlQraqlN3lN6ojnRPUqj9td5g
	KBKiLzaqNESQNhf+x85eyOn9RcU68DAPcyyniAB/bwcCay1GQCjLY/6FHqEFapkP7pce
	ORuH3aahluOAuSoTQB+yDhVAPtXvQQW6b9Sb4GEhhpJ1dSe/4E+dEdbbak/39uFH+gpE
	N0BFJ01k5CYFp21FAeJJKs5oUBlwisjC5R0YUGfdkxRz/ps42qVRFkbN53Aa81W/1isX
	Q3LfbxNTcQhUc2qvwn/ziYdXtA4pofjQME3PUcPZuytj6B+GCzp3PsrejSaEXl+NT8Em
	gtsA==
X-Gm-Message-State: ALoCoQlvKZMjOduaBRciVZPMC6sYlqBJzJGkAM1BYjUPLV4hx6u4mQIJDchnW19gt1/x5RHt+d5bPYrISQgaCxLue7RRHMaZiaEYqtOInAnXX8Ug/X8pPLQ=
X-Received: by 10.107.3.154 with SMTP id e26mr88679397ioi.99.1452159859843;
	Thu, 07 Jan 2016 01:44:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 01:44:00 -0800 (PST)
In-Reply-To: <43647F23-7669-45EF-952E-973D73AE7CF3@gmail.com>
References: <1452072169-1415-1-git-send-email-ross.burton@intel.com>
	<43647F23-7669-45EF-952E-973D73AE7CF3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 09:44:00 +0000
Message-ID: <CAJTo0LbqCYgfO1NpyE3_bM-oWBYdAPy=cvdn3sBekb+ooxrD1Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: enable compatibility libraries by default
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
X-List-Received-Date: Thu, 07 Jan 2016 09:44:23 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a9a7c9e0528bb5016

--001a113ec10a9a7c9e0528bb5016
Content-Type: text/plain; charset=UTF-8

On 7 January 2016 at 01:08, Khem Raj <raj.khem@gmail.com> wrote:

> I think it would be good if we could get them to move. How many such
> packages do you see ?
>

The straw that broke the camels back, so to speak, was the recent post
about rsyslog where enabling a systemd-using PACKAGECONFIG didn't actually
work as it was using the older names.  The overhead of the compat libraries
is fairly negligible and can be turned off if required.

Ross

--001a113ec10a9a7c9e0528bb5016
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 January 2016 at 01:08, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":1wp" class=3D"a3s" styl=
e=3D"overflow:hidden">I think it would be good if we could get them to move=
. How many such packages do you see ?</div></blockquote><div><br></div><div=
>The straw that broke the camels back, so to speak, was the recent post abo=
ut rsyslog where enabling a systemd-using PACKAGECONFIG didn&#39;t actually=
 work as it was using the older names.=C2=A0 The overhead of the compat lib=
raries is fairly negligible and can be turned off if required.</div><div><b=
r></div><div>Ross</div></div></div></div>

--001a113ec10a9a7c9e0528bb5016--
