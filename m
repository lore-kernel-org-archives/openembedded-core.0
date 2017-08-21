Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id A3A73782E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 15:13:59 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id n29so23923232uai.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dMF4mIdczuK/G7D2gZXQRDmbzPeKPM67e9fAk5/o3Uw=;
	b=cji6PkzYo7KaG64eVAGVB9gYk1ehNcE4DFlpnELAURihvx38nMXceHgUsy7OFqcW0N
	W39CihHI3ZsA8ETzvnJhbc6lo+AvzRv5d3+WDXIsPbihMwvCPWjtkfXHGtCWZuwGJlHe
	ZeBnM7xzYagrVH5kC7nwdtoccn++R8miL38WqvlWIGD1nemEC1PQdJtymFZOVPk+ZmIC
	iuXNansNY0Pa1Z8kCOCDsgFhfho399ao3WK1Gf9mkPq+yhxJLh7gqAUYN4irkYWhRbYx
	sOFJH9ReMMUmbuJ+qW+qyGnopp+PKkL+LuX96ahsfbb39LJv0UXvDHMlA+fE1fRVNx/3
	QE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dMF4mIdczuK/G7D2gZXQRDmbzPeKPM67e9fAk5/o3Uw=;
	b=SBngx185DqCiE4fOzfTFqph51gf5rcZ2hYb678VUX9jAsg9RsLa3JiwwZVGb9TY2qh
	nsAGcwbQLOI3Q+TLFM2zEMCsQ0usIY6JdnnKZ039Prrnjaje+OGSqqUbl0LjXmutpD9U
	AROEx5XbAbI4oEc0LTtFe73RF5GLO336t5gUjNqt/rY5qMzDLckQS5hjowvzfqCH6NH2
	tTu5w/CLwTVeJx+GDr4Uw8zzSi3tOwNJ+aM8Kt2An+ZBvTMJ+HeJL5WiRd5GORbU/HXI
	JNQgxASaomflg0SyD/bVN62RPnyHgVgu57KAEMLs5z+RqV5Hi5+3d3SDrpNkkqB5e3Do
	DwtQ==
X-Gm-Message-State: AHYfb5hQLt2HhJC2aSLwFjSH8cR3s+Nwnd3uwGfpGtoMs2pJQSkK7a7i
	vveTozq2HFzqIpLg+5WibnT7fxcHxQ==
X-Received: by 10.176.7.42 with SMTP id h39mr6909140uah.71.1503328440432; Mon,
	21 Aug 2017 08:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Mon, 21 Aug 2017 08:13:59 -0700 (PDT)
In-Reply-To: <CADkTA4Nx3EAgggD2ohyZJpX2ZGUgKvmQK-KFLTnreJSjO830Zw@mail.gmail.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<ab92e7d90c416d6e5cdb17cdba269e09ec967607.1503283308.git.bruce.ashfield@windriver.com>
	<b68f37bbad5940a8bdb7f165a7600f18@XBOX02.axis.com>
	<CADkTA4Nx3EAgggD2ohyZJpX2ZGUgKvmQK-KFLTnreJSjO830Zw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Aug 2017 11:13:59 -0400
Message-ID: <CADkTA4PdZwrfh_u44auWAR4r0KV2oVp1VJu=56Uvpv6xocEp1g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Mon, 21 Aug 2017 15:13:59 -0000
Content-Type: multipart/alternative; boundary="94eb2c124178ac3cd6055744ed09"

