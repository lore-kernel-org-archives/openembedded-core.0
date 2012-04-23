Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SMMzz-0001ir-CK
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Apr 2012 19:24:27 +0200
Received: by vbbfr13 with SMTP id fr13so9151615vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2012 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=vxeqFuKJV/rpcKoHBNWM6A0kylBIWLRCMBayeLbF91c=;
	b=Cy3vSebs7pvwip6CiB5yXAD8ehHKvxP0d9t7xeZ/DqHaLG/CrilnRqeNGRIzeOQOS+
	eWgJ9edGNdynqdnXq1iMWgg7tmLDjdgq8/bLvqgnQr56dD1wCy+bDTcB8iicVbvfniEP
	Eu5lOWhyUrNixRI0tL9+cdFoPTexXyARYsSMDs/zd0Rp+3SOeb0S7mV1CPqvHDaPflPU
	7woSxNLJy+nfO/pCZxNn6GdEyBwbayEjMA2Dirg6MWtIB1WYWiSHkEbRNfCdlFmxjGS9
	eVD1puM4uwqUen+zt/XcvC+gvJk5pCUtNcmtn/i4Ag5DF6hZSWDiGl3o4hb3DqroA5/R
	V4jw==
MIME-Version: 1.0
Received: by 10.52.172.172 with SMTP id bd12mr1809398vdc.69.1335201293376;
	Mon, 23 Apr 2012 10:14:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.108.146 with HTTP; Mon, 23 Apr 2012 10:14:53 -0700 (PDT)
In-Reply-To: <4F95772B.2080007@linux.intel.com>
References: <1334872962.3028.2.camel@ted>
	<4F95772B.2080007@linux.intel.com>
Date: Mon, 23 Apr 2012 14:14:53 -0300
X-Google-Sender-Auth: SeMuq9bLl9DyTEJrzz0FLMjBDWw
Message-ID: <CAP9ODKpwzetJhcR4pRFXHWsbNA-SE5osnwb7j7zw63py0Sk+Sg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimg.bbclass: Tweak iso images to become hybrid images
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
X-List-Received-Date: Mon, 23 Apr 2012 17:24:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 23, 2012 at 12:37, Darren Hart <dvhart@linux.intel.com> wrote:
> How many different systems and firmware has this been tested on?
>
> I think it is a worthwhile patch, but we should be aware of the above in
> case a regression is reported. In such an event, it seems a
> NO_ISO_HYBRID flag could be set by the machine.conf to revert to the
> older behavior.

and please, do it in 1.3 only.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


