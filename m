Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDF26AC36
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 13:09:31 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so8855054qko.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 06:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ayuku3lTzvug+i/uBYhqZngZQ92sh8Jj6WdY/xWKXQc=;
	b=hZ1wlkeHvHx56JpnHAJhGcZrVxPU5/53M5AyR/LV3ggaYRwI/8uu81JLHRcNwhCpge
	nb+2e923KyidjDLlL5Gg55BOmz8n3zxwJt0Vs4hq8OXKQbT0OvugFv9ZdO8BEVlwkVnC
	fqq01H33YJaI7pOOkogHbbd4PbVDz5JZkWYC0lj+v02XBSAIvsD7BU84sDrPPb3PJiEw
	4ZzMbAKzUmyWu7Jo8NrfZx2H7hiFxreVVavdoX51+Z/pTjIXlIo38K654qS1N6TD0n1z
	REY6gOR9PE8RDMK0jYX64wJ+Zqr9vHZQ1OQSndBC/AcGHl3phIbKCQ6lMEnfGaxgv6i1
	hZXA==
X-Gm-Message-State: ALoCoQl/tVcalHY11gOOZlp3jWWZZtvkEccjNH0ENBcOdUyAR/oxmDvDqAzpY2f3sC/Rkx+1DAs2
X-Received: by 10.140.43.228 with SMTP id e91mr25404959qga.80.1433855372276;
	Tue, 09 Jun 2015 06:09:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 06:09:11 -0700 (PDT)
In-Reply-To: <CAMCfZKFgggP5Y21S58+jq8n_se3a3Tg06f2HTFTj8j0Go3ATUA@mail.gmail.com>
References: <CAMCfZKFgggP5Y21S58+jq8n_se3a3Tg06f2HTFTj8j0Go3ATUA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 14:09:11 +0100
Message-ID: <CAJTo0LadVJPTXNb5MLV6AHhbcS9_rEN1qYz0D+cp0nmB4uv9aQ@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] Issue on linking qtwebengine
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
X-List-Received-Date: Tue, 09 Jun 2015 13:09:33 -0000
Content-Type: multipart/alternative; boundary=001a113a34bc1fce5d0518157826

--001a113a34bc1fce5d0518157826
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 13:58, Diego Sueiro <diego.sueiro@gmail.com> wrote:

> I'm using fido branch and I'm getting the linker killed due to out of
> memory in a machine with 8GB of RAM.
>

I guess you'll want to pass the same options to the linker that we already
pass to webkitgtk:

LDFLAGS += "-Wl,--no-keep-memory"

Ross

--001a113a34bc1fce5d0518157826
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2015 at 13:58, Diego Sueiro <span dir=3D"ltr">&lt;<a href=3D"mail=
to:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div>I&#39;m using fido branch and I&#39=
;m getting the linker killed due to out of memory in a machine with 8GB of =
RAM.</div><div></div></blockquote></div><br>I guess you&#39;ll want to pass=
 the same options to the linker that we already pass to webkitgtk:</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">LDFLAGS +=3D &=
quot;-Wl,--no-keep-memory&quot;<br></div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113a34bc1fce5d0518157826--
