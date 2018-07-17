Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id C9CA878984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 15:22:45 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 13-v6so2774662ois.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J2TxPmyvKrdvjMZX/NecyewNkCvkPp5UBpwOFr0YXMc=;
	b=SYAUK3xc7M/c2xn4fYljz9ZVjSjeuGmo2C0sl4V464YEb5hOtr7pX2X74LtPVHy8hc
	Qz6FETlW+WMT+FmGIHjEqZmFzkbnyspu7JZpABfOxHqFK0OtStVkmAYlF8L+ktToMS7X
	LXhs4upT6EO0bPKq4zVYsP8E+lvh63xmuqbkgAhweshob4BIHvTeIKhTIlBWLGPEWHdD
	F131mF23/iVM8UsmgF4iY41Aw9DU0QRpyt+7qm1KG2F5uRwgRjuheLAu8o0ZEHzq4bVH
	5xEJB4JeTaX6P7aBqS+Xl1Zw9DaSvFtFC91VRPCw6J3aQ7xtH2sQKZa3ZOQWfkOZ8zbH
	cDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J2TxPmyvKrdvjMZX/NecyewNkCvkPp5UBpwOFr0YXMc=;
	b=LcyrD/HrVpVi9TImnh5eAjG8Q6AmUBP46bKMCnrpYU6fldulxF1iXPC5LV1rmuFHbO
	EDaoC6brFFW0PENytW8Cl6t2NNDHzQD7fvL645SYFF7+tJWcy1e7Z0xi7DZ70z4r30ts
	hM0sGF3Um7rrDcv2O8/d5ZILSln5JQeSPx9fCWfaU2qKjObdLBGHh/4ZSkfIsMBybWgS
	5Un34Si6NMPd6gu6rT+uqllS9Je2GOUWejvATjjx7bGptuxregfmmfMHPvj+7tr16efQ
	DU5/y52qXOhYQkY42CXauwtNaA2y1f9bt9ZvzTIbS2+NLo3s3Z/Qg/4S/jynbw/5PlhB
	z53Q==
X-Gm-Message-State: AOUpUlE8eauQLCBalJsLZzqL1LgGiNFVcQcDdcX0VE1R4FNoc3hJDryy
	uN2+q0Yi4AmWApYgZCDRDR51tiMsuZpQZfR3Zew=
X-Google-Smtp-Source: AAOMgpevFStt2bEcG6TKGn7AXxHTdt6Y8jfB3aBTbEBgIkIjD4+HpdMaBDlB7KtTDpBcmrIwJmjSQuC/JYpfNfLLyuE=
X-Received: by 2002:aca:a69b:: with SMTP id
	t27-v6mr2271465oij.261.1531840966609; 
	Tue, 17 Jul 2018 08:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <1511349605-22464-1-git-send-email-rbilovol@cisco.com>
	<6fc7ed17-7619-15b8-fc7e-5fdab594fcbf@cisco.com>
In-Reply-To: <6fc7ed17-7619-15b8-fc7e-5fdab594fcbf@cisco.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 17 Jul 2018 08:22:34 -0700
Message-ID: <CABcZANkLbfW8XcynJmjzWFnzxT_fkxkCqA3OAUDtfqFo-_r95g@mail.gmail.com>
To: rbilovol@cisco.com
Cc: gtertych@cisco.com, xe-linux-external@cisco.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] relocate_sdk.py: remove hardcoded SDK path
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
X-List-Received-Date: Tue, 17 Jul 2018 15:22:46 -0000
Content-Type: multipart/alternative; boundary="000000000000aad1dd0571338469"

--000000000000aad1dd0571338469
Content-Type: text/plain; charset="UTF-8"

IMHO this is a solid improvement that should go in.

