Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvF7m-0000GD-KL
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:30:04 +0100
Received: by fxm8 with SMTP id 8so1512680fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 12:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=BYYHVAzEVXnDMYimfspcqC/zDtX3MQXwKX+c13UZ2sA=;
	b=iRp7jxj3ir+Ot1GOgkH6szwXPgkR+8SjAbHeeFRsUHENmjshm5h0D6oUngEQI8VsqB
	lvmrRHx8V8/y04dDA1FFCIAR79vzANtrbrTXVi9GI8QwWcgO0Cf4Poj5W4iFfky2hfPl
	o7Lg3HCycz2Mz5Zogu09y19U2HAKMURY7rQ94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=uxh0k9ZKhApedDKhsvBACg/jsAvTcv1Yb1zZDO6T5bSWBgYfdOq2+IN4ZXKX3iwJ8m
	a+BRto5JN3UKYwcn56kHf7/l3PLL8D7lRnJRBV9rroDJAz8DKX6GUpAg9fD9U+xz3F5B
	pnTnzTqIgc9UvOuOnT3OYyWBJGlqa2/ZGZisc=
Received: by 10.223.87.75 with SMTP id v11mr1973886fal.131.1299183961084; Thu,
	03 Mar 2011 12:26:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 12:25:41 -0800 (PST)
In-Reply-To: <e5662d07e615cfa5879a5d700df2d1e9049a6413.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
	<e5662d07e615cfa5879a5d700df2d1e9049a6413.1299182375.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 12:25:41 -0800
Message-ID: <AANLkTi=aQ=HYbPrXd98qvxYC=voFhf0AJMsse5bcrp3M@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 03/10] sato-icon-theme: Explictly use "Sato" as gtk icon theme
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
X-List-Received-Date: Thu, 03 Mar 2011 20:30:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
>
> There is a tricky race condition that "Sato" icons got missing on
> matchbox-desktop as low priority "hicolor" theme was chosen. Explictly
> settting "Sato" in gtk config file to avoid this.
>
> [BUGID #456] got fixed.
>
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
> =C2=A0.../sato-icon-theme/sato-icon-theme.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +++
> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta=
/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> index a1669c6..0eff9dd 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> @@ -16,9 +16,12 @@ PACKAGE_ARCH =3D "all"
>
> =C2=A0EXTRA_OECONF +=3D "--with-iconmap=3D${STAGING_LIBDIR_NATIVE}/../lib=
exec/icon-name-mapping"
>
> +#explictly setting "Sato" as default icon theme to avoid icon missing du=
e to
> +#tricky race condition
> =C2=A0pkg_postinst_${PN} () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "x$D" !=3D "x" ]; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk-update-icon-cache -q /usr/share/icons/Sat=
o
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo 'gtk-icon-theme-name =3D "Sato"' >> /et=
c/gtk-2.0/gtkrc

what would happen if you reinstalled this packge again I guess it
would keep appending right ?


> =C2=A0}
> --
> 1.7.1.1
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


