Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7E021607A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 11:16:17 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id o68so145780991qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 04:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4XVEoQxb6wrLXprL60hQeOkwQFnBbD+2AbO9CdTEUFM=;
	b=rb0HNWYIdqYHOg0024JrqYeBQkwaRsTIA9vzZhVXZ4ERUHz85c69/GTdOE8I/AVvwI
	CeHgeZTJchHhcsWsG8EfWH/zu5SOt4BXRW/QAqQ1FuK6LAWZOgB16k/CcR1jjjEOuTSU
	22AcNF81sJzvhv3qVbRD4UQ1O7rKZsvu/qSSbVzsl70RkJRMKvURF2PXzl5CI1ubX6Jl
	OB3P0AIX8cDgxKF+7rKrhffagOjhmD24/3nntjvd0IxeR5JyWBSvwJ3mhHVP2YiswSaU
	x83qfnOKPxqZQRqQgQVBvxR40rWhe98qyda0+8maKg3QfZkICbg3XFoHG9a77Svp5zXi
	O3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4XVEoQxb6wrLXprL60hQeOkwQFnBbD+2AbO9CdTEUFM=;
	b=D5VgJJkzsGVB0jTHxllzykLQa+zzrLaf/IeJcCvVB8bzUgR5boJmKRvn+92u9MHXCQ
	Zbsibhuex87PxNFeecnLo+XGD2tLcsdljYBzbMOJRP/dpFBWs9kJUlOKnApfUCACdua+
	3RpIeRNuZQOmlfkO88EQRE1AKNYdkOQ4d6MYRMkovnPK/YIn6J1tKUIqh+PGya1QPtOu
	20Q51GYHU7+9yHlr0s4JsgWa1C8GQxKiWcTTZoAo9PiViftY5ZMu1E7yanTqsVqwaRoh
	BWGNeR/afOHk79c0R/RlCGOvOgw4eEB3Gi2r5YwQiuScWU+G4JvmC5+Eg8jOn6OEJ+Gn
	ZSlw==
X-Gm-Message-State: ABUngvd+4DlYQC+3GRiDA0xR6OJSRAAl/X7secbvMf+jm1hVwxz1Ej4penAXVHac62Eg6WgH4ZWWwlIr75vo72/T
X-Received: by 10.55.156.22 with SMTP id f22mr478409qke.36.1477048579222; Fri,
	21 Oct 2016 04:16:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 21 Oct 2016 04:15:58 -0700 (PDT)
In-Reply-To: <b28525b5cea46a4eedd12f8c1fc29c08eaf4f074.1476716907.git.alexander.kanavin@linux.intel.com>
References: <cover.1476716907.git.alexander.kanavin@linux.intel.com>
	<b28525b5cea46a4eedd12f8c1fc29c08eaf4f074.1476716907.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Oct 2016 12:15:58 +0100
Message-ID: <CAJTo0LaxkVj4eM4c=zWNHz+tv9WaQHJj=uxJnwgffwuNgWRjeQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/23] lttng: enable optional building of manpages
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
X-List-Received-Date: Fri, 21 Oct 2016 11:16:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c07680ee1a752053f5e2b43

--94eb2c07680ee1a752053f5e2b43
Content-Type: text/plain; charset=UTF-8

On 17 October 2016 at 16:12, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>  meta/recipes-kernel/lttng/lttng-tools_git.bb | 4 ++--
>

packages/corei7-64-poky-linux/lttng-tools/lttng-tools-dbg: RRECOMMENDS:
added "lttng-tools-ptest-dbg"
  * DEPENDS: added "asciidoc-native xmlto-native libxslt-native"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-dev: RRECOMMENDS:
added "lttng-tools-ptest-dev"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-doc: FILELIST: added
"/usr/share/man/man1/lttng-load.1 /usr/share/man/man1/lttng-untrack.1
/usr/share/man/man1/lttng.1 /usr/share/man/man1/lttng-stop.1
/usr/share/man/man1/lttng-set-session.1 /usr/share/man/man1/lttng-track.1
/usr/share/man/man8/lttng-relayd.8 /usr/share/man/man1/lttng-add-context.1
/usr/share/man/man1/lttng-version.1 /usr/share/man/man1/lttng-create.1
/usr/share/man/man1/lttng-save.1 /usr/share/man/man1/lttng-enable-channel.1
/usr/share/man/man1/lttng-disable-event.1
/usr/share/man/man1/lttng-snapshot.1
/usr/share/man/man1/lttng-enable-event.1
/usr/share/man/man8/lttng-sessiond.8 /usr/share/man/man1/lttng-status.1
/usr/share/man/man1/lttng-view.1 /usr/share/man/man1/lttng-destroy.1
/usr/share/man/man1/lttng-metadata.1
/usr/share/man/man1/lttng-disable-channel.1
/usr/share/man/man1/lttng-start.1 /usr/share/man/man1/lttng-crash.1
/usr/share/man/man1/lttng-help.1 /usr/share/man/man1/lttng-list.1
/usr/share/man/man1/lttng-calibrate.1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed
from 140958 to 398669 (+182%)
  * FILELIST: added "/usr/share/man/man1/lttng-load.1
