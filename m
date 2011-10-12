Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RDoDc-0001TK-2w; Wed, 12 Oct 2011 04:06:52 +0200
Received: by qadc1 with SMTP id c1so200251qad.6
	for <multiple recipients>; Tue, 11 Oct 2011 19:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=xoKFPnh1MxzOriGAXxv1ZvWalNiVfXbrwnKz0uvK//s=;
	b=Dz8wAb7Z2k5RaxkUjG2O+hpdJsRV+yO+jHEFCp26jw7L0Psr8EfD7PqtxI8UuJH25e
	JPOznwkb4F+75Ehb2LQpIoth7Di2Juk79skPsgWihaeSBETJuq7jA00zrcSxpcesyA0E
	jiVTgBSygQnSw2MY0DPHtLwTkN9busIpaSElA=
Received: by 10.68.208.229 with SMTP id mh5mr50053956pbc.124.1318384869104;
	Tue, 11 Oct 2011 19:01:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Tue, 11 Oct 2011 19:00:39 -0700 (PDT)
In-Reply-To: <201110120110.38951.schnitzeltony@gmx.de>
References: <201110120110.38951.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Oct 2011 19:00:39 -0700
Message-ID: <CAMKF1srfiOy0k2714bkmkfSnvgQ=UGg3CDWUYUEnV1OFXcVKxQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: oe parse fails
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
X-List-Received-Date: Wed, 12 Oct 2011 02:06:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 4:10 PM, Andreas M=C3=BCller <schnitzeltony@gmx.de>=
 wrote:
> Angstrom environment / fresh pull / clean tmp dir -> error
>
> Pseudo is not present but is required, building this first before the mai=
n build
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided icon=
v library is used =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| ETA: =C2=A000:00:34
> NOTE: angstrom DOES NOT support libiconv because the eglibc provided icon=
v library is used
> NOTE: angstrom DOES NOT support gconf-dbus because gconf-dbus has been me=
rged back into main GConf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA: =
=C2=A000:00:34
> NOTE: angstrom DOES NOT support gconf-dbus-native because gconf-dbus has =
been merged back into main GConf
> ERROR: Could not include required file recipes-graphics/xorg-xserver/xser=
ver-xf86-dri-lite.inc######################################################=
######## =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA: =
=C2=A000:00:09
> ERROR: Command execution failed: Exited with 1
>

the recent xorg changes in oe-core needs to be adapted into layers. I
have posted some patches, they may be wrong
but they help in getting over the parse issues while using angstrom.

> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


