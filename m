Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id E8EA6607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 12:16:03 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so49993306qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 05:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iriO3FAb6sA05+/SfXtgw0aweSzuiYCVbVYPpf592dU=;
	b=PCO5bHJX1OgwAHzMxLtCoTa5fPP13wBgqbtVQJs+MbG7gKE5DvRM05KkKb5hwkn+rr
	othaH52C8deh/F6FKMELoSstxdTSBHSTgctWAfs9tcjpIj2VXE3qoIQPECkOGZ+T4is/
	5H5N+FOy4cXU+yzZpXKR4TbBAWF6QRIWB7o2G+HxeBCjJl+1byrn79dvshwh9iqkYmYS
	bxRYenEpsUYXVRXwksUaheoTmI4SSf1Rm7IfT++xSXdKXZUWZqlMhn/QecrBzxnumNgC
	bm6KoeQAWRs18iU78XyC8So31CAXFAvQyvUQFLhGX86udwNLZP+VjudfufYfeRA0MDJa
	+9zg==
X-Gm-Message-State: ALoCoQlk7/B8BO4WH7zkJpRaPTUqXDZiJOSfy8fgVDQ9qHRK9C87nbtxa6wAefzl8r48nQlC+4fZ
X-Received: by 10.140.20.99 with SMTP id 90mr41452818qgi.87.1435839363289;
	Thu, 02 Jul 2015 05:16:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 2 Jul 2015 05:15:43 -0700 (PDT)
In-Reply-To: <CAHiDW_FFK9XPCeQG+nUxC_SbrAsuNRB4gRgwL6CEMcFWXbBDyg@mail.gmail.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<0c7f245a788abe31dc96f33860465b32300c05dd.1434464336.git.jussi.kukkonen@intel.com>
	<CAJTo0Lb2doffPRhcsfrr_M37XOxdSL13=juHkvLtbjL4=_3qdg@mail.gmail.com>
	<CAHiDW_FFK9XPCeQG+nUxC_SbrAsuNRB4gRgwL6CEMcFWXbBDyg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 13:15:43 +0100
Message-ID: <CAJTo0Lb=DBkXg3j1kv2=shwx2HL3mVhCOdAWSmQJwfHEqurifQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/6] adwaita-icon-theme: Add new icon theme for GTK+
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
X-List-Received-Date: Thu, 02 Jul 2015 12:16:08 -0000
Content-Type: multipart/alternative; boundary=001a11c125d4342f8c0519e36751

--001a11c125d4342f8c0519e36751
Content-Type: text/plain; charset=UTF-8

On 2 July 2015 at 09:15, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Not with my autotools fu... adwaita has a couple of strings they want
> translated so they use intltool. intltool.m4 decides to do a compile
> test (because of a Solaris corner case) and this naturally leads to a
> configure failure on allarch. Search for "Set DATADIRNAME correctly"
> in intltool.m4 if you want to see it.
>
> Hints on how to fix that are welcome -- allarch would be helpful as
> install really does take quite a while.
>

If the compile tests are limited to bug detection on Solaris, we know we're
not running on Solaris so could patch those out.  Not having intltool break
allarch would be helpful (not you mention it I remember hitting this before
too).

Ross

--001a11c125d4342f8c0519e36751
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 July 2015 at 09:15, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1nl" cla=
ss=3D"a3s" style=3D"overflow:hidden">Not with my autotools fu... adwaita ha=
s a couple of strings they want<br>
translated so they use intltool. intltool.m4 decides to do a compile<br>
test (because of a Solaris corner case) and this naturally leads to a<br>
configure failure on allarch. Search for &quot;Set DATADIRNAME correctly&qu=
ot;<br>
in intltool.m4 if you want to see it.<br>
<br>
Hints on how to fix that are welcome -- allarch would be helpful as<br>
install really does take quite a while.<br></div></blockquote><div><br></di=
v><div>If the compile tests are limited to bug detection on Solaris, we kno=
w we&#39;re not running on Solaris so could patch those out.=C2=A0 Not havi=
ng intltool break allarch would be helpful (not you mention it I remember h=
itting this before too).</div><div><br></div><div>Ross=C2=A0</div></div></d=
iv></div>

--001a11c125d4342f8c0519e36751--
