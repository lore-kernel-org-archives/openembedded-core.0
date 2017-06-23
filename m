Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 727CE78066
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 13:09:41 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id 16so35004643qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sQEVmkcmJLA6IriEAdA2fHOllmWXNqQcMS7M00BjNbA=;
	b=K6GBpES3LT9LvUNSNSbdsUFvrgR3sIvspKVAyME4oJM6iI1ZtA7Qyhhc/U3i9XldyM
	ZFuEgFtQbNhxzprDetzYZbCE/jBT2Vm8n0Umz2hSMWzVMluLFKkI88tfN5v1+/GXpRyp
	5f1IUaJh3q2MvJ61JYPz51KHNhO7wn5Sgp8CtsJPtiZTCaN8er+OwYkUGym4777fJDDX
	rMMymjpu9Kkk4+GZ+amcluWoHea98pNcwzcsbTfYCd1sTKV9JmUsCkRhVWcVfHYSL+04
	wySBRi2DioeoJVsRzItN+VEbGzjQNTR6/DaN2LHR00yzI1mmSa3TOo3nwtj26OnQ/mUc
	SL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sQEVmkcmJLA6IriEAdA2fHOllmWXNqQcMS7M00BjNbA=;
	b=UlzHQGvmYxf/zjHbIbZQQCVs8cskBGqJsqQtGstc3Rlj0bDzGIklhjrb9q3He/BJLy
	+XAq3OXkMU6RNPC2xzYf5Bqa7c8E0uEyHRFSQua851DX2Sf64X+T7k8oi+PiME/sMm6j
	DupV9HISfXuBJ6W0NT2JR27aEuxdPGUbj1D7uh9Nl71cikToOUW65JGIzhQLtsMhr3Qv
	bKovvLlIcmKfomnaMvOHKte/Bbn1oP89/4AcNj9kc9lFoNFwffZ1gNP2F/rCUylzhl8g
	oFh6ISWHm75iBpXKjV5NwmmzTbxNK4GU3o/UyX2PZREldT4hGe9p9SXH6Mxg6LADw7vT
	qvmg==
X-Gm-Message-State: AKS2vOy2YpO1bfQEW0Y9UirQuAJnCwADxvZ4yqwPHTF7/6EZbCyu2XU1
	ktDcsHIXU2RQRYEk2PlDs33gVRTJrNw9
X-Received: by 10.55.214.221 with SMTP id p90mr8635681qkl.228.1498223382433;
	Fri, 23 Jun 2017 06:09:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 23 Jun 2017 06:09:22 -0700 (PDT)
In-Reply-To: <20170619143145.11911-1-pkj@axis.com>
References: <20170619143145.11911-1-pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jun 2017 14:09:22 +0100
Message-ID: <CAJTo0LaBMEicpXpyOdA+U+=Wm9fVCepREHJMcsZ_LeMRRd7WaA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] oe-pkgdata-util: package-info: Allow extra variables to be displayed
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
X-List-Received-Date: Fri, 23 Jun 2017 13:09:41 -0000
Content-Type: multipart/alternative; boundary="001a1147a4188127600552a050a5"

--001a1147a4188127600552a050a5
Content-Type: text/plain; charset="UTF-8"

On 19 June 2017 at 15:31, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> +        if args.extra:
> +            for val in args.extra:
> +                src_uri = mappings[pkg][val].strip()
> +                src_uri = re.sub(r'\s+', ' ', src_uri)
> +                line += ' "%s"' % src_uri
>

I don't think you meant src_uri here.  :)

Ross

--001a1147a4188127600552a050a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 June 2017 at 15:31, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":511" class=3D"a3s aXjCH m15cc0c4a319ad830">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if args.extra:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for val in args.extra:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri =3D mappin=
gs[pkg][val].strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_uri =3D re.sub=
(r&#39;\s+&#39;, &#39; &#39;, src_uri)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line +=3D &#39; &q=
uot;%s&quot;&#39; % src_uri<br></div></blockquote><div><br></div><div>I don=
&#39;t think you meant src_uri here. =C2=A0:)</div><div><br></div><div>Ross=
=C2=A0</div></div></div></div>

--001a1147a4188127600552a050a5--
