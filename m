Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 691CA60601
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 14:41:13 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id c9so12603272qcz.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 06:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DYrMEVQ8NlPmqbSoxRcPJmpp4yWY+XSygdCZYn4iqjo=;
	b=l8yITioQ7rfFnYXK5Ykrrk0TG/JnhyDA0LthNeJ8o4X7A0yoQaDTd4mTc9RE+/Xmrt
	j6UDginb1fHwZ5JR1P//9HcJCSgMk67LPud0LC2jgC7nUBMoGj9Ay8nsNPCs+Sf2UizA
	07dyqLqsEEYzn1r8nB/fviMHfatj5LpZUkCPZ/+y1z68eDnTo6IXiRUJs5QG2Lrn9vHZ
	/whDc5TnQQYC6PO7Krf6MJ1xXNY9dRpcj58M750rPDOhhONDCMb+JZFa3gYc1FKz0Bvn
	IpZmHtl7JBF+Zn0AaXDWruTbAWiGKrvQHjuLuy5YzfhGG8nL8vAg1ntfBNRsIX6Gzvm/
	+Duw==
X-Gm-Message-State: ALoCoQkuZ8qKU0yOGB56LnsjgUpSm5uYRYAVcotvlslgCpQ0eUP2n3tWzw0FNwLtMFwOEbKj476m
X-Received: by 10.224.93.6 with SMTP id t6mr17361186qam.93.1417704073936; Thu,
	04 Dec 2014 06:41:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 4 Dec 2014 06:40:53 -0800 (PST)
In-Reply-To: <CAP71WjzrWaBs-q8i=4UwbMpzsMzOxePXOFAyCCxa0xckwX2pbw@mail.gmail.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<fef682ae2a0028af5d14a4cc82e83208c6a440aa.1417466734.git.anibal.limon@linux.intel.com>
	<CAJTo0LZ6b0SYW7GY5KZ+zC-UGx8+afDif9y5iGTumj7Yycjr_A@mail.gmail.com>
	<CAP71WjzrWaBs-q8i=4UwbMpzsMzOxePXOFAyCCxa0xckwX2pbw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Dec 2014 14:40:53 +0000
Message-ID: <CAJTo0LYXOobX8Nnjy1KrQizBpUTZDdHLjDV0uLzrUGED1iKjoQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libdrm: Upgrade to 2.4.58.
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
X-List-Received-Date: Thu, 04 Dec 2014 14:41:14 -0000
Content-Type: multipart/alternative; boundary=089e01495028b970a0050964f326

--089e01495028b970a0050964f326
Content-Type: text/plain; charset=UTF-8

On 4 December 2014 at 07:14, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> hmm. it worked for me, libdrm-doc was generated fine, and nothing
> really has changed upstream in this area. my buildhistory shows that
> libdrm-doc has:
>

And my libdrm has no documentation, because it's checking for xsltproc and
the docbook stylesheets, which I don't have installed..  You had
dependencies, I don't, the autobuilder may have had transient failure or an
incomplete set of build deps.  Either way, this should be an option as
currently this isn't deterministic.  We need a packageconfig for manpages
with xsltproc-native and the xslt stylesheets as build depends.

Ross

--089e01495028b970a0050964f326
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 December 2014 at 07:14, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=
=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@=
linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":9do" class=3D"a3s" style=3D"overflow:hidden">hmm. it worked for me, li=
bdrm-doc was generated fine, and nothing<br>
really has changed upstream in this area. my buildhistory shows that<br>
libdrm-doc has:<br></div></blockquote></div><br>And my libdrm has no docume=
ntation, because it&#39;s checking for xsltproc and the docbook stylesheets=
, which I don&#39;t have installed..=C2=A0 You had dependencies, I don&#39;=
t, the autobuilder may have had transient failure or an incomplete set of b=
uild deps.=C2=A0 Either way, this should be an option as currently this isn=
&#39;t deterministic.=C2=A0 We need a packageconfig for manpages with xsltp=
roc-native and the xslt stylesheets as build depends.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e01495028b970a0050964f326--
