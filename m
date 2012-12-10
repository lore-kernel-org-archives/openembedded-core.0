Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ti6J8-00023J-5y
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 17:34:18 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so1873670pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 08:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=caaq+vOO7kRfXN46tiblzTYCNUVd/MsyPmPTBSBOwEk=;
	b=zVGuDo837InkTq8V/2CK27WUF3ANCj56/zHq4UaGaxqbLYwALIRgu2x6dWSl+gCqJu
	lVJHIDEGuTiCdT2m6Z7YKgICms6NIQgujfag8Twe0Hz0VRq7FXy+FPoLaYh0gUziRj6o
	8ZNAopLH6u2IFl2dFnwEXTFFRDIEJZ9mWhKOEMGMekZvPW+GHpyBDwtVXk50RX11P9NZ
	gccYWTZxqlY1/qENsW5OcfiXxkKWB0cIIWSPsm5Q+pvq2ZVRo+1G59+/wsOHcCVIRbUV
	WUHrvOzeNr4X+aE8YrJwvIyxorCaWwMfgmLxe1gyfRyMxK65VnrP3NTnRVNWLnvUD5+c
	v0AQ==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr40798846pbc.33.1355156386543;
	Mon, 10 Dec 2012 08:19:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.125.227 with HTTP; Mon, 10 Dec 2012 08:19:46 -0800 (PST)
In-Reply-To: <d5c9acb38b6e2d962818f15119bb6748d1320dff.1355154246.git.laurentiu.palcu@intel.com>
References: <cover.1355154246.git.laurentiu.palcu@intel.com>
	<d5c9acb38b6e2d962818f15119bb6748d1320dff.1355154246.git.laurentiu.palcu@intel.com>
Date: Mon, 10 Dec 2012 14:19:46 -0200
X-Google-Sender-Auth: V3pyFjtfkybvegz0RqG_vyFx2A8
Message-ID: <CAP9ODKpggcjrxP+soQ-69cTWat8pg5sMq8XCKOsfNwCyqWpyRQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] populate_sdk_(deb|ipk|rpm): export NATIVE_ROOT and INTERCEPT_DIR variables
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
X-List-Received-Date: Mon, 10 Dec 2012 16:34:19 -0000
Content-Type: multipart/alternative; boundary=047d7b10d18508fa2404d081efe5

--047d7b10d18508fa2404d081efe5
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 10, 2012 at 2:09 PM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> In order for the postinstall scripts to have access to the recent
> improvements when generating the target SDK sysroot, export these
> variables in populate_sdk.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ...

+       export NATIVE_ROOT=${STAGING_DIR_NATIVE}
> ...
>

Why you don't use STAGING_DIR_NATIVE directly? This seems to have no good
reason for a variable with same content of a well known variable.

Regards,

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d18508fa2404d081efe5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Mon, D=
ec 10, 2012 at 2:09 PM, Laurentiu Palcu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:laurentiu.palcu@intel.com" target=3D"_blank">laurentiu.palcu@intel.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">In order for the postinstall scripts to have=
 access to the recent<br>
improvements when generating the target SDK sysroot, export these<br>
variables in populate_sdk.<br>
<br>
Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel.=
com">laurentiu.palcu@intel.com</a>&gt;<br>...=A0</blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
+ =A0 =A0 =A0 export NATIVE_ROOT=3D${STAGING_DIR_NATIVE}<br>...<br></blockq=
uote><div><br></div><div>Why you don&#39;t use STAGING_DIR_NATIVE directly?=
 This seems to have no good reason for a variable with same content of a we=
ll known variable.</div>
<div><br></div><div>Regards,</div></div><div><br></div>-- <br>Otavio Salvad=
or=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<b=
r>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otav=
io@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--047d7b10d18508fa2404d081efe5--
