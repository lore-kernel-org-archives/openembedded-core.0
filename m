Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCcX7-0006uS-6o
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 21:58:21 +0200
Received: by qafl39 with SMTP id l39so3307143qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kzVvISq6ASRKb3xSEwcTY237MBNfdq4eEZHQu999ZeE=;
	b=Hv+IkCp5HDJZpYp0jCjYFV9QaDdWiO7doSQRlf+eDly6CCRUX7hzDnda5V/oKlghTD
	KODmycr46+QKt7Yst5vgB4Yfq3C2s2gVDWKZ38ozOyOW7GqvBYv2Q3SlVkIVNRictuL5
	TaHP5kbDAWdCyNux2UUjwaGZItZ3xxeoTrQ7ttx4uBMBUsn8hXcBc9+SbCaNGQ/JohRE
	xZe19wAOtk5xe6J5G8M0rJnlOoU2xeN2xyMKjgr++uInGU/VTdrwmrm01FwacaYXC66z
	xJd5zPlFmZvLpPnT2NhtAe4HMRNbtW659VmbRCunhCZEVWpYPVWn9vLGMUZfK0tLkGUA
	2kHg==
Received: by 10.224.182.201 with SMTP id cd9mr34631406qab.92.1332877759450;
	Tue, 27 Mar 2012 12:49:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Tue, 27 Mar 2012 12:48:59 -0700 (PDT)
In-Reply-To: <e9d2eb8bec97c9bd98bbd5ea2073924e284ba41b.1332814325.git.xiaofeng.yan@windriver.com>
References: <cover.1332814325.git.xiaofeng.yan@windriver.com>
	<e9d2eb8bec97c9bd98bbd5ea2073924e284ba41b.1332814325.git.xiaofeng.yan@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Mar 2012 12:48:59 -0700
X-Google-Sender-Auth: USii5fuF14zLjGZzy_kk_eEdofk
Message-ID: <CABcZANkLt7Ym-hRT-_qRKUXyYZkxZ_wco8JQcLzAA5heS4m=DQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] local.conf.sample.extended: The set for archiving packages
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
X-List-Received-Date: Tue, 27 Mar 2012 19:58:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 7:24 PM, Xiaofeng Yan
<xiaofeng.yan@windriver.com> wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> User can use these variables to get atchiving packages they want.
>
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> =C2=A0meta-yocto/conf/local.conf.sample.extended | =C2=A0 32 ++++++++++++=
++++++++++++++++
> =C2=A01 files changed, 32 insertions(+), 0 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf=
/local.conf.sample.extended
> index 9c5b974..731b7d6 100644
> --- a/meta-yocto/conf/local.conf.sample.extended
> +++ b/meta-yocto/conf/local.conf.sample.extended
> @@ -182,3 +182,35 @@
> =C2=A0# when the disk space reduces 50M (or the amount of inode reduces 5=
k).
> =C2=A0#BB_DISKMON_WARNINTERVAL =3D "50M,5K"
>
> +# Archiving packages configuration
> +#
> +# The following variables lists which files to archive and the package t=
ype to archive.
> +# One bbclass of them (archive-original-source.bbclass,archive-patched-s=
ource.bbclass
> +# and archive-configured-source.bbclass) should be inherited in a global=
 bbclass, for example,
> +# intherit archive-original-source in packages_rpm.bbclass
> +#
> +# SOURCE_ARCHIVE_PACKAGE_TYPE =3D {'tar','srpm'}
> +#SOURCE_ARCHIVE_PACKAGE_TYPE ?=3D 'tar'
> +#
> +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS =3D {'logs_with_scripts', 'logs'}
> +# String 'logs_with_scripts' include temp directory and .bb and .inc fil=
es
> +# String 'logs' only include temp
> +#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?=3D 'logs_with_scripts'
> +
> +#
> +# Archiving packages configuration
> +#
> +# The following variables lists which files to archive and the package t=
ype to archive.
> +# One bbclass of them (archive-original-source.bbclass,archive-patched-s=
ource.bbclass
> +# and archive-configured-source.bbclass) should be inherited in a global=
e bbclass, for example,
> +# intherit archive-original-source in packages_rpm.bbclass
> +#
> +# SOURCE_ARCHIVE_PACKAGE_TYPE =3D {'tar','srpm'}
> +#SOURCE_ARCHIVE_PACKAGE_TYPE ?=3D 'tar'
> +#
> +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS =3D {'logs_with_scripts', 'logs'}
> +# String 'logs_with_scripts' include temp directory and .bb and .inc fil=
es
> +# String 'logs' only include temp
> +#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?=3D 'logs_with_scripts'
> +#
> +
> --
> 1.7.0.4

You're adding the bits to the file twice, as far as I can tell.
--=20
Christopher Larson


