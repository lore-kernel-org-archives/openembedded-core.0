Return-Path: <nwwinters@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id E4B1178DEA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 17:51:03 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id l82-v6so4368887oih.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GsswOzsrJDFxtl+9ca2/nORxvujpgBJ9qTA05yQesUM=;
	b=UoMp3aP/X5HjDxkKB7hILQfYADp0K4uvDg0Q20mqiDkqAHbF2+87TJL+RUVgOwupSk
	kW68Ii48PYhnPuAlld4ELeZLrNZeSLzhKpW3+LjZ9WuwTRFq35x50Gi0VILys46/mlg1
	55zt82tFA8vSA+bPYkxX55bN4qRE5IGnUNlwg8g/gi9NZ3MkMKog5XTIJ2LkZmWz8uEV
	NXQBK6z8WYICXI+0vEKnYq6NtNNGyxfyLcDdvvDykQXmRvvq/k7Mbzw/MAocqb4yyAJw
	7poENh5pQmj24zzqn4CVaWnSHhnpwhlKsOuuBvVXlPBWdrPYpvAFWDmljBhT65bVyio+
	kL/A==
X-Gm-Message-State: APzg51DxSC2EM94d4KpKHtxcT6IF2yg0fk/S6UVUarRHKYkW33B9mzbW
	MMKBtcrcGaELLyL3h9FvXyWp2sFA
X-Google-Smtp-Source: ANB0VdZyCTJ9DnfcbItQ0dKVVjSei1lkr1nnL68iIMufiFUEe/XzD1T2C6QNyWfYgNVoagLTxvIchA==
X-Received: by 2002:aca:4f44:: with SMTP id
	d65-v6mr2272809oib.224.1535478664620; 
	Tue, 28 Aug 2018 10:51:04 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	l195-v6sm1761298oib.17.2018.08.28.10.51.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 10:51:04 -0700 (PDT)
Received: by mail-oi0-f44.google.com with SMTP id l82-v6so4368782oih.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:51:04 -0700 (PDT)
X-Received: by 2002:aca:ba83:: with SMTP id
	k125-v6mr1946109oif.226.1535478663714; 
	Tue, 28 Aug 2018 10:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <CA+FvCj6uCS7iSwpyOnNx0Q-A7iXfzTg_NtcH98ihmsfLDGkn9Q@mail.gmail.com>
	<CANNYZj-Ga4t5WW+bSZ+eqXEcUuR_G-5QNfzAta40oEgAf+paqg@mail.gmail.com>
In-Reply-To: <CANNYZj-Ga4t5WW+bSZ+eqXEcUuR_G-5QNfzAta40oEgAf+paqg@mail.gmail.com>
From: Nick Winters <nick@wintersteam.org>
Date: Tue, 28 Aug 2018 10:50:51 -0700
X-Gmail-Original-Message-ID: <CA+FvCj77pcY6BQ4ecNc6a5NPFWeKjFs02Kkn4y4+BPaSBuuqAw@mail.gmail.com>
Message-ID: <CA+FvCj77pcY6BQ4ecNc6a5NPFWeKjFs02Kkn4y4+BPaSBuuqAw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Troubleshooting sstate cache
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
X-List-Received-Date: Tue, 28 Aug 2018 17:51:04 -0000
Content-Type: multipart/alternative; boundary="0000000000004f9cdb0574827cea"

--0000000000004f9cdb0574827cea
Content-Type: text/plain; charset="UTF-8"

Thanks for your response Alex.

Below is an excerpt of one failure I've encountered. When attempting to
do_rootfs, the following error occurs:

error while loading shared libraries: libopkg.so.1: cannot open shared
object file: No such file or directory

Below is more detail:

NOTE: recipe core-image-biamp-linux-ppc-1.0-r0: task do_rootfs: Started
ERROR: Unable to update the package index files. Command
'/var/lib/jenkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl
-f
/var/lib/jenkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/work/mpc83xx-poky-linux/core-image-biamp-linux-ppc/1.0-r0/opkg.conf
-o
/var/lib/jenkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/work/mpc83xx-poky-linux/core-image-biamp-linux-ppc/1.0-r0/rootfs
--force_postinstall --prefer-arch-to-version  --add-exclude linux-dummy
--add-exclude opkg --add-exclude dbus --add-exclude gdbm --force-overwrite
update' returned 127:
/var/lib/jenkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl:
error while loading shared libraries: libopkg.so.1: cannot open shared
object file: No such file or directory
ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/var/lib/jenkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/work/mpc83xx-poky-linux/core-image-biamp-linux-ppc/1.0-r0/temp/log.do_rootfs.4871
NOTE: recipe core-image-biamp-linux-ppc-1.0-r0: task do_rootfs: Failed
ERROR: Task 7
(/var/lib/jenkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/../meta-biamp/recipes-ppc/images/
core-image-biamp-linux-ppc.bb, do_rootfs) failed with exit code '1'

When I execute ldd on opkg-cl, I get the following:
linux-vdso.so.1 (0x00007ffda9bd8000)
libopkg.so.1 => not found
libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f72dbac3000)
/lib64/ld-linux-x86-64.so.2 (0x00007f72dc067000)

Looking inside the tmp/sysroots directory, I can find libopkg.so.1. It
appears as though opkg-cl was built to look for the shared library in the
host path rather than the tmp/sysroots path.

