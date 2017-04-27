Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 545B76AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 20:47:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z129so7141703wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 13:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zbsQGlvszjEo1q6OnPw9OJ9HupiPLaH8FXvMtziCzVY=;
	b=UfwhkPypGjyZP+uo88chgTX6SrwO5CE6p0QRMGY6+0djiE3lTdNQoIOoFnl9l6pepB
	mp0KDdoKJK1byeWEmpL7zcvPKjRS/rr7Oy4QdHkUWrC39GFE756MqMYvDLx0jFiNrlAC
	N/Ii7Gm54meX+gO73/1XuwfXcI77IgG5xnsYhKtXdvhQN9J5OL/kk6qOJu6TYua2Xxqf
	tx0vtCXvqMufMC32hRlMfSf38rusOyMSIEv31329co0ihwxfmzqzCDeP2Bii2grOvKnm
	Ck83vlZdlJxIY7VeEKi6rI+9SuR5Jrb8vw5LEFZYN8+FNyRaZdqH5yACqK8iDaNW0KUq
	2sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zbsQGlvszjEo1q6OnPw9OJ9HupiPLaH8FXvMtziCzVY=;
	b=MbMfMZ8MDK/v+E0H9dXkI+LHMHyMkiziZpCkt8IaMs6g0ESaYLc8692hRVAWZROtG8
	WYQp3IX3DXJrP4oKkEqXKKhUdgVb/7ydiaMA/yiOqCT2PCb+fMoWknydKXoItXZm+pqg
	EiwY5TP7upc98bTkuZdWfMI8p6AVZK3eWdJf7ltcPj7rgWkYPk6FrD5gOf9Hk5U5hV+3
	3YJGjDFjpAn9wrONjc9q/MQQu5FspSwHhlMABsfoPblnXMYIuNX9wtHgSG9kF7NDzaUT
	WjLuotryixIalE90geN2txx8HJzwzJ2L2FbzrlxvziqD51Wr8i5Cnxd5RncJ9ADfCITC
	KmFQ==
X-Gm-Message-State: AN3rC/7PDTtQXZjuzq8Scqtops7DiiS3Rxc2Vz5QEgkZ4QBlGuIJMaw5
	CRs96TeQQUmLciCX3Jw4a5yyfnPkYg==
X-Received: by 10.80.149.203 with SMTP id x11mr6014034eda.181.1493326022955;
	Thu, 27 Apr 2017 13:47:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Thu, 27 Apr 2017 13:47:02 -0700 (PDT)
In-Reply-To: <1489150711-1608-3-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489150711-1608-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1489150711-1608-3-git-send-email-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 27 Apr 2017 22:47:02 +0200
Message-ID: <CA+chaQck0sU7Bcz5Hnr_34=PGsx4ngyQO+5w3dEu+xMm=G48BQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] runqemu-gen-tapdevs: Improve help text with an example
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
X-List-Received-Date: Thu, 27 Apr 2017 20:47:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c0e4b6621d7db054e2c0fd6

--94eb2c0e4b6621d7db054e2c0fd6
Content-Type: text/plain; charset=UTF-8

FWIW: I've tried to use runqemu for first time (using my own scripts until
now).

And this example doesn't work for me, the tunctl binary is here:

OE @ /OE/openembedded-core # find
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/sysroot-providers
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/sysroot-providers/qemu-helper-native
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin/tunctl

But the script still complains that it cannot find tunctl:

OE @ /OE/openembedded-core # ./scripts/runqemu-gen-tapdevs 1026 1026 4
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/
Note: Destroying pre-existing tap interface tap0...
TUNSETIFF: Device or resource busy
Creating 4 tap devices for UID: 1026 GID: 1026...
Creating tap0
Error running tunctl: Error: Unable to find tunctl binary in
'/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/',
please bitbake qemu-helper-native

The message is actually from runqemu-ifup, which is called from
runqemu-gen-tapdevs as:
++ ./scripts/runqemu-ifup 1026 1026
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/

