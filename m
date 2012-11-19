Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaOma-0005np-Dz
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 11:40:52 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2973297pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=/229MFR809ihdwsNVm9KF54VBSUSYC5n8Tvvd74X26Q=;
	b=JUv2LSlf/IIJOgIYnTv8sxBGUoQL9wB1pqe7OCoJ1IjWF9jyr/XgAGV6YRxx1cEw5u
	LPRXIyirc9cqxKzR4FKpkIHvErxubPM2KAIhoszB8o4hxJMR1Rzmxnq6D6TmXIh1Xpdt
	LV0DXSnYtDnoei0uvGzpttx+IDO/YZ/h6rvwiQHlGoS0UaL/ebCx5su9UP5QmgJfUT47
	sE8Lyx7zOO9cbVuegy7IE9ODOHoNVKSvALUCSqlrkf/Q5Eim9grT6GBmTjEF33Mr7L/g
	Ne3+51fjCfsam+OAhqms/aMq4K30R9ZM56Ikay8ioPNO2h+247SEfYH4swYFaoIKLaqN
	iK3g==
MIME-Version: 1.0
Received: by 10.66.85.69 with SMTP id f5mr34369015paz.50.1353320809734; Mon,
	19 Nov 2012 02:26:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 02:26:49 -0800 (PST)
In-Reply-To: <d3d921e5893d008e4597ada22556e7c9e62dfeba.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
	<d3d921e5893d008e4597ada22556e7c9e62dfeba.1353304234.git.sgw@linux.intel.com>
Date: Mon, 19 Nov 2012 08:26:49 -0200
X-Google-Sender-Auth: QX-bG7-ogKySYZFMqMEXPbbU_CI
Message-ID: <CAP9ODKpwoc1UM2fEYFXCUNFf+AErFGx13QSt=eAY2S9YLKGn9Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 14/17] rt-tests/hwlatdetect: Update to 0.84
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 10:40:52 -0000
Content-Type: multipart/alternative; boundary=f46d042ef56321a19004ced68e56

--f46d042ef56321a19004ced68e56
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 3:54 AM, Saul Wold <sgw@linux.intel.com> wrote:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

It seems you missed the SRCREV update. By the way, move the SRCREV to the
recipe instead of the .inc file so it is clear it is version dependant.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042ef56321a19004ced68e56
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Nov 19, 2012 at 3:54 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br></blockquote><div><br></div><div>It seems you misse=
d the SRCREV update. By the way, move the SRCREV to the recipe instead of t=
he .inc file so it is clear it is version dependant.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d042ef56321a19004ced68e56--
