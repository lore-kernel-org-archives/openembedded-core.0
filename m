Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA6F460130
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:56:42 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id eh20so11090823obb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=GnFq5FFKlkFUMaPrF/9Y3Z1bB/tfy764JIADi/qb+hY=;
	b=pQNdad/FgVZ1XqCPwwnPsAdTLZfbeQGV8thr4FuGYoBgfbeK8463+7dKnGfMRyPsIb
	dHBC/m8rmo3GaxO2bA61po3OqUW0xIcIBIGcxmOKoEOefEk4Ifjbczgbwb4AmN5Uq0WD
	iA0UjuErb+ffNFLW2GTabqs0dGrSywWx1xEPMaMiXoNm3HpwatBrU/+yOLNGFrfZMmTA
	IfFKMZ7SFNjmYYrBIqtDCC21EnCLbbo2P+iwsfj9qPfeV3LlImub06ccXi91F3D6duCJ
	uWg0MezJEDxh3lqrYr13XU8N4hWs0Fc1Tc41vNB+qZS6y/Cns1igPQsk1Qa8Teo+Szpa
	43uA==
MIME-Version: 1.0
X-Received: by 10.60.143.41 with SMTP id sb9mr3137766oeb.102.1370908603402;
	Mon, 10 Jun 2013 16:56:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 16:56:43 -0700 (PDT)
In-Reply-To: <03a26f0a33de866401325c100eae7baadf62e6c2.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
	<03a26f0a33de866401325c100eae7baadf62e6c2.1370906102.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 20:56:43 -0300
X-Google-Sender-Auth: tvNW875vjZzCKvMBwaGXDemEVgY
Message-ID: <CAP9ODKp7Qopi_pgXoLHCn_9emAy9+hf8=W4CQtJ4ZdtQYemj9Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] license.bbclass: include all licenses in the manifest
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
X-List-Received-Date: Mon, 10 Jun 2013 23:56:42 -0000
Content-Type: multipart/alternative; boundary=047d7b3a89fc53535704ded5883b

--047d7b3a89fc53535704ded5883b
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 8:15 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> When we don't have a generic license file for the license in question, we
> can
> warn, but we should still include it in the manifest, otherwise the
> manifest
> doesn't reflect reality. Failing to include a license listed in the recipe
> in
> the manifest can't be allowed.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b3a89fc53535704ded5883b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 8:15 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Christopher Larson &lt;<a href=3D"mail=
to:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
When we don&#39;t have a generic license file for the license in question, =
we can<br>
warn, but we should still include it in the manifest, otherwise the manifes=
t<br>
doesn&#39;t reflect reality. Failing to include a license listed in the rec=
ipe in<br>
the manifest can&#39;t be allowed.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div s=
tyle>Reviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.co=
m.br">otavio@ossystems.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b3a89fc53535704ded5883b--