But runqemu-ifup expects 3rd parameter to be STAGING_BINDIR_NATIVE directly
not just SYSROOT dir
STAGING_BINDIR_NATIVE=$3
because tunctl is then used as:
TUNCTL=$STAGING_BINDIR_NATIVE/tunctl

It looks like it got broken by:
commit cc5513bf7a6114e14bb307acb88a44e9cf0aed8a
Author: Ed Bartosh <ed.bartosh@linux.intel.com>
Date:   Wed Apr 12 23:40:59 2017 +0300

    runqemu: use bindir_native property to run ifup/down scripts

    Used self.bindir_native to point out to the native sysroot
    when running runqemu-ifup and runqemu-ifdown scripts.

    [YOCTO #11266]
    [YOCTO #11193]

    Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Seemingly obvious fix would be to call runqemu-gen-tapdevs with path to
STAGING_BINDIR_NATIVE in 4th parameter as well, but that won't work,
because runqemu-gen-tapdevs checks for TUNCTL=$SYSROOT/usr/bin/tunctl

OE @ /OE/openembedded-core # ./scripts/runqemu-gen-tapdevs 1026 1026 4
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin/
Error:
/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin//usr/bin/tunctl
is not an executable

I'm sending a fix for this, but as I said it's first time I've tried to use
this, so maybe this all was supposed to work somehow differently - or it
isn't tested at all as it is now.

Regards,

On Fri, Mar 10, 2017 at 1:58 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Figuring how the correct commandline isn't trivial, improve the help
> text with RSS in mind.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/runqemu-gen-tapdevs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
> index bfb60f4..9e5e5b9 100755
> --- a/scripts/runqemu-gen-tapdevs
> +++ b/scripts/runqemu-gen-tapdevs
> @@ -28,6 +28,8 @@ usage() {
>         echo "Where <gid> is the numeric group id the tap devices will be
> owned by"
>         echo "<num> is the number of tap devices to create (0 to remove
> all)"
>         echo "<native-sysroot-basedir> is the path to the build system's
> native sysroot"
> +       echo "e.g. $ bitbake qemu-helper-native -c addto_recipe_sysroot"
> +       echo "$ sudo $0 1000 1000 4 tmp/work/x86_64-linux/qemu-
> helper-native/*/recipe-sysroot-native/"
>         exit 1
>  }
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0e4b6621d7db054e2c0fd6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I&#39;ve tried to use runqemu for first time (using =
my own scripts until now).<div><br></div><div>And this example doesn&#39;t =
work for me, the tunctl binary is here:</div><div><br><div><div>OE @ /OE/op=
enembedded-core # find /OE/build/oe-core/tmp-glibc/sysroots-components/x86_=
64/qemu-helper-native/</div><div>/OE/build/oe-core/tmp-glibc/sysroots-compo=
nents/x86_64/qemu-helper-native/</div><div>/OE/build/oe-core/tmp-glibc/sysr=
oots-components/x86_64/qemu-helper-native/sysroot-providers</div><div>/OE/b=
uild/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/sysroo=
t-providers/qemu-helper-native</div><div>/OE/build/oe-core/tmp-glibc/sysroo=
ts-components/x86_64/qemu-helper-native/usr</div><div>/OE/build/oe-core/tmp=
-glibc/sysroots-components/x86_64/qemu-helper-native/usr/bin</div><div>/OE/=
build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/usr/b=
in/tunctl</div></div><div><br></div><div>But the script still complains tha=
t it cannot find tunctl:</div><div><br></div><div><div>OE @ /OE/openembedde=
d-core # ./scripts/runqemu-gen-tapdevs 1026 1026 4 /OE/build/oe-core/tmp-gl=
ibc/sysroots-components/x86_64/qemu-helper-native/</div><div>Note: Destroyi=
ng pre-existing tap interface tap0...</div><div>TUNSETIFF: Device or resour=
ce busy</div><div>Creating 4 tap devices for UID: 1026 GID: 1026...</div><d=
iv>Creating tap0</div><div>Error running tunctl: Error: Unable to find tunc=
tl binary in &#39;/OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qe=
mu-helper-native/&#39;, please bitbake qemu-helper-native</div></div></div>=
<div><br></div><div>The message is actually from runqemu-ifup, which is cal=
led from runqemu-gen-tapdevs as:</div><div>++ ./scripts/runqemu-ifup 1026 1=
026 /OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-nati=
ve/<br></div><div><br></div><div>But runqemu-ifup expects 3rd parameter to =
be STAGING_BINDIR_NATIVE directly not just SYSROOT dir</div><div>STAGING_BI=
NDIR_NATIVE=3D$3<br></div><div>because tunctl is then used as:</div><div>TU=
NCTL=3D$STAGING_BINDIR_NATIVE/tunctl<br></div><div><br></div><div>It looks =
like it got broken by:</div><div><div>commit cc5513bf7a6114e14bb307acb88a44=
e9cf0aed8a</div><div>Author: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@li=
nux.intel.com">ed.bartosh@linux.intel.com</a>&gt;</div><div>Date: =C2=A0 We=
d Apr 12 23:40:59 2017 +0300</div><div><br></div><div>=C2=A0 =C2=A0 runqemu=
: use bindir_native property to run ifup/down scripts</div><div>=C2=A0 =C2=
=A0=C2=A0</div><div>=C2=A0 =C2=A0 Used self.bindir_native to point out to t=
he native sysroot</div><div>=C2=A0 =C2=A0 when running runqemu-ifup and run=
qemu-ifdown scripts.</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 =
[YOCTO #11266]</div><div>=C2=A0 =C2=A0 [YOCTO #11193]</div><div>=C2=A0 =C2=
=A0=C2=A0</div><div>=C2=A0 =C2=A0 Signed-off-by: Ed Bartosh &lt;<a href=3D"=
mailto:ed.bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;</div>=
<div>=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<=
/div></div><div><br></div><div>Seemingly obvious fix would be to call runqe=
mu-gen-tapdevs with path to STAGING_BINDIR_NATIVE in 4th parameter as well,=
 but that won&#39;t work, because runqemu-gen-tapdevs checks for TUNCTL=3D$=
SYSROOT/usr/bin/tunctl</div><div><br></div><div><div>OE @ /OE/openembedded-=
core # ./scripts/runqemu-gen-tapdevs 1026 1026 4 /OE/build/oe-core/tmp-glib=
c/sysroots-components/x86_64/qemu-helper-native/usr/bin/</div><div>Error: /=
OE/build/oe-core/tmp-glibc/sysroots-components/x86_64/qemu-helper-native/us=
r/bin//usr/bin/tunctl is not an executable</div></div><div><br></div><div>I=
&#39;m sending a fix for this, but as I said it&#39;s first time I&#39;ve t=
ried to use this, so maybe this all was supposed to work somehow differentl=
y - or it isn&#39;t tested at all as it is now.</div><div><br></div><div>Re=
gards,</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Fri, Mar 10, 2017 at 1:58 PM, Richard Purdie <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Figuring how the correct commandline isn&#39;t trivial, improve th=
e help<br>
text with RSS in mind.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu-gen-tapdevs | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs<br>
index bfb60f4..9e5e5b9 100755<br>
--- a/scripts/runqemu-gen-tapdevs<br>
+++ b/scripts/runqemu-gen-tapdevs<br>
@@ -28,6 +28,8 @@ usage() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Where &lt;gid&gt; is the numeric gro=
up id the tap devices will be owned by&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;&lt;num&gt; is the number of tap dev=
ices to create (0 to remove all)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;&lt;native-sysroot-basedir&gt; is th=
e path to the build system&#39;s native sysroot&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;e.g. $ bitbake qemu-helper-native -c=
 addto_recipe_sysroot&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;$ sudo $0 1000 1000 4 tmp/work/x86_6=
4-linux/qemu-<wbr>helper-native/*/recipe-<wbr>sysroot-native/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0e4b6621d7db054e2c0fd6--
