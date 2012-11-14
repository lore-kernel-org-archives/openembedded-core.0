Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYbFD-0001o5-1v
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:34:59 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so138770dak.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 03:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=w1F888mnT4whTs8FAHEQVdWZL4qalbsj8FwpycPL6Ug=;
	b=IQO/gmipzQY/SV3rTvdFxMSiW0vzFiKkySDlumBWcvVpHNLOxem1TvYJs5CEzv2YxW
	2rcLuXBwsUYLEkbNyf9ucpKyPhQ3YmqrBG2WtTnINr0sTmplRWK/NuVQWbaMnLR2q2at
	4sm3smS3IMjlREH3yv2ztxDRYNC3s9E32UgqWWVRjK4YU/J/oMuKDSqrGcjUT88J7U/8
	w093bJ/C9VSfxDKyQsp1Fuh8KsF0F7fWtg2y2bzobVCaNzclFI9qeJW/6zLdKs+8yMpi
	p3pBBEZgJ9uCtPziA8brECYD2FlgpTTDT5Y39LF2njbBpuN1KKXZgG5yencfUoOjsS4x
	ViHw==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr78445052pbc.24.1352892063044; Wed,
	14 Nov 2012 03:21:03 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 14 Nov 2012 03:21:03 -0800 (PST)
In-Reply-To: <ced593109000abdca328d606f02ced75f30a9ca5.1352871028.git.sgw@linux.intel.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<ced593109000abdca328d606f02ced75f30a9ca5.1352871028.git.sgw@linux.intel.com>
Date: Wed, 14 Nov 2012 09:21:03 -0200
X-Google-Sender-Auth: ka_lfWGOAgXmL5HZUXkpPD4PDZE
Message-ID: <CAP9ODKqZfF8tRfxYtqRsdfc-BMGX22izdG4gnumZXyNU4E+q7A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/9] builder: Add password for user
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
X-List-Received-Date: Wed, 14 Nov 2012 11:34:59 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c99cd6525404ce72ba55

--e89a8ff1c99cd6525404ce72ba55
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 14, 2012 at 3:32 AM, Saul Wold <sgw@linux.intel.com> wrote:

> This is needed to allow openssh to work correctly for the Eclipse
> plugin to have access to the build appliance to view/modify recipes
> and lauch builds
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

I'd like to be able to override the password used; another point is the
commit log ought to document what the default password and the recipe ought
to have it documented as well.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c99cd6525404ce72ba55
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Nov 14, 2012 at 3:32 AM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
This is needed to allow openssh to work correctly for the Eclipse<br>
plugin to have access to the build appliance to view/modify recipes<br>
and lauch builds<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br></blockquote><div><br></div><div>I&#39;d like to be=
 able to override the password used; another point is the commit log ought =
to document what the default password and the recipe ought to have it docum=
ented as well.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c99cd6525404ce72ba55--
