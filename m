Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id A7AA971B2F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 20:40:54 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id k15so50238790qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 12:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ER9msr2UOh2j6ri8P5ssGky4kvixeJQKJKjtp/xe7Uo=;
	b=p+sEM6ilOv3gzWD9Y+Dzbsj9u3gV4De2boHOC4G9Bqx0VlL/IElgpIwOQCfFYraHAc
	iEbtxNVKC9mWmfhrabQ57mOwx6MIbqHimO1DGwV+ESxbzRgCNWI2hquHGgQkj6GuBrc1
	MMHzb+JJgsFKFu+guV/CNtwVa4Rn9diUjChuP1eLydw6xjLxwV0w1o1zynl2VNSXqCSZ
	cQst4CYb3OpoyL3VsL9iO5HTtDvQL5Njc24dMsy6o7jjlQOdsK480jVhn7IsrjcAi0TT
	Czs/qqa33tycgSIoOgd2pvBwQihEVp7SqDireT2dnzT/8Zcy7W0LlfwO+TBL9Dnj765t
	F6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ER9msr2UOh2j6ri8P5ssGky4kvixeJQKJKjtp/xe7Uo=;
	b=jPwLrlTXqSX3t8BNFn7EMYmkl4cNknlVgdGkxZgpvamJvngNJXxWtf3t14+OPN4JE0
	ZrXtnqwQo1D27ErO5ZTSHY+EjmyiGkLthLIcJBgNbWL/jgSBEkHN0mLpFe/V9Eg/nBTw
	47JJl1IL2izsLzKt47L39hUxnwxohOQqn40r4b9V+1YtaOoKCzzgqE/LCPrA1iB7K0GQ
	g/zwRzgsSGjjX3LVKdO1K8sR7eKReJeopyM9soRCakCb2MzHIaV44IZaoUFvIopcl8Fd
	qwg+7C/JAFEvdLUU6Lj0c2PrPrnI6V6Esh/NIgVgEFnbS7qBhTa7QFzJw5/cgZ+HTnoG
	N1Yg==
X-Gm-Message-State: AMke39mLEbDv9OBq/w+N/nVaVyuUpMzWqKakDzwGniSQm0iqAJzInxQNMYaq/ErCq2VIHWrJc/pKwiCfPCPfhJEW
X-Received: by 10.200.39.212 with SMTP id x20mr9040767qtx.109.1487364055156;
	Fri, 17 Feb 2017 12:40:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 17 Feb 2017 12:40:34 -0800 (PST)
In-Reply-To: <1487356080-8124-1-git-send-email-sgw@linux.intel.com>
References: <1487356080-8124-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Feb 2017 20:40:34 +0000
Message-ID: <CAJTo0Lb5=tW_U4WizZBjmVTUzsmrOpaEmAmnVn5zJAZGZUPJVg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] apt-package: use ${libdir} instead of /usr/lib
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
X-List-Received-Date: Fri, 17 Feb 2017 20:40:56 -0000
Content-Type: multipart/alternative; boundary=001a1135b54228e0e20548bfeef1

--001a1135b54228e0e20548bfeef1
Content-Type: text/plain; charset=UTF-8

On 17 February 2017 at 18:28, Saul Wold <sgw@linux.intel.com> wrote:

> -       install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
> +       install -m 0644 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
>         install -m 0644 ${S}/debian/apt-daily.service
> ${D}${systemd_unitdir}/system/
>         install -m 0644 ${S}/debian/apt-daily.timer
> ${D}${systemd_unitdir}/system/
>

The apt-daily.service unit is what fires the apt.systemd.daily script:

$ cat debian/apt-daily.service
...
ExecStart=/usr/lib/apt/apt.systemd.daily

If you're going to change the install location of the script then the unit
needs to be fixed.

Ross

--001a1135b54228e0e20548bfeef1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 February 2017 at 18:28, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D"gmail-:3r4" class=3D"gmail-a3s gm=
ail-aXjCH gmail-m15a4d550ea20a4b3">-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0=
644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/debian/apt.systemd.daily $=
{D}${libdir}/apt/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/debian/apt-daily.service $=
{D}${systemd_unitdir}/system/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/debian/apt-daily.timer ${D=
}${systemd_unitdir}/system/</div></blockquote></div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">The apt-daily.service unit is what=
 fires the apt.systemd.daily script:</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">$ cat debian/apt-daily.service</div><div cla=
ss=3D"gmail_extra">...</div><div class=3D"gmail_extra">ExecStart=3D/usr/lib=
/apt/apt.systemd.daily<br></div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">If you&#39;re going to change the install location of =
the script then the unit needs to be fixed.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a1135b54228e0e20548bfeef1--
