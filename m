Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R53N4-0002jE-C1
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:28:26 +0200
Received: by bke11 with SMTP id 11so13879185bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=m0sZYjvHn6qP4N+8n4tLPxdQZlKEu6j5+ce3EddJ494=;
	b=PGeoiaRwBceblP40BTw5bPM+W9f0YWhE5Hy7+GLnGiJvmcYmLjrky5Bd6dXnQc/nJG
	xnHN3lLtviKRxBaA1/KH9+vQrX67PPVGDlKpZKgcScZMiKlN8dELx3Lu12SOKoMI8A8E
	vv1hTuYsWb8sceAdqJ5uxds/FD4S5avE1h5YE=
MIME-Version: 1.0
Received: by 10.204.138.193 with SMTP id b1mr569138bku.114.1316298192153; Sat,
	17 Sep 2011 15:23:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 17 Sep 2011 15:23:12 -0700 (PDT)
In-Reply-To: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
Date: Sat, 17 Sep 2011 19:23:12 -0300
X-Google-Sender-Auth: h6nfZU4w5Zq031I5xVdhjiJ9GSA
Message-ID: <CAP9ODKqwxc7TcZhgNtuZfan_Kbdn2hJ7UELfy=BeFtGS3iGKGQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
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
X-List-Received-Date: Sat, 17 Sep 2011 22:28:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I have sent this in July and it was nacked. See at
https://github.com/OSSystems/oe-core/commit/5c53cbf951a11ed92fb2ad0837991db=
256c11489

On Sat, Sep 17, 2011 at 19:18, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> =A0meta/classes/kernel.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index bc1baa0..c577011 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -451,7 +451,7 @@ python populate_packages_prepend () {
> =A0 =A0 =A0 =A0metapkg =3D "kernel-modules"
> =A0 =A0 =A0 =A0bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
> =A0 =A0 =A0 =A0bb.data.setVar('FILES_' + metapkg, "", d)
> - =A0 =A0 =A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base'=
, 'kernel-vmlinux', 'perf', 'kernel-misc' ]
> + =A0 =A0 =A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base'=
, 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
> =A0 =A0 =A0 =A0for l in module_deps.values():
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for i in l:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pkg =3D module_pattern % l=
egitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1)=
)
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


