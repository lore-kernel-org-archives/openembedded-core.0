Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TCEXt-0004DC-Pr
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 20:53:49 +0200
Received: by pbcwy7 with SMTP id wy7so4161178pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 11:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:cc:content-type;
	bh=JKrdclJ77PSYok5cJUOP/bV33YmVcgzISD1GDMF9YmA=;
	b=usRhtzHG3PQDp+bYCLHuSop8A+SB0VzRkdhZrfPwObdPMNi/vDpfjqc+QMTfipM7cw
	xsOVXFDudmF7wrT2HCZWpcGMGaTMg3UI+ZGmqlMtGdIHHfPdQ/JImvvHtE1/MYVfyJ1O
	/vPUrtprRIevlhMVEHNVMSfs0uOnh8bIql6brUYzYr5QvFW5co1QPcT8yb/5BQ+maCbx
	MHOMG4VtgTumhyhxVcce3c6Fuxo1TUqrZe71gUe9A39jPzPPtq0S/Ox2cm0tK/s4Z8on
	Wu4BHIXbWwyqLPgcjOWIhcZOMbXA4AcnMDLY+vnM8Ug+PotFtP6KIWX6uHkDTsTfDcJZ
	iCtw==
MIME-Version: 1.0
Received: by 10.66.75.232 with SMTP id f8mr20851paw.59.1347561675319; Thu, 13
	Sep 2012 11:41:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Thu, 13 Sep 2012 11:41:15 -0700 (PDT)
Date: Thu, 13 Sep 2012 15:41:15 -0300
X-Google-Sender-Auth: x5zQD7yu7nA-V7AOrm8Fe4-c4pI
Message-ID: <CAP9ODKpy==dnOV-MtxLck0nLm0juBPiVSNwf=_M3gt12tCqXXQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Rogerio Pimentel <rogerio.pimentel@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: Possible bug in bitbake
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
X-List-Received-Date: Thu, 13 Sep 2012 18:53:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Rogerio and Daiane, here copied, found a bug in bitbake (we managed to
reproduce it in denzil). The output in console when it happens can be
seen at:

https://groups.google.com/d/msg/meta-fsl-arm/7W9bwxqslnk/htEiOcaJMH8J

The way to reproduce it is very easy:

 * bitbake gnutls -c cleansstate
 * remove gnutls from download cache
 * bitbake gnutls

Adding gnutls back to download cache make the build succeed.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


