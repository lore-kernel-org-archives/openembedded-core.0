Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E530365C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 20:34:56 +0000 (UTC)
Received: by qcvx3 with SMTP id x3so10552451qcv.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 12:34:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xK1GBWS7C/vviv8zGOjAiDOlrUa5o11xIfgBD61IgRs=;
	b=FqtbRp8kK1JsZL4bkRxTy0dTwkjPJtXKFmq5BPZ/l43mqBagj6Z3cdElkzUZNs3WJb
	3Ip/1mPYmpl0H3cQs7Uhlh34aoyYkBBtxZfmTIz4vumw3XN6MVfsqKxKw3Y8j70/nrYo
	R+nnrZXczpZSg15YSKbbF3ApE54GhBF+hW4zY/64t0R+gPHWEIkiMPqhwtpgOn39qhmH
	+zLcM4tAE7hSVSAF24GjohWj9Vz8MkBMfJgY/ddPz0Uz6CjLQbc9/8IXofwFDf/TnIVZ
	XT/f0qhtjksnNi3D/4JElikwA0gQwcHnpWsC26Xc3fBxO3Cl81/iUlNBN0+7eB6czSWx
	WRwA==
X-Gm-Message-State: ALoCoQkJzcU3Uyu+Ekac8G8bJBXT7cDygiBSwfGz0kUaUk5zU+2rWDBU+uR8npObnDoDQwva7v/Y
X-Received: by 10.140.20.23 with SMTP id 23mr20806277qgi.40.1424982896621;
	Thu, 26 Feb 2015 12:34:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Feb 2015 12:34:36 -0800 (PST)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F443500@irsmsx105.ger.corp.intel.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
	<84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
	<CAJTo0LYy7G3d=YbBDfwScqv6SJ5TN2-8BgAcd9ScaA+KCZ9qGA@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F443500@irsmsx105.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Feb 2015 20:34:36 +0000
Message-ID: <CAJTo0Lao_XRie0O_Kb+Cw6-Zh-q+d--XJti6ogbu=WeUqmQhmw@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Thu, 26 Feb 2015 20:34:57 -0000
Content-Type: multipart/alternative; boundary=001a11c130a85d5181051003af7e

--001a11c130a85d5181051003af7e
Content-Type: text/plain; charset=UTF-8

On 26 February 2015 at 20:19, Iorga, Cristian <cristian.iorga@intel.com>
wrote:

> Can you point me to a tutorial in this kind of test suites?
>
>
I sure can, see meta/lib/oe/tests/test_utils.py.  Should be fairly obvious.

Ross

--001a11c130a85d5181051003af7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 February 2015 at 20:19, Iorga, Cristian <span dir=3D"ltr">&lt;<a href=
=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p class=3D"Ms=
oNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&q=
uot;sans-serif&quot;;color:#1f497d">Can you point me to a tutorial in this =
kind of test suites?<u></u><u></u></span></p>
<p class=3D"MsoNormal"></p></blockquote></div><br>I sure can, see meta/lib/=
oe/tests/test_utils.py.=C2=A0 Should be fairly obvious.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c130a85d5181051003af7e--