/usr/share/man/man1/lttng-untrack.1 /usr/share/man/man1/lttng.1
/usr/share/man/man1/lttng-stop.1 /usr/share/man/man1/lttng-set-session.1
/usr/share/man/man1/lttng-track.1 /usr/share/man/man8/lttng-relayd.8
/usr/share/man/man1/lttng-add-context.1 /usr/share/man/man1/lttng-version.1
/usr/share/man/man1/lttng-create.1 /usr/share/man/man1/lttng-save.1
/usr/share/man/man1/lttng-enable-channel.1
/usr/share/man/man1/lttng-disable-event.1
/usr/share/man/man1/lttng-snapshot.1
/usr/share/man/man1/lttng-enable-event.1
/usr/share/man/man8/lttng-sessiond.8 /usr/share/man/man1/lttng-status.1
/usr/share/man/man1/lttng-view.1 /usr/share/man/man1/lttng-destroy.1
/usr/share/man/man1/lttng-metadata.1
/usr/share/man/man1/lttng-disable-channel.1
/usr/share/man/man1/lttng-start.1 /usr/share/man/man1/lttng-crash.1
/usr/share/man/man1/lttng-help.1 /usr/share/man/man1/lttng-list.1
/usr/share/man/man1/lttng-calibrate.1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-ptest: RDEPENDS:
removed "lttng-tools (['>= 2.8.1+git0+d11e0dba0d'])" added "lttng-tools"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST:
added "/usr/lib/lttng-tools/ptest/doc/man/lttng-stop.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-calibrate.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-status.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-set-session.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-sessiond.8
/usr/lib/lttng-tools/ptest/doc/man/lttng-disable-event.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-crash.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-load.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-enable-channel.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-save.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-destroy.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-track.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-list.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-version.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-help.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-untrack.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-start.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-snapshot.1
/usr/lib/lttng-tools/ptest/doc/man/lttng.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-enable-event.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-view.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-relayd.8
/usr/lib/lttng-tools/ptest/doc/man/lttng-disable-channel.1
/usr/lib/lttng-tools/ptest/include/config.h.in~
/usr/lib/lttng-tools/ptest/doc/man/lttng-add-context.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-metadata.1
/usr/lib/lttng-tools/ptest/doc/man/lttng-create.1"
packages/corei7-64-poky-linux/lttng-tools/lttng-tools: RDEPENDS: added
"lttng-tools-ptest (['>= 2.8.1+git0+d11e0dba0d'])"

Something went wrong here when doing the secondary install for the ptest
package. It installed duplicates of the man pages and nonsense such as
include/config.h.in~, and then the runtime dependency tree went crazy.

Ross

--94eb2c07680ee1a752053f5e2b43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 October 2016 at 16:12, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D"gmail-:c7" class=3D"gmail-a3s gmail-aXjCH gmail-m157d337e11e2628a">=C2=
=A0meta/recipes-kernel/<span class=3D"gmail-il">lttng</span>/<a href=3D"htt=
p://lttng-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">lttn<wbr>g-too=
ls_git.bb</a> | 4 ++--<br></div></blockquote></div><br><div class=3D"gmail_=
extra"><div class=3D"gmail_extra">packages/corei7-64-poky-linux/lttng-tools=
/lttng-tools-dbg: RRECOMMENDS: added &quot;lttng-tools-ptest-dbg&quot;</div=
><div class=3D"gmail_extra">=C2=A0 * DEPENDS: added &quot;asciidoc-native x=
mlto-native libxslt-native&quot;</div><div class=3D"gmail_extra">packages/c=
orei7-64-poky-linux/lttng-tools/lttng-tools-dev: RRECOMMENDS: added &quot;l=
ttng-tools-ptest-dev&quot;</div><div class=3D"gmail_extra">packages/corei7-=
64-poky-linux/lttng-tools/lttng-tools-doc: FILELIST: added &quot;/usr/share=
/man/man1/lttng-load.1 /usr/share/man/man1/lttng-untrack.1 /usr/share/man/m=
an1/lttng.1 /usr/share/man/man1/lttng-stop.1 /usr/share/man/man1/lttng-set-=
session.1 /usr/share/man/man1/lttng-track.1 /usr/share/man/man8/lttng-relay=
d.8 /usr/share/man/man1/lttng-add-context.1 /usr/share/man/man1/lttng-versi=
on.1 /usr/share/man/man1/lttng-create.1 /usr/share/man/man1/lttng-save.1 /u=
sr/share/man/man1/lttng-enable-channel.1 /usr/share/man/man1/lttng-disable-=
event.1 /usr/share/man/man1/lttng-snapshot.1 /usr/share/man/man1/lttng-enab=
le-event.1 /usr/share/man/man8/lttng-sessiond.8 /usr/share/man/man1/lttng-s=
tatus.1 /usr/share/man/man1/lttng-view.1 /usr/share/man/man1/lttng-destroy.=
1 /usr/share/man/man1/lttng-metadata.1 /usr/share/man/man1/lttng-disable-ch=
annel.1 /usr/share/man/man1/lttng-start.1 /usr/share/man/man1/lttng-crash.1=
 /usr/share/man/man1/lttng-help.1 /usr/share/man/man1/lttng-list.1 /usr/sha=
