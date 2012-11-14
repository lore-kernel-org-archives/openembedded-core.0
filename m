Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYbMB-00024m-Rm
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:42:12 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so140757dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 03:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=EzmSxIgbB6sjS80xFZV+TQ2Ol6eQz5bHyZStsK+Ptg4=;
	b=Ew3RAUjirp1OfWtIpQv092F5gRHLxKZvlI+gRcGoRKscEYqGJUHO+ebqEO4qdTybg0
	I79AvhK2iq8AtCMulTvm0Nzu3YvyllHBVsHK62Gy09Vh4BGAWqqOcPgL8BuCLNACBGkt
	HkhJHJJ+GLowox5PshX00kH62E27fhe8p4EZcSTr5YhiZrVggkgsPPQVovWptEX8FkLs
	O0sSipOv7JKWTOEbtDLkhxMGcF21jLN9rFZ9gTdHtE7Bx0yDdxd22zM3bTXcU9Hz9/WM
	vXocyDseIrOeGETlCWM//CJHNJ8zRRzMv4LPzHa3X1p4y9dcok1nhPr3WC2KAgsQXTvt
	+EMg==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr71015605pbc.33.1352892495812;
	Wed, 14 Nov 2012 03:28:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 14 Nov 2012 03:28:15 -0800 (PST)
In-Reply-To: <fe918e16f7c7d4e01ab317c3f29ff7dab1ba9537.1352884713.git.laurentiu.palcu@intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
	<fe918e16f7c7d4e01ab317c3f29ff7dab1ba9537.1352884713.git.laurentiu.palcu@intel.com>
Date: Wed, 14 Nov 2012 09:28:15 -0200
X-Google-Sender-Auth: tWYexy8aUqPjdHL-upa9gcC1XOg
Message-ID: <CAP9ODKpNb6RuJ7Yg5dX_0Xi6uvNDfTuqM-PQLBMYF2fH4HpyEA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 08/12] xserver-xorg: upgrade to 1.13.0
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
X-List-Received-Date: Wed, 14 Nov 2012 11:42:12 -0000
Content-Type: multipart/alternative; boundary=047d7b10d185a1d82904ce72d49a

--047d7b10d185a1d82904ce72d49a
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 7:28 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> The patch contains several aditional changes:
>  * removed one backported patch (included in the new release);
>  * changed mips64-compiler.patch to apply properly;
>  * licence checksum for COPYING file changed: some copyright years have
>    been changed
>
> The following external modules are now built-in:
>  * DBE
>  * DRI2
>  * DRI
>  * RECORD
>
> The extmod module was completely removed.
>

Why those are now built-in?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d185a1d82904ce72d49a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Nov 14, 2012 at 7:28 AM, Laurent=
iu Palcu <span dir=3D"ltr">&lt;<a href=3D"mailto:laurentiu.palcu@intel.com"=
 target=3D"_blank">laurentiu.palcu@intel.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
The patch contains several aditional changes:<br>
=A0* removed one backported patch (included in the new release);<br>
=A0* changed mips64-compiler.patch to apply properly;<br>
=A0* licence checksum for COPYING file changed: some copyright years have<b=
r>
=A0 =A0been changed<br>
<br>
The following external modules are now built-in:<br>
=A0* DBE<br>
=A0* DRI2<br>
=A0* DRI<br>
=A0* RECORD<br>
<br>
The extmod module was completely removed.<br></blockquote><div><br></div><d=
iv>Why those are now built-in?</div><div>=A0</div></div>-- <br>Otavio Salva=
dor=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<=
br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">ota=
vio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b10d185a1d82904ce72d49a--
