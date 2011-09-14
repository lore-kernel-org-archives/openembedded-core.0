Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3sxM-0006jI-Jk
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 19:09:04 +0200
Received: by bke11 with SMTP id 11so1667009bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 10:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=0EW/C3ziE5ojzIe6XueoE7l8E4BGI+vpHtN84FPdJyY=;
	b=EEFrg+2VNhPW1VesbmlLKL1S6+r3DiTD5WN9HUrlNY37KZ8ewTqMd6HY/s0nqPDz0Q
	zAqNip6h87WpZT5VyD6hbRWltJ+PUFNzHp8eGAF9NEygFeuRdJ0C+aTb34C3EKnoXgNJ
	LZz4YAFRT9MpoCpcscLrsT6Lcplosol3PH1c4=
MIME-Version: 1.0
Received: by 10.204.129.214 with SMTP id p22mr58308bks.93.1316019832868; Wed,
	14 Sep 2011 10:03:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 10:03:52 -0700 (PDT)
In-Reply-To: <1316016731.26879.2511.camel@elmorro>
References: <1316016731.26879.2511.camel@elmorro>
Date: Wed, 14 Sep 2011 14:03:52 -0300
X-Google-Sender-Auth: ElbKXPLOEOKT9_Ztc1DODO3238k
Message-ID: <CAP9ODKryriUQJ-T7SFTdbau-k9HNx2ui3Mc0GOh_0MMaSZ99fw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] initramfs-live-install: add support for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 17:09:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 13:12, Tom Zanussi <tom.zanussi@intel.com> wrote:
...
> --- a/meta/recipes-core/initrdscripts/files/init-install.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install.sh
> @@ -1,6 +1,6 @@
> =A0#!/bin/sh -e
> =A0#
> -# Copyright (C) 2008 Intel
> +# Copyright (C) 2011 Intel

This ought to be 2008, 2011 or 2008-2011.

Besides that, ack.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


