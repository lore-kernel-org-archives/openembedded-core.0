Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9cDK-0006tb-LQ
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 14:29:14 +0200
Received: by qadc1 with SMTP id c1so217315qad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QBJDkBNi/e18H4a2FLuzMDgmgaKrwqzyLXh6XD6i6iY=;
	b=klfRCiXXxIFmlBuI+VTD+//zHWSeob5GxuqZXWUpBqN3ChD4KMkoPzofJ+d9813iKd
	AmbHZXx/+9rKZXF4IuxNFIxxucMreUbwQKpqt9UQuAcMQ1jkWyyCSTT/c1uNMkHYOE8M
	Zhl0JbzXfxZel7kM18dU8QJohTecdSoqUcX4w=
MIME-Version: 1.0
Received: by 10.68.35.232 with SMTP id l8mr58432994pbj.75.1317385420454; Fri,
	30 Sep 2011 05:23:40 -0700 (PDT)
Received: by 10.142.199.2 with HTTP; Fri, 30 Sep 2011 05:23:40 -0700 (PDT)
In-Reply-To: <b53e13b48897472197f3ab2cb28c85cab089e4a5.1317370299.git.lei.mei@intel.com>
References: <cover.1317370299.git.lei.mei@intel.com>
	<b53e13b48897472197f3ab2cb28c85cab089e4a5.1317370299.git.lei.mei@intel.com>
Date: Fri, 30 Sep 2011 14:23:40 +0200
Message-ID: <CA+chaQcWqvxDeOMVpdAL_2US3KzAmD_iJCytMfwJRa0rEfG5uA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] curl: Upgrade from 7.21.7 to 7.22.0
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
X-List-Received-Date: Fri, 30 Sep 2011 12:29:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 10:16 AM, Mei Lei <lei.mei@intel.com> wrote:
> Signed-off-by: Mei Lei <lei.mei@intel.com>
> ---
> =C2=A0.../curl/{curl_7.21.7.bb =3D> curl_7.22.0.bb} =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-support/curl/{curl_7.21.7.bb =3D> curl_7.22.0.b=
b} (92%)
>
> diff --git a/meta/recipes-support/curl/curl_7.21.7.bb b/meta/recipes-supp=
ort/curl/curl_7.22.0.bb
> similarity index 92%
> rename from meta/recipes-support/curl/curl_7.21.7.bb
> rename to meta/recipes-support/curl/curl_7.22.0.bb
> index 2ec4402..d6924be 100644
> --- a/meta/recipes-support/curl/curl_7.21.7.bb
> +++ b/meta/recipes-support/curl/curl_7.22.0.bb
> @@ -14,8 +14,8 @@ SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.ta=
r.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://noldlibpath.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://pkgconfig_fix.patch"
>
> -SRC_URI[md5sum] =3D "5f6d50c4d4ee38c57fe37e3cff75adbd"
> -SRC_URI[sha256sum] =3D "1a50dd17400c042090203eef347e946f29c342c32b6c4843=
c740c80975e8215a"
> +SRC_URI[md5sum] =3D "bde820eac53fa3a8d8696667418557ad"
> +SRC_URI[sha256sum] =3D "bda0da862322b122784f5a9d7a65efdd99a6061292cfb8e9=
357e0c67c03e5112"

md5sum looks wrong (I have the same sha256sum)

OE @ ~ $ md5sum curl-7.22.0.tar.bz2
bdb5c226d37c4a6082c70e7ef6f63060  curl-7.22.0.tar.bz2
OE @ ~ $ sha256sum curl-7.22.0.tar.bz2
bda0da862322b122784f5a9d7a65efdd99a6061292cfb8e9357e0c67c03e5112
curl-7.22.0.tar.bz2

Regards,


