Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id ECA196E362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:39:14 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id uz6so987539obc.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Edce3N4sNT6tXLh7jl3i9L3GSZ9PO64Cc14Vt0KF2HE=;
	b=Wes+KkJxeffXY1pW+UX/Wh2HEtdhtcUcuj7V9Golp4NKtJ+u0lC325+FOasPVn0uTb
	+GHLdcrs2RiybBCkopMZuxNNBWT//0wD/I7Uk/MyBOAE88Y2f3tBtjJ8HCRDtpndS9F1
	4cqkrT227vQcE/Y1c0e08D681I8tLAEQdWWFD6ODQjMNUM8Mfja5VbAv0eYry6qEcrjw
	ZwzbHcpy55iEh0RmPVJ0ektAPquV5qn+XSatv9yp+yNUOJg1vaxfBn4IMTu5As+Jf4WC
	PHcEejFWG9uHHPMm0RILBPZv9mnL8C/Pa0eOcg8E2UjOoj4hpF3K80bD5IeuqsfJQYWp
	CqDw==
MIME-Version: 1.0
X-Received: by 10.182.117.195 with SMTP id kg3mr1317879obb.17.1389785955933;
	Wed, 15 Jan 2014 03:39:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:39:15 -0800 (PST)
In-Reply-To: <88e97c2d22d5289b4be49c0b7bb57295d959bfa7.1389768606.git.Qi.Chen@windriver.com>
References: <cover.1389768606.git.Qi.Chen@windriver.com>
	<88e97c2d22d5289b4be49c0b7bb57295d959bfa7.1389768606.git.Qi.Chen@windriver.com>
Date: Wed, 15 Jan 2014 09:39:15 -0200
X-Google-Sender-Auth: lXlQ6i_eYScKYl9TpcDDDt5fiBs
Message-ID: <CAP9ODKofxQ3gvXaRjTtd18JBqp+y2AyonpLq2R4931mXv8OvQA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libtool: remove the unrecognized configure option
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
X-List-Received-Date: Wed, 15 Jan 2014 11:39:15 -0000
Content-Type: multipart/alternative; boundary=089e0149c50637a2c004f000c2ee

--089e0149c50637a2c004f000c2ee
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 4:51 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Remove the unrecognized configure option '--with-sysroot' to avoid
> build time warnings.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0149c50637a2c004f000c2ee
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jan 15, 2014 at 4:51 AM, Chen Qi <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.co=
m</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Remove the unrecognized configure option &#39;--with-sysro=
ot&#39; to avoid<br>

build time warnings.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Ota=
vio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystem=
s.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e0149c50637a2c004f000c2ee--
