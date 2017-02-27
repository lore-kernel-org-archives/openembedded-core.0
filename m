Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1B18D71AD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 18:40:52 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n127so111472974qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MXQWbuaK9Aex4qL0uLyQ4cXffJLbhKt2z1FaVZEhveQ=;
	b=gXEuakhDBIEAU7wSKaE1IoJfpSxAbmdHnHG9kdc2mwCSKVavLoXp+BNX18wDBawq3S
	RLPgj6+BDMagcmDX1C4qIzCNsjugMgkruuGda+SN6dMd4W0Ganqt6FS2qkJcfJZImsCb
	KS+EcehZhgcl4wP9xGVw1rizfV5IfXPs4nvm7jbYIFo7Pbqr62cqYMFzqN+E5PDwhw9e
	h8yHwF5EiY1PksKyAN2U7WqdPD8MQGoGatwNwYHg2++M2UhUKNurS//mXBcxxLu/kuzF
	40I0de2++gsozEgQHpehHuQ1ho2lib722Ksizty0Vn9GHFdNTZvOnBp/8Xk3Rpjx07M4
	KCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MXQWbuaK9Aex4qL0uLyQ4cXffJLbhKt2z1FaVZEhveQ=;
	b=jvNoiAS++ULbMswFAAi9YUVMG+RiltZtabfOrhoDqAynhxet/2Dtp7P05CxqDSsBoI
	lknYi50y0Ld0VKXQKa31gSNieaQzRecv3QD5dnDuqe9OZcko0H+JYuXdND9hNop/NK3k
	6286vQvGAIqhggykEinLQ5u14q+ZZOUREIKEr2DbwvJ46FZj5F/mfiV6hOqBAndjsLoz
	cb+dgS5UJ4VgPw8c0K4DZkklvIDN2LQbufRXCXwgwAocRtiKnRAGJ6tWtEEtDjmzC6RB
	KX4EoHoMu7LitWfGMlo2p0WORVc8xf4clo/j2rg3ZwX+XawT8JYHywDXU7P2BXowGOBo
	VWZQ==
X-Gm-Message-State: AMke39kzKOahMloiRkrkcmOSoiiJzvqhTAgWW10tbUshTDRSXZUK2vxfxsWY08f3j/ixHLm/Lf4lKxJfaDYbNHcJ
X-Received: by 10.200.41.115 with SMTP id z48mr15459977qtz.109.1488220853093; 
	Mon, 27 Feb 2017 10:40:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 10:40:32 -0800 (PST)
In-Reply-To: <1488215925-26396-1-git-send-email-peter.marko@siemens.com>
References: <1488215925-26396-1-git-send-email-peter.marko@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 18:40:32 +0000
Message-ID: <CAJTo0LbUwQmWJzy=Q=Sy6G3dOVUR_s2ejLbP9PyAE=2Pq3mzAA@mail.gmail.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: Andrej Valek <andrej.valek@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zlib: Upgrade 1.2.8 -> 1.2.11
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
X-List-Received-Date: Mon, 27 Feb 2017 18:40:58 -0000
Content-Type: multipart/alternative; boundary=001a1140699c4cda600549876b6c

--001a1140699c4cda600549876b6c
Content-Type: text/plain; charset=UTF-8

On 27 February 2017 at 17:18, Peter Marko <peter.marko@siemens.com> wrote:

> -LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=
> fde612df1e5933c428b73844a0c494fd"
> +LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=
> 5377232268e952e9ef63bc555f7aa6c0"
>

To demonstrate that you haven't just updated the checksum without checking
the license changes, can you sent a v3 with an explanation of this change
in the commit log?  Something along the lines of "copyright dates changed"
is fine, we just need to know that the change isn't "relicensed under
GPLv3". :)

Ross

--001a1140699c4cda600549876b6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2017 at 17:18, Peter Marko <span dir=3D"ltr">&lt;<a href=3D"=
mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":31l" cla=
ss=3D"a3s aXjCH m15a8095bf787c8c8">-LIC_FILES_CHKSUM =3D &quot;file://zlib.=
h;beginline=3D4;<wbr>endline=3D23;md5=3D<wbr>fde612df1e5933c428b73844a0c494=
<wbr>fd&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://zlib.h;beginline=3D6;<wbr>endline=3D23;m=
d5=3D<wbr>5377232268e952e9ef63bc555f7aa6<wbr>c0&quot;<br></div></blockquote=
></div><br>To demonstrate that you haven&#39;t just updated the checksum wi=
thout checking the license changes, can you sent a v3 with an explanation o=
f this change in the commit log?=C2=A0 Something along the lines of &quot;c=
opyright dates changed&quot; is fine, we just need to know that the change =
isn&#39;t &quot;relicensed under GPLv3&quot;. :)</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140699c4cda600549876b6c--
