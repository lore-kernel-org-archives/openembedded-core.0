Received: from mail-lb0-f170.google.com ([209.85.217.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TvXah-0001kb-FK
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 19:19:59 +0100
Received: by mail-lb0-f170.google.com with SMTP id j14so1256628lbo.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 10:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=6CuO48F9vXrTX+bfs0NADXgx2NSKzfDozgpfX9yz2Go=;
	b=KaYBLTbwOnAF9u9myukH9UlhGrn6Z4bybLsN2XxxK2ZJzvvgyhZT1N2nvTBmcsgf8y
	6mFdRumPxCn09YI7specWaAVdpvVTWYiHc+eRLezA7AMTGX4hEHBOl5gE0i51yK2em6E
	gbnxfgLmYAVYiWx9YUuSTdhO0b/+Lh8hZYlSFff+XRiOSVWeTy6WkVAMpb4HTxTd20PP
	SWBjEiD6/N3y7u8JE0ZErpnROKz1k1hb2XqFOWFl0QMz81yuQSPGiWFiXDOiM4b77TSi
	XG+VXoBEhXxTihXu0H+Lr8sm6zfxBsPX/KixTu7erIlKXujx+7Qia7l2pgkqX1jpg1bv
	2KaA==
X-Received: by 10.112.88.105 with SMTP id bf9mr1036547lbb.43.1358359476489;
	Wed, 16 Jan 2013 10:04:36 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 16 Jan 2013 10:04:16 -0800 (PST)
In-Reply-To: <81aaaa6acc35e5fddf945d2a694a9381fb071635.1358355580.git.paul.eggleton@linux.intel.com>
References: <cover.1358355580.git.paul.eggleton@linux.intel.com>
	<81aaaa6acc35e5fddf945d2a694a9381fb071635.1358355580.git.paul.eggleton@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 16 Jan 2013 11:04:16 -0700
X-Google-Sender-Auth: 0us163-EUocn8xbWNoyQ1Mqc02w
Message-ID: <CABcZANmeipR++4mAkMvwm_2fvZEp6rmXMd2j1DAC4cTE-U1oMA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] classes/image: improve debug-tweaks ssh server configuration
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
X-List-Received-Date: Wed, 16 Jan 2013 18:20:05 -0000
Content-Type: multipart/alternative; boundary=f46d04016ac712cccd04d36bb6ad

--f46d04016ac712cccd04d36bb6ad
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 16, 2013 at 10:00 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> +       if [ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then
> +               if grep -q DROPBEAR_EXTRA_ARGS
> ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2>/dev/null ; then
> +                       if ! grep -q "DROPBEAR_EXTRA_ARGS=.*-B"
> ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear ; then
> +                               sed -i
> 's/^DROPBEAR_EXTRA_ARGS="*\([^"]*\)"*/DROPBEAR_EXTRA_ARGS="\1 -B"/'
> ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
> +                       fi
> +               else
> +                       printf '\nDROPBEAR_EXTRA_ARGS="-B"\n' >>
> ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear
> +               fi



Looks good, thanks.
-- 
Christopher Larson

--f46d04016ac712cccd04d36bb6ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 16, 2013 at 10:00 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton=
@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">+ =C2=A0 =C2=A0 =C2=A0 if =
[ -e ${IMAGE_ROOTFS}${sbindir}/dropbear ] ; then<br>
</div>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep -q DROPBEA=
R_EXTRA_ARGS ${IMAGE_ROOTFS}${sysconfdir}/default/dropbear 2&gt;/dev/null ;=
 then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ! grep -q &quot;DROPBEAR_EXTRA_ARGS=3D.*-B&quot; ${IMAGE_ROOTFS}${sy=
sconfdir}/default/dropbear ; then<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s/^DROPBEAR_EXTRA_ARGS=3D&quot;=
*\([^&quot;]*\)&quot;*/DROPBEAR_EXTRA_ARGS=3D&quot;\1 -B&quot;/&#39; ${IMAG=
E_ROOTFS}${sysconfdir}/default/dropbear<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fi<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf &#39;\nDROPBEAR_EXTRA_ARGS=3D&quot;-B&quot;\n&#39; &gt;&gt; ${IM=
AGE_ROOTFS}${sysconfdir}/default/dropbear<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi</blockquote></div><br=
><br>Looks good, thanks.<br>-- <br>Christopher Larson</div></div>

--f46d04016ac712cccd04d36bb6ad--
