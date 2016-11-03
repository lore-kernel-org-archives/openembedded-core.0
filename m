Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id E1BA7601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:40:24 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id x190so69565393qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KApSlLXBH84eOknFtkCOnP0+SFwXy+MwjxuHfA0/nNk=;
	b=XyMFRxjT6A+3xHMcC2p/WkHs1WThG0Z/dY3q3g2Xlo6pFAvIRzW6wdAqldtQnxP9nm
	X5KBxGYrSTxo1zzlro1zb3Dtj4axH+gLSGXdIQbBhwKW8sD9Tg8wvEmFF7pyoSkELKfp
	LQqKEnaHMaE24kqcNn4WZWepfTQuwthTqyIbStsyyXx8orUuhFKPhI0bajXBhzamaaDF
	QRIICL9gP9ciI4rSKWWDxTScH6om0Xme3tLvgCDWefTgnDr9vydgLdRamPwMP5yQq8Lt
	WYTCSTmm4UUBafBbiJRmsbS0i5fnEq4xO4LJapRDUMSbwSweI0UlT1S8QtHp36+YrzSD
	cDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KApSlLXBH84eOknFtkCOnP0+SFwXy+MwjxuHfA0/nNk=;
	b=Vn11PMpn9lEcDX6k+AWU3KgiNY28K9kwtnBIE3sXfSC/EE/MPiJARjbGiGBcx7Y8s5
	/nqwjmRisBxY02VFachUJgUFIMBDM78Wui3QwPhHbhHlkXOytYbREau5BtUrHxTq35Hc
	28v3SQrp7OxUJkM3vAVbsQXsbF4Ixy8Ft1gRocqVuNcCqvdUkf1WfWoZ/eR1s5tfqvIx
	O0yLeCzblfHWIAzybbnWvJmjtIqA2RCrSQi57Xd+Up7Mym47hQJgdvIYSccbKL5pXohX
	rCj10VR65H1Djg356fc8LbA5p7g/kT/yA93wN/Ab+LMU2q7U7kfDo/ueHqCNTmnHWGO9
	GGUg==
X-Gm-Message-State: ABUngve/MRDG/lM4pWw3xRJJ2WuVLT57ZNiAfbNOgUx7GueC1SdzSReFT2atVif4LKNM/PCShRGqV1t9V1F5yR6X
X-Received: by 10.55.31.157 with SMTP id n29mr9196738qkh.221.1478202026192;
	Thu, 03 Nov 2016 12:40:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 3 Nov 2016 12:40:05 -0700 (PDT)
In-Reply-To: <1478187243-17488-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478187243-17488-1-git-send-email-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Nov 2016 19:40:05 +0000
Message-ID: <CAJTo0Lb7KFypggDwyWF5_7KutJ-Tq9k2+8E69696CirEWrcpRQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] serf: Update to version 1.3.9
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
X-List-Received-Date: Thu, 03 Nov 2016 19:40:25 -0000
Content-Type: multipart/alternative; boundary=001a1147f228ad8d7a05406abaad

--001a1147f228ad8d7a05406abaad
Content-Type: text/plain; charset=UTF-8

On 3 November 2016 at 15:34, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/s/serf/"
> +UPSTREAM_CHECK_URI = "${APACHE_MIRROR}/${BPN}/"
>

As all the tarballs are in a single directory you can probably just delete
this line (though please do check with bitbake serf -c checkpkg).

Ross

--001a1147f228ad8d7a05406abaad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2016 at 15:34, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossyst=
ems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1ar" class=3D"a3s aXjCH m1582af0cb93027db">-UPSTREAM_CHECK_URI =3D &qu=
ot;${DEBIAN_MIRROR}/main/s/serf/<wbr>&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;${APACHE_MIRROR}/${BPN}/&quot;<br></div></blo=
ckquote></div><br>As all the tarballs are in a single directory you can pro=
bably just delete this line (though please do check with bitbake serf -c ch=
eckpkg).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a1147f228ad8d7a05406abaad--