My guess is that this is something other than an sstate-cache problem but
when I clear the sstate-cache, everything builds fine.

Nick

On Tue, Aug 28, 2018 at 12:10 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> 2018-08-28 7:53 GMT+02:00 Nick Winters <nick@wintersteam.org>:
> > Often when I use an sstate cache from another build, I run into problems
> > where builds fail. Usually the failure is a result of not being able to
> find
> > a shared library. If I delete the sstate cache, the build succeeds,
> although
> > it is 8 hours later. I switched to using sstate mirrors and had similar
> > problems.
>
> If you provide an example of a specific failure, we might be better
> able to help you.
>
> It's fine to use one global sstate cache for absolutely everything.
> You can share between builds, target machines and distros.
>
> Alex
>

--0000000000004f9cdb0574827cea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your response Alex.<div><br></div><div>Below is=
 an excerpt of one failure I&#39;ve encountered. When attempting to do_root=
fs, the following error occurs:</div><div><br></div><div><div>error while l=
oading shared libraries: libopkg.so.1: cannot open shared object file: No s=
uch file or directory</div><div><br></div>Below is more detail:<br class=3D=
"inbox-inbox-Apple-interchange-newline"><br><div>NOTE: recipe core-image-bi=
amp-linux-ppc-1.0-r0: task do_rootfs: Started</div><div>ERROR: Unable to up=
date the package index files. Command &#39;/var/lib/jenkins/workspace/Singl=
eNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/sysroot=
s/x86_64-linux/usr/bin/opkg-cl -f /var/lib/jenkins/workspace/SingleNetworkC=
onnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/work/mpc83xx-pok=
y-linux/core-image-biamp-linux-ppc/1.0-r0/opkg.conf -o /var/lib/jenkins/wor=
kspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc=
/tmp/work/mpc83xx-poky-linux/core-image-biamp-linux-ppc/1.0-r0/rootfs --for=
ce_postinstall --prefer-arch-to-version=C2=A0 --add-exclude linux-dummy --a=
dd-exclude opkg --add-exclude dbus --add-exclude gdbm --force-overwrite upd=
ate&#39; returned 127:</div><div>/var/lib/jenkins/workspace/SingleNetworkCo=
nnectionPipeline/repos/poky/ppc/build-biamp-linux-ppc/tmp/sysroots/x86_64-l=
inux/usr/bin/opkg-cl: error while loading shared libraries: libopkg.so.1: c=
annot open shared object file: No such file or directory</div><div>ERROR: F=
unction failed: do_rootfs<br></div><div>ERROR: Logfile of failure stored in=
: /var/lib/jenkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc=
/build-biamp-linux-ppc/tmp/work/mpc83xx-poky-linux/core-image-biamp-linux-p=
pc/1.0-r0/temp/log.do_rootfs.4871</div><div>NOTE: recipe core-image-biamp-l=
inux-ppc-1.0-r0: task do_rootfs: Failed</div><div>ERROR: Task 7 (/var/lib/j=
enkins/workspace/SingleNetworkConnectionPipeline/repos/poky/ppc/build-biamp=
-linux-ppc/../meta-biamp/recipes-ppc/images/<a href=3D"http://core-image-bi=
amp-linux-ppc.bb">core-image-biamp-linux-ppc.bb</a>, do_rootfs) failed with=
 exit code &#39;1&#39;</div><div><br></div><div>When I execute ldd on opkg-=
cl, I get the following:</div><div><span style=3D"white-space:pre">	</span>=
linux-vdso.so.1 (0x00007ffda9bd8000)</div><div><span style=3D"white-space:p=
re">	</span>libopkg.so.1 =3D&gt; not found</div><div><span style=3D"white-s=
pace:pre">	</span>libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.so.6 (0x0000=
7f72dbac3000)</div><div><span style=3D"white-space:pre">	</span>/lib64/ld-l=
inux-x86-64.so.2 (0x00007f72dc067000)</div><div><br></div><div>Looking insi=
de the tmp/sysroots directory, I can find libopkg.so.1. It appears as thoug=
h opkg-cl was built to look for the shared library in the host path rather =
than the tmp/sysroots path.</div><div><br></div><div>My guess is that this =
is something other than an sstate-cache problem but when I clear the sstate=
-cache, everything builds fine.=C2=A0</div><div><br></div><div>Nick</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Aug 28, 2018 at 12:10=
 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">2018-08-28 7:53 GMT+02:00 Nick Winters &lt;<a href=3D"mailto=
:nick@wintersteam.org" target=3D"_blank">nick@wintersteam.org</a>&gt;:<br>
&gt; Often when I use an sstate cache from another build, I run into proble=
ms<br>
&gt; where builds fail. Usually the failure is a result of not being able t=
o find<br>
&gt; a shared library. If I delete the sstate cache, the build succeeds, al=
though<br>
&gt; it is 8 hours later. I switched to using sstate mirrors and had simila=
r<br>
&gt; problems.<br>
<br>
If you provide an example of a specific failure, we might be better<br>
able to help you.<br>
<br>
It&#39;s fine to use one global sstate cache for absolutely everything.<br>
You can share between builds, target machines and distros.<br>
<br>
Alex<br>
</blockquote></div></div></div>

--0000000000004f9cdb0574827cea--
