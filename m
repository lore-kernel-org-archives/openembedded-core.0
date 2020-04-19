Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.7159.1587332029911530889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2020 14:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CVstpMd6;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id p13so3762974qvt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2020 14:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uS3T3XBD+MGHQR+tEKkR6F6c/mdzJGUsjUyYfKv2mHA=;
        b=CVstpMd6TFEoCNvB/LdNGWtUe0Lm+5ZLH8SaFrUxZGZg+AwChQsAbbuk2awrP72pDt
         0gbNH3UR5AmTOVGWUDDERZAYQoDK8z1rB+6G3zSDltydPIKKOATm0SXG6cFDXpCviNIP
         meMO5Woe1fJGq9yhpW3+d6jANlU1XfC/HGh4pSMfU12iC6v5RHqSUfJcnKffR7dujkYP
         55BXcCvPUUF/D8KVmTHrRsbxy/BKhUml5OXvwMScYe1vMp7kaRiMg8nX8QUb7rCB4Ez0
         ukKdMgVlfzfsjY2f125KVj8LFN49wI1Z71WHHQWRG8kW6Oo+eQiYYOCCACs+3ED/Jw5a
         ZqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uS3T3XBD+MGHQR+tEKkR6F6c/mdzJGUsjUyYfKv2mHA=;
        b=TjbksyTqPoyiAP/HYeRXOy4j3W5QKWg6aCtqJLj3IbN3Ub44i0lbIXnT2wXiBXwFAP
         K3D3Tgv04RwF+8CJ2PS8N2eJoKmGuw69nBs/LwYIuFuChmxZH62CxjAjaXdYwcBEYWLL
         u3RX3aUBHmEufh3nIlmrF65j0ybB8t+GuZCWXccClvq5k3AkgmdakGFxjuTbnejHtJ8z
         yrmZKuh8vZhhLo4nCpU1C6N8t5Hs8GlwqPgLWu4wz26H9QYBaQZ+FuVc3Xx3ZBr5SD/g
         HCZbCl9vJyDGiWR2w8A0txtkIp91DHeFUmtFQvdaALTtPnvO/mpV0UFw64CyvsCxUb/6
         ynOg==
X-Gm-Message-State: AGi0Pub1y46jOVHP+rMoTvBKnFZzTE6aWLo0ytPaaZXYAwwr0Ud7gus8
	YT3hCTEEN/l26WeKgzSaSh9LkHxwcg61jczlphs=
X-Google-Smtp-Source: APiQypIifsb6DCEdiW9EyJyh56H2utaqqU/0nQ1jXCR3muEaTH+onuSnfUoMF06o539YynEWG5EmRf1c+bMbotA6+6U=
X-Received: by 2002:a0c:f1d1:: with SMTP id u17mr12539635qvl.146.1587332028781;
 Sun, 19 Apr 2020 14:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200419081603.15837-1-dan.callaghan@opengear.com> <CANNYZj_bbsHuLN2ymB_motz7O8h66xCv92ONWqAgFN55Wu6zcg@mail.gmail.com>
In-Reply-To: <CANNYZj_bbsHuLN2ymB_motz7O8h66xCv92ONWqAgFN55Wu6zcg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 19 Apr 2020 14:33:37 -0700
Message-ID: <CAMKF1sogFvMQcHEKkWq8Y038n-WTs5AEkwn=AwtPQGHZYYTNpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: inject "minidebuginfo" into packaged binaries
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Dan Callaghan <dan.callaghan@opengear.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b759a205a3ab8933"

--000000000000b759a205a3ab8933
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2020 at 1:37 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Thanks! I'd propose this is actually enabled by default, with a
> possibility to disable for those situations where 5% extra is critical.
>

It should be a distro choice to enable it, there are
Other solutions like breakpad which does something similar and already
deployed on top of OE if you are proposing that poky should enable it by
default that=E2=80=99s a separate issue and perhaps would be ok


