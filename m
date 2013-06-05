Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 805E06A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 17:45:58 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id 10so4564668ied.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 10:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Cc8kr5yAniKLEiftMpOvZIuD2Myp5Hx9qrHwx4RhAZU=;
	b=mBXXiM/vo1vtSv+S4c5Az5LxvQ7xkOtVA9ZR9ul9ZpES2pQyhd5HXq/6fBedTOVE+F
	sL4sgtLNsJeVPzMi4vkeGE4FSR0Y+2rU6s5ito//NmeE6c315EqKtmyH8+LVqsfFw80g
	LIgJ3A3yt0k+XtckhEQJNcmhG6QN9T7cjnWMQxI6eCemUWYnmXVX2L+jYW13GkhSLCW5
	bZHaVqMXdxpqSjjmF3VS/XOD4pd32V4A02lD6GUrBrEy7baFNEYKd/PDk0HtHQnOtQm1
	iAJPDQ0NLmpAqSWleYeuJMer1iRTeuwQ9Q9xbm/BazAMf/MxGmCCrcQwNnnAGECyLc+Z
	vT9Q==
MIME-Version: 1.0
X-Received: by 10.50.39.35 with SMTP id m3mr3781309igk.42.1370454359624; Wed,
	05 Jun 2013 10:45:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.11.231 with HTTP; Wed, 5 Jun 2013 10:45:59 -0700 (PDT)
In-Reply-To: <1370447550-23693-2-git-send-email-andy.voltz@timesys.com>
References: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
	<1370447550-23693-2-git-send-email-andy.voltz@timesys.com>
Date: Wed, 5 Jun 2013 14:45:59 -0300
X-Google-Sender-Auth: nPPsY1ie_1KO7NWvGbHrx7XngdI
Message-ID: <CAP9ODKpqdS4gSWdzKXo=bTv3OW4PJ2hUVFjc8MxnMzvtiR5kNA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andy Voltz <andy.voltz@timesys.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Wed, 05 Jun 2013 17:45:58 -0000
Content-Type: multipart/alternative; boundary=047d7bdca5ca49553f04de6bc53c

--047d7bdca5ca49553f04de6bc53c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 12:52 PM, Andy Voltz <andy.voltz@timesys.com> wrote:

> The tuning files for the cortex-a* processors are mostly identical for
> the A7,A8,A9,A15 processors. Rework these files to use a CORTEX_ID
> variable to setup the tuning for each specific processor.
>
> Signed-off-by: Andy Voltz <andy.voltz@timesys.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7bdca5ca49553f04de6bc53c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 12:52 PM, Andy Voltz <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andy.voltz@timesys.com" target=3D"_blank">andy.voltz@times=
ys.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The tuning files for the cortex-a* processor=
s are mostly identical for<br>
the A7,A8,A9,A15 processors. Rework these files to use a CORTEX_ID<br>
variable to setup the tuning for each specific processor.<br>
<br>
Signed-off-by: Andy Voltz &lt;<a href=3D"mailto:andy.voltz@timesys.com">and=
y.voltz@timesys.com</a>&gt;<br></blockquote><div><br></div><div style>Revie=
wed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otav=
io@ossystems.com.br</a>&gt;=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7bdca5ca49553f04de6bc53c--
