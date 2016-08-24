Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id BAE02731BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 21:12:24 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id n128so57579091ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6i7N4rviDVrnAnH/oDb+fVqhJie+vltW5fvkfz2Aqmo=;
	b=E5gEl8KanjfMFVEJluOXJRElfRZzU1O7YEBY0jiE578aKQZoY32Qo1bo+7rq/JP4TR
	H9OYjJomvTthp8NJrT+FTYAAk8r5NN2m9r2mBqjsnncx8gwcPPHQTH+5CBMURDiXvFbm
	Te1jwOjk453r7JAneqCrLTVpnA4BGc/s22cAH3fO/uayilDWhSsfrq0LAbplrSHlP7Xz
	WCRUsUPy8pB9xb3Gr+jhHzEmR2uteOdRIqaeDqjch0vG68oXU51aYU3V7vrHYPtPhBX/
	jeVG+gUOrp/sZEWoPSAvxpiQ1RgvrkteLwLSBwDH6O/a4E2xwcWlZiB59gV5H526AgAP
	/jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6i7N4rviDVrnAnH/oDb+fVqhJie+vltW5fvkfz2Aqmo=;
	b=lEm/sreuhbzpVTi7m+rZXiPL/VcIfVOYeFSuEXWZ11wUj7fhSJYOWaYQGTGp9oWsI3
	Ld935WZlBlzG+f8sJHha6dupvDnQPvEFX5NKQJbASWUrvZFgooaqiVr/GRDpBYeWerO/
	qwCwxLBLc7CMNJj1p0BqIn9ooOnvErYvv8YEg7kNlfQYgXk8ZAj6c+qkFKNLtg2NbTlF
	uwVhy6er4miy6r0W6Tu/QSFz1+qbtS1VLfSCfUP8qMzH8R/8qxNQL1H159y9zHrxEEzB
	HHIus7zlHZMNLaxm+FCQI+KExLYGoWvWcgTiuFn5leEHuKxVAlNZPgnhZUBwdT4Rujx8
	t6nA==
X-Gm-Message-State: AE9vXwNTMaM9wnD1/i442RIfamupZcvLCdjXDdvXBtNeOddr3YnPXVinIyINO8/lHyZwOOPBPG+OSlKuorix1Zf9
X-Received: by 10.107.135.142 with SMTP id r14mr6933678ioi.133.1472073144738; 
	Wed, 24 Aug 2016 14:12:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 14:12:04 -0700 (PDT)
In-Reply-To: <1471859570-1536-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <CAHiDW_EOqi1qsP3AF_a3oqfg7smFb=EL=puyzyUfH+BK92_pOw@mail.gmail.com>
	<1471859570-1536-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 22:12:04 +0100
Message-ID: <CAJTo0LZaZj0CdXQAivEqyBQusc4HT54u6_0x943G58XQy-6wiA@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] bind: 9.10.3-P3 -> 9.11.0b2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2016 21:12:25 -0000
Content-Type: multipart/alternative; boundary=001a113eccbce02fe5053ad7bc6b

--001a113eccbce02fe5053ad7bc6b
Content-Type: text/plain; charset=UTF-8

On 22 August 2016 at 10:52, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> +EXTRA_OECONF = " ${ENABLE_IPV6} --with-python=python
> --with-randomdev=/dev/random --disable-threads \
> @@ -81,7 +76,7 @@ do_install_append() {
>         install -d "${D}${sysconfdir}/init.d"
>         install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>         install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
> -       sed -i -e '1s,#!.*python,#! /usr/bin/python3,'
> ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
> +       sed -i -e '1s,#!.*python,#! /usr/bin/python3,'
> ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
> ${D}${sbindir}/dnssec-keymgr
>

Would passing --with-python=python3 mean you can remove the sed entirely?

Ross

--001a113eccbce02fe5053ad7bc6b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 August 2016 at 10:52, Wang Xin <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@cn.fu=
jitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2js" class=3D"a3s aXjCH m156b1abd22fd9413">+EXTRA_OECONF =3D &quot; ${=
ENABLE_IPV6} --with-python=3Dpython --with-randomdev=3D/dev/random --disabl=
e-threads \<br>
@@ -81,7 +76,7 @@ do_install_append() {<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d &quot;${D}${sysconf=
dir}/init.d&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/conf/* &quot;${D}${sysconfd=
ir}/bind/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 &quot;${S}/init.d&quot; &quot;${=
D}${sysconfdir}/init.d/<wbr>bind&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s,#!.*python,#! /usr/bin/python=
3,&#39; ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds<br>
</span>+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s,#!.*python,#! /usr/bin=
/python3,&#39; ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds=
 ${D}${sbindir}/dnssec-keymgr</div></blockquote></div><br></div><div class=
=3D"gmail_extra">Would passing --with-python=3Dpython3 mean you can remove =
the sed entirely?</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113eccbce02fe5053ad7bc6b--
