Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 80553719A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:26:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1517264780; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=6cf/X7d5ZP/zOKbPAkynNR8mTlRyJcNvzY1h2F7WRsk=;
	b=byDpI/QfMQHEihHB0cLYg90d2u6S3k/iDzrBSMzeQ5fS6fiJK2KuEtyoDCZwQdREjzAibsj7
	h0htSSPzF0+tHcErB71mScUtSBE6qNVJdiHrvTR6HEZKETXZVWGeQxNcpAC12c+eNGfsMUe7
	DTPa/5unPX4A6ABb0plG53XMMSM=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mxa.mailgun.org with ESMTP id 5a6f9f8c.7f8c987a1f30-smtp-out-n01;
	Mon, 29 Jan 2018 22:26:20 -0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id a5so7681532qkg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 14:26:20 -0800 (PST)
X-Gm-Message-State: AKwxyten5aSmsjQYpvuoZApgp57/LBTv3mpb3cz5OzgXBQgzjWW83QNW
	DDpxCTAZ8kNG/Fbvsf+olMqhExWdgpdEIUVIaU8=
X-Google-Smtp-Source: AH8x225AJvDEV65Fx1XcZnTi81385f2XlF0olj9/gXd+L5N2TCuRFTStlNsYysonHdQQVUFzmvXoDH5pUTsPCLlzj6I=
X-Received: by 10.55.51.12 with SMTP id z12mr38119556qkz.152.1517264779369;
	Mon, 29 Jan 2018 14:26:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.71 with HTTP; Mon, 29 Jan 2018 14:26:18 -0800 (PST)
Received: by 10.140.40.71 with HTTP; Mon, 29 Jan 2018 14:26:18 -0800 (PST)
In-Reply-To: <1517264310.3090.15.camel@linuxfoundation.org>
References: <1517262541-8719-1-git-send-email-derek@asterius.io>
	<1517264310.3090.15.camel@linuxfoundation.org>
From: Derek Straka <derek@asterius.io>
Date: Mon, 29 Jan 2018 17:26:18 -0500
X-Gmail-Original-Message-ID: <CADNbA1ob_P9HqYfFMszuddKDsUwPU7DzeJH5gdmhgQmSQ_F9HQ@mail.gmail.com>
Message-ID: <CADNbA1ob_P9HqYfFMszuddKDsUwPU7DzeJH5gdmhgQmSQ_F9HQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python: Upgrade both python and python-native to 2.7.14
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
X-List-Received-Date: Mon, 29 Jan 2018 22:26:19 -0000
Content-Type: multipart/alternative; boundary="001a1147045c34751b0563f1bc98"

--001a1147045c34751b0563f1bc98
Content-Type: text/plain; charset="UTF-8"

Thanks.  Last I checked it was just in master-next.  I'll send the patch
for the manifest once I get off the train.

On Jan 29, 2018 5:18 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2018-01-29 at 16:49 -0500, Derek Straka wrote:
> > Rebased:
> >   - python/01-use-proper-tools-for-cross-build.patch
> >   - python/fix-makefile-for-ptest.patch
> >   - python/parallel-makeinst-create-bindir.patch
> >
> > Removed Upstreamed Patch:
> >   - python/Don-t-use-getentropy-on-Linux.patch
> >
> > Updated license checksum for changes in the copyright date.  The
> > license
> > terms remain unchanged
> >
> > Added an extra do_compile item to create the native pgen that no
> > longer
> > gets compiled by default
> >
> > Update the json manifest with the latest dependency set
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
>
> Your patch was merged into master so if there are tweaks they need to
> be in a patch against master now please.
>
> Cheers,
>
> Richard
>

--001a1147045c34751b0563f1bc98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks.=C2=A0 Last I checked it was just in master-next.=
=C2=A0 I&#39;ll send the patch for the manifest once I get off the train.</=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Jan 29, 20=
18 5:18 PM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br =
type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 2018-01-29 at 1=
6:49 -0500, Derek Straka wrote:<br>
&gt; Rebased:<br>
&gt; =C2=A0 - python/01-use-proper-tools-<wbr>for-cross-build.patch<br>
&gt; =C2=A0 - python/fix-makefile-for-ptest.<wbr>patch<br>
&gt; =C2=A0 - python/parallel-makeinst-<wbr>create-bindir.patch<br>
&gt;<br>
&gt; Removed Upstreamed Patch:<br>
&gt; =C2=A0 - python/Don-t-use-getentropy-<wbr>on-Linux.patch<br>
&gt;<br>
&gt; Updated license checksum for changes in the copyright date.=C2=A0=C2=
=A0The<br>
&gt; license<br>
&gt; terms remain unchanged<br>
&gt;<br>
&gt; Added an extra do_compile item to create the native pgen that no<br>
&gt; longer<br>
&gt; gets compiled by default<br>
&gt;<br>
&gt; Update the json manifest with the latest dependency set<br>
&gt;<br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">d=
erek@asterius.io</a>&gt;<br>
<br>
Your patch was merged into master so if there are tweaks they need to<br>
be in a patch against master now please.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--001a1147045c34751b0563f1bc98--
