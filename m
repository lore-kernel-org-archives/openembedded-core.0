Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D75D60722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 17:09:42 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so43175993igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-type;
	bh=V5QheCRKvLGVeOo4fPBYVwMmtc3QyxEawC6389fIBk4=;
	b=qEnVd0cR4SJGfR/Qig05hw6yMtjE/UuSwTJHZwiHy6fldYGrvwm4ArrrAa+PTUQFGE
	hhNnCn7tfY3vB1jMDme+gNYmV2s0Z8OtCuaVspiHrSQohXAxzqlRcaTr+JfMkUsGsu50
	pI29DMnzegEJ+9gICJDwjXOND8QNBi56it+vT/BQVnrMvmpX9x9r1urGyJNu/Em3MZ1u
	9RG+B0ODzEPjZruXJ5z+gthOfnAda/NYoleupk7oE1eCSZOtTfmELylULaPAgM2FhKcv
	roEUO/VUGTvvEtf8VkA3sXojP4Cmq40NxytSW5SuIfz/M5Xe9tlvd+QSeYhhJSV861wq
	3bdA==
X-Received: by 10.50.78.161 with SMTP id c1mr6049127igx.10.1449853783166; Fri,
	11 Dec 2015 09:09:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1443032533.git.chris_larson@mentor.com>
In-Reply-To: <cover.1443032533.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 11 Dec 2015 17:09:33 +0000
Message-ID: <CABcZANnFxcyUzvJhp3tUM17m-W0ELuVozoKob23d+epzna8SMA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 0/3] recipetool/devtool: send errors to stderr
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
X-List-Received-Date: Fri, 11 Dec 2015 17:09:43 -0000
Content-Type: multipart/alternative; boundary=089e0111e07ab8d7750526a26386

--089e0111e07ab8d7750526a26386
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 23, 2015 at 11:21 AM Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This aligns with the behavior of bitbake proper. There is a bit of code
> duplication between knotty and scriptutils, but that's not new -- that was
> the
> case before as well. We should consider moving these logger configuration
> functions into bb.msg.
>
> The following changes since commit
> 2ad7308ee7166641eff99f3b9fe6794de143f6bc:
>
>   oeqa/utils/qemurunner.py: Remove duplicate message on LoggingThread
> start (2015-09-22 18:13:02 +0100)
>
> are available in the git repository at:
>
>   git://github.com/kergoth/openembedded-core scriptutils-log-improvements
>
> https://github.com/kergoth/openembedded-core/tree/scriptutils-log-improvements
>
> Christopher Larson (3):
>   oe.scriptutils: enable color in a more flexible way
>   oe.scriptutils: add logger_setup_filters
>   recipetool, devtool: set up the logging filters
>

Does anyone happen to know if there any objection to this? I just noticed
this hasn't been merged yet. This makes the behavior of recipetool and
devtool more consistent with bitbake itself by sending errors to stderr.
Long term I'd like to see warnings go there as well, but that could be more
controversial and is a later task, I think this should go in as is.
Eventually we should consolidate some of the logger setup and configuration
logic between scriptutils and bitbake as well, but that was the case with
or without this series

--089e0111e07ab8d7750526a26386
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Sep 23, 2015 at 11:21 AM Christopher Larson &lt;<a href=3D"mailto:kergoth=
@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
This aligns with the behavior of bitbake proper. There is a bit of code<br>
duplication between knotty and scriptutils, but that&#39;s not new -- that =
was the<br>
case before as well. We should consider moving these logger configuration<b=
r>
functions into bb.msg.<br>
<br>
The following changes since commit 2ad7308ee7166641eff99f3b9fe6794de143f6bc=
:<br>
<br>
=C2=A0 oeqa/utils/qemurunner.py: Remove duplicate message on LoggingThread =
start (2015-09-22 18:13:02 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://github.com/kergoth/openembedded-core" rel=3D=
"noreferrer" target=3D"_blank">github.com/kergoth/openembedded-core</a> scr=
iptutils-log-improvements<br>
=C2=A0 <a href=3D"https://github.com/kergoth/openembedded-core/tree/scriptu=
tils-log-improvements" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/kergoth/openembedded-core/tree/scriptutils-log-improvements</a><br>
<br>
Christopher Larson (3):<br>
=C2=A0 oe.scriptutils: enable color in a more flexible way<br>
=C2=A0 oe.scriptutils: add logger_setup_filters<br>
=C2=A0 recipetool, devtool: set up the logging filters<br></blockquote><div=
><br></div><div>Does anyone happen to know if there any objection to this? =
I just noticed this hasn&#39;t been merged yet. This makes the behavior of =
recipetool and devtool more consistent with bitbake itself by sending error=
s to stderr. Long term I&#39;d like to see warnings go there as well, but t=
hat could be more controversial and is a later task, I think this should go=
 in as is. Eventually we should consolidate some of the logger setup and co=
nfiguration logic between scriptutils and bitbake as well, but that was the=
 case with or without this series<br></div></div></div>

--089e0111e07ab8d7750526a26386--
