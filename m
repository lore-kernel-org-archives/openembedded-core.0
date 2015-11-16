Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 209F46E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:19:10 +0000 (UTC)
Received: by ioc74 with SMTP id 74so162491047ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=q22/V8nLTWeNwazFkWKzrhz2UELBASz870NX4+aWMU0=;
	b=gAn1/oF0u3wAnN5ZS2OHWBWUrkSER251ATY6aM73fTsAaMhAoX/k2mBGjBHPkXnn9X
	obib6dWzPQiybr6VKbn71/kCSTEtqPBFB7XwdVHTKKXbBY3ZFMPZJmLebkrh19xQ9p2P
	yfC0Bzj5qlKdv7K1tg3T7ESNKPJF9hIBDlFW8MAy7VqnlL5Z6jL2TpqIgJ9K4SMSOj60
	IXqQteMx6dxSbC3ylfofTVDcR9yJbDMS+mfNu5QvjyThN6EmW/ZT0l2OlFcwpVlIVKsc
	DnfAyy2FxZuzytC3C9DMBtTxFk8XyqWc3o1zFTwWllp3VZUNQJkuggeLxguJKbgjk85r
	MCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q22/V8nLTWeNwazFkWKzrhz2UELBASz870NX4+aWMU0=;
	b=DrO1fw4pgvxE/m16YLAdm85IqCbuh2Z2/LhsV+j0H21UFJAzBzE+AXRDkchemcXN7L
	RkA0JmkebVjGWjfF4IIngjPCKs61hSrAfPlg5QbXksygHBuWsHWN3gVAWXkZqdJljh/R
	JhSu6OaK55U+gEmBXUpsG38UGBjo2J68IzNo2+/Igv1O2BhU6KV6yErsDPh0iimB2TwM
	v/A1YPUs0R8lAIpLJAhK/PLt2cJPCluXLe3NzpkzsxLdNnlqsGsCKX8AFPH+jlWBseTu
	2q4mx+dK+dc2rwfDQBo1O2Vvq5KkZBQNZyDHpvfFACa54+JuZbVccD5gpTlZ4k8bd296
	nZkg==
X-Gm-Message-State: ALoCoQmS35zRMpKuulkAPM8z6N7k2hQcTKX3atR9KrlodWt9ZftalFKIK1UHMNjCaILD6WonrbnJ
X-Received: by 10.107.135.30 with SMTP id j30mr30417631iod.148.1447687150480; 
	Mon, 16 Nov 2015 07:19:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 07:18:50 -0800 (PST)
In-Reply-To: <7dfc5c44d99054fd0f087bd1b4102aef0511029e.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
	<7dfc5c44d99054fd0f087bd1b4102aef0511029e.1447371033.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 15:18:50 +0000
Message-ID: <CAJTo0LZbY3d718R8WL4mLuS-hxKiWTgHYBNf51VPwUfbbNSeAw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] systemd: drop unneeded $D check in prerm
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
X-List-Received-Date: Mon, 16 Nov 2015 15:19:12 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a5a68020524a9eef3

--001a113ec64a5a68020524a9eef3
Content-Type: text/plain; charset=UTF-8

On 12 November 2015 at 23:39, Christopher Larson <kergoth@gmail.com> wrote:

> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 315c17f..1f5bbcc 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -50,3 +50,8 @@ QEMU_EXTRAOPTIONS_ppc64e5500 = " -cpu e5500"
>  QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e6500"
>  QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e6500"
>  QEMU_EXTRAOPTIONS_ppc7400   = " -cpu 7400"
> +
> +python () {
> +    if "QEMU_EXTRAOPTIONS" in d and
> d.expand("QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}") not in d and
> d.getVar("PACKAGE_ARCH", True) != "all":
> +        bb.fatal("Incorrect use of overrides rather than PACKAGE_ARCH for
> QEMU_EXTRAOPTIONS")
> +}
>

I think you meant to split this out.

Ross

--001a113ec64a5a68020524a9eef3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2015 at 23:39, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4v0" class=3D=
"a3s" style=3D"overflow:hidden">diff --git a/meta/classes/qemu.bbclass b/me=
ta/classes/qemu.bbclass<br>
index 315c17f..1f5bbcc 100644<br>
--- a/meta/classes/qemu.bbclass<br>
+++ b/meta/classes/qemu.bbclass<br>
@@ -50,3 +50,8 @@ QEMU_EXTRAOPTIONS_ppc64e5500 =3D &quot; -cpu e5500&quot;<=
br>
=C2=A0QEMU_EXTRAOPTIONS_ppce6500 =3D &quot; -cpu e6500&quot;<br>
=C2=A0QEMU_EXTRAOPTIONS_ppc64e6500 =3D &quot; -cpu e6500&quot;<br>
=C2=A0QEMU_EXTRAOPTIONS_ppc7400=C2=A0 =C2=A0=3D &quot; -cpu 7400&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if &quot;QEMU_EXTRAOPTIONS&quot; in d and d.expand(&quot;QEM=
U_EXTRAOPTIONS_${PACKAGE_ARCH}&quot;) not in d and d.getVar(&quot;PACKAGE_A=
RCH&quot;, True) !=3D &quot;all&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Incorrect use of overrides rath=
er than PACKAGE_ARCH for QEMU_EXTRAOPTIONS&quot;)<br>
+}</div></blockquote></div><br>I think you meant to split this out.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a113ec64a5a68020524a9eef3--