> Alex
>
> On Sun, 19 Apr 2020 at 10:16, Dan Callaghan <dan.callaghan@opengear.com>
> wrote:
>
>> "Mini debuginfo" is a special section in ELF executables containing
>> minimal compressed debuginfo for non-exported symbols:
>>
>> https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
>>
>> It lets debugging tools produce better stack traces, including local
>> function names, without incurring the space overhead of full debuginfo.
>> The feature was originally developed for Fedora:
>>
>> https://fedoraproject.org/wiki/Features/MiniDebugInfo
>>
>> but nowadays it is widely supported in the ecosystem, including in gdb
>> and elfutils (and therefore also in tools which use elfutils, such as
>> systemd-coredump).
>>
>> This patch adds an optional extra step in package.bbclass to inject
>> minidebuginfo while stripping and splitting out debuginfo. It can be
>> enabled by setting PACKAGE_MINIDEBUGINFO=3D1. In my testing, this
>> increases the size of resulting binaries by roughly 5%.
>>
>> The code for producing and re-injecting the minidebuginfo is my own
>> Python implementation but corresponds directly to the shell
>> implementation that RPM uses for doing the same:
>>
>>
>> https://github.com/rpm-software-management/rpm/blob/rpm-4.15.1-release/=
scripts/find-debuginfo.sh#L261
>>
>> Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
>> ---
>>  meta/classes/package.bbclass | 84 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 84 insertions(+)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclas=
s
>> index d4c6a90e84..648297ad25 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -245,6 +245,8 @@ python () {
>>          deps =3D ""
>>          for dep in (d.getVar('PACKAGE_DEPENDS') or "").split():
>>              deps +=3D " %s:do_populate_sysroot" % dep
>> +        if d.getVar('PACKAGE_MINIDEBUGINFO') =3D=3D '1':
>> +            deps +=3D ' xz-native:do_populate_sysroot'
>>          d.appendVarFlag('do_package', 'depends', deps)
>>
>>          # shlibs requires any DEPENDS to have already packaged for the
>> *.list files
>> @@ -459,6 +461,83 @@ def splitstaticdebuginfo(file, dvar, debugstaticdi=
r,
>> debugstaticlibdir, debugsta
>>
>>      return (file, sources)
>>
>> +def inject_minidebuginfo(file, dvar, debugdir, debuglibdir, debugappen=
d,
>> debugsrcdir, d):
>> +    # Extract just the symbols from debuginfo into minidebuginfo,
>> +    # compress it with xz and inject it back into the binary in a
>> .gnu_debugdata section.
>> +    # https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
>> +
>> +    import subprocess
>> +
>> +    readelf =3D d.getVar('READELF')
>> +    nm =3D d.getVar('NM')
>> +    objcopy =3D d.getVar('OBJCOPY')
>> +
>> +    minidebuginfodir =3D d.expand('${WORKDIR}/minidebuginfo')
>> +
>> +    src =3D file[len(dvar):]
>> +    dest =3D debuglibdir + os.path.dirname(src) + debugdir + "/" +
>> os.path.basename(src) + debugappend
>> +    debugfile =3D dvar + dest
>> +    minidebugfile =3D minidebuginfodir + src + '.minidebug'
>> +    bb.utils.mkdirhier(os.path.dirname(minidebugfile))
>> +
>> +    # If we didn't produce debuginfo for any reason, we can't produce
>> minidebuginfo either
>> +    # so skip it.
>> +    if not os.path.exists(debugfile):
>> +        bb.debug(1, 'ELF file {} has no debuginfo, skipping
>> minidebuginfo injection'.format(file))
>> +        return
>> +
>> +    # Find non-allocated PROGBITS, NOTE, and NOBITS sections in the
>> debuginfo.
>> +    # We will exclude all of these from minidebuginfo to save space.
>> +    remove_section_names =3D []
>> +    for line in subprocess.check_output([readelf, '-W', '-S',
>> debugfile], universal_newlines=3DTrue).splitlines():
>> +        fields =3D line.split()
>> +        if len(fields) < 8:
>> +            continue
>> +        name =3D fields[0]
>> +        type =3D fields[1]
>> +        flags =3D fields[7]
>> +        # .debug_ sections will be removed by objcopy -S so no need to
>> explicitly remove them
>> +        if name.startswith('.debug_'):
>> +            continue
>> +        if 'A' not in flags and type in ['PROGBITS', 'NOTE', 'NOBITS']=
:
>> +            remove_section_names.append(name)
>> +
>> +    # List dynamic symbols in the binary. We can exclude these from
>> minidebuginfo
>> +    # because they are always present in the binary.
>> +    dynsyms =3D set()
>> +    for line in subprocess.check_output([nm, '-D', file,
>> '--format=3Dposix', '--defined-only'], universal_newlines=3DTrue).split=
lines():
>> +        dynsyms.add(line.split()[0])
>> +
>> +    # Find all function symbols from debuginfo which aren't in the
>> dynamic symbols table.
>> +    # These are the ones we want to keep in minidebuginfo.
>> +    keep_symbols_file =3D minidebugfile + '.symlist'
>> +    found_any_symbols =3D False
>> +    with open(keep_symbols_file, 'w') as f:
>> +        for line in subprocess.check_output([nm, debugfile,
>> '--format=3Dsysv', '--defined-only'], universal_newlines=3DTrue).splitl=
ines():
>> +            fields =3D line.split('|')
>> +            if len(fields) < 7:
>> +                continue
>> +            name =3D fields[0].strip()
>> +            type =3D fields[3].strip()
>> +            if type =3D=3D 'FUNC' and name not in dynsyms:
>> +                f.write('{}\n'.format(name))
>> +                found_any_symbols =3D True
>> +
>> +    if not found_any_symbols:
>> +        bb.debug(1, 'ELF file {} contains no symbols, skipping
>> minidebuginfo injection'.format(file))
>> +        return
>> +
>> +    bb.utils.remove(minidebugfile)
>> +    bb.utils.remove(minidebugfile + '.xz')
>> +
>> +    subprocess.check_call([objcopy, '-S'] +
>> +                          ['--remove-section=3D{}'.format(s) for s in
>> remove_section_names] +
>> +
>> ['--keep-symbols=3D{}'.format(keep_symbols_file), debugfile, minidebugf=
ile])
>> +
>> +    subprocess.check_call(['xz', '--keep', minidebugfile])
>> +
>> +    subprocess.check_call([objcopy, '--add-section',
>> '.gnu_debugdata=3D{}.xz'.format(minidebugfile), file])
>> +
>>  def copydebugsources(debugsrcdir, sources, d):
>>      # The debug src information written out to sourcefile is further
>> processed
>>      # and copied to the destination here.
>> @@ -1185,6 +1264,11 @@ python split_and_strip_files () {
>>
>>          oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
>>
>> +    # Build "minidebuginfo" and reinject it back into the stripped
>> binaries
>> +    if d.getVar('PACKAGE_MINIDEBUGINFO') =3D=3D '1':
>> +        oe.utils.multiprocess_launch(inject_minidebuginfo,
>> list(elffiles), d,
>> +                                     extraargs=3D(dvar, debugdir,
>> debuglibdir, debugappend, debugsrcdir, d))
>> +
>>      #
>>      # End of strip
>>      #
>> --
>> 2.21.1
>>
>>
>>=20
>

--000000000000b759a205a3ab8933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Apr 19, 2020 at 1:37 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Thanks! I&#3=
9;d propose this is actually enabled by default, with a possibility to disa=
ble for those situations where 5% extra is critical.</div></div></blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">It should be a distro choic=
e to enable it, there are</div><div dir=3D"auto">Other solutions like break=
pad which does something similar and already deployed on top of OE if you a=
re proposing that poky should enable it by default that=E2=80=99s a separat=
e issue and perhaps would be ok=C2=A0</div><div dir=3D"auto"><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><div></div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, 19 Apr 2020 at 10:16, Dan Callaghan &lt;<a href=3D=
"mailto:dan.callaghan@opengear.com" target=3D"_blank">dan.callaghan@opengea=
r.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">&quot;Mini debuginfo&quot; is a special section in ELF executables con=
taining<br>
minimal compressed debuginfo for non-exported symbols:<br>
<br>
<a href=3D"https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html" r=
el=3D"noreferrer" target=3D"_blank">https://sourceware.org/gdb/onlinedocs/g=
db/MiniDebugInfo.html</a><br>
<br>
It lets debugging tools produce better stack traces, including local<br>
function names, without incurring the space overhead of full debuginfo.<br=
>
The feature was originally developed for Fedora:<br>
<br>
<a href=3D"https://fedoraproject.org/wiki/Features/MiniDebugInfo" rel=3D"n=
oreferrer" target=3D"_blank">https://fedoraproject.org/wiki/Features/MiniDe=
bugInfo</a><br>
<br>
but nowadays it is widely supported in the ecosystem, including in gdb<br>
and elfutils (and therefore also in tools which use elfutils, such as<br>
systemd-coredump).<br>
<br>
This patch adds an optional extra step in package.bbclass to inject<br>
minidebuginfo while stripping and splitting out debuginfo. It can be<br>
enabled by setting PACKAGE_MINIDEBUGINFO=3D1. In my testing, this<br>
increases the size of resulting binaries by roughly 5%.<br>
<br>
The code for producing and re-injecting the minidebuginfo is my own<br>
Python implementation but corresponds directly to the shell<br>
implementation that RPM uses for doing the same:<br>
<br>
<a href=3D"https://github.com/rpm-software-management/rpm/blob/rpm-4.15.1-=
release/scripts/find-debuginfo.sh#L261" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/rpm-software-management/rpm/blob/rpm-4.15.1-release/sc=
ripts/find-debuginfo.sh#L261</a><br>
<br>
Signed-off-by: Dan Callaghan &lt;<a href=3D"mailto:dan.callaghan@opengear.=
com" target=3D"_blank">dan.callaghan@opengear.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/package.bbclass | 84 ++++++++++++++++++++++++++++++++++=
++<br>
=C2=A01 file changed, 84 insertions(+)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<b=
r>
index d4c6a90e84..648297ad25 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -245,6 +245,8 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D &quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in (d.getVar(&#39;PACKAGE_DEPEND=
S&#39;) or &quot;&quot;).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D &quot; %s:do_pop=
ulate_sysroot&quot; % dep<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&#39;PACKAGE_MINIDEBUGINFO&#39;) =
=
=3D=3D &#39;1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps +=3D &#39; xz-native:do_po=
pulate_sysroot&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVarFlag(&#39;do_package&#39;, &#=
39;depends&#39;, deps)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# shlibs requires any DEPENDS to have al=
ready packaged for the *.list files<br>
@@ -459,6 +461,83 @@ def splitstaticdebuginfo(file, dvar, debugstaticdir, =
debugstaticlibdir, debugsta<br>
<br>
=C2=A0 =C2=A0 =C2=A0return (file, sources)<br>
<br>
+def inject_minidebuginfo(file, dvar, debugdir, debuglibdir, debugappend, =
debugsrcdir, d):<br>
+=C2=A0 =C2=A0 # Extract just the symbols from debuginfo into minidebuginf=
o,<br>
+=C2=A0 =C2=A0 # compress it with xz and inject it back into the binary in=
 a .gnu_debugdata section.<br>
+=C2=A0 =C2=A0 # <a href=3D"https://sourceware.org/gdb/onlinedocs/gdb/Mini=
DebugInfo.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org=
/gdb/onlinedocs/gdb/MiniDebugInfo.html</a><br>
+<br>
+=C2=A0 =C2=A0 import subprocess<br>
+<br>
+=C2=A0 =C2=A0 readelf =3D d.getVar(&#39;READELF&#39;)<br>
+=C2=A0 =C2=A0 nm =3D d.getVar(&#39;NM&#39;)<br>
+=C2=A0 =C2=A0 objcopy =3D d.getVar(&#39;OBJCOPY&#39;)<br>
+<br>
+=C2=A0 =C2=A0 minidebuginfodir =3D d.expand(&#39;${WORKDIR}/minidebuginfo=
&#39;)<br>
+<br>
+=C2=A0 =C2=A0 src =3D file[len(dvar):]<br>
+=C2=A0 =C2=A0 dest =3D debuglibdir + os.path.dirname(src) + debugdir + &q=
uot;/&quot; + os.path.basename(src) + debugappend<br>
+=C2=A0 =C2=A0 debugfile =3D dvar + dest<br>
+=C2=A0 =C2=A0 minidebugfile =3D minidebuginfodir + src + &#39;.minidebug&=
#39;<br>
+=C2=A0 =C2=A0 bb.utils.mkdirhier(os.path.dirname(minidebugfile))<br>
+<br>
+=C2=A0 =C2=A0 # If we didn&#39;t produce debuginfo for any reason, we can=
&#39;t produce minidebuginfo either<br>
+=C2=A0 =C2=A0 # so skip it.<br>
+=C2=A0 =C2=A0 if not os.path.exists(debugfile):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &#39;ELF file {} has no debuginfo=
, skipping minidebuginfo injection&#39;.format(file))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 # Find non-allocated PROGBITS, NOTE, and NOBITS sections in=
 the debuginfo.<br>
+=C2=A0 =C2=A0 # We will exclude all of these from minidebuginfo to save s=
pace.<br>
+=C2=A0 =C2=A0 remove_section_names =3D []<br>
+=C2=A0 =C2=A0 for line in subprocess.check_output([readelf, &#39;-W&#39;,=
 &#39;-S&#39;, debugfile], universal_newlines=3DTrue).splitlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fields =3D line.split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(fields) &lt; 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D fields[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D fields[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags =3D fields[7]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # .debug_ sections will be removed by objcopy=
 -S so no need to explicitly remove them<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if name.startswith(&#39;.debug_&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;A&#39; not in flags and type in [&#39=
;PROGBITS&#39;, &#39;NOTE&#39;, &#39;NOBITS&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove_section_names.append(nam=
e)<br>
+<br>
+=C2=A0 =C2=A0 # List dynamic symbols in the binary. We can exclude these =
from minidebuginfo<br>
+=C2=A0 =C2=A0 # because they are always present in the binary.<br>
+=C2=A0 =C2=A0 dynsyms =3D set()<br>
+=C2=A0 =C2=A0 for line in subprocess.check_output([nm, &#39;-D&#39;, file=
, &#39;--format=3Dposix&#39;, &#39;--defined-only&#39;], universal_newlines=
=
=3DTrue).splitlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dynsyms.add(line.split()[0])<br>
+<br>
+=C2=A0 =C2=A0 # Find all function symbols from debuginfo which aren&#39;t=
 in the dynamic symbols table.<br>
+=C2=A0 =C2=A0 # These are the ones we want to keep in minidebuginfo.<br>
+=C2=A0 =C2=A0 keep_symbols_file =3D minidebugfile + &#39;.symlist&#39;<br=
>
+=C2=A0 =C2=A0 found_any_symbols =3D False<br>
+=C2=A0 =C2=A0 with open(keep_symbols_file, &#39;w&#39;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in subprocess.check_output([nm, debu=
gfile, &#39;--format=3Dsysv&#39;, &#39;--defined-only&#39;], universal_newl=
ines=3DTrue).splitlines():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fields =3D line.split(&#39;|&#3=
9;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(fields) &lt; 7:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D fields[0].strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D fields[3].strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if type =3D=3D &#39;FUNC&#39; a=
nd name not in dynsyms:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&#39;{}\n=
&#39;.format(name))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found_any_symbols=
 =3D True<br>
+<br>
+=C2=A0 =C2=A0 if not found_any_symbols:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &#39;ELF file {} contains no symb=
ols, skipping minidebuginfo injection&#39;.format(file))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 bb.utils.remove(minidebugfile)<br>
+=C2=A0 =C2=A0 bb.utils.remove(minidebugfile + &#39;.xz&#39;)<br>
+<br>
+=C2=A0 =C2=A0 subprocess.check_call([objcopy, &#39;-S&#39;] +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 [&#39;--remove-section=3D{}&#39;.format(s) for s in remo=
ve_section_names] +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 [&#39;--keep-symbols=3D{}&#39;.format(keep_symbols_file)=
, debugfile, minidebugfile])<br>
+<br>
+=C2=A0 =C2=A0 subprocess.check_call([&#39;xz&#39;, &#39;--keep&#39;, mini=
debugfile])<br>
+<br>
+=C2=A0 =C2=A0 subprocess.check_call([objcopy, &#39;--add-section&#39;, &#=
39;.gnu_debugdata=3D{}.xz&#39;.format(minidebugfile), file])<br>
+<br>
=C2=A0def copydebugsources(debugsrcdir, sources, d):<br>
=C2=A0 =C2=A0 =C2=A0# The debug src information written out to sourcefile =
is further processed<br>
=C2=A0 =C2=A0 =C2=A0# and copied to the destination here.<br>
@@ -1185,6 +1264,11 @@ python split_and_strip_files () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.utils.multiprocess_launch(oe.package.=
runstrip, sfiles, d)<br>
<br>
+=C2=A0 =C2=A0 # Build &quot;minidebuginfo&quot; and reinject it back into=
 the stripped binaries<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;PACKAGE_MINIDEBUGINFO&#39;) =3D=3D &#39;1&=
#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.utils.multiprocess_launch(inject_minidebug=
info, list(elffiles), d,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extraargs=3D(dv=
ar, debugdir, debuglibdir, debugappend, debugsrcdir, d))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0# End of strip<br>
=C2=A0 =C2=A0 =C2=A0#<br>
-- <br>
2.21.1<br>
<br>
<br>
</blockquote></div>
<br>
</blockquote></div></div>

--000000000000b759a205a3ab8933--
