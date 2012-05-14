Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SU0Hu-0001Vc-Dy
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 20:46:30 +0200
Received: by vbbfr13 with SMTP id fr13so5592905vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=epe2oXTrtD0rq3oM9mnX7tNALZclihywJJJlQsQyPNE=;
	b=uzVnds7xg/OA5yMLAm3rbeWC3NzB19FFpqP0GajFD77Ay980Ou/iFnr5JZGyDGlnYE
	5biBhp/G8p9UQBivGtr2yMGAHdM6NSbC/ZJ3yUVzb39HlWIzvwcGuFSbvJfThxGPjt5O
	6c1zHPzYPE4psJcFOXMBtEL/JVVnO3SvGrWLwJNyAHtWtl9nezvT6toM++ZlS7DV5fC6
	QxWd4QT4bb5N2V5LT3n3cJc3NJQ1l/UZQqxsMmTwMX8Fl02rk8r/iUSYZnjjZzkoaeM/
	gc2oSWF6VKkMo49Cz9iETGRfkyLDV0mxS6pWLmc0mU7yJL5L8jTSWo1mwF95cuIm0qTz
	NRfw==
MIME-Version: 1.0
Received: by 10.52.26.232 with SMTP id o8mr4492497vdg.64.1337020590847; Mon,
	14 May 2012 11:36:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Mon, 14 May 2012 11:36:30 -0700 (PDT)
In-Reply-To: <082e4970f3fa5b102b9ef716e300d017f70601cd.1337020062.git.otavio@ossystems.com.br>
References: <cover.1337020062.git.otavio@ossystems.com.br>
	<f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
	<082e4970f3fa5b102b9ef716e300d017f70601cd.1337020062.git.otavio@ossystems.com.br>
Date: Mon, 14 May 2012 15:36:30 -0300
X-Google-Sender-Auth: UcEaBq9JlHATNyGNU-RDCWYjGm4
Message-ID: <CAP9ODKouv-o4N1wt+AsntLg6KU8-q2PxcZGzq5S3Q_RdwSafmA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Mon, 14 May 2012 18:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 3:30 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The pkgconfig files need to be installed in ${libdir} instead of
> ${base_libdir}.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This patch is near but still doesn't  work as expected. I am working on tha=
t.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


