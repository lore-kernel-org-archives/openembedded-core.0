Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaOqr-00063P-VX
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 11:45:19 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1739963pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LoducuVH/tdPnerZ8cQkonK4rzd8vCEl8Th88igivTs=;
	b=b2lA80KCy35hWrgeomYQZGkfiUKr/ni/1qNOsNaVfVB4NF1Mkcmd0Q3oFW679NMo99
	U5Awz6r3bAXFYYHn/khvL8XES1XNSpmTTjNdlA1SREBOx290t4rrgHzw0p+nRLkHeB7q
	pg67HJsSfEPdQrpYz0Kncdduv9mARtwaStPRaqlAIR9StNFFBrk7qZFZfSM/tWmFBZw1
	ORMOgM421Hofyv99YxSWOHzknpLv4wG7XhS3nEVFRu4INsDrgSxq0dmsGZNsVMKd/NPE
	WjAmNji3Y92L2evnVH0p/CqdwAjzlhqttOtKFfBav1RQ5Jr/75+VZ06qqegBPrXppLwk
	Rowg==
MIME-Version: 1.0
Received: by 10.68.254.10 with SMTP id ae10mr38029421pbd.126.1353321075257;
	Mon, 19 Nov 2012 02:31:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 02:31:15 -0800 (PST)
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
Date: Mon, 19 Nov 2012 08:31:15 -0200
X-Google-Sender-Auth: 69BV-pSj4aOCNWezuW_knnUWl_Y
Message-ID: <CAP9ODKrU0d5Zckp58hXBCigauMkAP2f_SPfGM7-jUqOTBMu5Yw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/17] Recipe Updates
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
X-List-Received-Date: Mon, 19 Nov 2012 10:45:19 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0da1f52fb404ced69d12

--047d7b2e0da1f52fb404ced69d12
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 3:54 AM, Saul Wold <sgw@linux.intel.com> wrote:

> Richard,
>
> Here is a batch of tested updates.
>
> I found 1 issue with cmake and libproxy, which I addressed, I hope
> there are not any others lurking.  I did rebuild all the cmake related
> packages.
>

I reported some issues on patches and those should be fixed before merging
this patchset. Specially the rt-tests one as it seems it wasn't updated
after all.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b2e0da1f52fb404ced69d12
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Nov 19, 2012 at 3:54 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Richard,<br>
<br>
Here is a batch of tested updates.<br>
<br>
I found 1 issue with cmake and libproxy, which I addressed, I hope<br>
there are not any others lurking. =A0I did rebuild all the cmake related<br=
>
packages.<br></blockquote><div><br></div><div>I reported some issues on pat=
ches and those should be fixed before merging this patchset. Specially the =
rt-tests one as it seems it wasn&#39;t updated after all.</div><div>=A0</di=
v>
</div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.=
br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.=
ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b2e0da1f52fb404ced69d12--
