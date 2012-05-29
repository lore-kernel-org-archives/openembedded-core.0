Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SZToV-0004WO-Bh
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 23:18:47 +0200
Received: by dalh21 with SMTP id h21so6429294dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=MGEkQNY1rLr4g/IzHk8S2IbRuIrY4rpjdLku1SqvyMo=;
	b=O9fhmtp9kU8zKHH62tgITew0+hQVYOE1Sic8cZiyCAsehlCvtptLEkFz204w1bKHec
	R/wdk0SYV74S7Oa18qCpvPGO8x7DtyTp3lcGINbjitAnLOTOy2f9VXQZXOze3Tb4994Z
	CISYl5wrM3GP8SgUWUKbeJ/VJhwqaTXH3bhwZuPlnwghkAsk/2kDqASKv2ywJPdn2wPo
	8lA5NbOXUkoZxeMWMYwU/LlAWAc2RMEIdVDs/qSffhSIptv+VDmeuFDvA261vREv3fu/
	MNIchFq0xwIEb0RzJ83W8H6CQ5dkXeTa9k/bVnr53JIOdBSbQrBCbu/IuEsh/RUnSglD
	X9+w==
MIME-Version: 1.0
Received: by 10.68.213.104 with SMTP id nr8mr42148696pbc.26.1338325708766;
	Tue, 29 May 2012 14:08:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.25.42 with HTTP; Tue, 29 May 2012 14:08:28 -0700 (PDT)
In-Reply-To: <73870ed1649a9fae2e44ed6299bfb068217b9e9c.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<73870ed1649a9fae2e44ed6299bfb068217b9e9c.1338323483.git.ross.burton@intel.com>
Date: Tue, 29 May 2012 18:08:28 -0300
X-Google-Sender-Auth: JjZ7O2cqLRC_Lb_4QQf99MLrFtM
Message-ID: <CAP9ODKotiqYtyY9sZ_9TqA3V2OoFRpkMpQLsR9sFSQqLaWf9iA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] connman: upgrade to 1.0
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
X-List-Received-Date: Tue, 29 May 2012 21:18:47 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c3d076fc1b04c1333ced

--e89a8ff1c3d076fc1b04c1333ced
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 29, 2012 at 5:43 PM, Ross Burton <ross.burton@intel.com> wrote:

>  .../connman/connman/disable_alg-test.patch         |   46 ----------------
>

This will make the build fail with old kernels.


>  .../connman/connman/ethernet_default.patch         |   22 --------
>

Did you check the network is started by default?

Regards,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c3d076fc1b04c1333ced
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, May 29, 2012 at 5:43 PM, Ross Burton <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
=A0.../connman/connman/disable_alg-test.patch =A0 =A0 =A0 =A0 | =A0 46 ----=
------------<br></blockquote><div><br></div><div>This will make the build f=
ail with old kernels.</div><div>=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

=A0.../connman/connman/ethernet_default.patch =A0 =A0 =A0 =A0 | =A0 22 ----=
----<br></blockquote><div><br></div><div>Did you check the network is start=
ed by default?</div><div>=A0</div><div>Regards,</div><div><br></div></div>-=
- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--e89a8ff1c3d076fc1b04c1333ced--
