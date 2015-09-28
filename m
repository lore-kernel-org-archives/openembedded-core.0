Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 860B175894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 12:31:34 +0000 (UTC)
Received: by qgx61 with SMTP id 61so118473629qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 05:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hsaYTOvh2xk8cJW72THQD5XjZE7FnLCbZUZ561jlCq4=;
	b=G6T6Wa88paizTrC1BZnHNsGNajoZJ9BeIPlZmudTrO8PbHM27dY+gPNjilN+5PY2bu
	Rcg1FCmw1afCFIIyTjIYzsCh4hZVnarUoBnLQPPa2bGniFR/Y4//Pne+gm59MHC1jb9n
	f6w8yn6bPGR5vI0g/LCsCd1cgMet9dxpWEr9P+0zU5VixQ39t3/eFy0xMI+xX0JvJ4uw
	dwjzky2Nl6JlXlfcPOWlUXnehlquWDpFRJ78oj6I5I+LhzdjUjPC8Aoiwx+4OrMcoRWK
	KgPxx3Hegwb0uMpG2vDlclV5ln5JU+CmlPEfpfbyj1rjIAlAIsTyYpQ5qfgxCsr/b1PD
	Cqtg==
X-Gm-Message-State: ALoCoQkSKTYqGZP/BOTL6GCusrwEz/dqd6cWjct4a4Y/xyTShxgtYUvys3Rl6iijXfGqm/Xg2I3h
X-Received: by 10.140.109.74 with SMTP id k68mr22582503qgf.77.1443443494747;
	Mon, 28 Sep 2015 05:31:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 28 Sep 2015 05:31:15 -0700 (PDT)
In-Reply-To: <5a37554dfd79d1c65ce30ab9db9b05608066eedd.1443432019.git.liezhi.yang@windriver.com>
References: <cover.1443432019.git.liezhi.yang@windriver.com>
	<5a37554dfd79d1c65ce30ab9db9b05608066eedd.1443432019.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Sep 2015 13:31:15 +0100
Message-ID: <CAJTo0LZv-pri_fntqi6ypU=oFiSXD--1k9ZBfzhF=TN7aVTFEw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-async: inherit setuptools
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
X-List-Received-Date: Mon, 28 Sep 2015 12:31:35 -0000
Content-Type: multipart/alternative; boundary=001a1139af24c217130520cde04d

--001a1139af24c217130520cde04d
Content-Type: text/plain; charset=UTF-8

On 28 September 2015 at 10:20, Robert Yang <liezhi.yang@windriver.com>
wrote:

> -inherit distutils
> +inherit distutils setuptools
>

setuptools inherits distutils, so you can replace instead of adding.

Ross

--001a1139af24c217130520cde04d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 September 2015 at 10:20, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4sv=
" class=3D"a3s" style=3D"overflow:hidden">-inherit distutils<br>
+inherit distutils setuptools<br></div></blockquote></div><br>setuptools in=
herits distutils, so you can replace instead of adding.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139af24c217130520cde04d--
