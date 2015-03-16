Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id C1E986AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:55:33 +0000 (UTC)
Received: by qcbkw5 with SMTP id kw5so40674363qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BoLnNeWJp42+87C0zWEysQgSH3UphpNj2zhH1rtMaIY=;
	b=jfiEBuWnn1XTeIUFhXFHi2ASczDHYELRs4HgBEkCoP4ITE7sYWynr2Hn0octu15HKc
	jJEaQwpZb7e2P/8FsGJfSizDXH7LL3YcmTs/XzGnMKOf/TkxqwMfBGBQCp2SVB3BTaJm
	hbjy2OMb5Y+beGJoAvIBer60zsKYpU/bZWVEefZNWltaU5XDZas/Rranjzqsat2j/cwG
	M73NeyqVSn+0iyYUcA6GIb0GsybcZwwnoSLpsBcTk57daSe23IGCzWfjECppas1qyq1h
	xR8m0T+io+pvtw7/e9ODRfQ4XPTsC1kHPiD+S7gtupEvs2DofVL4RdtuTljXDkhxEK/8
	4mzQ==
X-Gm-Message-State: ALoCoQk5qDZu7oFbp3HRCySQfhmazlHIAZyTaiHuLCt689L7POCM/pWn/Hi/KRFnTWFZi80dR9Sj
X-Received: by 10.140.101.22 with SMTP id t22mr74734532qge.9.1426506934362;
	Mon, 16 Mar 2015 04:55:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 16 Mar 2015 04:55:14 -0700 (PDT)
In-Reply-To: <CAC1BbcT6v5Dwa+jDmePaXwto-M2dK8QgX4FvBf1XJ5qOfFEWGg@mail.gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<CAJTo0La-P0daO2k0UWFjcYgHwjMGHnqrsj6gid=6-0oFZEe9Vw@mail.gmail.com>
	<CAC1BbcQU=b3FH7QqanMTu6c5PYYQ3ftJ_pVgYy6Z_tpbDRhYqA@mail.gmail.com>
	<CAJTo0LZA7zJvE-8QKcsSc4_o1LOnYqOEWcOL+pKre7Z1CexFEg@mail.gmail.com>
	<CAC1BbcT6v5Dwa+jDmePaXwto-M2dK8QgX4FvBf1XJ5qOfFEWGg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Mar 2015 13:55:14 +0200
Message-ID: <CAJTo0LYGf7o8G81Sufv44e1e-FwOvCVZzvTc=iCbLnEQO_GMxg@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 11:55:33 -0000
Content-Type: multipart/alternative; boundary=001a11c16ffa17bd120511668791

--001a11c16ffa17bd120511668791
Content-Type: text/plain; charset=UTF-8

(obviously remove the PR bumps from the entire series, thanks)

On 16 March 2015 at 13:53, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
wrote:

> On 16 March 2015 at 12:52, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On 16 March 2015 at 13:49, Bernhard Reutner-Fischer <
> rep.dot.nop@gmail.com>
> > wrote:
> >>
> >> yea, i'm not changing anything from installed binaries perspective,
> right?
> >>
> >
> > Even if you were we haven't needed explicit PR bumps for quite a while
> now.
> > The PR service will automatically increase the PR if required.
>
> k, thanks!
>

--001a11c16ffa17bd120511668791
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(obviously remove the PR bumps from the entire series, tha=
nks)</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 16 M=
arch 2015 at 13:53, Bernhard Reutner-Fischer <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rep.dot.nop@gmail.com" target=3D"_blank">rep.dot.nop@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb=
"><div class=3D"h5">On 16 March 2015 at 12:52, Burton, Ross &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 16 March 2015 at 13:49, Bernhard Reutner-Fischer &lt;<a href=3D"mai=
lto:rep.dot.nop@gmail.com">rep.dot.nop@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; yea, i&#39;m not changing anything from installed binaries perspec=
tive, right?<br>
&gt;&gt;<br>
&gt;<br>
&gt; Even if you were we haven&#39;t needed explicit PR bumps for quite a w=
hile now.<br>
&gt; The PR service will automatically increase the PR if required.<br>
<br>
</div></div>k, thanks!<br>
</blockquote></div><br></div>

--001a11c16ffa17bd120511668791--
