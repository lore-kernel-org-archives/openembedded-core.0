Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFFdc-0000bw-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 04:07:56 +0200
Received: by vbbfr13 with SMTP id fr13so281923vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2012 18:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1m+dUHbROPMLStW15imjiWyTfmyFXWYLNOk0x1+GTkU=;
	b=fnQZWk2oH/Xaud3sIAi2Q1xCf2PjKwetk/2Y26/btkMesY3FpyzsV3GK8sYH5d5rF2
	/iukn1+1vggQyOxzTePzki5rKGoaPsRNG3PiYXq+kkpRro2ScKaTKpXGKOb1dX8le1QN
	zOubAH2n+DltUG7nke66eU88JSlxdFPjLhPqC/Lev6cb2eY56fyWeu9CCOHDycF/Nbnw
	8I4Ry4gM9rj81tj8xONRnevlMGQDAHluqcWy4SxdfNi3vk1ZpuSmI4YzExdFo51q8LyV
	OYy9aKZii//E0evtkfz4BDGU/JkmZFmhF6ZRi2ELmf2IggtFdmveoOmGt4uJIG/gMCt8
	v0Tw==
MIME-Version: 1.0
Received: by 10.220.107.208 with SMTP id c16mr6736122vcp.65.1333504725972;
	Tue, 03 Apr 2012 18:58:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.151.10 with HTTP; Tue, 3 Apr 2012 18:58:45 -0700 (PDT)
In-Reply-To: <558f20b409b75d18d426a471c3aa5bd296df9aa7.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<558f20b409b75d18d426a471c3aa5bd296df9aa7.1333481624.git.mark.hatle@windriver.com>
Date: Tue, 3 Apr 2012 22:58:45 -0300
X-Google-Sender-Auth: cPHh1qLJfTZCDHvtkXGqh6Ar1t4
Message-ID: <CAP9ODKqJ4Exbb38ic1OB6h9FieWErR0yGkyEzk9usPSuxh6RUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] conf/machine/include/README: Add readme to explain cpu tunings
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
X-List-Received-Date: Wed, 04 Apr 2012 02:07:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 3, 2012 at 16:47, Mark Hatle <mark.hatle@windriver.com> wrote:
...
> +TUNE_ARCH - The GNU canonical arch for a specific architecture. =A0i.e.
> +arm, armeb, mips, mips64, etc. =A0This value is by bitbake to setup
> +configure. TUNE_ARCH definitions are specific to a given architecture.
> +They may be a single static definitions, or may be dynamically adjusted.
> +See each architectures README for details for that CPU family.

... This value /is used by bitbake/ ...

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


