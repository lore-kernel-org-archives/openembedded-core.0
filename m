Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TLiq0-00028w-72
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 01:03:44 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so5190938wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 15:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NmLlpgYUEi9hpBGmLrOUd+qXTd0J8aFnlem6hXJAVrE=;
	b=vQ63rSnwD7QZqgwUbJYR0BEIVFGkwgOgPgX+GzrQyvv3FwueQioCN+15IYZ3job7ze
	t0lPj1LLQWCK4NveE7I9+Kug7XSEExFgS/NbEnQD3OTxH6pMNERwsLAZ5u7cWk6GVk4f
	hunioSGKzYG7aQHC+4gTINYj2VoH1rViZ7PtN4Kkmcv3SHz2m8uTaGXGr4i7uQWsVwgK
	k4jnysSDdzRoh+de85HT9k9t1TVzKAzNs45wJxli0zXj0Uqxxx5JD7ShYFX2+8kec+kG
	nXduEBPRCxGVDtC0gHSpRWd25aXT5aQWXLLXF7Xnxih2cx5+049RPqnFeSXIOsCgkGE1
	fG5Q==
Received: by 10.216.145.9 with SMTP id o9mr12508132wej.107.1349823036060;
	Tue, 09 Oct 2012 15:50:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dt9sm27108257wib.1.2012.10.09.15.50.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 15:50:35 -0700 (PDT)
Date: Wed, 10 Oct 2012 00:50:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Message-ID: <20121009225049.GF4715@jama.jama.net>
References: <CAPhnLPAojmKQkympwaPL4Co5srBSzUfJd+7eB4YU3Fv665Q6gw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPhnLPAojmKQkympwaPL4Co5srBSzUfJd+7eB4YU3Fv665Q6gw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip license: bzip2 not bzip.
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
X-List-Received-Date: Tue, 09 Oct 2012 23:03:44 -0000
X-Groupsio-MsgNum: 30502
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline

--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 09, 2012 at 12:28:54PM -0700, Flanagan, Elizabeth wrote:
> The name of the license for bzip2 is wrong causing warnings
> to be thrown.

Can you resend with -M?

Cheers,

>=20
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> ---
>  meta/files/common-licenses/bzip  |   41 --------------------------------=
------
>  meta/files/common-licenses/bzip2 |   41 ++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 41 insertions(+), 41 deletions(-)
>  delete mode 100644 meta/files/common-licenses/bzip
>  create mode 100644 meta/files/common-licenses/bzip2
>=20
> diff --git a/meta/files/common-licenses/bzip b/meta/files/common-licenses=
/bzip
> deleted file mode 100644
> index 8ec599d..0000000
> --- a/meta/files/common-licenses/bzip
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -------------------------------------------------------------------------=
--
> -
> -This program, "bzip2", the associated library "libbzip2", and all
> -documentation, are copyright (C) 1996-2010 Julian R Seward.  All
> -rights reserved.
> -
> -Redistribution and use in source and binary forms, with or without
> -modification, are permitted provided that the following conditions
> -are met:
> -
> -1. Redistributions of source code must retain the above copyright
> -   notice, this list of conditions and the following disclaimer.
> -
> -2. The origin of this software must not be misrepresented; you must
> -   not claim that you wrote the original software.  If you use this
> -   software in a product, an acknowledgment in the product
> -   documentation would be appreciated but is not required.
> -
> -3. Altered source versions must be plainly marked as such, and must
> -   not be misrepresented as being the original software.
> -
> -4. The name of the author may not be used to endorse or promote
> -   products derived from this software without specific prior written
> -   permission.
> -
> -THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
> -OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> -WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> -ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
> -DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> -DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
> -GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> -INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> -WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> -NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> -SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> -
> -Julian Seward, jseward@bzip.org
> -bzip2/libbzip2 version 1.0.6 of 6 September 2010
> -
> -------------------------------------------------------------------------=
--
> diff --git a/meta/files/common-licenses/bzip2 b/meta/files/common-license=
s/bzip2
> new file mode 100644
> index 0000000..8ec599d
> --- /dev/null
> +++ b/meta/files/common-licenses/bzip2
> @@ -0,0 +1,41 @@
> +------------------------------------------------------------------------=
--
> +
> +This program, "bzip2", the associated library "libbzip2", and all
> +documentation, are copyright (C) 1996-2010 Julian R Seward.  All
> +rights reserved.
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions
> +are met:
> +
> +1. Redistributions of source code must retain the above copyright
> +   notice, this list of conditions and the following disclaimer.
> +
> +2. The origin of this software must not be misrepresented; you must
> +   not claim that you wrote the original software.  If you use this
> +   software in a product, an acknowledgment in the product
> +   documentation would be appreciated but is not required.
> +
> +3. Altered source versions must be plainly marked as such, and must
> +   not be misrepresented as being the original software.
> +
> +4. The name of the author may not be used to endorse or promote
> +   products derived from this software without specific prior written
> +   permission.
> +
> +THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
> +OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
> +WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> +ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
> +DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
> +GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> +INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
> +WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> +NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
> +SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +Julian Seward, jseward@bzip.org
> +bzip2/libbzip2 version 1.0.6 of 6 September 2010
> +
> +------------------------------------------------------------------------=
--
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB0qkkACgkQN1Ujt2V2gBw0iQCePzTXW5QIN4nTR31AU0FAZekF
Vl0Anjkv0tpxydP37bR7EKhST3fRJRlI
=nux5
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--
