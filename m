Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 803FC7F304
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 10:14:10 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id w195so10715773vsw.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 03:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6lXkp+SpMimagjZ2EkgLTVj5CFOjijK/6GQAFrOHj6Y=;
	b=O0d/s21uqKijhXal9SIL/d0vm7Hf3kdAbDvp9c2PTbMWQYSZN3c7lZP4rvrzR6BXQR
	ySiQi9M8ee/I6MhNa47Atmu4LHcWWm+LZ343DX+AhKZzS2E3fcvTyfCLIMgLYG5CgbFB
	srN6nJER5MhHk+rsnOHT/lSmOB3qS3MsSvrZDYiTO0991fzejImv+ikReFMwit5PKSrc
	SmBtSQJg9gkPX0PpKiLwtzs2VhGQPUvTh+oY7AxtswqEVXik6qGPB5LPYiDLspfHd7Ec
	oCWqhoDPKnIqsuS/Vz5T6St+TpsDRT58WKZXmWZKafbuKv4RJf8RmatlhhQXO3Z6HMFo
	vMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6lXkp+SpMimagjZ2EkgLTVj5CFOjijK/6GQAFrOHj6Y=;
	b=fwNaa+zubR5NQ8fWlyR/9BXR7R888kZx//qdaBQoJCEaTimtXoFmT+yxD/InJgEmLQ
	5XQ+TWDqjeDMNGFucUt27LFa6y5Enm0bkQShxuM3mRGAGx9qJzC0tTyqLqC/8Pc110Ku
	6X1Hvcl1BTEFq1Mh0W2cP5E/mx9FDmQuVVjNiUDIsTiVhdytzKP0XcfMBo6yujR7eq8V
	HJfguMFAI3W6qgk4Og6hVmBuUWUPcszO2bDTTLSth7PniuvKtBUZ9XPtxxUs3hAUvVRn
	VUC8tO7zlprgs1pc2e2e++BwWt5dkSanaXYJrTQmVMdmW1lCUj0BTTIHCd15PrGC8Av8
	An7w==
X-Gm-Message-State: APjAAAXNxp+tns7bkrQGNwuEtq2MZysSavVcHptshr9iNZA79HVP2wx2
	8oF5HqahUGDYqqoGEM+VF9xRxSHa/LALzKcoaMXyQQ==
X-Google-Smtp-Source: APXvYqy5wXENiJ1h/Gwz+hq15fHw8utP4YwtKETfkg04mSVyYkoLkoJYEmVaY/i6+iWpWtmekiDne3Wg/tGzl9MO16g=
X-Received: by 2002:a67:7087:: with SMTP id l129mr4499818vsc.83.1567592051418; 
	Wed, 04 Sep 2019 03:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <1567386885-110297-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj93Trq7+ytueYA9QDa=o2HjtJJRCADcUW-dqJML3+u+DA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B5B6D581@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6D581@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 12:14:00 +0200
Message-ID: <CANNYZj-hR7EV+qYcmrTbtcagmNKyc22xA3BBe3qTS-jPvpa1qw@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-environment: make rpm and dnf work in toolchain
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
X-List-Received-Date: Wed, 04 Sep 2019 10:14:10 -0000
Content-Type: multipart/alternative; boundary="00000000000060ae3e0591b77728"

--00000000000060ae3e0591b77728
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Sep 2019 at 03:44, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Thank you for your advice and I have a question.
>
>
>
> 1:-> This does not seem like the right place to me to adjust the settings=
.
>
>
>
> Well, did you mean that I shouldn=E2=80=99t adjust the settings in
> meta-environment recipe, instead of it, adjust the settings in the
> nativesdk-meson recipe?
>

What I mean is that you take nativesdk-meson recipe as an example of how to
do special configuration for nativesdk, and do similar adjustments to
dnf/rpm recipes. Specifically, the wrapper can set up environment
variables, and the script in post-relocate-setup.d/ can  write
configuration files.

Alex

--00000000000060ae3e0591b77728
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Sep 2019 at 03:44, Zheng, Ruoqi=
n &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujits=
u.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_8175029106250075370WordSection1"><span style=3D"font-=
size:11pt;font-family:&quot;Calibri&quot;,sans-serif">Thank you for your ad=
vice and I have a question.</span>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">1:-&gt; This does not seem like the right place to me=
 to adjust the settings.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,sans-serif">Well, did you mean that I shouldn=E2=80=99t adjust th=
e settings in meta-environment recipe, instead of it, adjust the settings i=
n the nativesdk-meson recipe?<u></u><u></u></span></p>
</div></div></blockquote><div><br></div><div>What I mean is that you take n=
ativesdk-meson recipe as an example of how to do special configuration for =
nativesdk, and do similar adjustments to dnf/rpm recipes. Specifically, the=
 wrapper can set up environment variables, and the script in post-relocate-=
setup.d/ can=C2=A0 write configuration files.</div><div><br></div><div>Alex=
<br></div></div></div>

--00000000000060ae3e0591b77728--
