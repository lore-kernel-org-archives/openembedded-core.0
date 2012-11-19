Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaOgZ-0005bh-5i
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 11:34:40 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2970063pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=lckTbIryHdY5DvwjUFwSvrGuPhSpn+nbt4kWRr110Ss=;
	b=tmb5Sa548fHihbPld6VQ70ddDVzFNOdGeIzdxq0JbAGfPaRR2CX46821MHQQQFB6QI
	irDd1ZFgGd2KXLOOdpH3zDeOx0NgrGUatQX1SPcD+ho71trBL9Ynl3gCpALrvQHsbNS0
	Y5KL2W+J9Qp5SM6r+cBtePysOKBptFhEUrqGiZaQ+GJ+admemPcIlA0cRf7klxcXZ1Bb
	sy1j4qQLhw7MD7kYyh17q/E2H9mowU/m33p+Pg6QJJE8p1AVgmHafY3QRvef7If+Y9uc
	59hquzoVnd0ihMxPPBRq8pe2EH/3XoxBEAxoG92CnHq7P5soXVNBoEvxwyhIe/4s8zKX
	IP3g==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr31985673pbc.33.1353320436421;
	Mon, 19 Nov 2012 02:20:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 02:20:36 -0800 (PST)
In-Reply-To: <a18406267008e5a694bc33da212bde6e8cce0038.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
	<a18406267008e5a694bc33da212bde6e8cce0038.1353304234.git.sgw@linux.intel.com>
Date: Mon, 19 Nov 2012 08:20:36 -0200
X-Google-Sender-Auth: 8le_8h3TwsaDXslcu9I8E96EM1c
Message-ID: <CAP9ODKqqud-1kvFVWqgoe_CJgyro4=eBSNfV_g02FP77EAvFWA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 16/17] cmake: Update to 2.8.10.1
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
X-List-Received-Date: Mon, 19 Nov 2012 10:34:40 -0000
Content-Type: multipart/alternative; boundary=047d7b10d185e1525904ced677db

--047d7b10d185e1525904ced677db
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 3:54 AM, Saul Wold <sgw@linux.intel.com> wrote:

> Rebase the patches due to macro name changes.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ...

-PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
> -SRC_URI[sha256sum] =
> "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
>

I find it hard to spot the checksums to be in the .inc file.

I'd prefer to have them in the .bb recipes (even if in this case it'd be a
duplication).

In case you would like to avoid the duplication (which I agree) you might
before, or later, merge the native handle onto the cmake_<ver>.bb recipe.

What do you think?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d185e1525904ced677db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Nov 19, 2012 at 3:54 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Rebase the patches due to macro name changes.<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>...=A0</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">-=
PR =3D &quot;${INC_PR}.0&quot;<br>

-<br>
-SRC_URI[md5sum] =3D &quot;ba74b22c788a0c8547976b880cd02b17&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2b59897864d6220ff20aa8eac64cac8994e004898a1c0=
f899c8cb4d7b7570b46&quot;<br></blockquote><div><br></div><div>I find it har=
d to spot the checksums to be in the .inc file.</div><div><br></div><div>
I&#39;d prefer to have them in the .bb recipes (even if in this case it&#39=
;d be a duplication).</div><div><br></div><div>In case you would like to av=
oid the duplication (which I agree) you might before, or later, merge the n=
ative handle onto the cmake_&lt;ver&gt;.bb recipe.</div>
<div><br></div><div>What do you think?</div><div><br></div></div>-- <br>Ota=
vio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S.=
 Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_b=
lank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br=
" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b10d185e1525904ced677db--
