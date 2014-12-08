Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id B2BD4724AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 13:47:04 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id bm13so3384379qab.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 05:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xjZFIHZJAhTsInAfAHwnNJp0vpxhID6wNCDWV49Rb1o=;
	b=J8FBRMUw2VjBgR1Yu9lymbvks84aKcI2pTLCOQ1i8EqsVFs68U6k3wdxJ2/fpekfx5
	IgOD2/1s9FBGRiWP7biUx/fSKiC26Bibjrp+5//sPbOkIOc9vSpIyGXxcmvEblj01sbK
	OjfQoZa8lAXEscIsvYuyAFqFGs8qX8zOz92hZynWp8O1ZhvtDfR8RjAIq5/LuGCAUnCo
	UPeJnkIsLdijkmEhCnumzxKiQUX8T2Y11JepBYaUPtjwQ6hi3k6M3d0lO1l40RjX6Wug
	AsCBt8kLJiXM5OM5qL4JIaIhpJmta4Rk26q0+H/3yyq3TO/NjShqXk7nG5ua79ny3la5
	r0Fw==
X-Gm-Message-State: ALoCoQlw+PSX4eY4CCShsvvhtTW3Z27wA5NKI3h7/XB2cEDRJRR/ffQsIZ7fAbfS6/hJkt4u6Q50
X-Received: by 10.224.60.74 with SMTP id o10mr45425238qah.22.1418046424654;
	Mon, 08 Dec 2014 05:47:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 05:46:44 -0800 (PST)
In-Reply-To: <FB5AD677-B717-4E86-A600-524D77A13F09@dominion.thruhere.net>
References: <1417851531-3540-1-git-send-email-sgw@linux.intel.com>
	<FB5AD677-B717-4E86-A600-524D77A13F09@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 13:46:44 +0000
Message-ID: <CAJTo0LbKLrmVNiMs4oBvq1rbVhjCCdzR0CHgy2sJjRrb5uRj8A@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHi v3] procps: Upgrade to 3.3.10
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
X-List-Received-Date: Mon, 08 Dec 2014 13:47:05 -0000
Content-Type: multipart/alternative; boundary=001a11c3f53e6aca5c0509b4a96c

--001a11c3f53e6aca5c0509b4a96c
Content-Type: text/plain; charset=UTF-8

On 6 December 2014 at 14:37, Koen Kooi <koen@dominion.thruhere.net> wrote:

> If you feel bored, there's a stray backslash in DESCRIPTION and the '+='
> for EXTRA_OECONF can be a regular '='. Next time I'll try to catch
> everything in one go :)


I thought a v4 was getting silly so fixed these as I merged it... but:

ERROR: Function failed: Fetcher failure for URL:
'file://fix-configure.patch'. Unable to fetch URL from any source.

Sorry Saul!

Ross

--001a11c3f53e6aca5c0509b4a96c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2014 at 14:37, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.thruhere.ne=
t</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex">If you feel bored, there&#39;s =
a stray backslash in DESCRIPTION and the &#39;+=3D&#39; for EXTRA_OECONF ca=
n be a regular &#39;=3D&#39;. Next time I&#39;ll try to catch everything in=
 one go :)</blockquote></div><div class=3D"gmail_extra"><br></div>I thought=
 a v4 was getting silly so fixed these as I merged it... but:</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">ERROR: Function fai=
led: Fetcher failure for URL: &#39;file://fix-configure.patch&#39;. Unable =
to fetch URL from any source.<br></div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Sorry Saul!</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c3f53e6aca5c0509b4a96c--
