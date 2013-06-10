Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 26BC16A9DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:54:21 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id 16so10558541obc.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=shzHz0HxGx5PzOcSK5wjshYd0VocQNVeX7mkoJRfSPU=;
	b=yhs74RlUi9tTVIyKwMYedhfdDIk1p5JTcnFH/LYuSAsYf/5vICBp7PFw/X/ya12PR8
	4BSa+KITGSux/8FXeebDyU0PH10sp5qpK0DxFokxPkWtSCTpm/y+HNhLWh+xs7p8EfGb
	4yrlXE3zAgn1BcZzlhobJ/qjyoJEisjszqZ15DSKz/OgpVYr2LrGTY6Aw05CH+RxsVRb
	Ke84rstwRwVmdGcmQ2MHOlbneEkMeBNJWVhWxNx1VJkqzjhpZswHSBunwj1HOW2T8A71
	6mfKaCXiJ/aJUy4V+0NheHimeuGU7aG7rtUdQ765lBbuKLG0dX8iarpIDBCmaKIzPk0j
	OwAA==
MIME-Version: 1.0
X-Received: by 10.182.233.137 with SMTP id tw9mr9871225obc.2.1370897662237;
	Mon, 10 Jun 2013 13:54:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Mon, 10 Jun 2013 13:54:22 -0700 (PDT)
In-Reply-To: <c3ed12567db9ac351e056b428db4ef2783181ecc.1370896976.git.chris_larson@mentor.com>
References: <cover.1370896976.git.chris_larson@mentor.com>
	<c3ed12567db9ac351e056b428db4ef2783181ecc.1370896976.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 17:54:22 -0300
X-Google-Sender-Auth: BVjn67w4F43Yu4xROMEidYc9lek
Message-ID: <CAP9ODKpteU3Md0D2mUTO_J4c5LDf_5+dyx2N=mFwo+quWpn1Mw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] copyleft_compliance: set 'dirs' flag on task
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
X-List-Received-Date: Mon, 10 Jun 2013 20:54:22 -0000
Content-Type: multipart/alternative; boundary=001a11c1c5562e641d04ded2fc64

--001a11c1c5562e641d04ded2fc64
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Without this, due to bitbake defaulting to ${B}, it's possible to get ${S}
> inadvertantly created before do_unpack, breaking the unpack of git sources,
> which expect the destination to not exist.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c1c5562e641d04ded2fc64
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Jun 10, 2013 at 5:46 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">From: Christopher Larson &lt;<a href=3D"mailto:chris_larso=
n@mentor.com">chris_larson@mentor.com</a>&gt;<br>

<br>
Without this, due to bitbake defaulting to ${B}, it&#39;s possible to get $=
{S}<br>
inadvertantly created before do_unpack, breaking the unpack of git sources,=
<br>
which expect the destination to not exist.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br></blockquote><div><br></div><div>R=
eviewed-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">=
otavio@ossystems.com.br</a>&gt;</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c1c5562e641d04ded2fc64--
