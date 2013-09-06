Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8A488615F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 15:25:17 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so2882247lab.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=J67a4WI5tDP9U8kumVGFnPYvnTAPaIQOo3ZiX/8uJaI=;
	b=DtrdFpFmyRuTiqQEt7OoTJ1hpr2dGCFyfYyHnBJaomszsxgxLDtqxB0mvEajpUjVrT
	rEIW/jgqKcrIlLofqOzZTWk+X1g3H5amx7ma885HR8UhjyBZgh0+oHAIzwkFqQgPYfeJ
	uhPHyEeDwebbupaD0HuVlKLkkGvKuAr/GaVcz5SRuChEkI5z8xbEJsVh1ZApW4E6XjXK
	7oY3mO0I8yPDfI9nCc4QK47+Aq/6jBbL81icjDsVqaBjlQdDao5iEBR593BVQFu5pU4N
	9CrbYeE5GaJb+Q52Z2RHtsp1vk8o90PCAzXMPNRgBqOpgqo4UvASPWoUiwlNtCaIva1R
	0H6g==
X-Received: by 10.152.115.176 with SMTP id jp16mr2646857lab.17.1378481118701; 
	Fri, 06 Sep 2013 08:25:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Fri, 6 Sep 2013 08:24:57 -0700 (PDT)
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 6 Sep 2013 08:24:57 -0700
X-Google-Sender-Auth: MFmZpu6mVaE0TQPQLDsPIXd6tHY
Message-ID: <CABcZANkbW5UhgrRsbWACJdJZDKm-Wu5J++ZwBQu_CiW5FzMBBQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Regarding ca-certificates & its usage
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
X-List-Received-Date: Fri, 06 Sep 2013 15:25:18 -0000
Content-Type: multipart/alternative; boundary=001a11c3509668eecc04e5b8a542

--001a11c3509668eecc04e5b8a542
Content-Type: text/plain; charset=UTF-8

Greetings,

I'm emailing as I think we should determine when and where ca-certificates
gets pulled into images and sdks. Should we add it as a RRECOMMENDS to
openssl and gnutls, or should it continue to be pulled in manually when and
where appropriate? I'm not really familiar enough with openssl and gnutls
use cases to say, so I'm hoping someone else has an opinion on this. Thanks,
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3509668eecc04e5b8a542
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greetings,<div><br></div><div>I&#39;m emailing as I think =
we should determine when and where ca-certificates gets pulled into images =
and sdks. Should we add it as a RRECOMMENDS to openssl and gnutls, or shoul=
d it continue to be pulled in manually when and where appropriate? I&#39;m =
not really familiar enough with openssl and gnutls use cases to say, so I&#=
39;m hoping someone else has an opinion on this. Thanks,<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c3509668eecc04e5b8a542--
