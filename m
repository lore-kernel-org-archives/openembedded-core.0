Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 441F4782DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:42:58 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g76so27279519wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6863jVFAmhCSsoMCfiwSkciJ/+OzQ53tSXJxTb4QQM0=;
	b=tis2frJuPHhmjZpSXa+aHSRorvLVSgk+JRfQUd2komjlOur9g+Fn2K8viMINJ9KFYI
	wBx4rbv5E2uwJFB07mKob+oREZxYuXuAh17rLJgaT7F02D1qxeDDGX8sHSWVKQ5fPYtH
	GmbRvRL8+A96qfg0wdY/i0vAMD8qyqpKVYTTEFSI2j25LvY0xWQVMZtNgHpbFnE8FCic
	UFKRqiwI3ieqaDRX3PNmPwtFM8fzbWtUO81uGantLklD7tISSVs9phO0QE5W0GCH5/oK
	830fdsjbE7c6K/bVJrQhtMH29uyQ+oU+QJxku9Ozh5lpA/MutTg4oS3uvKHGR0+IdqFT
	lUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6863jVFAmhCSsoMCfiwSkciJ/+OzQ53tSXJxTb4QQM0=;
	b=gDTaWSgWXxVuzVELIPWf/jGKvJblLNPv2hAimSzx7KaC7dFlX81l+ln3efG76MWgcJ
	TiD4lGkA7zxqWgVTk4PotX+vHREw+ausG0etxN0e4rMV9GO12XupjKFLnb6uSGuU0qmz
	RXpcmWCfEWhY788MNQYBlF+WbPoim3ibL/uozBXuL4JxBAriuFUI9MQkt7SvQmhsq8pY
	xiRytYpfhwQA+YIO6/pY4CXUTmkajZtXXHjo1NYORENckitFfFSXO4uccBODCVSEGIeB
	NEsETdDUlHRErmA/irStVswHKwOc64/nYs1+qeqbfuh7FwIzAl/72C17IADQbkZshNun
	swZg==
X-Gm-Message-State: AKS2vOwTNuDMI69bvfuEyhe7oZy18Zs/AV231qEsiE/zvGQuJp3vzXDq
	HrR0dNEL1uITJ8apHiA=
X-Received: by 10.223.150.39 with SMTP id b36mr1977849wra.149.1497339779874;
	Tue, 13 Jun 2017 00:42:59 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id t70sm3320916wmd.1.2017.06.13.00.42.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 00:42:59 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 09:42:58 +0200
Message-ID: <5375953.mqpsrmuyJB@crde-port-20.cahors.local>
In-Reply-To: <1497016420.4561.13.camel@andred.net>
References: <20170609070429.17376-1-freesilicon@gmail.com>
	<1497016420.4561.13.camel@andred.net>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND 0/3] openssh: Package server configuration
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
X-List-Received-Date: Tue, 13 Jun 2017 07:42:59 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On vendredi 9 juin 2017 15:53:40 CEST Andr=C3=A9 Draszik wrote:
> Hi.
>=20
> On Fri, 2017-06-09 at 09:04 +0200, David Vincent wrote:
> > This serie of patches provides a way to package OpenSSH sshd
> > configuration. This
> > way, it should be easier to change the configuration either in distro
> > and/or BSP
> > layers.
> > It also simplifies management for R/O rootfs
>=20
> Looking at some previous patches and comments, this split seems to have b=
een
> done with the intention to better support R/O rootfs.
Not only, it has been done with the intention of providing a completely cus=
tom=20
configuration. But maybe it wasn't the proper way to do it.
> I have a sent a patch that addresses the R/O rootfs issue in a different
> way, which I believe to be a simpler and less intrusive approach. We've b=
een
> using this for a while.
Yes, I saw it has been merged recently. I'm not sure it addresses the probl=
em=20
I had in mind but I agree it simplifies the configuration for R/O rootfs.
>=20
> http://lists.openembedded.org/pipermail/openembedded-core/2017-June/13784=
8.h
> tml
>=20
> Let me know what you think.
>=20
>=20
> Cheers,
> Andre'
>=20
> > David Vincent (3):
> >   openssh: Package server configuration
> >   core-image: Set default sshd configuration
> >   rootfs-postcommands: Modify ssh-related commands
> >=20
> >  meta/classes/core-image.bbclass                    |  3 +-
> >  meta/classes/rootfs-postcommands.bbclass           | 17 +++-----
> >  meta/recipes-connectivity/openssh/openssh_7.5p1.bb | 51
> > ++++++++++++++++++----
> >  3 files changed, 50 insertions(+), 21 deletions(-)
> >=20
> > --=20
> > 2.13.0


=2D-
David

