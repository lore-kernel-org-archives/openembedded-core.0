Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 06DAB608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 10:50:02 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so283663qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 03:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DyZswuO21qHimfI24wpAR90b6coWwY9b1OibjxJbOUA=;
	b=YsRWBRiabQsT5km0q9mNk0ziwn1e2f6ze1XGmOsveaSqpAI4P5kvcyUyFgDCt8R4X2
	SKZ+kiZi1DLrRQE/hewXCuz2soJIulpv7Ni3fsVtrSedfzjepb+hS3jpT7TySzIW8K6c
	bkw2kmemAHMkZ5usw8Hyfu4Gd1KLq6Q6I8pYg1Vhuj1CGWzXQ3PsUXQq2G48ttMtn/AV
	IB2UmWpV+FfG1jPzPPP/xFLXowmEO/lCFfzLRe/+1WEybBOXTTfeHXLPpVXAJ3V5gN/t
	hud3tgZFfbnbDOWeNwuJL+i5Y0A4qDf+QKK34FIADykJ5N6YyNTpUate/zP/wuYgBF4R
	MJ+A==
X-Gm-Message-State: ALoCoQnMcbHAw1QA5FHgiHuzQmXmwxH49/TKUBi4sPAnKExXldF4255xDKGmJOyJuCvF6j/O8z2s
X-Received: by 10.55.23.224 with SMTP id 93mr18408266qkx.13.1439981402478;
	Wed, 19 Aug 2015 03:50:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 03:49:43 -0700 (PDT)
In-Reply-To: <CAHiDW_EKTkPcQ+NVP9AocSfvpusiBtwp25rpkTDr5Zn0Ut=A4Q@mail.gmail.com>
References: <cover.1439471616.git.jussi.kukkonen@intel.com>
	<10269744a7e91ddf317b041f70d5810ae5c94c36.1439471616.git.jussi.kukkonen@intel.com>
	<20150818083635.GE2458@jama>
	<CAHiDW_EKTkPcQ+NVP9AocSfvpusiBtwp25rpkTDr5Zn0Ut=A4Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 11:49:43 +0100
Message-ID: <CAJTo0LazdOp-2BDf0cb3cXx3K7CvZPZwYcD-YuaJM1W033Db8A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
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
X-List-Received-Date: Wed, 19 Aug 2015 10:50:04 -0000
Content-Type: multipart/alternative; boundary=001a1147a0befa64ca051da7cbc0

--001a1147a0befa64ca051da7cbc0
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 09:17, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> >> * License is now GPLv3+
> >
> > What about GPLv2 version which was preserved (IIRC) in prevous patch?
> >
> > Why did you decide to drop it now?
>
> Mostly because of Ross' comment "Is screen considered sufficiently
> core that we should maintain both GPLv2 and v3 recipes?  I'm not
> convinced it is".
>
> I did try to coax people to explain their thoughts in a little more
> detail (because I wasn't sure what exactly they were saying) in my
> reply on Aug 12 but no-one did... So I figured it's better to talk
> with patches: I believe maintaining the GPLv2 version is not a great
> use of anyones time (and I think it's fair to say that the recipe
> wasn't receiving the sort of attention it would have required) and
> making a developer tool like that GPLv3 shouldn't be a problem to most
> people.


FWIW, I still agree with my statement and with Jussi here.

Ross

--001a1147a0befa64ca051da7cbc0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 August 2015 at 09:17, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
&gt;&gt; * License is now GPLv3+<br>
&gt;<br>
&gt; What about GPLv2 version which was preserved (IIRC) in prevous patch?<=
br>
&gt;<br>
&gt; Why did you decide to drop it now?<br>
<br>
</span>Mostly because of Ross&#39; comment &quot;Is screen considered suffi=
ciently<br>
core that we should maintain both GPLv2 and v3 recipes?=C2=A0 I&#39;m not<b=
r>
convinced it is&quot;.<br>
<br>
I did try to coax people to explain their thoughts in a little more<br>
detail (because I wasn&#39;t sure what exactly they were saying) in my<br>
reply on Aug 12 but no-one did... So I figured it&#39;s better to talk<br>
with patches: I believe maintaining the GPLv2 version is not a great<br>
use of anyones time (and I think it&#39;s fair to say that the recipe<br>
wasn&#39;t receiving the sort of attention it would have required) and<br>
making a developer tool like that GPLv3 shouldn&#39;t be a problem to most<=
br>
people.</blockquote></div><br>FWIW, I still agree with my statement and wit=
h Jussi here.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a1147a0befa64ca051da7cbc0--
