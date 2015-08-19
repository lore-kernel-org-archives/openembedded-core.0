Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id E0104608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 11:25:22 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so1079410qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=InsjNZ+wWJwpJsvuIUFxuXSHQyw58RfGV8UqinuuVas=;
	b=Po3xsCWpLMbms2THzOtaAKQhHq2hyagDRnIXqM1c9YSuWcnXLMp818SCtskdCV6YZl
	k+PP86l3C5LzOu+/TUwZocJNHDISbIvg8rUzwSrngL1Bf3LXm0sGf4YjckB4yJC/Er8o
	rR2TVwI9T6+eSN1p8NZwV2AyzL8N8A3Y0PQmjqzYRyYYBTKnoZLvgN2cEdFcfQAKwgB4
	1p+ucqg/DyxCoyJsWD/APO3xHF+xgk0GthDQYTcVCYbi+zrtMhpSBEh7cul9Fzaupvhg
	u9IwAu11XtKhkVlR9uNdvGCmV1unLy8RIsdPteKGtS42Of8iSeOauota8zdpZDMi3EO9
	K5cA==
X-Gm-Message-State: ALoCoQloyUnPqquUNfSuYuRdxtDmfNtOOIPsExGBbAYYX7hpNjQasA9sLsIJJs06DpN1a5XFt33n
X-Received: by 10.140.43.199 with SMTP id e65mr21962545qga.80.1439983522475;
	Wed, 19 Aug 2015 04:25:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 04:25:03 -0700 (PDT)
In-Reply-To: <1439974264-7891-1-git-send-email-jussi.kukkonen@intel.com>
References: <1439974264-7891-1-git-send-email-jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 12:25:03 +0100
Message-ID: <CAJTo0La_QNGCLsHDFT=Wx3KbfJqwiMuR0DQ06T_LnN6zWxJ+Xg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build regression test binaries
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
X-List-Received-Date: Wed, 19 Aug 2015 11:25:23 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa570f8f051da84a9c

--001a113a9baa570f8f051da84a9c
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 09:51, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> +make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
>

Presumably this means that openssh-ptest should rdepend on sudo?  Is sudo
only used if the tests are executed as non-root?

Ross

--001a113a9baa570f8f051da84a9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 August 2015 at 09:51, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5r5" =
class=3D"a3s" style=3D"overflow:hidden">+make -k .OBJDIR=3D`pwd` .CURDIR=3D=
`pwd` SUDO=3D&quot;sudo&quot; tests \<br></div></blockquote></div><br>Presu=
mably this means that openssh-ptest should rdepend on sudo?=C2=A0 Is sudo o=
nly used if the tests are executed as non-root?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a9baa570f8f051da84a9c--
