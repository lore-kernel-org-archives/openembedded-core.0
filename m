Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id BA5F37318F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 11:59:43 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id x201so207285635oif.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=xPq2K7Bu6mXKrNVVNkXU3LmNDuP5jk2SPrO84NagFrU=;
	b=bdOQkc1iQ9H3ac57+AfR2xViOEDz084QFI/+Nq/aTCX1aRJhxvWqUwq3e21lf5M2zU
	O22liTZ2EwvZIfb1sqHOczDga1G/P/ew2rbrIAmO5RFWpd1WCMN8wZRSkiqlijVW6DzY
	++/k2KmwfdRp5zYaCOIrq7ePlxPLMsBdtvZPD3+iMWkHN3S4lymZRm6kzjRZWExp57Su
	GY3PLtHJ0dH8Ca8BpePXDZkbv7jw2NyxknLR81iXwd11Z4BD614zfAH+JS54dwMQvldJ
	dg6rf6dX6ILCJktqWIdObaLXIOwBABCK78saytUKcOU4zksTps9RGPKhhZI863eb2xz/
	KTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=xPq2K7Bu6mXKrNVVNkXU3LmNDuP5jk2SPrO84NagFrU=;
	b=MtvK5tDShHoDEVs8d8Z9LV2Oei8tC8TkbVb95YyySxoQBre4oGDfGvsE79MagmyTBr
	ZF3IoQo/QQzaJshePJ2IIj6NRiGQGOeGEBui3uxL6GTH2a7P7wbnqFd1NAKgyfXnFLXM
	5MXExJiZU40jrsz7BR/n6/slRaqMGHvoIhmiA7g59MI1pxow+kGh6dxFqjJC4cfaDorf
	lg2IyKUn9J03QvwI/SqQCAFM92zuN9r5NduD2cTHuXZQcI0YBK44UUXl8xIlDQpt6JxK
	Kj8buJTkVt2zIk4rzgYoVr+Nr4zhxCJ6oN180dy50Pti6jGYuANKDEhUaxEXPfsx4yQO
	3g/A==
X-Gm-Message-State: AOPr4FUrcaDjXerb6DwYzwX0CyUMknHZokSwPpyVnkGAVcQTNlq+r//3/n7NO/7KTy4LvE074U3QGSBSbNFN6g==
MIME-Version: 1.0
X-Received: by 10.202.170.65 with SMTP id t62mr14880631oie.60.1462795183826;
	Mon, 09 May 2016 04:59:43 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 9 May 2016 04:59:43 -0700 (PDT)
In-Reply-To: <85ffd927c7834f4111ae1740b8aad5a9c444b7aa.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<85ffd927c7834f4111ae1740b8aad5a9c444b7aa.1462768634.git.paul.eggleton@linux.intel.com>
Date: Mon, 9 May 2016 07:59:43 -0400
Message-ID: <CADkTA4MmTBTg+Wp-Cwp4eRNzbpp+Sp=5B1Yf4Lc_qUrDwsaaNA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] classes/kernel-check: add a class to check kernel config options
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
X-List-Received-Date: Mon, 09 May 2016 11:59:45 -0000
Content-Type: multipart/alternative; boundary=001a113c352c4fad710532678bf0

--001a113c352c4fad710532678bf0
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Some user-space software has specific requirements about the kernel
> configuration options selected. This class allows a recipe to explicitly
> state the kernel configuration options it needs (through a
> REQUIRED_KERNEL_OPTIONS variable). This is a space separated list, where
> each item is one of:
>   (a) an option name (e.g. CONFIG_FHANDLE, in which case CONFIG_FHANDLE
>       must be set to y or m to match)
>   (b) optionname=value (e.g. CONFIG_FHANDLE=y, in which case
>       CONFIG_FHANDLE must be set to y). If the specified value is n,
>       it will also match if the option is not present.
>   (c) optionname1|optionname2|... (e.g.
>       CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT23, meaning that either
>       CONFIG_EXT2_FS or CONFIG_EXT4_USE_FOR_EXT23 must be set to y or
>       m to match).
>


This duplicates code that is already in the kconf_check routines, which
I've already
made generic (and added dependency information) for the 2.2 release ... so
call
me confused that I've never heard about this until now :(

