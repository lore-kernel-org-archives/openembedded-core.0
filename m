Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8C477ED3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 15:06:32 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id c45so52403577qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 08:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jrGaD2MSnjviU856rL4SE0ZzWHvQCVynKB7OBOZuzc8=;
	b=R8N9fiFhRHzwLlBd+oftBAGE8bUZiI4oiQmce9mZl609R0pDkoM+OIPjCuKWSwDD0n
	dNVaswxjVh5994b4GcYU6ixqcuRIv7MdhxFkRRtc/UsBmp3tsmGYo6h/4RLErn09xgJr
	FifNNqyPh4qK+5rvH0njOAEahUiLtIYJvjUsoje9bKau2FNVxHzZoDGsJ1jr82HuYssL
	jo4vCfLKmb3ApCdgRnItT4uRJIjk0ObV7qFyHQHAMK16YIOvNb8G33z5jwyAX+ZEt+FD
	Pzl4nviEHA0mSz5YjPXsgQJlUz6MQ/cXkn2qmvDfRh6Xao450usNa1dc3tWLq3CGeKT/
	bkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jrGaD2MSnjviU856rL4SE0ZzWHvQCVynKB7OBOZuzc8=;
	b=IPS4FNDEfN4eZu31jrBcsXNobknVRZY3QPnYwoxhw5akHGBI3oxtd/pYTh1tuAeh2S
	x4Pj36JDlJLWiPoxw39pZcpIcbJztPAcORGhsJR4Qz1zAEa24JTojknHYq62qmdVAwXQ
	xVsacAQP9SDYTtplqG32Z0CZ/hM34R7pwB/o/1Ro3CCN0IG+5ZWjAXtAS+71JGcNdh3E
	0s/U9Ol7Xcq1sP3Lox3wsFiQBIgrJ4S7fTmUBfflkhtuvDHojQ14/Ka1uY13k+orKllk
	pOXwXCAgkiCZYgVBYTtRygTNIEVWpGMhQKHtKXm2r31qkue9RSeDjifhIuFSw/sjlNmn
	IeDg==
X-Gm-Message-State: AN3rC/7OHtIPaBae2HaHjs2bQMkHoxUeEYc7xJgpUauhHyhOEBmus1XZ
	5rlT0hsgz81bhGWrE71HhAtB9ocjxeji
X-Received: by 10.200.56.56 with SMTP id q53mr11244303qtb.105.1493391993634;
	Fri, 28 Apr 2017 08:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 28 Apr 2017 08:06:13 -0700 (PDT)
In-Reply-To: <8a430c9f93f00eed399175287be30cfcd0326cab.1493391620.git.pkj@axis.com>
References: <cover.1493391620.git.pkj@axis.com>
	<8a430c9f93f00eed399175287be30cfcd0326cab.1493391620.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Apr 2017 16:06:13 +0100
Message-ID: <CAJTo0LbdLc2OUFxY4N_sgVMVObiUzQFHaj6BD4idGsEiy7-2NQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] sstate.bbclass, staging.bbclass: Handle HOSTTOOLS_DIR when restoring state
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
X-List-Received-Date: Fri, 28 Apr 2017 15:06:34 -0000
Content-Type: multipart/alternative; boundary=001a1137aca24a98e4054e3b6bba

--001a1137aca24a98e4054e3b6bba
Content-Type: text/plain; charset=UTF-8

On 28 April 2017 at 16:01, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> -EXTRA_STAGING_FIXMES ?= ""
> +EXTRA_STAGING_FIXMES ?= "HOSTTOOLS_DIR"
>

EXTRA and ?= suggests that this should remain "" and the HOSTTOOLS_DIR
relocation is handled in another way, as other classes that have done
="FOODIR" would override HOSTTOOLS_DIR.

Ross

--001a1137aca24a98e4054e3b6bba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 April 2017 at 16:01, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":42t" class=3D"a3s aXjCH m15bb516b996b3b6e">-EXTRA_STAGING_FIXMES ?=3D =
&quot;&quot;<br>
+EXTRA_STAGING_FIXMES ?=3D &quot;HOSTTOOLS_DIR&quot;<br></div></blockquote>=
</div><br>EXTRA and ?=3D suggests that this should remain &quot;&quot; and =
the HOSTTOOLS_DIR relocation is handled in another way, as other classes th=
at have done =3D&quot;FOODIR&quot; would override HOSTTOOLS_DIR.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1137aca24a98e4054e3b6bba--
