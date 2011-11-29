Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RVCGD-0003wG-Gi
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 02:13:25 +0100
Received: by bkbzs2 with SMTP id zs2so8633411bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 17:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Kba9VAtD/xecPIBcuvaqOJbWIQzqVbHkD3vjDts11dQ=;
	b=NZnupztlPIVrFXbrRMtsqYahgARZcy6dzT76/HchjVhWcK/rA6j/g8lgMAShWoPAzy
	txXn9TyLeOK99R8BaRlzpoOm1f2itXJka0iZDA2J0cCH6Vj0ffHwOEM1/Z/YPdgeyhQQ
	iCuiWc6skL0mLwggXkVv2WC78qj13zISUFc+M=
MIME-Version: 1.0
Received: by 10.205.83.73 with SMTP id af9mr48149499bkc.24.1322528805752; Mon,
	28 Nov 2011 17:06:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.148 with HTTP; Mon, 28 Nov 2011 17:06:45 -0800 (PST)
In-Reply-To: <4f8425c0c7856dba2b3765407a97754c7b06aeb5.1322526931.git.nitin.a.kamble@intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
	<6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
	<4f8425c0c7856dba2b3765407a97754c7b06aeb5.1322526931.git.nitin.a.kamble@intel.com>
Date: Mon, 28 Nov 2011 23:06:45 -0200
X-Google-Sender-Auth: EUH2AgDk_8SUglOdIdH63afc0DA
Message-ID: <CAP9ODKpm7jB4FhBuNC7biDyuhVg8Kdxf5wEcm+WwsAyRtZR+WQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gmp: also generate the libgmpcxx library & package it properly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 01:13:25 -0000
Content-Type: multipart/alternative; boundary=bcaec554016aac0ffe04b2d53b5c

--bcaec554016aac0ffe04b2d53b5c
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 28, 2011 at 22:36, <nitin.a.kamble@intel.com> wrote:

> ...

+PACKAGES =+ "libgmp10 libgmpxx4"
> +FILES_libgmp10 = "${libdir}/libgmp.so.10*"
> +FILES_libgmpxx4 = "${libdir}/libgmpxx.so.4*"
>

Why didn't you let the system to name the package using the soname by
itself and avoid putting the soname on the glob matching?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--bcaec554016aac0ffe04b2d53b5c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Nov 28, 2011 at 22:36,  <span dir=3D"ltr=
">&lt;<a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a.kamble@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
...</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex;">+PACKAGES =3D+ &quot;libgmp=
10 libgmpxx4&quot;<br>
+FILES_libgmp10 =3D &quot;${libdir}/libgmp.so.10*&quot;<br>
+FILES_libgmpxx4 =3D &quot;${libdir}/libgmpxx.so.4*&quot;<br></blockquote><=
div><br></div><div>Why didn&#39;t you let the system to name the package us=
ing the soname by itself and avoid putting the soname on the glob matching?=
</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--bcaec554016aac0ffe04b2d53b5c--