On Tue, Jul 17, 2018 at 8:09 AM Ruslan Bilovol via Openembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Hi all,
>
> Any comments on this patch?
>
> Thanks
> Ruslan
>
> On 11/22/2017 01:20 PM, Ruslan Bilovol wrote:
> > This patch removes hardcodes added to relocate_sdk.py
> > during SDK build, making it flexible and reusable.
> > Now default SDK path is passed to the script as
> > parameter rather then harcoded inside it.
> >
> > This allows to reuse this script for multiple
> > relocations, and adds possibility to relocate
> > SDK multiple times
> >
> > Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> > ---
> >   meta/classes/populate_sdk_base.bbclass |  5 -----
> >   meta/files/toolchain-shar-relocate.sh  |  2 +-
> >   scripts/relocate_sdk.py                | 17 +++++++++--------
> >   3 files changed, 10 insertions(+), 14 deletions(-)
> >
> > diff --git a/meta/classes/populate_sdk_base.bbclass
> b/meta/classes/populate_sdk_base.bbclass
> > index 424c63c..e7aa5a8 100644
> > --- a/meta/classes/populate_sdk_base.bbclass
> > +++ b/meta/classes/populate_sdk_base.bbclass
> > @@ -152,11 +152,6 @@ do_populate_sdk[stamp-extra-info] =
> "${MACHINE}${SDKMACHINE}"
> >
> >   fakeroot create_sdk_files() {
> >       cp ${COREBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
> > -
> > -     # Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
> > -     # Escape special characters like '+' and '.' in the SDKPATH
> > -     escaped_sdkpath=$(echo ${SDKPATH} |sed -e "s:[\+\.]:\\\\\\\\\0:g")
> > -     sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:"
> ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
> >   }
> >
> >   python check_sdk_sysroots() {
> > diff --git a/meta/files/toolchain-shar-relocate.sh
> b/meta/files/toolchain-shar-relocate.sh
> > index e3c1001..f82ff2b 100644
> > --- a/meta/files/toolchain-shar-relocate.sh
> > +++ b/meta/files/toolchain-shar-relocate.sh
> > @@ -36,7 +36,7 @@ if [ x\${PYTHON} = "x"  ]; then
> >       echo "SDK could not be relocated.  No python found."
> >       exit 1
> >   fi
> > -\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir
> $dl_path $executable_files
> > +\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $DEFAULT_INSTALL_DIR
> $target_sdk_dir $dl_path $executable_files
> >   EOF
> >
> >   $SUDO_EXEC mv $tdir/relocate_sdk.sh
> ${env_setup_script%/*}/relocate_sdk.sh
> > diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py
> > index c752fa2..0d5a6f5 100755
> > --- a/scripts/relocate_sdk.py
> > +++ b/scripts/relocate_sdk.py
> > @@ -38,8 +38,6 @@ else:
> >       def b(x):
> >           return x.encode(sys.getfilesystemencoding())
> >
> > -old_prefix = re.compile(b("##DEFAULT_INSTALL_DIR##"))
> > -
> >   def get_arch():
> >       f.seek(0)
> >       e_ident =f.read(16)
> > @@ -212,19 +210,22 @@ def change_dl_sysdirs(elf_file_name):
> >           f.write(sysdirslen)
> >
> >   # MAIN
> > -if len(sys.argv) < 4:
> > +if len(sys.argv) < 5:
> >       sys.exit(-1)
> >
> >   # In python > 3, strings may also contain Unicode characters. So,
> convert
> >   # them to bytes
> >   if sys.version_info < (3,):
> > -    new_prefix = sys.argv[1]
> > -    new_dl_path = sys.argv[2]
> > +    new_prefix = sys.argv[2]
> > +    new_dl_path = sys.argv[3]
> >   else:
> > -    new_prefix = sys.argv[1].encode()
> > -    new_dl_path = sys.argv[2].encode()
> > +    new_prefix = sys.argv[2].encode()
> > +    new_dl_path = sys.argv[3].encode()
> > +
> > +executables_list = sys.argv[4:]
> >
> > -executables_list = sys.argv[3:]
> > +old_prefix_ne = b(sys.argv[1])
> > +old_prefix = re.compile(re.escape(old_prefix_ne));
> >
> >   for e in executables_list:
> >       perms = os.stat(e)[stat.ST_MODE]
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000aad1dd0571338469
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">IMHO this is a solid improvement that should go in.<br></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Jul 17, 2018 at =
8:09 AM Ruslan Bilovol via Openembedded-core &lt;<a href=3D"mailto:openembe=
dded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi all,<br>
<br>
Any comments on this patch?<br>
<br>
Thanks<br>
Ruslan<br>
<br>
On 11/22/2017 01:20 PM, Ruslan Bilovol wrote:<br>
&gt; This patch removes hardcodes added to relocate_sdk.py<br>
&gt; during SDK build, making it flexible and reusable.<br>
&gt; Now default SDK path is passed to the script as<br>
&gt; parameter rather then harcoded inside it.<br>
&gt; <br>
&gt; This allows to reuse this script for multiple<br>
&gt; relocations, and adds possibility to relocate<br>
&gt; SDK multiple times<br>
&gt; <br>
&gt; Signed-off-by: Ruslan Bilovol &lt;<a href=3D"mailto:rbilovol@cisco.com=
" target=3D"_blank">rbilovol@cisco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/populate_sdk_base.bbclass |=C2=A0 5 -----<br>
&gt;=C2=A0 =C2=A0meta/files/toolchain-shar-relocate.sh=C2=A0 |=C2=A0 2 +-<b=
r>
&gt;=C2=A0 =C2=A0scripts/relocate_sdk.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 17 +++++++++--------<br>
&gt;=C2=A0 =C2=A03 files changed, 10 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/pop=
ulate_sdk_base.bbclass<br>
&gt; index 424c63c..e7aa5a8 100644<br>
&gt; --- a/meta/classes/populate_sdk_base.bbclass<br>
&gt; +++ b/meta/classes/populate_sdk_base.bbclass<br>
&gt; @@ -152,11 +152,6 @@ do_populate_sdk[stamp-extra-info] =3D &quot;${MAC=
HINE}${SDKMACHINE}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0fakeroot create_sdk_files() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${COREBASE}/scripts/relocate_sdk.py ${SDK=
_OUTPUT}/${SDKPATH}/<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Replace the ##DEFAULT_INSTALL_DIR## with the co=
rrect pattern.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0# Escape special characters like &#39;+&#39; and =
&#39;.&#39; in the SDKPATH<br>
&gt; -=C2=A0 =C2=A0 =C2=A0escaped_sdkpath=3D$(echo ${SDKPATH} |sed -e &quot=
;s:[\+\.]:\\\\\\\\\0:g&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s:##DEFAULT_INSTALL_DIR##:$escape=
d_sdkpath:&quot; ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0python check_sdk_sysroots() {<br>
&gt; diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolch=
ain-shar-relocate.sh<br>
&gt; index e3c1001..f82ff2b 100644<br>
&gt; --- a/meta/files/toolchain-shar-relocate.sh<br>
&gt; +++ b/meta/files/toolchain-shar-relocate.sh<br>
&gt; @@ -36,7 +36,7 @@ if [ x\${PYTHON} =3D &quot;x&quot;=C2=A0 ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;SDK could not be relocated.=C2=A0=
 No python found.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt; -\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $target_sdk_dir $dl=
_path $executable_files<br>
&gt; +\${PYTHON} ${env_setup_script%/*}/relocate_sdk.py $DEFAULT_INSTALL_DI=
R $target_sdk_dir $dl_path $executable_files<br>
&gt;=C2=A0 =C2=A0EOF<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0$SUDO_EXEC mv $tdir/relocate_sdk.sh ${env_setup_script%/*}=
/relocate_sdk.sh<br>
&gt; diff --git a/scripts/relocate_sdk.py b/scripts/relocate_sdk.py<br>
&gt; index c752fa2..0d5a6f5 100755<br>
&gt; --- a/scripts/relocate_sdk.py<br>
&gt; +++ b/scripts/relocate_sdk.py<br>
&gt; @@ -38,8 +38,6 @@ else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def b(x):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return x.encode(sys.getfilesys=
temencoding())<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -old_prefix =3D re.compile(b(&quot;##DEFAULT_INSTALL_DIR##&quot;))<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0def get_arch():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0f.seek(0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0e_ident =3Df.read(16)<br>
&gt; @@ -212,19 +210,22 @@ def change_dl_sysdirs(elf_file_name):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(sysdirslen)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# MAIN<br>
&gt; -if len(sys.argv) &lt; 4:<br>
&gt; +if len(sys.argv) &lt; 5:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sys.exit(-1)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# In python &gt; 3, strings may also contain Unicode chara=
cters. So, convert<br>
&gt;=C2=A0 =C2=A0# them to bytes<br>
&gt;=C2=A0 =C2=A0if sys.version_info &lt; (3,):<br>
&gt; -=C2=A0 =C2=A0 new_prefix =3D sys.argv[1]<br>
&gt; -=C2=A0 =C2=A0 new_dl_path =3D sys.argv[2]<br>
&gt; +=C2=A0 =C2=A0 new_prefix =3D sys.argv[2]<br>
&gt; +=C2=A0 =C2=A0 new_dl_path =3D sys.argv[3]<br>
&gt;=C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 new_prefix =3D sys.argv[1].encode()<br>
&gt; -=C2=A0 =C2=A0 new_dl_path =3D sys.argv[2].encode()<br>
&gt; +=C2=A0 =C2=A0 new_prefix =3D sys.argv[2].encode()<br>
&gt; +=C2=A0 =C2=A0 new_dl_path =3D sys.argv[3].encode()<br>
&gt; +<br>
&gt; +executables_list =3D sys.argv[4:]<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -executables_list =3D sys.argv[3:]<br>
&gt; +old_prefix_ne =3D b(sys.argv[1])<br>
&gt; +old_prefix =3D re.compile(re.escape(old_prefix_ne));<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0for e in executables_list:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0perms =3D os.stat(e)[stat.ST_MODE]<br>
&gt; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graph=
ics</div></div></div></div>

--000000000000aad1dd0571338469--
