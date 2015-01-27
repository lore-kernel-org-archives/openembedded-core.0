Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id ED336718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 15:30:14 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id i8so12421082qcq.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 07:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W84czojcDEX3k4XrehAYmXtxbxanDAxPTkTkz0RbJ8Q=;
	b=K94UqSSOjgXm1HXzVYdSIHQL9ZFRqcnVMjCtWwoVPBwMRuQJnCjUtu+o60Y7aFwbjA
	rMT038xZhqAcGMPEvgcAzdrpqBL3B0Bg8jKa0mmBE4hR/5/jA4hFfwFUPbLzfuI6o9JL
	VpYhgO4itMu+z9xennnNBvsDswICcAJCFzV/To7aDKQ1K1XTtDGze6bIMiexIG9M1hBV
	N9X8+uTTAAzkTvLDYPbmmxSZicIMyJo2egrZ4kJzs49yp4DwS7+OEYtf/lu+tm2KytKo
	ZePLRRnFnXacVbaiNOEDT0eO1P5PrDP1ha41PDx7gt2l/VNW1Sl9ktCCfwbMgClWLPpQ
	2ulQ==
X-Gm-Message-State: ALoCoQn9ovlS/eZ5/f2nr2zD2Uc75PdFHLY3iPVrC0S6wxi6R5PzMCWmyAoMD//zQ9oHz2rK0dop
X-Received: by 10.229.80.3 with SMTP id r3mr1125631qck.23.1422372614835; Tue,
	27 Jan 2015 07:30:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 27 Jan 2015 07:29:54 -0800 (PST)
In-Reply-To: <54C7AC94.5040400@pseudoterminal.org>
References: <54C7AC94.5040400@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Jan 2015 15:29:54 +0000
Message-ID: <CAJTo0LZqzaSP=3MugESPsot8RLksde3126M6LZS9AzC6gH=tEA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should the GStreamer 1.0 _git.bb recipes be removed?
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
X-List-Received-Date: Tue, 27 Jan 2015 15:30:20 -0000
Content-Type: multipart/alternative; boundary=001a1133cb78722bf1050da3eecf

--001a1133cb78722bf1050da3eecf
Content-Type: text/plain; charset=UTF-8

On 27 January 2015 at 15:19, Carlos Rafael Giani <dv@pseudoterminal.org>
wrote:

> right now, for each GStreamer 1.0 package, there is a .inc file, a _git
> recipe, and a versioned recipe. The _git recipes made sense when GStreamer
> 1.0 was first introduced, because this happened during the 1.0 -> 1.2
> version change, and 1.2 brought many essential enhancements, so many people
> wanted to build the git version. However, these days, I don't think the git
> versions are in such high demand. As a result, their SRCREVs haven't been
> updated for a very long time.
>
> Since this is pretty much dead, how about removing these recipes?
>

I was wondering this just this week and have no objection.

Ross

--001a1133cb78722bf1050da3eecf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2015 at 15:19, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudoterminal.or=
g</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ub" =
class=3D"a3s" style=3D"overflow:hidden">right now, for each GStreamer 1.0 p=
ackage, there is a .inc file, a _git recipe, and a versioned recipe. The _g=
it recipes made sense when GStreamer 1.0 was first introduced, because this=
 happened during the 1.0 -&gt; 1.2 version change, and 1.2 brought many ess=
ential enhancements, so many people wanted to build the git version. Howeve=
r, these days, I don&#39;t think the git versions are in such high demand. =
As a result, their SRCREVs haven&#39;t been updated for a very long time.<b=
r>
<br>
Since this is pretty much dead, how about removing these recipes?<br></div>=
</blockquote></div><br>I was wondering this just this week and have no obje=
ction.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a1133cb78722bf1050da3eecf--
