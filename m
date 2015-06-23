Return-Path: <kergoth@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8317674225
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 21:42:24 +0000 (UTC)
Received: by qcji3 with SMTP id i3so7132681qcj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=zUAw/4VxCStT+ZbJ8OkoSGwkd7egeLsKg/jxmIBCchc=;
	b=dSr+icEiVzeC0z6bT73J6ukkZqXArnrFwOE+25WaUr+KHepwsZwreSIaEY2P8L9Lgu
	+lttfHfibR1NThOmdxeKZ+7HmqcJ0QulwEssfRyVpv6jZtMie+EOS7YRVck6dBVKFLfv
	FwLd/ZTiFPByY+3b+cUmjHTMP7cdvrE1jXKzB2dVxLqropDKj7RvVo31JehwskiC3hnK
	naSw3nqGwFVYLmVKmm7QqsLeKNy6sQcxUEjiMcvKZjGPfjzDTOmBLWaFgpeyt3Scm69M
	g1ec3+rCiMEaaEgq/MXtiTsfFM0gnfbkfws6p5vDlvQrAEkN3LZQZxlxbr4LSb3yk1Yi
	Elaw==
X-Received: by 10.55.16.67 with SMTP id a64mr75123489qkh.31.1435095743044;
	Tue, 23 Jun 2015 14:42:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.73 with HTTP; Tue, 23 Jun 2015 14:42:03 -0700 (PDT)
In-Reply-To: <1435089761-27337-2-git-send-email-anibal.limon@linux.intel.com>
References: <1435089761-27337-1-git-send-email-anibal.limon@linux.intel.com>
	<1435089761-27337-2-git-send-email-anibal.limon@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 23 Jun 2015 14:42:03 -0700
X-Google-Sender-Auth: 95JuyqQRGEfJpAsvr3BT6US6X9s
Message-ID: <CABcZAN=VA7n8WucUUgWiPXK+bqoNB6Qz2dznOyVNQtKbaukmHQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/sstate.bbclass: Improve checkstatus using connection cache.
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
X-List-Received-Date: Tue, 23 Jun 2015 21:42:24 -0000
Content-Type: multipart/alternative; boundary=001a1146f2c2fba169051936436e

--001a1146f2c2fba169051936436e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2015 at 1:02 PM, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux=
.intel.com>
wrote:

> Use FetcherConnectionCache to improve times when do checkstatus over
> sstate resources.
>
> Add debug message about how many SState objecs are available also
> how many time takes to get it.


If this is an RFC, it should be marked as such in the subject. If not, and
you actually want it applied, I don=E2=80=99t think including debug message=
s with
performance metrics is appropriate.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1146f2c2fba169051936436e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Jun 23, 2015 at 1:02 PM, An=C3=ADbal Lim=C3=B3n <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:anibal.limon@linux.intel.com" target=
=3D"_blank">anibal.limon@linux.intel.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Use FetcherConnectionCache to improve times when do checkstatus over<br>
sstate resources.<br>
<br>
Add debug message about how many SState objecs are available also<br>
how many time takes to get it.</blockquote><div><br></div><div>If this is a=
n RFC, it should be marked as such in the subject. If not, and you actually=
 want it applied, I don=E2=80=99t think including debug messages with perfo=
rmance metrics is appropriate.=C2=A0</div></div>-- <br><div class=3D"gmail_=
signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bi=
tBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software En=
gineer, Mentor Graphics</div>
</div></div>

--001a1146f2c2fba169051936436e--
