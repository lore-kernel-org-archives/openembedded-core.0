Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id B90856E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 14:57:25 +0000 (UTC)
Received: by igl9 with SMTP id 9so58631385igl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XDx4cPgAh1veJwbSgX0ueDH4iMnm+SCludIOQeineLA=;
	b=ixe0JUUjAIiMWBgH9tF4vvWuRckBMsrcMWiRtSxpA1a+X2CjQlmQwei4kZR1gnkZ71
	mSwmBhdK997D+4GWorR/jE/TO3PXlR52nP7wM1piiFhoZP6RYwsWEGHsi+ChpZ5/7rMG
	qD5sLfmHAIH2K0cDAU+0bQSK/4SpoKjT9YH0aoXmJhGTPxkAIdwid58Z8GjNZDhtphCV
	ttIrgagQUKx2fvcbZ4fvgVlvcG5LtQqgKiuv1BKlGVaCSN17d1EnqRq+UFbA5gigNKP/
	CP2Py8nKphZRHuU/pH7kfsLRRhenCKf8gmrQYKrt1VoJDi/bZOoxD/TwXfGoJc+OPXTu
	UeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XDx4cPgAh1veJwbSgX0ueDH4iMnm+SCludIOQeineLA=;
	b=cQZvfFdAJXjqF4ivZd7UxqhwcJweu1liZZhK51J5Klgm+2brf65Cx92Zv3I6wRzgBQ
	vPHBWpZWORd71OXUfEEtaoDWLZzp7+UsQmpb8Nl6NT3JeKjhEoVrpTVGBkbTQBwx2Jpx
	QerFKCxQyJ6CnkedLTE/9zpfEXny06o3rEdrhX1MPBVTMeGj/djYinzSVU2DMQBZlB3x
	Sf0pnKISnYm6Du87igHg0qOa22DxODXVsNFZiVrRueBNIdDimZuwy3ri3xl+bxtuXrH3
	pi7aIwzyGAJMVTC49HP95Iamuhp6fr89oYpswov+i+12g487ILlstKxVYWtFSZmiU0b5
	Y4JQ==
X-Gm-Message-State: ALoCoQlh8AMnpzB43auYGPAk+RZUsxuvpmsuGkdL5wGG7btBD5702p6Rmyr8qubi9gkVgDuFWwvs
X-Received: by 10.50.30.69 with SMTP id q5mr5090229igh.78.1447685845326; Mon,
	16 Nov 2015 06:57:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 06:57:05 -0800 (PST)
In-Reply-To: <1447537483-22167-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447537483-22167-1-git-send-email-adrian.freihofer@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 14:57:05 +0000
Message-ID: <CAJTo0LbS8osFq8C8D5offYjoF2SnCXPMbE-MTyJo=+E3nXdM7Q@mail.gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] python-pickle: Add rdepend python-db
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
X-List-Received-Date: Mon, 16 Nov 2015 14:57:27 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c8ecea20524a9a005

--047d7bdc1c0c8ecea20524a9a005
Content-Type: text/plain; charset=UTF-8

On 14 November 2015 at 21:44, Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

>  meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
>

As the comment at the top of the file says:

# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time
I regenerate the file.
# Generator: '../../../scripts/contrib/python/generate-manifest-2.7.py'
Version 20110222.2 (C) 2002-2010 Michael 'Mickey' Lauer <
mlauer@vanille-media.de>

Please edit the script and re-generate the manifest, then send the patch.

Ross

--047d7bdc1c0c8ecea20524a9a005
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 November 2015 at 21:44, Adrian Freihofer <span dir=
=3D"ltr">&lt;<a href=3D"mailto:adrian.freihofer@gmail.com" target=3D"_blank=
">adrian.freihofer@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex">=C2=A0meta/recipes-devtoo=
ls/python/python-2.7-manifest.inc | 2 +-<br></blockquote><div><br></div><di=
v>As the comment at the top of the file says:</div><div><br></div><div># WA=
RNING: This file is AUTO GENERATED: Manual edits will be lost next time I r=
egenerate the file.</div><div># Generator: &#39;../../../scripts/contrib/py=
thon/<a href=3D"http://generate-manifest-2.7.py">generate-manifest-2.7.py</=
a>&#39; Version 20110222.2 (C) 2002-2010 Michael &#39;Mickey&#39; Lauer &lt=
;<a href=3D"mailto:mlauer@vanille-media.de">mlauer@vanille-media.de</a>&gt;=
</div><div><br></div><div>Please edit the script and re-generate the manife=
st, then send the patch.</div><div><br></div><div>Ross=C2=A0</div></div></d=
iv></div>

--047d7bdc1c0c8ecea20524a9a005--