Bruce


>
> Inheriting the class will also add a dependency from do_configure on
> virtual/kernel:do_shared_workdir so that the kernel config is there to
> check. If one or more items are not matched, then a warning will be
> printed at do_configure time. (This is a warning rather than an error
> in case you are using linux-dummy with an externally built kernel).
>
> A separate function is also provided should you wish to check a config
> option from python code - but note you must only call this in a place
> where you can guarantee that the kernel config has been written to the
> sysroot (i.e. from a task that has virtual/kernel:do_shared_workdir in
> its depends varflag value).
>
> Fixes [YOCTO #5574].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/kernel-check.bbclass | 97
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 meta/classes/kernel-check.bbclass
>
> diff --git a/meta/classes/kernel-check.bbclass
> b/meta/classes/kernel-check.bbclass
> new file mode 100644
> index 0000000..d202f4e
> --- /dev/null
> +++ b/meta/classes/kernel-check.bbclass
> @@ -0,0 +1,97 @@
> +# Provides a means of checking within a recipe if particular kernel
> +# config options are enabled
> +#
> +# Copyright (C) 2016 Intel Corporation
> +#
> +# Example usage (within a recipe):
> +#
> +# inherit kernel-check
> +# REQUIRED_KERNEL_OPTIONS = "CONFIG_CGROUPS CONFIG_NAMESPACES"
> +#
> +# If one or more of the options aren't in the built kernel configuration
> +# you will get a warning at do_configure time.
> +#
> +# You can also use the check_kernel_config_options() function to do
> +# explicit checks yourself (and perform a different action).
> +
> +def check_kernel_config_options(options, d):
> +    """
> +    A function you can use to do explicit checks for kernel config
> +    options from python code
> +    """
> +
> +    if isinstance(options, basestring):
> +        required = options.split()
> +    else:
> +        required = options[:]
> +    missing = []
> +    diffvalue = []
> +    if required:
> +        with open(d.expand('${STAGING_KERNEL_BUILDDIR}/.config'), 'r') as
> f:
> +            for line in f:
> +                if line.startswith('#'):
> +                    continue
> +                linesplit = line.rstrip().split('=', 1)
> +                if len(linesplit) < 2:
> +                    continue
> +                linevalue = linesplit[1]
> +                for req in required:
> +                    found = False
> +                    if '|' in req:
> +                        for reqitem in req.split('|'):
> +                            if reqitem == linesplit[0]:
> +                                if linevalue in ['y', 'm']:
> +                                    found = True
> +                                    break
> +                    else:
> +                        reqsplit = req.split('=', 1)
> +                        # Can check for CONFIG_OPTION or
> CONFIG_OPTION=value
> +                        if len(reqsplit) > 1:
> +                            reqvalue = reqsplit[1]
> +                        else:
> +                            reqvalue = None
> +                        if reqsplit[0] == linesplit[0]:
> +                            if reqvalue is None:
> +                                if linevalue not in ['y', 'm']:
> +                                    diffvalue.append((reqsplit[0], 'y or
> m', linevalue))
> +                            elif reqvalue.strip("'\"") !=
> linevalue.strip("'\""):
> +                                diffvalue.append((reqsplit[0], reqvalue,
> linevalue))
> +                            found = True
> +
> +                    if found:
> +                        required.remove(req)
> +                        break
> +
> +        for req in required:
> +            reqsplit = req.split('=', 1)
> +            if len(reqsplit) > 1:
> +                if reqsplit[1] == 'n':
> +                    continue
> +                missing.append('%s=%s' % reqsplit)
> +            else:
> +                missing.append('%s' % req)
> +
> +    return missing, diffvalue
> +
> +
> +python check_kernel_config() {
> +    pn = d.getVar('PN', True)
> +    required = d.getVar('REQUIRED_KERNEL_OPTIONS', True) or ''
> +    if ' | ' in required:
> +        bb.error('Invalid REQUIRED_KERNEL_OPTIONS value - cannot have
> spaces around |')
> +    if ' = ' in required:
> +        bb.error('Invalid REQUIRED_KERNEL_OPTIONS value - cannot have
> spaces around =')
> +    missing, diffvalue = check_kernel_config_options(required, d)
> +    if missing or diffvalue:
> +        reqstr = '\n  '.join(missing + ['%s=%s (actual value %s)' % item
> for item in diffvalue])
> +        # Just warn here for cases like linux-dummy where we don't
> actually
> +        # know the final config
> +        bb.warn('The kernel you are building against is missing the
> following required configuration options:\n  %s' % reqstr)
> +}
> +
> +python() {
> +    if d.getVar('REQUIRED_KERNEL_OPTIONS', True):
> +        d.appendVar('DEPENDS', ' virtual/kernel')
> +        d.appendVarFlag('do_configure', 'prefuncs', '
> check_kernel_config')
> +        d.appendVarFlag('do_configure', 'depends', '
> virtual/kernel:do_shared_workdir')
> +}
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113c352c4fad710532678bf0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Some user-space software has specific requirements about the kernel<br>
configuration options selected. This class allows a recipe to explicitly<br=
>
state the kernel configuration options it needs (through a<br>
REQUIRED_KERNEL_OPTIONS variable). This is a space separated list, where<br=
>
each item is one of:<br>
=C2=A0 (a) an option name (e.g. CONFIG_FHANDLE, in which case CONFIG_FHANDL=
E<br>
=C2=A0 =C2=A0 =C2=A0 must be set to y or m to match)<br>
=C2=A0 (b) optionname=3Dvalue (e.g. CONFIG_FHANDLE=3Dy, in which case<br>
=C2=A0 =C2=A0 =C2=A0 CONFIG_FHANDLE must be set to y). If the specified val=
ue is n,<br>
=C2=A0 =C2=A0 =C2=A0 it will also match if the option is not present.<br>
=C2=A0 (c) optionname1|optionname2|... (e.g.<br>
=C2=A0 =C2=A0 =C2=A0 CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT23, meaning that=
 either<br>
=C2=A0 =C2=A0 =C2=A0 CONFIG_EXT2_FS or CONFIG_EXT4_USE_FOR_EXT23 must be se=
t to y or<br>
=C2=A0 =C2=A0 =C2=A0 m to match).<br></blockquote><div><br></div><div><br><=
/div><div>This duplicates code that is already in the kconf_check routines,=
 which I&#39;ve already</div><div>made generic (and added dependency inform=
ation) for the 2.2 release ... so call</div><div>me confused that I&#39;ve =
never heard about this until now :(</div><div><br></div><div>Bruce</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Inheriting the class will also add a dependency from do_configure on<br>
virtual/kernel:do_shared_workdir so that the kernel config is there to<br>
check. If one or more items are not matched, then a warning will be<br>
printed at do_configure time. (This is a warning rather than an error<br>
in case you are using linux-dummy with an externally built kernel).<br>
<br>
A separate function is also provided should you wish to check a config<br>
option from python code - but note you must only call this in a place<br>
where you can guarantee that the kernel config has been written to the<br>
sysroot (i.e. from a task that has virtual/kernel:do_shared_workdir in<br>
its depends varflag value).<br>
<br>
Fixes [YOCTO #5574].<br>
<br>
Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.inte=
l.com">paul.eggleton@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-check.bbclass | 97 ++++++++++++++++++++++++++++++=
+++++++++<br>
=C2=A01 file changed, 97 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/kernel-check.bbclass<br>
<br>
diff --git a/meta/classes/kernel-check.bbclass b/meta/classes/kernel-check.=
bbclass<br>
new file mode 100644<br>
index 0000000..d202f4e<br>
--- /dev/null<br>
+++ b/meta/classes/kernel-check.bbclass<br>
@@ -0,0 +1,97 @@<br>
+# Provides a means of checking within a recipe if particular kernel<br>
+# config options are enabled<br>
+#<br>
+# Copyright (C) 2016 Intel Corporation<br>
+#<br>
+# Example usage (within a recipe):<br>
+#<br>
+# inherit kernel-check<br>
+# REQUIRED_KERNEL_OPTIONS =3D &quot;CONFIG_CGROUPS CONFIG_NAMESPACES&quot;=
<br>
+#<br>
+# If one or more of the options aren&#39;t in the built kernel configurati=
on<br>
+# you will get a warning at do_configure time.<br>
+#<br>
+# You can also use the check_kernel_config_options() function to do<br>
+# explicit checks yourself (and perform a different action).<br>
+<br>
+def check_kernel_config_options(options, d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 A function you can use to do explicit checks for kernel conf=
ig<br>
+=C2=A0 =C2=A0 options from python code<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 if isinstance(options, basestring):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 required =3D options.split()<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 required =3D options[:]<br>
+=C2=A0 =C2=A0 missing =3D []<br>
+=C2=A0 =C2=A0 diffvalue =3D []<br>
+=C2=A0 =C2=A0 if required:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(d.expand(&#39;${STAGING_KERNEL_BUILD=
DIR}/.config&#39;), &#39;r&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith=
(&#39;#&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linesplit =3D line=
.rstrip().split(&#39;=3D&#39;, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(linesplit) =
&lt; 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linevalue =3D line=
split[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for req in require=
d:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foun=
d =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &=
#39;|&#39; in req:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for reqitem in req.split(&#39;|&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if reqitem =3D=3D linesplit[0]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if linevalue in [&#39;y&#39;, &#39;m=
&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 reqsplit =3D req.split(&#39;=3D&#39;, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Can check for CONFIG_OPTION or CONFIG_OPTION=3Dvalue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if len(reqsplit) &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 reqvalue =3D reqsplit[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 reqvalue =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if reqsplit[0] =3D=3D linesplit[0]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if reqvalue is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if linevalue not in [&#39;y&#39;, &#=
39;m&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diffvalue.append((reqs=
plit[0], &#39;y or m&#39;, linevalue))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 elif reqvalue.strip(&quot;&#39;\&quot;&quot;) !=3D=
 linevalue.strip(&quot;&#39;\&quot;&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diffvalue.append((reqsplit[0], reqva=
lue, linevalue))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 found =3D True<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if f=
ound:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 required.remove(req)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for req in required:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reqsplit =3D req.split(&#39;=3D&=
#39;, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(reqsplit) &gt; 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if reqsplit[1] =3D=
=3D &#39;n&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cont=
inue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missing.append(&#3=
9;%s=3D%s&#39; % reqsplit)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missing.append(&#3=
9;%s&#39; % req)<br>
+<br>
+=C2=A0 =C2=A0 return missing, diffvalue<br>
+<br>
+<br>
+python check_kernel_config() {<br>
+=C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;, True)<br>
+=C2=A0 =C2=A0 required =3D d.getVar(&#39;REQUIRED_KERNEL_OPTIONS&#39;, Tru=
e) or &#39;&#39;<br>
+=C2=A0 =C2=A0 if &#39; | &#39; in required:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&#39;Invalid REQUIRED_KERNEL_OPTIONS =
value - cannot have spaces around |&#39;)<br>
+=C2=A0 =C2=A0 if &#39; =3D &#39; in required:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&#39;Invalid REQUIRED_KERNEL_OPTIONS =
value - cannot have spaces around =3D&#39;)<br>
+=C2=A0 =C2=A0 missing, diffvalue =3D check_kernel_config_options(required,=
 d)<br>
+=C2=A0 =C2=A0 if missing or diffvalue:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reqstr =3D &#39;\n=C2=A0 &#39;.join(missing + =
[&#39;%s=3D%s (actual value %s)&#39; % item for item in diffvalue])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Just warn here for cases like linux-dummy wh=
ere we don&#39;t actually<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # know the final config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&#39;The kernel you are building again=
st is missing the following required configuration options:\n=C2=A0 %s&#39;=
 % reqstr)<br>
+}<br>
+<br>
+python() {<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;REQUIRED_KERNEL_OPTIONS&#39;, True):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;DEPENDS&#39;, &#39; virtual/k=
ernel&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_configure&#39;, &#39;p=
refuncs&#39;, &#39; check_kernel_config&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_configure&#39;, &#39;d=
epends&#39;, &#39; virtual/kernel:do_shared_workdir&#39;)<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113c352c4fad710532678bf0--
