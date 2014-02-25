Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4B16CAD5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 18:18:42 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id x3so2763982qcv.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 10:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0ZzHlJ0bY+HIlh4ukbKmw+RHiFeNdvnBY+yMi3l3DSU=;
	b=nosecDzsDZTToTbTpv1RQSGXfROqAOQXoYtVTygTtJIJHC8ks5OhRRybqhmCjRjJQk
	9D4mfKjBR1OhoxfzsZsZTYs2jM5LtDe9VLTlOyCQzraLSR6ht1jmxXG7SCNAztLWKwYz
	bcQR9lpcDgQsu5O9YR0qyHJZ9fIQciLjyAECM+X7r4iBvSLZ/TuXNgJfg/wE99SeYkXi
	1LAZF+0o+iHwPSko4Qh3Hy3SfsBhXbmG9DkwZWJzoj5XTI8ejOAL7jizlEPvDg51x0IS
	nS51jCEGgqRdUn+b8+bB5WfQiypLpUdd+vmREZ3ixRvq0rOK9DbRkmZmN6eiF0smDmsh
	apyA==
X-Received: by 10.140.91.228 with SMTP id z91mr1961344qgd.32.1393352323446;
	Tue, 25 Feb 2014 10:18:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 25 Feb 2014 10:18:23 -0800 (PST)
In-Reply-To: <CAMKF1srJ5Gi1j-m+rObvMwNYnrfgeKhJwy3LyLhCx=kNtWgsGA@mail.gmail.com>
References: <1393280958-18379-1-git-send-email-diego.sueiro@gmail.com>
	<CAP9ODKpGE22EOaUgqnaYGF47dsidsAF5_zFxUdNz=EzfSeQOWg@mail.gmail.com>
	<CAMCfZKG7ZQUdaFJ8MfCyyKR17p0w=MagQNMNeZR9cGTmiMasPw@mail.gmail.com>
	<CAP9ODKoCwUtYzbhnj2Ka1HOEdYo=UZk6vPVHxsCB43Z1k0hcFw@mail.gmail.com>
	<CAMKF1srJ5Gi1j-m+rObvMwNYnrfgeKhJwy3LyLhCx=kNtWgsGA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 25 Feb 2014 15:18:23 -0300
Message-ID: <CAMCfZKFQEoUhcEADCOz-bfHN=yK0dDWkk6D6KgRAH1vmufLGLA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH v2] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 25 Feb 2014 18:18:45 -0000
Content-Type: multipart/alternative; boundary=001a113a7b1e493c1104f33f1ee8

--001a113a7b1e493c1104f33f1ee8
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 25, 2014 at 1:41 PM, Khem Raj <raj.khem@gmail.com> wrote:

> ofcourse, however all I was suggesting to make it a little more
> understood with some
> comments.
>

So,
I can remove the header text from commit. What do you think?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a113a7b1e493c1104f33f1ee8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 25, 2014 at 1:41 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":rn" style=3D"overflow:hidden">of=
course, however all I was suggesting to make it a little more<br>
understood with some<br>
comments.</div></blockquote></div><br>So,</div><div class=3D"gmail_extra">I=
 can remove the header text from commit. What do you think?<br></div><div c=
lass=3D"gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,<=
/div>

<div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados=
<br><a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&=
amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" targ=
et=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a113a7b1e493c1104f33f1ee8--
