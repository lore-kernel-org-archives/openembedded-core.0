Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjyLW-0005Kl-Uz
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 20:51:43 +0200
Received: by pvf24 with SMTP id 24so1357522pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=AiwPSmJWvbEq9jj+5sx+D8ldyd84px1AFfFheDhgmFk=;
	b=Xw3UvRCfzfbSv+p2X3v/AIp505sWSoXmMNvQFZZsHcgdoZ5Mzm0XKlAvbRjKatBlQl
	r7qkCVoFNbm6oBhqMuYQYSpIk61NOosO29QKKX9vpwaynt8fisl2OvJzL4DTT23Gqtfy
	lkWfnDzfC3a57zuD4wNDaFI8RT2Fwq2j63rPw=
Received: by 10.68.33.200 with SMTP id t8mr739819pbi.144.1311274054525; Thu,
	21 Jul 2011 11:47:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 21 Jul 2011 11:47:04 -0700 (PDT)
In-Reply-To: <fc7ecf3f3b90f6949e790f18eeea908d069282d5.1311234475.git.sgw@linux.intel.com>
References: <cover.1311234475.git.sgw@linux.intel.com>
	<fc7ecf3f3b90f6949e790f18eeea908d069282d5.1311234475.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 11:47:04 -0700
Message-ID: <CAMKF1spf5Q2-fFL6=dGEjG+2Xrovujf9EXV70R5eZ4A9NDZUcw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 14/20] Make intltool use perlnative instead of perl on host
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
X-List-Received-Date: Thu, 21 Jul 2011 18:51:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2011 at 12:53 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig perlnative
>
> =C2=A0export PERL_virtclass-native =3D "/usr/bin/env perl"

is the above line still needed


> =C2=A0BBCLASSEXTEND =3D "native"
>


