Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C559660132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:14:33 +0000 (UTC)
Received: by qkap81 with SMTP id p81so16045813qka.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 03:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+pPV7Yq6lLwEfYyLtd9e67LNeoWGnbGasgSIF7WVNDc=;
	b=Zkf1mJC9RtJJiIDWbmuKy8JfOpyMlYhX8iPsw13VpC8HV4jISfwt/FWpe39Ppfnmjh
	wik29q1iJqYyie40AjhB/Wx8Zlj9dHxZSEsF1gFDLBPi80JZEY7dJ521Q2jOBHCACT74
	K4bMt6eIA7/RdbAYBQBvwKNW5qrsNSX81WJT3lxZO+i8TpLkql43YduLAC0XIwO1U7Ps
	5WDXDvjq3+eHcVw12bD9IgF3Kpud5WvrCEizwIXA3d3t2BrZOkiKTMzzJunVG5S+Bqzr
	Pbsmmy7HqNeUGLoHF1ww7AIMg0A5TG3uISM+rgyHA+HnaHXQOctet27f4AjXDTR4LIXf
	1/wA==
X-Gm-Message-State: ALoCoQlI6b5R3SVAXy3K5N07vDN/Pc5pJ7T5idQGCu/MpkyKxmqLrs5bC1kpYHky2OtYfSmOHMjP
X-Received: by 10.55.195.86 with SMTP id a83mr51550490qkj.72.1441880073009;
	Thu, 10 Sep 2015 03:14:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 10 Sep 2015 03:14:13 -0700 (PDT)
In-Reply-To: <cover.1441878476.git.liezhi.yang@windriver.com>
References: <cover.1441878476.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Sep 2015 11:14:13 +0100
Message-ID: <CAJTo0LYdchmiRpbW6TKOQ68pzgLUKiRt4bOP2syNH6-9Zppd2g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] sstate.bbclass: fixes for SSTATE_SIG_KEY when use SSTATE_MIRRORS
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
X-List-Received-Date: Thu, 10 Sep 2015 10:14:35 -0000
Content-Type: multipart/alternative; boundary=001a1142b9508f9bc4051f61dd30

--001a1142b9508f9bc4051f61dd30
Content-Type: text/plain; charset=UTF-8

I sent an almost identical patch to this yesterday :)

(your patch breaks is SSTATE_VERIFY_KEY="0")

Ross

On 10 September 2015 at 11:04, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The following changes since commit
> 56c5fa106eeccda2ca92dbeb73ff01ba40992e7d:
>
>   ptest: use fakeroot for do_install_ptest_base (2015-09-09 14:25:09 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/ss
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ss
>
> Robert Yang (1):
>   sstate.bbclass: fixes for SSTATE_SIG_KEY when use SSTATE_MIRRORS
>
>  meta/classes/sstate.bbclass |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1142b9508f9bc4051f61dd30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I sent an almost identical patch to this yesterday :)<div>=
<br></div><div>(your patch breaks is SSTATE_VERIFY_KEY=3D&quot;0&quot;)<br>=
<div><br></div><div>Ross</div></div></div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 10 September 2015 at 11:04, Robert Yang <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blan=
k">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">The following changes since commit 56c5fa106eeccda2ca92dbeb73ff01=
ba40992e7d:<br>
<br>
=C2=A0 ptest: use fakeroot for do_install_ptest_base (2015-09-09 14:25:09 +=
0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> rbt/ss<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Drbt/ss" rel=3D"noreferrer" target=3D"_blank">http://cgit.op=
enembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Drbt/ss</a><br>
<br>
Robert Yang (1):<br>
=C2=A0 sstate.bbclass: fixes for SSTATE_SIG_KEY when use SSTATE_MIRRORS<br>
<br>
=C2=A0meta/classes/sstate.bbclass |=C2=A0 =C2=A0 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.9.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1142b9508f9bc4051f61dd30--
