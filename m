Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S78vI-0004Qg-7n
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 18:20:40 +0100
Received: by eaae1 with SMTP id e1so1059008eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kqdYA8Z/7cCZ36MC2IF+2qZbHNuD5wftEIe3Gb4CTzk=;
	b=i671XWvCrQvQhoX4MtCl0Jy4b/OzuIuV63WIy0gNNBAi+AWYUxMpjeB5HjC7PULW3g
	ZIet+UQuryG2Z8oAkqoOpAjrinWoVThV8covUSRdnO+kgfSdtluzfMll71lV/pRs4b0j
	FkqY1RN3ds7AyX+HAMKwTanmRz6vgK46I15IsLGo47iDY9DZmpt/W8Yz9jaUZZyKc1Zo
	Aw+k9Y05WMm0WH7uqtijLk1k6oeDeUHcA8uPjn7TCWTZl1k3hqPFXItyD/Y4/OCmQefE
	PnAGtkHi0+jP/XKEacBzRbIRhc/HUibq1OjVkYPaD5UthTMe+sKjNymasdvG6ZUXfbwb
	C0oA==
MIME-Version: 1.0
Received: by 10.52.35.69 with SMTP id f5mr14990963vdj.29.1331572316850; Mon,
	12 Mar 2012 10:11:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 12 Mar 2012 10:11:56 -0700 (PDT)
In-Reply-To: <537de2381d30818bbc1bd0758f4fb1a8dc7f49de.1331569628.git.nitin.a.kamble@intel.com>
References: <cover.1331569628.git.nitin.a.kamble@intel.com>
	<537de2381d30818bbc1bd0758f4fb1a8dc7f49de.1331569628.git.nitin.a.kamble@intel.com>
Date: Mon, 12 Mar 2012 14:11:56 -0300
X-Google-Sender-Auth: 9G6zgp7XSQTfnqeKFlosAFDGePg
Message-ID: <CAP9ODKoJ-OJgfujfTybm9Nbg-xXuoJC-WBoR7HSX1aP24+JP+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH
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
X-List-Received-Date: Mon, 12 Mar 2012 17:20:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Mon, Mar 12, 2012 at 13:28,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Some libraries like libcrypto.so are installed at base_libdir
> instead of libdir. So add the base_libdir to CMAKE_LIBRARY_PATH
> so that these libraries can be found correctly.
>
> This resolves an issues with libzypp, which was not finding the
> libcrypo library correctly in an x32 build.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =A0meta/classes/cmake.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 8aec759..dcd974a 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -59,7 +59,7 @@ set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
> =A0set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
>
> =A0# add for non /usr/lib libdir, e.g. /usr/lib64
> -set( CMAKE_LIBRARY_PATH ${libdir} )
> +set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
>
> =A0EOF
> =A0}
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


