Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id C2C3C6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 22:46:56 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id l13so251221iga.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 15:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yxDRxgYQcHs10s2yjnuuETg2OcNM9xRmnZ5YVI/YrmA=;
	b=n1MqLVXqRC7+79LrytrH5gy3IxhjZlrjE40zLOfL+mM0zUruEb8l96nFprdp6JRotD
	eNnpPTU0HY0Mc2d2/nk2qvuzkLtjQ6DGclselKCbrm0lrfivi+mqIpTY417h55JBVeNS
	9hKtLpAHsdq6peeJJRQYqWveYWH4YuHmy2N6uH1G3CQR9kedA1VhpzlxhxaQUJiCYw8r
	JnLTvcvpdfYR01DO7Kv8w86w0l9U3EkPlJAkbVBeOzDno4bmWtUcsJSOzOxSp7iFlLmp
	0OXHEMu2HM7UyfGIsKQ53jN8TXOPnoEWDCIR03CvnBWyyPhmUNJIcqxKsTyDilb4Osjj
	0gDg==
MIME-Version: 1.0
X-Received: by 10.50.18.42 with SMTP id t10mr2000167igd.30.1410907617620; Tue,
	16 Sep 2014 15:46:57 -0700 (PDT)
Received: by 10.50.240.6 with HTTP; Tue, 16 Sep 2014 15:46:57 -0700 (PDT)
In-Reply-To: <CAJTo0LZKOKaZeOKFGUpCyAtkcLZ9iGus6fGV_X_1ih8CpuwtAg@mail.gmail.com>
References: <1410555811-30996-1-git-send-email-jslater@windriver.com>
	<CAMKF1spCXYs2OSUdjN4XCFLJsAX4iHHOQRzqEjEGf9uq7uZDFQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF845CC50028@ALA-MBA.corp.ad.wrs.com>
	<CAJTo0LZKOKaZeOKFGUpCyAtkcLZ9iGus6fGV_X_1ih8CpuwtAg@mail.gmail.com>
Date: Tue, 16 Sep 2014 15:46:57 -0700
Message-ID: <CAMKF1spMpk3HXOdh6h4H3Fcj-75ZUFBDS+_nTP8D+drKo8ScXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysprof: add aarch64 support
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
X-List-Received-Date: Tue, 16 Sep 2014 22:46:59 -0000
Content-Type: multipart/alternative; boundary=089e014946b25c218b050336870d

--089e014946b25c218b050336870d
Content-Type: text/plain; charset=UTF-8

On Tuesday, September 16, 2014, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 September 2014 20:27, Slater, Joseph <joe.slater@windriver.com
> <javascript:;>> wrote:
> > It is not runtime tested.  The intent is to allow world builds for
> aarch64.
>
> In that case would it be more suitable to use COMPATIBLE_* to exclude
> aarch64 until it is tested?
>
>
Yes please. Such patches can cause larger pain later. I would avoid them if
not tested

> Ross
>

--089e014946b25c218b050336870d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, September 16, 2014, Burton, Ross &lt;<a href=3D"mailto:=
ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On 16 September 2014 20:27, Slater, Joseph &lt;<a href=
=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;joe.slater@wind=
river.com&#39;)">joe.slater@windriver.com</a>&gt; wrote:<br>
&gt; It is not runtime tested.=C2=A0 The intent is to allow world builds fo=
r aarch64.<br>
<br>
In that case would it be more suitable to use COMPATIBLE_* to exclude<br>
aarch64 until it is tested?<br>
<br></blockquote><div><br></div><div>Yes please. Such patches can cause lar=
ger pain later. I would avoid them if not tested=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
Ross<br>
</blockquote>

--089e014946b25c218b050336870d--
