Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id DFD0D786C6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 13:54:54 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id t22so19237872ioa.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 05:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5a2sgSDWhgCc9EI16qDc5ClYQ4C5oJ7eslOeL6tn4o4=;
	b=ioN4G0+K6H/WanC+thiAKgla4XRf6yoHDXziZqdP7RmH6pOSdlQscbqfNKpeVqpJyv
	WXxviTdfbYkGBY+HK9QbWfmwR6Qgo0txmXZFCIeuBGeIpszIjPf5eECMNfUav4bzEgut
	/nmie66wdOf96hSeVzzz9Bnnkvmvfq2U17Rw3uXmk4jA6tJ7ZHko7uGtHdvQ09uBC2R6
	TtDpKRHIKZYTCJ5Ip/QnsOVRux2u33rAr4p9vmo3RrZo1jxBYcqcoguZhq0GUBjU5IWm
	IaqUSkBjAFmNhNXh+gVkeqIe+oB1XZWfUv6xtGYU8p6OZ94h0rnxCKn4yUCfiD0HHFOn
	9/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5a2sgSDWhgCc9EI16qDc5ClYQ4C5oJ7eslOeL6tn4o4=;
	b=NP0b+ah5L9ako6+PIlpA/7h8rr4mZb1Gyvaw6/dDT0v5W96120/wXygAJ1FmHAHsMx
	LlwO9eq283qdJkMyr14BYuYtU3pBFbWrxh8mCJOR4a9nHV5499zNIdExRaIsIUZFn/Uy
	jHRspNpN+spBOAXxKTnJKMMJcVgFjH8peq4cbJdFPScZvydnwHGe7H9BdiacP2eANtg3
	ZeUihLL2mg23J5AgY8srExtAhCiV4NzZU6bG+Aeg33dMqeefYCm43XM/2GCIPWPltC8y
	DfmfCna5IRmiOaFoqYukSJejyrIPKBy09DU2ntsrGM05MhkzyTQb/oUCrZUmWL+BmESY
	RReA==
X-Gm-Message-State: AKwxytcKn9sQYQf+RIVCO5gkqDDWqXcLP0YCT8CL4IpMaEbWF+sUvcxO
	bIIdefwE+JovaqLQi2X1TuVUgFbpZqw1E7M7nTM8xw==
X-Google-Smtp-Source: AH8x227SLxajO3idELcLZuTvfUPtOa48278nZdAWdLh2iBLjOlHhoJQMCqi4eJomycAo6hzgtQDh+cWm0/oKIqr387Y=
X-Received: by 10.107.32.19 with SMTP id g19mr37784657iog.217.1517493295813;
	Thu, 01 Feb 2018 05:54:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Thu, 1 Feb 2018 05:54:35 -0800 (PST)
In-Reply-To: <e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
References: <90ac077a-5126-fb99-0512-9a12851be994@thecshore.com>
	<CAJTo0LY2whxu8P8u4-U9s7pn6KJZLX53x4ZJ8xH+dN2c6gciyA@mail.gmail.com>
	<e6645328-4252-1a0b-d69c-37578461c5cf@thecshore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Feb 2018 13:54:35 +0000
Message-ID: <CAJTo0LZyLzYWAWcR7WUY+e9u2c=LhdqQg6WU2p8dCsB7umiv2A@mail.gmail.com>
To: "Daniel F. Dickinson" <cshored@thecshore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding a "tiny" DISTRO_FEATURE and having packages build smaller
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
X-List-Received-Date: Thu, 01 Feb 2018 13:54:55 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a4d8b570056426f0c2"

--001a1141a2a4d8b570056426f0c2
Content-Type: text/plain; charset="UTF-8"

On 1 February 2018 at 13:44, Daniel F. Dickinson <cshored@thecshore.com>
wrote:

> I guess the question is would it be useful to have a flag that chooses
> a 'typical' tinyness but can be overridden (I'm think here of avoiding
> having to specify huge numbers of PACKAGECONFIGs for a typical tiny case,
> when really you want most of the 'normal' tinyness with some
> tweaks.  What I'm think is that "tiny" really should just change the
> defaults for PACKAGECONFIG etc, but like the defaults can be easily
> overridden.
>

Well in the idiomatic way the default would be "all the things are on", so
doing a "tiny" build would be just setting PACKAGECONFIG="".

When we're dealing with tiny configurations you can't really say "and this
is what people will want", because that's precisely the problem: you don't
know what someone else will want.

Ross

--001a1141a2a4d8b570056426f0c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 February 2018 at 13:44, Daniel F. Dickinson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:cshored@thecshore.com" target=3D"_blank">csh=
ored@thecshore.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I guess the question =
is would it be useful to have a flag that chooses<br>
a &#39;typical&#39; tinyness but can be overridden (I&#39;m think here of a=
voiding having to specify huge numbers of PACKAGECONFIGs for a typical tiny=
 case, when really you want most of the &#39;normal&#39; tinyness with some=
<br>
tweaks.=C2=A0 What I&#39;m think is that &quot;tiny&quot; really should jus=
t change the defaults for PACKAGECONFIG etc, but like the defaults can be e=
asily overridden.<br></blockquote><div><br></div><div>Well in the idiomatic=
 way the default would be &quot;all the things are on&quot;, so doing a &qu=
ot;tiny&quot; build would be just setting PACKAGECONFIG=3D&quot;&quot;.</di=
v><div><br></div><div>When we&#39;re dealing with tiny configurations you c=
an&#39;t really say &quot;and this is what people will want&quot;, because =
that&#39;s precisely the problem: you don&#39;t know what someone else will=
 want.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a1141a2a4d8b570056426f0c2--
