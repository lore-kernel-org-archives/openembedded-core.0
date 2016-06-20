Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9624273259
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 21:58:19 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id t74so694178ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eZrjYF//iPfibJJ8zXRW8lMTu+7oulim0FNBumYuteo=;
	b=uWtu098A39bOrj2xhE+hE/2pQTQQmlTpDhQEvLCfx4y/a0AqQIQylBE5JgjAhwerPA
	zcdu+neKXAFqcqZvmGTUB7c6RT0DD/1jiXjyl8oLRK3+5+g9vZrdipwN3C/6QjDjndaf
	75WJW0tBTNtc7+Jl3t5VDfzKaZgQdxpMFqUZHDDJ7k02VN9H9wyNLCsdq31RGjY/Dzir
	hp9Dy//42KvAdFZ6cU/tAPnPQefUuRpfIqj8YY9uIfV4vr/XfAB5DT4PydzGRWIF4K/L
	jOme2oB9e8Rj//ZzV+vZsfpeQ5ILtJP9uI3OH2sKrvaueB0EfKu4mEIXy+48OqlAmaMt
	2q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eZrjYF//iPfibJJ8zXRW8lMTu+7oulim0FNBumYuteo=;
	b=RiDng9LFN6yNjqvCttq+q9XG/RbFsAESSfoXZXrWvxWgvTPBUTPF52mlt8FmkrCfu3
	aZrXLO3OR95hEmcpsQuyDFkXTTs4A2jjI+GUQjt6ZBbGo5p1eAfr44FB2TYPgMoOtpE7
	gpG9QtiNuJkx0sw/3Zh915vSCg3jtEZDyMbTwSy5zkpvtrTxnMZHBGdZXEPzyck4P8fV
	+TWE7iNKSn64a8Na2g5IOBlfzopOWPDSGZhTmBBpV39W4WIuVsnWJuZ1AA4y3twfoD5y
	yeYHTyE+V5U8pkCkg3zJQ63r/PqVq0gzPRjuVEGEOoZNpQlYN0Uj7WS2q5OJX9HA1nPM
	lceg==
X-Gm-Message-State: ALyK8tKLf3V13NMKuC8608E3xtMf307zzDz+NiwMo5lQ7gHRkjln1U4GPISlCpS5pi25/xglXZKw31FwSixkuwj1
X-Received: by 10.107.138.201 with SMTP id c70mr25042405ioj.148.1466459899878; 
	Mon, 20 Jun 2016 14:58:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 20 Jun 2016 14:58:00 -0700 (PDT)
In-Reply-To: <CA+chaQcUOqPCx76Y3rvv-GMsDgMeb7rAnKQM3Ackz+k1As-o7Q@mail.gmail.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
	<7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
	<81de01080e7d3180df7badba586f16c87160c893.1465288175.git.jussi.kukkonen@intel.com>
	<CA+chaQcUOqPCx76Y3rvv-GMsDgMeb7rAnKQM3Ackz+k1As-o7Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jun 2016 22:58:00 +0100
Message-ID: <CAJTo0LYWq82gHWNNNpEPdqhJj=95teUZGLjiT-0wr+mCn9WrGQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 29/37] sysprof: Upgrade to git version slightly past 3.20
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
X-List-Received-Date: Mon, 20 Jun 2016 21:58:19 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6a68f4820535bccdad

--001a113e8e6a68f4820535bccdad
Content-Type: text/plain; charset=UTF-8

On 20 June 2016 at 21:08, Martin Jansa <martin.jansa@gmail.com> wrote:

> sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof: Files/directories were
> installed but not shipped in any package:
>   /lib
>   /usr/share/dbus-1
>   /usr/share/dbus-1/system.d
>   /usr/share/dbus-1/system-services
>   /usr/share/dbus-1/system.d/org.gnome.Sysprof2.conf
>   /usr/share/dbus-1/system-services/org.gnome.Sysprof2.service
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/sysprof2.service
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> sysprof: 9 installed and not shipped files. [installed-vs-shipped]
> sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepends on polkit, but it
> isn't a build dependency, missing polkit in DEPENDS or PACKAGECONFIG?
> [build-deps]
>

Thanks, I noticed this in a long-running build but was travelling so
couldn't reply.

Jussi, this happens if you have systemd and policykit present in the
sysroot.

Ross

--001a113e8e6a68f4820535bccdad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 June 2016 at 21:08, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>sys=
prof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof: Files/directories were installe=
d but not shipped in any package:</div><div>=C2=A0 /lib</div><div>=C2=A0 /u=
sr/share/dbus-1</div><div>=C2=A0 /usr/share/dbus-1/system.d</div><div>=C2=
=A0 /usr/share/dbus-1/system-services</div><div>=C2=A0 /usr/share/dbus-1/sy=
stem.d/org.gnome.Sysprof2.conf</div><div>=C2=A0 /usr/share/dbus-1/system-se=
rvices/org.gnome.Sysprof2.service</div><div>=C2=A0 /lib/systemd</div><div>=
=C2=A0 /lib/systemd/system</div><div>=C2=A0 /lib/systemd/system/sysprof2.se=
rvice</div><div>Please set FILES such that these items are packaged. Altern=
atively if they are unneeded, avoid installing them or delete them within d=
o_install.</div><div>sysprof: 9 installed and not shipped files. [installed=
-vs-shipped]</div><div>sysprof-3.20.0+gitAUTOINC+9c6cec9b49: sysprof rdepen=
ds on polkit, but it isn&#39;t a build dependency, missing polkit in DEPEND=
S or PACKAGECONFIG? [build-deps]</div></div><div class=3D"HOEnZb"></div></b=
lockquote></div><br>Thanks, I noticed this in a long-running build but was =
travelling so couldn&#39;t reply.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Jussi, this happens if you have systemd and pol=
icykit present in the sysroot.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a113e8e6a68f4820535bccdad--
