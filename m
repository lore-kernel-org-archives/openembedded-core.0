Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 040496AC69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 16:14:55 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so1090566lab.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=MjvoC24vXRP1+5u2OI7emNreEtcq4oQ3Ul7OhO9/AYY=;
	b=ALPgFggaK+y/1+BhyntfuY/IeMbBG/DhFAXDWuwrhrKrdx6n4LO7edtJK2/4JdUrXy
	hSuJW+T2jcSAGX+i2gTGK33M12dYjX3jWFVvqsbCkHG3oUsfVrE5QbdELnokGc/gEmo0
	O4JmgRZDFQ8ucy84ix0PaahsF4/rZ7ADlNk5BzGkhLnu+8wVQRq2aamo/InIPCUclyL/
	e31kG/9MMhNBBZkIg70/R9g4M790VjImxFt1tegfFWXweKLDKguia1HPl0yJXH4BRIEY
	VxQjfxSrXgM5EoL559lr1gFrnS/PLPWTUVkLd7AIQSDyGQ0gRtmZkK9Zf5MGa9FYccWY
	AjPw==
X-Received: by 10.112.48.103 with SMTP id k7mr2742824lbn.32.1406132095617;
	Wed, 23 Jul 2014 09:14:55 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Wed, 23 Jul 2014 09:14:35 -0700 (PDT)
In-Reply-To: <1406131544.22985.126.camel@ted>
References: <1406131544.22985.126.camel@ted>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 23 Jul 2014 09:14:35 -0700
X-Google-Sender-Auth: qACVDkCZm_GZ4UJNRBfEu2G34Oo
Message-ID: <CABcZANnhirhwrGK88cBLPVAZBnvOqEXASdn2CcdE6EjcnBiBog@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: Check for setgid/setuid TMPDIR
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
X-List-Received-Date: Wed, 23 Jul 2014 16:15:00 -0000
Content-Type: multipart/alternative; boundary=001a113486d2110ff104fedea4fa

--001a113486d2110ff104fedea4fa
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 23, 2014 at 9:05 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> +        status.addresult("TMPDIR is setuid, please don't build in a
> setgid directory")


Minor typo, s/setgid directory/setuid directory/.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113486d2110ff104fedea4fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 23, 2014 at 9:05 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(&quot;TMPDIR is setuid, pleas=
e don&#39;t build in a setgid directory&quot;)</blockquote><div><br></div><=
div class=3D"gmail_extra">Minor typo, s/setgid directory/setuid directory/.=
 <br>-- <br>Christopher Larson<br>

clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div></div></div>

--001a113486d2110ff104fedea4fa--
