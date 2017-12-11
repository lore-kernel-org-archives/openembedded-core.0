Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 189987864B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 13:45:45 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id f190so15799847ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 05:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=448d5hENdMphTRbZr5h26ncZDnw106xtd+7nnMpg2Jw=;
	b=cxWMDQkYIE4iEbFzagTR7kFud7Q0mxuUEI9efiKvWvstS7hYqJRs9qurX26lDGT0y+
	V1uvKlZWbgFsaD8z+Bd2+P0g7+wZpPuCBn/aMyThzHnDp+XMtivXA8p2ywEM7QMmzeBW
	6wCiumLnGsfNnrlHmFE2elb/TaLpQE4K7gUb1eopMHD65rRtnRcZvjcY3lvbRyctaKew
	XBr9V25J0vUs6FcXLmJa5AkavTs939Jb/DX0v7znY1EK/3z31G13N9v/tnXKn95G+kqq
	76ZspOx5Jzeoz+X4SP/+oKq97ku9YsuTRrhosQe4hZQUZBIHehLXnegH16CYSPHsWhnl
	Y62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=448d5hENdMphTRbZr5h26ncZDnw106xtd+7nnMpg2Jw=;
	b=aKJuYRKsMFc5AwQA3h1ZEj+uKXEvrTZzbAR9ysfzIqS/ZvMYuwhVEIYYZPoAWJGEBL
	RN8GObTnv+fXVNYsGrEWKCblWVDfcDJ9wsbCNgwLbedxoyEcgLnxcHZyWvEFnQVb8BI9
	7dtuoBMjnSE3sQ+lqgHgmByfh4eZQ3qSj80KhyzXyyKIdo+S1FHswdDeM1f0k/9UIS4f
	bG+6G7bkco7LSpCjoVXcQC1QBevuRnKRv2ZLGCgR50sK764mqayDryxnjzWWsa6WRq6p
	bWNtcdljiKenyfwy6byzg+Plm1cTEStkt/IN7Ad/AsecIQKvjlwXyN/Tm9F0qng/jRhX
	yASw==
X-Gm-Message-State: AKGB3mI2PXevE6IU7M5x1JTf2Wbc6OLagRRliuIDZg5gHTfAeRrsICy8
	F2MkbdhLBIooWYl7LzAOzOgXfIViWeE2Tc8Z4mG1Kw==
X-Google-Smtp-Source: ACJfBouv2BrxEUVDSChCWBpt6mHYkZK8Go1hnLJDpLWFZCFrn73fmvsrp5ugtKmv+/58GCveqwWZq3Nb08T8H7yh8JQ=
X-Received: by 10.36.93.5 with SMTP id w5mr1040942ita.124.1512999947044; Mon,
	11 Dec 2017 05:45:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Mon, 11 Dec 2017 05:45:26 -0800 (PST)
In-Reply-To: <20171211095149.ywhejbets5loutnv@mcrowe.com>
References: <20171112163923.19517-1-mac@mcrowe.com>
	<CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
	<20171211095149.ywhejbets5loutnv@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Dec 2017 13:45:26 +0000
Message-ID: <CAJTo0Lbp+4hmDE69Wrc5z-EvwPytweozmxBWemrbTXhN5DHwRg@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cmake: Avoid passing empty prefix to os.path.relpath
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
X-List-Received-Date: Mon, 11 Dec 2017 13:45:46 -0000
Content-Type: multipart/alternative; boundary="001a1143f14c63a051056010c029"

--001a1143f14c63a051056010c029
Content-Type: text/plain; charset="UTF-8"

It was implicated in some build failures.  I'll re-add it and try again.

Ross

On 11 December 2017 at 09:51, Mike Crowe <mac@mcrowe.com> wrote:

> On Monday 13 November 2017 at 15:15:35 -0200, Otavio Salvador wrote:
> > On Sun, Nov 12, 2017 at 2:39 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > > With meta-micro, ${prefix} is the empty string. This means that
> > > CMAKE_INSTALL_BINDIR:PATH and friends end up containing paths starting
> with
> > > many instances of "../", presumably due to os.path.relpath attempting
> to
> > > find its way to the current directory.
> > >
> > > Let's avoid this by ensuring that the root path always ends in a
> slash. If
> > > it already ends in a slash then adding another one shouldn't cause any
> > > problems.
> > >
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Patch ID: 145709
>
> It doesn't look like this change has landed, even on master-next. Has it
> fallen through the cracks?
>
> Thanks.
>
> Mike.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143f14c63a051056010c029
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was implicated in some build failures.=C2=A0 I&#39;ll r=
e-add it and try again.<div><br></div><div>Ross</div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 11 December 2017 at 09:51, Mik=
e Crowe <span dir=3D"ltr">&lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"_=
blank">mac@mcrowe.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On Monday 13 November 2017 at 15:15:35 -0200, Otavio Sa=
lvador wrote:<br>
&gt; On Sun, Nov 12, 2017 at 2:39 PM, Mike Crowe &lt;<a href=3D"mailto:mac@=
mcrowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
&gt; &gt; With meta-micro, ${prefix} is the empty string. This means that<b=
r>
&gt; &gt; CMAKE_INSTALL_BINDIR:PATH and friends end up containing paths sta=
rting with<br>
&gt; &gt; many instances of &quot;../&quot;, presumably due to os.path.relp=
ath attempting to<br>
&gt; &gt; find its way to the current directory.<br>
&gt; &gt;<br>
&gt; &gt; Let&#39;s avoid this by ensuring that the root path always ends i=
n a slash. If<br>
&gt; &gt; it already ends in a slash then adding another one shouldn&#39;t =
cause any<br>
&gt; &gt; problems.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Mike Crowe &lt;<a href=3D"mailto:mac@mcrowe.com">m=
ac@mcrowe.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br">otavio@ossystems.com.br</a>&gt;<br>
<br>
</span>Patch ID: 145709<br>
<br>
It doesn&#39;t look like this change has landed, even on master-next. Has i=
t<br>
fallen through the cracks?<br>
<br>
Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mike.<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1143f14c63a051056010c029--
