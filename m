Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SmPJo-0001kw-LO
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 15:08:33 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Jul 2012 05:56:23 -0700
Received: by lbbgj3 with SMTP id gj3so9194884lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 05:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=BixDjGY/CPjv9LlYuu6htJqUuqIt0MIX+KUdfcJarco=;
	b=NBbFc5n4u/h5AV57q7QGEqTPNoRyCp8K41MJhaaPGM2ysONXdz1/C7gwRisg5+Q/ie
	YMQy6xbarP5xLylrQhQAdc8exgLncwooZYiYXsZqn33/1pEeAXdVOS+Y7Hdhr3B0tJEf
	rtmIv01GJ1FBYKeH+LUeJVBMFxWmJqfnYy5fODUpTtdHcXODfiMr79N2gG7o/SO12Vyl
	OeshxmnU4+2CEh3tBaViW/iHJjwxChw9hBkv9fYTZLsVy3GjEeEZrO9WTutyEWBTrA2F
	Go50XXR62OtlT42s5tRWaNKgwQdHJy7NC0/C98o7Q3WojeOOr09DGGRXQ8JW0nI/Jd6F
	k+6A==
MIME-Version: 1.0
Received: by 10.152.48.6 with SMTP id h6mr21776847lan.30.1341406581598; Wed,
	04 Jul 2012 05:56:21 -0700 (PDT)
Received: by 10.112.38.132 with HTTP; Wed, 4 Jul 2012 05:56:21 -0700 (PDT)
In-Reply-To: <CAJ2CSBv9amOtH=LdU+37ZoNo0LB0B6uJ-=osARD0d_Chuppu9Q@mail.gmail.com>
References: <CAJ2CSBv9amOtH=LdU+37ZoNo0LB0B6uJ-=osARD0d_Chuppu9Q@mail.gmail.com>
Date: Wed, 4 Jul 2012 15:56:21 +0300
Message-ID: <CAJ2CSBu8oFTwDh_Cg_ciokfDvYEZ33Pz3-FZM-FJYZsKdepuqA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkubAcZ5DZHB+eePM9q6K2ctg4vriWrweR5OQSdjyMNOdDycMsNFWpmSSeBzTNbTV/GE6HZ
Subject: Re: Files not getting into the debug packages
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
X-List-Received-Date: Wed, 04 Jul 2012 13:08:33 -0000
Content-Type: multipart/alternative; boundary=bcaec5524242cbaa7104c4008ed5

--bcaec5524242cbaa7104c4008ed5
Content-Type: text/plain; charset=ISO-8859-1

MIhai gratiously provided the insight, the debug lines should be

FILES_${PN}-dbg += "${base_libdir}/udev/udev/.debug/"
FILES_${PN}-dbg += "${base_libdir}/udev/udev/.debug/*"

(notice base_libdir instead of libexecdir)

Cheers,
Alex

On Wed, Jul 4, 2012 at 3:19 PM, Damian, Alexandru <
alexandru.damian@intel.com> wrote:

> Hi guys,
>
> I'm trying to run a udev package upgrade (See attached patch).
>
> I get this error,
>
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/v4l_id
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/cdrom_id
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/mtd_probe
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/accelerometer
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/scsi_id
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/udevd
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/keymap
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/collect
> ERROR: QA Issue: non debug package contains .debug directory: udev path
> /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/ata_id
> ERROR: QA run found fatal errors. Please consider fixing them.
>
>
> although I added the files to the debug package (I think)
>
>  FILES_${PN}-dbg += "${libexecdir}/.debug"
> +FILES_${PN}-dbg += "${libexecdir}/udev/udev/.debug/"
> +FILES_${PN}-dbg += "${libexecdir}/udev/udev/.debug/*"
>  FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
>
> Can somebody please point out what I'm doing wrong ?
>
> Cheers,
> Alex
>

--bcaec5524242cbaa7104c4008ed5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

MIhai gratiously provided the insight, the debug lines should be <br><br>FI=
LES_${PN}-dbg +=3D &quot;${base_libdir}/udev/udev/.debug/&quot;<br>FILES_${=
PN}-dbg +=3D &quot;${base_libdir}/udev/udev/.debug/*&quot;<br><br>(notice b=
ase_libdir instead of libexecdir)<br>
<br>Cheers,<br>Alex<br><br><div class=3D"gmail_quote">On Wed, Jul 4, 2012 a=
t 3:19 PM, Damian, Alexandru <span dir=3D"ltr">&lt;<a href=3D"mailto:alexan=
dru.damian@intel.com" target=3D"_blank">alexandru.damian@intel.com</a>&gt;<=
/span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi guys,<br><br>I&#39;m trying to run a udev=
 package upgrade (See attached patch).<br><br>I get this error, <br><br>ERR=
OR: QA Issue: non debug package contains .debug directory: udev path /work/=
i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/v4l_id=
<br>

ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/cdr=
om_id<br>ERROR: QA Issue: non debug package contains .debug directory: udev=
 path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.=
debug/mtd_probe<br>

ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/acc=
elerometer<br>ERROR: QA Issue: non debug package contains .debug directory:=
 udev path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/u=
dev/.debug/scsi_id<br>

ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/ude=
vd<br>ERROR: QA Issue: non debug package contains .debug directory: udev pa=
th /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.deb=
ug/keymap<br>

ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/col=
lect<br>ERROR: QA Issue: non debug package contains .debug directory: udev =
path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.d=
ebug/ata_id<br>

ERROR: QA run found fatal errors. Please consider fixing them.<br><br><br>a=
lthough I added the files to the debug package (I think)<br><br>=A0FILES_${=
PN}-dbg +=3D &quot;${libexecdir}/.debug&quot;<br>+FILES_${PN}-dbg +=3D &quo=
t;${libexecdir}/udev/udev/.debug/&quot;<br>

+FILES_${PN}-dbg +=3D &quot;${libexecdir}/udev/udev/.debug/*&quot;<br>=A0FI=
LES_${PN}-dev =3D &quot;${datadir}/pkgconfig/udev.pc&quot;<br><br>Can someb=
ody please point out what I&#39;m doing wrong ?<br><br>Cheers,<br>Alex<br>
</blockquote></div><br>

--bcaec5524242cbaa7104c4008ed5--
