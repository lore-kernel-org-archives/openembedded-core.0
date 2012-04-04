Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFTg2-00047T-7A
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:07:22 +0200
Received: by pbcum15 with SMTP id um15so414771pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iEw+zOPxPDFK9iBDx2oQ2jJhJM8CtVk0s/rLdYsyfRs=;
	b=QCQ9tWmy4B7vcvTnZ3G2/cShpzipUr6JCGy7MPL/dP4TrM1TZAv0AhVpj4zyOCD2+g
	OYfHyrv/BjxiVSW3CtuR39zJ17UhCR9MSU2MrpEC1gwjvggSp7eBwVGC34KW4UfGeipF
	U7FVRQoowIWrqHtxeUZ2j5b69x5UOF5XNjVF4Ah5TJ5DdAYz/UpTAP2WN7GoL5Bjh9u6
	lTdHG9pS8j9diVeR/Yk+MttRwVCPhzxtuYyaLUmqq7C2iX4RNbN2mSjVaOlHLcFxr62l
	Rvo4/ghMLydTB1tP5s7YS+urP5kjfipBVwRok29Oz637Uf4QJ1dX39CiXZI52zeD1L0R
	J48w==
MIME-Version: 1.0
Received: by 10.68.202.167 with SMTP id kj7mr39627338pbc.9.1333558690775; Wed,
	04 Apr 2012 09:58:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.60.161 with HTTP; Wed, 4 Apr 2012 09:58:10 -0700 (PDT)
In-Reply-To: <95c5864783433fb7a82a356c1e6132a9a56a1bf4.1333553396.git.paul.eggleton@linux.intel.com>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
	<95c5864783433fb7a82a356c1e6132a9a56a1bf4.1333553396.git.paul.eggleton@linux.intel.com>
Date: Wed, 4 Apr 2012 13:58:10 -0300
X-Google-Sender-Auth: p_XHhNk_4e5WptrFLyaHhwItG7c
Message-ID: <CAP9ODKokKPxkSCQ4WEOpOw=Vg4uvEOhrmafbxpC8TC+z7v7NiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] self-hosted-image: decrease reserved space to 0.5%
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
X-List-Received-Date: Wed, 04 Apr 2012 17:07:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2012 at 12:32, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> The default amount of reserved space for ext2/3 is 5% - this amounts to
> about 2GB of a 40GB filesystem that the builder user can't make use of.
> We don't need this much reserved so peg it back to 0.5% which should be
> more than enough.

Please look at my comment about a possible alternative way of doing
it, in a more generic one.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


