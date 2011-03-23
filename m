Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2UY1-000695-Qn
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 21:20:53 +0100
Received: by mail-fx0-f47.google.com with SMTP id 19so7913991fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 13:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Ulx1UfiuShQdCT9wERp5l5anCOwD84Dwc9H7FU05vkw=;
	b=uVCCX7P0HVp1sZe2m76X6a2MUijziODGhkLZ/mGL9glAc1j4iJucPgiVkepYCJ/rPg
	MmleP3yaNh8Khx9lM2ZgGh58vDpukhI+5WnjY6cSEl8mLHJEjkTfYfHcCymOh/RT+0mA
	/3DnGedc9FWn7KD0eyEXu9f8gV+AiCg3tLc8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Th4pCcVoOtfzQNJ2im5ry5u5124PGQqMJbKM3qaHwLGB7A1k+H6vle4oBVFPCGamet
	QqDA/r1I/joWW+bdn/cIfDX+98ZrMUSsazGQfvMuUTZvDf9Zd49X1bJ1d9uhj8GR44CC
	nFOo/2ZP3lsEnZ6S/Jn8EVoSW0QUAzdE/fyx8=
Received: by 10.223.26.205 with SMTP id f13mr317323fac.49.1300911544320; Wed,
	23 Mar 2011 13:19:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Wed, 23 Mar 2011 13:18:34 -0700 (PDT)
In-Reply-To: <1300910131-9827-1-git-send-email-koen@dominion.thruhere.net>
References: <1300910131-9827-1-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Mar 2011 13:18:34 -0700
Message-ID: <AANLkTimczMoBaP67GMz+pc11A0arZejWj4=yQrki52W-@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH] kernel.bbclass: blacklist 'kernel-misc' from kernel-modules
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
X-List-Received-Date: Wed, 23 Mar 2011 20:20:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 12:55 PM,  <koen@dominion.thruhere.net> wrote:
> From: Koen Kooi <koen@dominion.thruhere.net>
>
> When 'kernel-misc' is empty do_rootfs will fail when including 'kernel-mo=
dules'
>
> The proper fix would be to have a whitelist for the 'kernel-modules' meta=
-pkg
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Worked nicely.

Tested-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0meta/classes/kernel.bbclass | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3eb6659..9f014d4 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -429,7 +429,7 @@ python populate_packages_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg =3D "kernel-modules"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", =
d)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('FILES_' + metapkg, "", d)
> - =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'ker=
nel-base', 'kernel-vmlinux', 'perf' ]
> + =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'ker=
nel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in module_deps.values():
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in l:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pkg =3D module_pattern % legitimize_package_name(re.match(module_=
regex, os.path.basename(i)).group(1))
> --
> 1.6.6.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


