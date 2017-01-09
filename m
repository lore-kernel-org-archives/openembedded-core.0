Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7D55371ADD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 10:36:00 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id x49so65689365qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 02:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y/XE7B/p9y0XJiAQOG06hBjCTR7QJp7pKxGo6U+an8o=;
	b=r4eNz4vVyMgmpLHheqvNWZl/n8uAeB9AdyPd7MMdY4kV1hB0A8U2Os9KH994KEHQMh
	HcpUoj4XVGR/lWa5E9b6WhLpNTT20qYpit5vrbPlf8jNQnYvfbpqeMfypaIpDF8ByuqJ
	Bb7JYjkIKeH73KN58coziQfAhk9mZBsfsenmIDT0DfXA65mq+4mYvU5omhxzv7HEr6AW
	tYRIB8hQJMH0Ao+UOWSJyOl3VzkhzHW4LJNYik8W+bdTYkndrv3FF2SPWGEp+tNNX8VI
	x8xMNoZM0DM//2nQWvzIncq/F2eIrDacZo/DRvAfaJpQpIEW35MzeYkSncYFL6HAzBw1
	628A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y/XE7B/p9y0XJiAQOG06hBjCTR7QJp7pKxGo6U+an8o=;
	b=Nc+mU9nMhiL87NxfCkghxGEYka5Qavbq6zSV6nVr79EoanECw10oIvSn/oL02in0Uh
	gvOKL5zaDktnFiLqe0gZD7Ddfx2bpzgygPvSmcSNpb2RYCs011/suH5doGPZ2ymWd29n
	T4PVPoNhwMixiUkdIRxY7XDpgthXDdfsMu0rEov5jEXbHfFovXmm2Z7fl+Jr+yFiTLWK
	JCU0cTTK7BAMccBNT2dO8z/pKgkDu9ms/q6bBIB4KvHXjiYMsqcGH8CYTH3ExLPybNat
	XtSPOJ7KFw24EiS3MeKp8UlRDLzo1GVPVzQ7M1/I0XVGkHp71Io2V1q1Zb2HuktrkKyd
	l4Ow==
X-Gm-Message-State: AIkVDXJcv1+p3sRnFmaUA/uZwnHV+dAXZhEimnd1B1mf6xR2wV66MiqctQaNP8DKS3E6aZbsKySP8S5+MBovpcs2
X-Received: by 10.237.36.208 with SMTP id u16mr6428902qtc.105.1483958160484;
	Mon, 09 Jan 2017 02:36:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 9 Jan 2017 02:35:40 -0800 (PST)
In-Reply-To: <98f949d52acc91f155bbc79bbea80a964b2300f0.1483945688.git.Qi.Chen@windriver.com>
References: <cover.1483945688.git.Qi.Chen@windriver.com>
	<98f949d52acc91f155bbc79bbea80a964b2300f0.1483945688.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jan 2017 10:35:40 +0000
Message-ID: <CAJTo0LZoa9zpwiMVyR0ZDk8aOHztjUgYrp20k3YiRUTtDvc1Gw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] selftest/buildoptions.py: do not hardcode 'tmp' for TMPDIR
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
X-List-Received-Date: Mon, 09 Jan 2017 10:36:00 -0000
Content-Type: multipart/alternative; boundary=001a114104ce04802a0545a6efb8

--001a114104ce04802a0545a6efb8
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 07:09, Chen Qi <Qi.Chen@windriver.com> wrote:

> -        pkgs_path = g.glob(str(self.builddir) +
> "/tmp/deploy/sources/allarch*/xcurs*")
> +        tmp_dir = get_bb_var('TMPDIR')
> +        pkgs_path = g.glob(str(tmp_dir) + "/deploy/sources/allarch*/
> xcurs*")
>

I think you meant DEPLOY_DIR_SRC :)

Ross

--001a114104ce04802a0545a6efb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2017 at 07:09, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D"gmail-:gu" class=3D"gmail-a3s gma=
il-aXjCH gmail-m159820fbc12f9764">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgs_path =
=3D g.glob(str(self.builddir) + &quot;/tmp/deploy/sources/allarch*/<wbr>xcu=
rs*&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_dir =3D get_bb_var(&#39;TMPDIR&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgs_path =3D g.glob(str(tmp_dir) + &quot;/dep=
loy/sources/allarch*/<wbr>xcurs*&quot;)<br></div></blockquote></div><br>I t=
hink you meant=C2=A0DEPLOY_DIR_SRC :)</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a114104ce04802a0545a6efb8--
