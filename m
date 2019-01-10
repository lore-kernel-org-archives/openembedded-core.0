Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id D19436C20D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 23:54:05 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id l14so10615851ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 15:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zq5gN7yNYvqhyoyjJQAEQ7jAsdl52MlbvVjEqTXftSY=;
	b=No1Fhyc2FV0pXXvzpE4PRc5m57oCMmybxI4fcxV/nDVMywU2hxkg/pWigIsoRAjkIK
	824GMsvWNKvchSTG+vl9JYMU8VrzztlfhMKbC8F+ARoK/127wU4gUw2Xd00DcRHwtLFF
	cNXIsCZq3Kv0wnYxwvLtc7p0rld2ookR1cCPnpBlq5AcRgS9Sv8mZjLt0Xg3FoYqetHa
	CEow5joLENToG38W5Q0paiuER0D0vff1xKVPnbkXH7RtnBwF8UJ9EJ+lgNhFWwTpO84B
	+vsNRsoTq5rdWEtswXzFOMpLkDiyjS41Vq1+3w1prvWL7IjbgATxlr3dAHPUIxaF/d87
	6b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zq5gN7yNYvqhyoyjJQAEQ7jAsdl52MlbvVjEqTXftSY=;
	b=lFQd0xeEb+gsz+PgnTZBVMe/RC6xLJBa/oTHlYEl46Q5oDEBFjX/tofywC4WaXeVdp
	Gvkorvyw4rZPnjlH9bpatiSFimfMooqS3RrRP3uPOu7JN+SVdC8dmI2OONMtf91dBbGU
	G1U8XzIVP2/iWcxG5G+4KM5tntAqq85U9CxJR9uLVFfLfY488qVXA89ZxgxeI8ZWk3+b
	9J9L4JejgndgSpvaPS4x4WemhxXlEaMFp34ER3fsJgurMYaVY6pa5n7NBaWxMwzB6Efb
	MVCrygwy70vr06PUe/cpcoR6z8Exv7BKcMcpKrvfE244G8NxmwXMLBRNtiICrC21j67s
	u1yg==
X-Gm-Message-State: AJcUukfgQUIfMx+1yXo/8HFLNlxCCSCDpOnJ+vv2YMRIwF5kkQcH/FwE
	7obi7xzFVbPMT9PbmzJCYWcKNHrH3ItKDh3vnnDRDQ==
X-Google-Smtp-Source: ALg8bN6J/66FuKB7jaFONGQdw0SqMl8oc+TFyGsqiPcHCmwu2yTXK+KKOKisMdcAN0N05aLfThxVHvWu6G/tLY27AdU=
X-Received: by 2002:a6b:f70a:: with SMTP id k10mr7289994iog.270.1547164446952; 
	Thu, 10 Jan 2019 15:54:06 -0800 (PST)
MIME-Version: 1.0
References: <20190110195121.13070-1-alistair.francis@wdc.com>
	<CAJTo0La+pRHTRkRtKUOKChgmRGtO6wp6LKiku-AMun8mgMo7UA@mail.gmail.com>
	<CAKmqyKPEvPOrn+Xds5FOqF9+xs_KdjOLMJL=9+fT9_4bW4CKCg@mail.gmail.com>
	<CAJTo0LavX1oxCPyK=g84LiaBsveo=n2bMOndEHWFPBhHPBRJ6w@mail.gmail.com>
	<CAKmqyKMpV3Po2oknYimYn=u4+Cv=s9cLki+gn7_-wM1P_XynyA@mail.gmail.com>
In-Reply-To: <CAKmqyKMpV3Po2oknYimYn=u4+Cv=s9cLki+gn7_-wM1P_XynyA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jan 2019 23:53:55 +0000
Message-ID: <CAJTo0LZobTXvEG1cEMyirNLz=EQcA3x6K1QDQQ-qqejA-RRHFQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 10 Jan 2019 23:54:06 -0000
Content-Type: multipart/alternative; boundary="000000000000452a4b057f234ba2"

--000000000000452a4b057f234ba2
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jan 2019 at 23:14, Alistair Francis <alistair23@gmail.com> wrote:

> > libinput isn't useful without a graphical debugging tool?  That seems
> quite a stretch.
>
> I meant that libinput isn't useful without the gui support.
>
> I think that this is worth having the extra packages as libinput is
> not really useful without gui support.


Sure, but the gui packageconfig just does -Ddebug-gui=yes, which just
builds the libinput-debug-gui binary.  Surely that isn't essential?

Ross

--000000000000452a4b057f234ba2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, 10 Jan 2019 at 2=
3:14, Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair=
23@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left=
:1ex">&gt; libinput isn&#39;t useful without a graphical debugging tool?=C2=
=A0 That seems quite a stretch.<br>
<br>
I meant that libinput isn&#39;t useful without the gui support.<br>
<br>
I think that this is worth having the extra packages as libinput is<br>
not really useful without gui support.</blockquote><div><br></div><div>Sure=
, but the gui packageconfig just does -Ddebug-gui=3Dyes, which just builds =
the=C2=A0<span style=3D"color:rgb(3,47,98);font-family:SFMono-Regular,Conso=
las,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:12px;whit=
e-space:pre">libinput-debug-gui</span>=C2=A0binary.=C2=A0 Surely that isn&#=
39;t essential?</div><div><br></div><div>Ross</div></div></div></div>

--000000000000452a4b057f234ba2--
