Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
	[209.85.217.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEA561C32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 13:09:33 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id p7so1393048vso.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 06:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x6IjDsTmv0ZZD6USlR1Sq3AZqzI5RoNwRHYKH37JEqM=;
	b=kOHAbVQnCWLkxJnFpTmqfpIwwNFk/AMqOCMkfOlin2Jdbu5IPijf7iVe3fFt13MS9z
	T6P/eYxgdKneADlpuNXsMfmMGN5wofgMv78VABzSpFWFn9jzQndt9yziVS1dyPCpQsPG
	2D1wVK3EKUVTpSEem2w68+JcGcTcMsAFUCGVsb8nsmlJn2npmo43EVEuDGXr2O7Mwtmg
	Dg5Cm12LYEE1USTeSq7efI0OTVmPpZWKwUfX5GWG6kgPMzz8nMRYa9+yF8qZhoO+BHET
	fM3p58+mKAxgRUKnETBYfTKUN+PcTifPzHnkft5irNzjtnsBkEBYx4uaV/IjY+FefktL
	Dfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x6IjDsTmv0ZZD6USlR1Sq3AZqzI5RoNwRHYKH37JEqM=;
	b=g+lgBfM4G4YB/3UrtqZFG6+J8g/8PF2yA+l5RQfkMg3gZmr5+m0blPxbtdm5qWM7zC
	BwkSVF4LG2EIFBdE50nLsijNktzk2Vmap0D3K4dqYgm7epr1eWhK6fbJTeFCD7Hk5rJA
	0xl98WgUrcj3POsfokBCsBDX7KcEeJPASAui2IMqVl7E/kIZzCRh/MQUXQHNTVQIr4pC
	1ATSIxhQzfF7Czu/p3o3/PV5GdyptLRPjJA1dN7Qb8o8CWGy1cM9ldpCzIVAENGb8b47
	236kv0WvXGDSilEZ+rHf1FljjYhShM+iIbLC13LIHIfaYEi5kyx3TaafKXVTP+TMKX1l
	js2g==
X-Gm-Message-State: ANhLgQ1qj5W2g0W3tQsBGJuHIWpSktQZKsB5iBqRocQznbFSisy0BpJS
	C/2kA6AyH5B4Bp6S/p18PJTzGEdqpywqR7RhC8v9DQ==
X-Google-Smtp-Source: ADFU+vuvBOGGe+8enwfTCmusiDUiXBYTMRm1LwMy9MR72jP7vpcSkFO2diLPQtQYp32cBnyx8XkypGgm8uOUvqLUCXk=
X-Received: by 2002:a67:d03:: with SMTP id 3mr4415747vsn.35.1584018574486;
	Thu, 12 Mar 2020 06:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200312085608.Horde.kbPh9KWkZJR4Zi-lry-_TrN@crashcourse.ca>
In-Reply-To: <20200312085608.Horde.kbPh9KWkZJR4Zi-lry-_TrN@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2020 14:09:23 +0100
Message-ID: <CANNYZj-KNVxXWjTWqc-a6Xe4YqBx4aZkuFAkNjQb3ZhBL-hUcw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: simplest command to display which layers are applying the same patch?
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
X-List-Received-Date: Thu, 12 Mar 2020 13:09:34 -0000
Content-Type: multipart/alternative; boundary="0000000000007334e405a0a810b5"

--0000000000007334e405a0a810b5
Content-Type: text/plain; charset="UTF-8"

I think 'bitbake -e recipe', and then searching for SRC_URI in it should
show which layer applies which patch.

Alex

On Thu, 12 Mar 2020 at 13:56, <rpjday@crashcourse.ca> wrote:

>    just got from colleague a miniscule snippet of build output:
>
> ERROR: openssl-1.0.2u-r0 do_patch: Command Error: 'quilt --quiltrc ...
> snip ...
> Output: Patch Use-SHA256-not-MD5-as-default-digest.patch is already
> applied; check your series file
>
> the problem seems obvious ... more than one layer being pulled
> into the build is trying to apply the same patch to that version
> of openssl.
>
> i don't have access to that build system, but i'm not surprised
> as it appears that at least three layers (oe-core, vendor, and
> wind river linux fixes layer) all supply that very patch.
>
> what is the simplest command from way back in "morty" that
> could display something as clear as, "layer A already applied
> this patch, now layer B is trying to apply it as well?"
>
> if it's in the log file, i can just point the person at that,
> short of getting access to the build system and finding it
> myself.  thank you kindly.
>
> rday
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007334e405a0a810b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think &#39;bitbake -e recipe&#39;, and then searchi=
ng for SRC_URI in it should show which layer applies which patch.</div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 12 Mar 2020 at 13:56, &lt;<a href=3D"=
mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 =C2=A0just got fr=
om colleague a miniscule snippet of build output:<br>
<br>
ERROR: openssl-1.0.2u-r0 do_patch: Command Error: &#39;quilt --quiltrc ...=
=C2=A0 <br>
snip ...<br>
Output: Patch Use-SHA256-not-MD5-as-default-digest.patch is already=C2=A0 <=
br>
applied; check your series file<br>
<br>
the problem seems obvious ... more than one layer being pulled<br>
into the build is trying to apply the same patch to that version<br>
of openssl.<br>
<br>
i don&#39;t have access to that build system, but i&#39;m not surprised<br>
as it appears that at least three layers (oe-core, vendor, and<br>
wind river linux fixes layer) all supply that very patch.<br>
<br>
what is the simplest command from way back in &quot;morty&quot; that<br>
could display something as clear as, &quot;layer A already applied<br>
this patch, now layer B is trying to apply it as well?&quot;<br>
<br>
if it&#39;s in the log file, i can just point the person at that,<br>
short of getting access to the build system and finding it<br>
myself.=C2=A0 thank you kindly.<br>
<br>
rday<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000007334e405a0a810b5--
