Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TgHd0-0000Dn-Ve
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 17:15:19 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so3237374pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 08:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=/h8MkN6uQo09y3kFc+yYlE1DCsfpop5/yklp2Uxfg8I=;
	b=syXnOq+n0BaKECu0mdrX8VaUFXL99l0gs95JzI6WBSjjrpDEtPj8gH2END/XI2f2NG
	qWNdOzk24cmrYMkCnI+cbqnW+wkt02/ktKzMXaC6UC1BCvdo7Pz8R6Z8a/+gQpSwh64S
	u0hfu6MxNatd75lEtK7wEjAZluNx2VKcTaWwgVgDUJx1mhnfRBj5f5ob7I5MSo0+AiYN
	wlD95KyUnj37X7JS3rUqrbF8Wry0Bx8iCBkduOZZhYPVeb/YxoHO7Adsj3Ak3SIxLSZz
	65HtOmP8GGkyZ6c2TZ69O1XAlcaI/jhBKg3usphNutCHEDjr4y+1nHuYJIN1GVq6AWqH
	PyIA==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr50549953pbc.33.1354723254214;
	Wed, 05 Dec 2012 08:00:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 5 Dec 2012 08:00:54 -0800 (PST)
In-Reply-To: <CAJTo0Lbn5jWz7SbJ96GrjJsZAwqkN=MWeJCaP_85YifN_PgXRQ@mail.gmail.com>
References: <1354654683-16793-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKr0TG3LRah3rCjwwUCkka=kHW3Ed4LXNpWA+81Eb2t=GA@mail.gmail.com>
	<CAJTo0LatQogGTmc41DMtyJi3mjtNRqWgX65Xw4AfwNra+37bGw@mail.gmail.com>
	<CAP9ODKq74Q9pcM_T_-q62H3vWJH_Pk3BSGRbx0=7mf8h9UDGAQ@mail.gmail.com>
	<CAJTo0Lbn5jWz7SbJ96GrjJsZAwqkN=MWeJCaP_85YifN_PgXRQ@mail.gmail.com>
Date: Wed, 5 Dec 2012 14:00:54 -0200
X-Google-Sender-Auth: 2SUWyr-0A5SyfW2u7jhPfn6IIzc
Message-ID: <CAP9ODKqOVCg2F6rWJFc0=J2+de-gCEETPiVFxHYUPJ14cf1c+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-meta-base: pull in X11 plugins when using X11
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
X-List-Received-Date: Wed, 05 Dec 2012 16:15:19 -0000
Content-Type: multipart/alternative; boundary=047d7b10d185561fa204d01d16ea

--047d7b10d185561fa204d01d16ea
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 5, 2012 at 1:55 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 5 December 2012 15:52, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > Just xvimagesink as this is an improvement, not a requirement.
>
> That's an interesting definition of improvement.  Video playback over
> X11 without using Xvideo is crazy.
>

Well, dependencies means it cannot be used without it. Recommends is
something which is important and makes sense to be used with it (most users
do) but not a requirement.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d185561fa204d01d16ea
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, D=
ec 5, 2012 at 1:55 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 5 December 2012 15:52, =
Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossys=
tems.com.br</a>&gt; wrote:<br>

&gt; Just xvimagesink as this is an improvement, not a requirement.<br>
<br>
</div>That&#39;s an interesting definition of improvement. =A0Video playbac=
k over<br>
X11 without using Xvideo is crazy.<br></blockquote><div><br></div><div>Well=
, dependencies means it cannot be used without it. Recommends is something =
which is important and makes sense to be used with it (most users do) but n=
ot a requirement.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--047d7b10d185561fa204d01d16ea--
