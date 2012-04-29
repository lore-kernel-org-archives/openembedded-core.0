Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOWPp-0007yS-H6
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Apr 2012 17:52:01 +0200
Received: by lbbgo4 with SMTP id go4so1410263lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2012 08:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=qWEny5+xiKVVuKWOi6qPEzifefP1GFzHYaAcRouOXkg=;
	b=uy7cH51+tmPF6kmqlrdE2scz7vjm3XsZU4CKKm5dueXfpZLyiQYyPErl6Z88G0nGM4
	/olkW5SySJvI6Nvdq8H53MSjSbr8o2SNA74/BRQUqkeyLpMOzzZBAoo5j2eXb+dZHQ0x
	Vc03nWvTxpIZ95D1/1H3hgvy4DLasdAaRuFWTmB46do9PbPMtFXwt8qTNfkczsGBPBDZ
	g9cg+3bmg+BmhSjbh30b1SoxfrdqiNbOhtCx/i+D/y0p3r11kzcma6qOVf+Dt2/nd9yE
	NUC8t1O+Qq623iQubajyn4h+GMsVl7QsKt1+4HM/lA8Yy1QTBI2x7ctA4oNIs7xm4ySV
	8GUQ==
Received: by 10.112.103.8 with SMTP id fs8mr8959500lbb.29.1335714140746; Sun,
	29 Apr 2012 08:42:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 29 Apr 2012 08:41:50 -0700 (PDT)
In-Reply-To: <1335693807-17609-1-git-send-email-wd@denx.de>
References: <1335693807-17609-1-git-send-email-wd@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Apr 2012 08:41:50 -0700
Message-ID: <CAMKF1so3xwMOB30-yogUL9jCuHoTEsMgTDRxTLWKT_dYn-LkuQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] [PATCH] Add KERNEL_EXTRA_ARGS parameter
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
X-List-Received-Date: Sun, 29 Apr 2012 15:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2012 at 3:03 AM, Wolfgang Denk <wd@denx.de> wrote:
> With recent kernel versions, some ARM configurations need may fail to
> build with errors like this:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0multiple load addresses: 0x80008000 0x80008000
> =C2=A0 =C2=A0 =C2=A0 =C2=A0This is incompatible with uImages
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Specify LOADADDR on the commandline to build a=
n uImage
>
> Add KERNEL_EXTRA_ARGS parameter so affected boards can add for example
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL_EXTRA_ARGS =3D "LOADADDR=3D0x80008000"
>
> to their configuration. =C2=A0We make this general enough so other needed
> command line options can be passed as well when compiling the kernel.

will EXTRA_OEMAKE =3D "..." work ?