--94eb2c124178ac3cd6055744ed09
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 11:03 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Aug 21, 2017 at 11:00 AM, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
>> > -----Original Message-----
>> > From: openembedded-core-bounces@lists.openembedded.org
>> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> > Bruce Ashfield
>> > Sent: den 21 augusti 2017 04:58
>> > To: richard.purdie@linuxfoundation.org
>> > Cc: openembedded-core@lists.openembedded.org
>> > Subject: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only valid
>> > BSPs are built
>> >
>> > There was a bug in the search routines responsible for locating
>> > BSP definitions which returned a valid match if only the ktype
>> > matched.
>> >
>> > This meant that someone looking for "qemux86foo" (which is an
>> > invalid definition) would potentially end up building "qemuarm"
>> > and be none the wiser (until it didn't boot).
>> >
>> > With this fix to the tools search routine, and improved return
>> > code testing, we will now stop the build and report and error to
>> > the user.
>> >
>> > [YOCTO: #11878]
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> > ---
>> >  meta/classes/kernel-yocto.bbclass                       | 3 +++
>> >  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>> >  2 files changed, 4 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/
>> kernel-yocto.bbclass
>> > index 1ca0756c4959..3c6df92131bc 100644
>> > --- a/meta/classes/kernel-yocto.bbclass
>> > +++ b/meta/classes/kernel-yocto.bbclass
>> > @@ -143,6 +143,9 @@ do_kernel_metadata() {
>> >
>> >       # expand kernel features into their full path equivalents
>> >       bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE}
>> -DKTYPE=${LINUX_KERNEL_TYPE})
>> > +     if [ $? -ne 0 ] || [ -z "${bsp_definition}" ]; then
>>
>> Use $bsp_definition instead of ${bsp_definition} since it is a
>> shell variable and not a bitbake variable.
>>
>
> I always use ${...}, so I'm going to stay consistent with what is already
> in
> the file.
>
>
>>
>> Actually, after looking at the code in that bbclass, I see this
>> used for a number of shell variables all over the place. This is
>> actually bad, and you should rewrite the code to not use ${variable}
>> for shell variables. The reason this is bad is because these
>> variables unnecessarily end up in the sstate hash for these functions,
>> and if someone actually happens to define a bitbake variable with the
>> same name as one of those shell variables, the result will not be what
>> is expected...
>>
>
> Not something high on my priority list. It's been that way since the
> beginning.
>

.. but I will loop back and take care of the issues before M4 closes. Just
a bit busy
pushing out the new kernels and a slew of bug fixes.

This patch can be ignored (if needed) until I get back around to that.

Cheers,

Bruce


>
> Cheers,
>
> Bruce
>
>
>>
>> > +             bbfatal_log "Could not locate BSP definiton for
>> ${KMACHINE}/${LINUX_KERNEL_TYPE}."
>>
>> Change "definiton" to "definition".
>>
>> > +     fi
>> >       meta_dir=$(kgit --meta)
>> >
>> >       # run1: pull all the configuration fragments, no matter where
>> they come from
>> > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> > index 2217a31076a2..4a78b897d34f 100644
>> > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginli
>> ne=5;endline=9;md5=a6c2fa8aef1b
>> >
>> >  DEPENDS = "git-native"
>> >
>> > -SRCREV = "9cd2b626d652bec10c6bc75275b35bfee74d447c"
>> > +SRCREV = "0571411cc033c11df7827508dd786876ce2f8c83"
>> >  PR = "r12"
>> >  PV = "0.2+git${SRCPV}"
>> >
>> > --
>> > 2.5.0
>>
>> //Peter
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c124178ac3cd6055744ed09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 21, 2017 at 11:03 AM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><di=
v><div class=3D"h5">On Mon, Aug 21, 2017 at 11:00 AM, Peter Kjellerstedt <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=
=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div class=3D"m_-6619940750513795977HOEnZb"><div class=
=3D"m_-6619940750513795977h5">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@list<wbr>s.openembedded.org=
</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org" target=3D"_blank">openembedded-core-boun<wbr>ces@lists.openembedded.o=
rg</a>] On Behalf Of<br>
&gt; Bruce Ashfield<br>
&gt; Sent: den 21 augusti 2017 04:58<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation<wbr>.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openem<wbr>bedded.org</a><br>
&gt; Subject: [OE-core] [PATCH 8/9] kernel-yocto: ensure that only valid<br=
>
&gt; BSPs are built<br>
&gt;<br>
&gt; There was a bug in the search routines responsible for locating<br>
&gt; BSP definitions which returned a valid match if only the ktype<br>
&gt; matched.<br>
&gt;<br>
&gt; This meant that someone looking for &quot;qemux86foo&quot; (which is a=
n<br>
&gt; invalid definition) would potentially end up building &quot;qemuarm&qu=
ot;<br>
&gt; and be none the wiser (until it didn&#39;t boot).<br>
&gt;<br>
&gt; With this fix to the tools search routine, and improved return<br>
&gt; code testing, we will now stop the build and report and error to<br>
&gt; the user.<br>
&gt;<br>
&gt; [YOCTO: #11878]<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@win=
driver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-yocto.bbcl<wbr>ass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 meta/recipes-kernel/kern-tools<wbr>/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a> | 2 +-<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yo=
cto.bb</a><wbr>class b/meta/classes/<a href=3D"http://kernel-yocto.bb">kern=
el-yocto.bb</a><wbr>class<br>
&gt; index 1ca0756c4959..3c6df92131bc 100644<br>
&gt; --- a/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.bb<=
/a><wbr>class<br>
&gt; +++ b/meta/classes/<a href=3D"http://kernel-yocto.bb">kernel-yocto.bb<=
/a><wbr>class<br>
&gt; @@ -143,6 +143,9 @@ do_kernel_metadata() {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# expand kernel features into their full pat=
h equivalents<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bsp_definition=3D$(spp ${includes} --find -D=
KMACHINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ] || [ -z &quot;${bsp_definition}&q=
uot; ]; then<br>
<br>
</div></div>Use $bsp_definition instead of ${bsp_definition} since it is a<=
br>
shell variable and not a bitbake variable.<br></blockquote><div><br></div><=
/div></div><div>I always use ${...}, so I&#39;m going to stay consistent wi=
th what is already in</div><div>the file.=C2=A0</div><span class=3D""><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
<br>
Actually, after looking at the code in that bbclass, I see this<br>
used for a number of shell variables all over the place. This is<br>
actually bad, and you should rewrite the code to not use ${variable}<br>
for shell variables. The reason this is bad is because these<br>
variables unnecessarily end up in the sstate hash for these functions,<br>
and if someone actually happens to define a bitbake variable with the<br>
same name as one of those shell variables, the result will not be what<br>
is expected...<br></blockquote><div><br></div></span><div>Not something hig=
h on my priority list. It&#39;s been that way since the beginning.</div></d=
iv></div></div></blockquote><div><br></div><div>.. but I will loop back and=
 take care of the issues before M4 closes. Just a bit busy</div><div>pushin=
g out the new kernels and a slew of bug fixes.</div><div><br></div><div>Thi=
s patch can be ignored (if needed) until I get back around to that.</div><d=
iv><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><div><br></div><div>Cheers,</div><div><br></=
div><div>Bruce</div><span class=3D""><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<span><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Cou=
ld not locate BSP definiton for ${KMACHINE}/${LINUX_KERNEL_TYP<wbr>E}.&quot=
;<br>
<br>
</span>Change &quot;definiton&quot; to &quot;definition&quot;.<br>
<span class=3D"m_-6619940750513795977im m_-6619940750513795977HOEnZb"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta_dir=3D$(kgit --meta)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# run1: pull all the configuration fragments=
, no matter where they come from<br>
&gt; diff --git a/meta/recipes-kernel/kern-too<wbr>ls/<a href=3D"http://ker=
n-tools-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-nati=
ve_git.bb</a> b/meta/recipes-kernel/kern-too<wbr>ls/<a href=3D"http://kern-=
tools-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native=
_git.bb</a><br>
&gt; index 2217a31076a2..4a78b897d34f 100644<br>
&gt; --- a/meta/recipes-kernel/kern-too<wbr>ls/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a><br>
&gt; +++ b/meta/recipes-kernel/kern-too<wbr>ls/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a><br>
&gt; @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D &quot;file://git/tools/kgit;begin=
li<wbr>ne=3D5;endline=3D9;md5=3Da6c2fa8aef1<wbr>b<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;git-native&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;9cd2b626d652bec10c6bc75275b35<wbr>bfee74d447c&quot;<=
br>
&gt; +SRCREV =3D &quot;0571411cc033c11df7827508dd786<wbr>876ce2f8c83&quot;<=
br>
&gt;=C2=A0 PR =3D &quot;r12&quot;<br>
&gt;=C2=A0 PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.5.0<br>
<br>
</span><span class=3D"m_-6619940750513795977HOEnZb"><font color=3D"#888888"=
>//Peter<br>
</font></span><div class=3D"m_-6619940750513795977HOEnZb"><div class=3D"m_-=
6619940750513795977h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></span></div><span class=3D"HOEnZb"><font color=3D=
"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"m_-6619=
940750513795977gmail_signature" data-smartmail=3D"gmail_signature">&quot;Th=
ou shalt not follow the NULL pointer, for chaos and madness await thee at i=
ts end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c124178ac3cd6055744ed09--
