Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 208AD7324E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 16:52:12 +0000 (UTC)
Received: by qget53 with SMTP id t53so11636286qge.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 09:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vhFadmhKc01aVqQXfzLsK/awSC0X9Yb838EC9AJAgVs=;
	b=UWEGd2eKGF83T0FVgfwzC4SqR3X93Dqp4BbJn41yIMYUfJ6ArH2DIzuU5lV8d4jAP9
	Z+qPbanRUCh0kPLSjnPdYKFZMQ5/txn6HyhMzBnqb6j7Q1UlooHX0x7nCdbjklAeQNBF
	QddRiRJzcKoNum0TdEpRkBHD1PjPtKh9m83lkm9XtKc245CPG2roVokbQ+x55HNulXCX
	kjwaIEF3rpUtjOdlUJCf8qMLA66AXTiv9gA2+d2z5NhQ2g+VsBQxgb3/o83WKpypn7lw
	ZOqXhoSR6KTfUOqZgNjyya8LJRhI6+gIcUbdyp3I9OC9c9KFM1SO0m69b9wBvvDxF0BX
	6Acg==
X-Gm-Message-State: ALoCoQn73AXvoVz5kOP4BxHsqohsTpQwAW5PwAnmlsL/z+obEeNX9Gu26MwTtFylhLxJj3C//F9k
X-Received: by 10.140.88.35 with SMTP id s32mr11807265qgd.59.1432313533295;
	Fri, 22 May 2015 09:52:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 09:51:52 -0700 (PDT)
In-Reply-To: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
References: <1432196500-13462-1-git-send-email-ismo.puustinen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 17:51:52 +0100
Message-ID: <CAJTo0LYupeaSkZPF5Ucb9pOc7DAxa5VT_YN9ntrWKyTDaXbndg@mail.gmail.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Fix quotes in several recipes
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
X-List-Received-Date: Fri, 22 May 2015 16:52:16 -0000
Content-Type: multipart/alternative; boundary=001a11c11d025c04a50516ae7b77

--001a11c11d025c04a50516ae7b77
Content-Type: text/plain; charset=UTF-8

On 21 May 2015 at 09:21, Ismo Puustinen <ismo.puustinen@intel.com> wrote:

> I recently wrote my own parser for BitBake recipes and ran it over the
> recipes
> in openembedded-core. I found a number of bugs in my parser, but I also
> saw some
> "patterns" in recipes which I thought were against the spec but still
> allowed by
> the BitBake parser.
>
> This patch series fixes quotes in variable values. Specifically, it
> disallows
> having unescaped double quotes inside a variable value that is surrounded
> by
> double quotes. This patch series in not critical in that sense that
> everything
> should work still the same way it used to. However, if the BitBake parser
> is
> ever made stricter or the BitBake User Manual written to have less
> ambiguity on
> the subject of the .bb file format, having these fixed will help in
> transition.
>
> Of course, it may be that I'm mistaken and the quoting around variable
> values is
> not even supposed to have a meaning in the variable definition, in which
> case
> the whole patch set can be disregarded.
>

This is going to sound really petty... but 99% of assignments in the
metadata use double quotes so for consistency the patches were possible
should use double quotes on the outside and single quotes on the inside.

And yes, bitbake's string parser isn't a strict as you'd expect.

Ross

--001a11c11d025c04a50516ae7b77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 May 2015 at 09:21, Ismo Puustinen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ismo.puustinen@intel.com" target=3D"_blank">ismo.puustinen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":al1" cla=
ss=3D"a3s" style=3D"overflow:hidden">I recently wrote my own parser for Bit=
Bake recipes and ran it over the recipes<br>
in openembedded-core. I found a number of bugs in my parser, but I also saw=
 some<br>
&quot;patterns&quot; in recipes which I thought were against the spec but s=
till allowed by<br>
the BitBake parser.<br>
<br>
This patch series fixes quotes in variable values. Specifically, it disallo=
ws<br>
having unescaped double quotes inside a variable value that is surrounded b=
y<br>
double quotes. This patch series in not critical in that sense that everyth=
ing<br>
should work still the same way it used to. However, if the BitBake parser i=
s<br>
ever made stricter or the BitBake User Manual written to have less ambiguit=
y on<br>
the subject of the .bb file format, having these fixed will help in transit=
ion.<br>
<br>
Of course, it may be that I&#39;m mistaken and the quoting around variable =
values is<br>
not even supposed to have a meaning in the variable definition, in which ca=
se<br>
the whole patch set can be disregarded.</div></blockquote></div><br>This is=
 going to sound really petty... but 99% of assignments in the metadata use =
double quotes so for consistency the patches were possible should use doubl=
e quotes on the outside and single quotes on the inside.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">And yes, bitbake&#39;s s=
tring parser isn&#39;t a strict as you&#39;d expect.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c11d025c04a50516ae7b77--