re/man/man1/lttng-calibrate.1&quot;<br></div><div class=3D"gmail_extra">pac=
kages/corei7-64-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed fro=
m 140958 to 398669 (+182%)</div><div class=3D"gmail_extra">=C2=A0 * FILELIS=
T: added &quot;/usr/share/man/man1/lttng-load.1 /usr/share/man/man1/lttng-u=
ntrack.1 /usr/share/man/man1/lttng.1 /usr/share/man/man1/lttng-stop.1 /usr/=
share/man/man1/lttng-set-session.1 /usr/share/man/man1/lttng-track.1 /usr/s=
hare/man/man8/lttng-relayd.8 /usr/share/man/man1/lttng-add-context.1 /usr/s=
hare/man/man1/lttng-version.1 /usr/share/man/man1/lttng-create.1 /usr/share=
/man/man1/lttng-save.1 /usr/share/man/man1/lttng-enable-channel.1 /usr/shar=
e/man/man1/lttng-disable-event.1 /usr/share/man/man1/lttng-snapshot.1 /usr/=
share/man/man1/lttng-enable-event.1 /usr/share/man/man8/lttng-sessiond.8 /u=
sr/share/man/man1/lttng-status.1 /usr/share/man/man1/lttng-view.1 /usr/shar=
e/man/man1/lttng-destroy.1 /usr/share/man/man1/lttng-metadata.1 /usr/share/=
man/man1/lttng-disable-channel.1 /usr/share/man/man1/lttng-start.1 /usr/sha=
re/man/man1/lttng-crash.1 /usr/share/man/man1/lttng-help.1 /usr/share/man/m=
an1/lttng-list.1 /usr/share/man/man1/lttng-calibrate.1&quot;</div><div clas=
s=3D"gmail_extra">packages/corei7-64-poky-linux/lttng-tools/lttng-tools-pte=
st: RDEPENDS: removed &quot;lttng-tools ([&#39;&gt;=3D 2.8.1+git0+d11e0dba0=
d&#39;])&quot; added &quot;lttng-tools&quot;</div><div class=3D"gmail_extra=
">packages/corei7-64-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: ad=
ded &quot;/usr/lib/lttng-tools/ptest/doc/man/lttng-stop.1 /usr/lib/lttng-to=
ols/ptest/doc/man/lttng-calibrate.1 /usr/lib/lttng-tools/ptest/doc/man/lttn=
g-status.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-set-session.1 /usr/lib/=
lttng-tools/ptest/doc/man/lttng-sessiond.8 /usr/lib/lttng-tools/ptest/doc/m=
an/lttng-disable-event.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-crash.1 /=
usr/lib/lttng-tools/ptest/doc/man/lttng-load.1 /usr/lib/lttng-tools/ptest/d=
oc/man/lttng-enable-channel.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-save=
.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-destroy.1 /usr/lib/lttng-tools/=
ptest/doc/man/lttng-track.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-list.1=
 /usr/lib/lttng-tools/ptest/doc/man/lttng-version.1 /usr/lib/lttng-tools/pt=
est/doc/man/lttng-help.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-untrack.1=
 /usr/lib/lttng-tools/ptest/doc/man/lttng-start.1 /usr/lib/lttng-tools/ptes=
t/doc/man/lttng-snapshot.1 /usr/lib/lttng-tools/ptest/doc/man/lttng.1 /usr/=
lib/lttng-tools/ptest/doc/man/lttng-enable-event.1 /usr/lib/lttng-tools/pte=
st/doc/man/lttng-view.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-relayd.8 /=
usr/lib/lttng-tools/ptest/doc/man/lttng-disable-channel.1 /usr/lib/lttng-to=
ols/ptest/include/<a href=3D"http://config.h.in">config.h.in</a>~ /usr/lib/=
lttng-tools/ptest/doc/man/lttng-add-context.1 /usr/lib/lttng-tools/ptest/do=
c/man/lttng-metadata.1 /usr/lib/lttng-tools/ptest/doc/man/lttng-create.1&qu=
ot;<br></div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/lttng=
-tools/lttng-tools: RDEPENDS: added &quot;lttng-tools-ptest ([&#39;&gt;=3D =
2.8.1+git0+d11e0dba0d&#39;])&quot;</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Something went wrong here when doing the secon=
dary install for the ptest package. It installed duplicates of the man page=
s and nonsense such as include/<a href=3D"http://config.h.in">config.h.in</=
a>~, and then the runtime dependency tree went crazy.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div></div=
>

--94eb2c07680ee1a752053f5e2b43--
