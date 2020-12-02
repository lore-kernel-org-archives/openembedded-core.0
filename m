Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web09.961.1606872748968036528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 17:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jswa6va2;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id 7so8847280ejm.0;
        Tue, 01 Dec 2020 17:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SOuX10nn1w+J+m98wCUzjMJHnGBrFavwPJK1xKywBHQ=;
        b=Jswa6va2AvOj4p4XlEsKujvN1E/vysbmtkmMK2vmnnCqzOFqNbghF1qg9z6OsLmx9t
         bFafGrIy+UWueRoKDZSrpB5lUA6qV0rGSCzRIhbI/WNwUKPMxVlD8CEjFK8AyijzLRby
         vQSOChh/v1fYd+mIYiMZ6NgrpuFklMqmio6uo47oB/w6yj5Oa3zTQioqtVLPL6vsHX9V
         j2dKLmTz6+jSAXd/wRz4tZDTCfwCpfxuGJK6vj047nsL6cthXk14CJs0cZzJrovv61n7
         ubjZIpgSZsHtlLx8YlqPZgdJYbq5LBHFKr8W4thHc6drlUkxs8PJ9PJbdf+uxy9bM2J7
         Ex+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SOuX10nn1w+J+m98wCUzjMJHnGBrFavwPJK1xKywBHQ=;
        b=H4nkbtkNBQoPiG+FVdPxJ/u71rqYrje2VeLBBIyho2IcQAODBDqmVAlVm3EVo6BWJR
         vNqAsWqs5fm2om65YkO6RXYeNpxuk0sFZ+r3FMDmXRmOyiMIDQo14WRjhNpObUj/66ZZ
         jMwouoe0LIeK6ynDL0ncLuorC+tBwKkWFRK3lydkGjCrg4nTGhcXskeKJF8wXspHYpQC
         gwRunw6aWolK+da7pR4YUYmY10CgGK5nBT/pyGCMLJiv6DMKTZtQVDMnXUCEhswYR9QF
         MN98fjiv7JZCZQYyPrdYWO/D4mNJ9ZFW911yXVCvZfG9/z7TsxOiXpkgBhsZFNKCTTnV
         FViw==
X-Gm-Message-State: AOAM53048EhMAczAljY/wVQ+Y2WeKrdS7atqJMG607V2yk60Q7k6vDKE
	bulje17pX5bmoyNHaWJvLWfRRQHu/JlezRBZV50=
X-Google-Smtp-Source: ABdhPJzAwfMs4DSulNAFMo231biTBb0RNC9csdnWvze7jhR8CBAtiQ3yCn3qtfmkcqEgDm1xvkwPsm0G8dBmKjwGxxg=
X-Received: by 2002:a17:907:d01:: with SMTP id gn1mr101202ejc.357.1606872747038;
 Tue, 01 Dec 2020 17:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20201128004505.27619-1-scott.branden@broadcom.com>
 <CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com>
 <a5ea40a5-17ef-f037-16b3-177f01db6447@broadcom.com> <CADkTA4NTPJrvoFqumNjkU-o-ZTt8iVUzQec+=Qvm4J_59FFQqg@mail.gmail.com>
 <be7e141b-4c20-c31b-9b74-6a1369569565@broadcom.com>
In-Reply-To: <be7e141b-4c20-c31b-9b74-6a1369569565@broadcom.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 1 Dec 2020 20:32:15 -0500
Message-ID: <CADkTA4OypBD5MyrEOPE_RtNC4DTSL-NPVa8QuDNHKHhRi8-Hzg@mail.gmail.com>
Subject: Re: [PATCH] menuconfig,mconf-cfg: Allow specification of ncurses location
To: Scott Branden <scott.branden@broadcom.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, Michal Marek <mmarek@suse.cz>
Content-Type: multipart/alternative; boundary="000000000000495e6a05b5713768"

--000000000000495e6a05b5713768
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 1, 2020 at 7:42 PM Scott Branden <scott.branden@broadcom.com>
wrote:

> Hi Bruce,
>
> On 2020-12-01 11:01 a.m., Bruce Ashfield wrote:
> > On Tue, Dec 1, 2020 at 12:19 PM Scott Branden
> > <scott.branden@broadcom.com> wrote:
> >> Hi Masahiro,
> >>
> >> On 2020-12-01 4:25 a.m., Masahiro Yamada wrote:
> >>> On Sat, Nov 28, 2020 at 9:45 AM Scott Branden
> >>> <scott.branden@broadcom.com> wrote:
> >>>> From: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>>>
> >>>> In some cross build environments such as the Yocto Project build
> >>>> environment it provides an ncurses library that is compiled
> >>>> differently than the host's version.  This causes display corruption
> >>>> problems when the host's curses includes are used instead of the
> >>>> includes from the provided compiler are overridden.  There is a second
> >>>> case where there is no curses libraries at all on the host system and
> >>>> menuconfig will just fail entirely.
> >>>>
> >>>> The solution is simply to allow an override variable in
> >>>> check-lxdialog.sh for environments such as the Yocto Project.  Adding
> >>>> a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
> >>>> compiling and linking against the right headers and libraries.
> >>>>
> >>>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >>>> cc: Michal Marek <mmarek@suse.cz>
> >>>> cc: linux-kbuild@vger.kernel.org
> >>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> >>>> ---
> >>> Some people solve the cross-compiling in Yocto
> >>> by using pkg-config.
> >>>
> >>>
> >>> For example,
> >>>
> >>> commit 067c650c456e758f933aaf87a202f841d34be269
> >>> Author: Pavel Modilaynen <pavel.modilaynen@axis.com>
> >>> Date:   Fri Jul 12 13:52:19 2019 +0200
> >>>
> >>>     dtc: Use pkg-config to locate libyaml
> >>>
> >>>     Using Makefile's wildcard with absolute path to detect
> >>>     the presence of libyaml results in false-positive
> >>>     detection when cross-compiling e.g. in yocto environment.
> >>>
> >>>
> >>>
> >>> mconf-cfg.sh already allows the path flexibility with pkg-config.
> >>> Why do you want yet another hook?
> >> I hope the yocto community can provide more details on this patch.
> >> The yocto environment isolates the build environment from the host
> tools.
> >> Running menuconfig with the upstream kernel does not work on the latest
> yocto without this patch.
> > Sorry for not commenting on the origin patch, gmail buried it within
> > some other threads, but luckily this one popped up.
> >
> > It is true that we've been carrying this for several years to deal with
> > the fact that the native sysroot is not searched by the pkg-config
> > called by mconf-cfg.sh (since it is separate from host and target
> > pkg-config).
> >
> > As it turns out, in the past few weeks, we have come up with a way
> > to inject those native sysroot components into pkg-config without
> > the need for any changes to the scripts.
> >
> > Scott: if you try again the the latest oe-core, and are still seeing
> > the problem with the mainline kernel, ping me, and we can see if
> > the pkg-config fix isn't holding for you, at that point, yes, we may
> > still need a hook like this to solve the problem.
> Try reverting this kernel patch from linux-yocto and menuconfig will fail.
>

s/this/your/ ?

I'm continuing to carry it, since that tree is part of more than just yocto
builds so
it is needed for other reasons as well.



> menuconfig actually did work with the upstream kernel until the yocto
> change below was introduced:
> "cml1.bbclass: Handle ncurses-native being available via pkg-config"
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
>
>
That's the one I was referring to.

You need to take that up with the submitter of that change, since it has
broken
your workflow.

My change will indeed fix (mask) it, but considering that commit claims to
solve
the same problem, it should be root caused on the oe core mailing list.

Bruce



> > Cheers,
> >
> > Bruce
> >
> >
> >
> >>>>  scripts/kconfig/mconf-cfg.sh | 8 ++++++++
> >>>>  1 file changed, 8 insertions(+)
> >>>>  mode change 100755 => 100644 scripts/kconfig/mconf-cfg.sh
> >>>>
> >>>> diff --git a/scripts/kconfig/mconf-cfg.sh
> b/scripts/kconfig/mconf-cfg.sh
> >>>> old mode 100755
> >>>> new mode 100644
> >>>> index aa68ec95620d..32448bc198a5
> >>>> --- a/scripts/kconfig/mconf-cfg.sh
> >>>> +++ b/scripts/kconfig/mconf-cfg.sh
> >>>> @@ -4,6 +4,14 @@
> >>>>  PKG="ncursesw"
> >>>>  PKG2="ncurses"
> >>>>
> >>>> +if [ "$CROSS_CURSES_LIB" != "" ]; then
> >>>> +    echo libs=\'$CROSS_CURSES_LIB\'
> >>>> +    if [ x"$CROSS_CURSES_INC" != x ]; then
> >>>> +       echo cflags=\'$CROSS_CURSES_INC\'
> >>>> +    fi
> >>>> +    exit 0
> >>>> +fi
> >>>> +
> >>>>  if [ -n "$(command -v pkg-config)" ]; then
> >>>>         if pkg-config --exists $PKG; then
> >>>>                 echo cflags=\"$(pkg-config --cflags $PKG)\"
> >>>> --
> >>>> 2.17.1
> >>>>
> >
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000495e6a05b5713768
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Dec 1, 2020 at 7:42 PM Scott Branden &lt;<a=
 href=3D"mailto:scott.branden@broadcom.com">scott.branden@broadcom.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Br=
uce,<br>
<br>
On 2020-12-01 11:01 a.m., Bruce Ashfield wrote:<br>
&gt; On Tue, Dec 1, 2020 at 12:19 PM Scott Branden<br>
&gt; &lt;<a href=3D"mailto:scott.branden@broadcom.com" target=3D"_blank">sc=
ott.branden@broadcom.com</a>&gt; wrote:<br>
&gt;&gt; Hi Masahiro,<br>
&gt;&gt;<br>
&gt;&gt; On 2020-12-01 4:25 a.m., Masahiro Yamada wrote:<br>
&gt;&gt;&gt; On Sat, Nov 28, 2020 at 9:45 AM Scott Branden<br>
&gt;&gt;&gt; &lt;<a href=3D"mailto:scott.branden@broadcom.com" target=3D"_b=
lank">scott.branden@broadcom.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@=
windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; In some cross build environments such as the Yocto Project=
 build<br>
&gt;&gt;&gt;&gt; environment it provides an ncurses library that is compile=
d<br>
&gt;&gt;&gt;&gt; differently than the host&#39;s version.=C2=A0 This causes=
 display corruption<br>
&gt;&gt;&gt;&gt; problems when the host&#39;s curses includes are used inst=
ead of the<br>
&gt;&gt;&gt;&gt; includes from the provided compiler are overridden.=C2=A0 =
There is a second<br>
&gt;&gt;&gt;&gt; case where there is no curses libraries at all on the host=
 system and<br>
&gt;&gt;&gt;&gt; menuconfig will just fail entirely.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The solution is simply to allow an override variable in<br=
>
&gt;&gt;&gt;&gt; check-lxdialog.sh for environments such as the Yocto Proje=
ct.=C2=A0 Adding<br>
&gt;&gt;&gt;&gt; a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue a=
nd allowing<br>
&gt;&gt;&gt;&gt; compiling and linking against the right headers and librar=
ies.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.we=
ssel@windriver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br=
>
&gt;&gt;&gt;&gt; cc: Michal Marek &lt;<a href=3D"mailto:mmarek@suse.cz" tar=
get=3D"_blank">mmarek@suse.cz</a>&gt;<br>
&gt;&gt;&gt;&gt; cc: <a href=3D"mailto:linux-kbuild@vger.kernel.org" target=
=3D"_blank">linux-kbuild@vger.kernel.org</a><br>
&gt;&gt;&gt;&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.=
ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&=
gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Scott Branden &lt;<a href=3D"mailto:scott.b=
randen@broadcom.com" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<b=
r>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; Some people solve the cross-compiling in Yocto<br>
&gt;&gt;&gt; by using pkg-config.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For example,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; commit 067c650c456e758f933aaf87a202f841d34be269<br>
&gt;&gt;&gt; Author: Pavel Modilaynen &lt;<a href=3D"mailto:pavel.modilayne=
n@axis.com" target=3D"_blank">pavel.modilaynen@axis.com</a>&gt;<br>
&gt;&gt;&gt; Date:=C2=A0 =C2=A0Fri Jul 12 13:52:19 2019 +0200<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0dtc: Use pkg-config to locate libyaml<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0Using Makefile&#39;s wildcard with absolute=
 path to detect<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0the presence of libyaml results in false-po=
sitive<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0detection when cross-compiling e.g. in yoct=
o environment.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; mconf-cfg.sh already allows the path flexibility with pkg-conf=
ig.<br>
&gt;&gt;&gt; Why do you want yet another hook?<br>
&gt;&gt; I hope the yocto community can provide more details on this patch.=
<br>
&gt;&gt; The yocto environment isolates the build environment from the host=
 tools.<br>
&gt;&gt; Running menuconfig with the upstream kernel does not work on the l=
atest yocto without this patch.<br>
&gt; Sorry for not commenting on the origin patch, gmail buried it within<b=
r>
&gt; some other threads, but luckily this one popped up.<br>
&gt;<br>
&gt; It is true that we&#39;ve been carrying this for several years to deal=
 with<br>
&gt; the fact that the native sysroot is not searched by the pkg-config<br>
&gt; called by mconf-cfg.sh (since it is separate from host and target<br>
&gt; pkg-config).<br>
&gt;<br>
&gt; As it turns out, in the past few weeks, we have come up with a way<br>
&gt; to inject those native sysroot components into pkg-config without<br>
&gt; the need for any changes to the scripts.<br>
&gt;<br>
&gt; Scott: if you try again the the latest oe-core, and are still seeing<b=
r>
&gt; the problem with the mainline kernel, ping me, and we can see if<br>
&gt; the pkg-config fix isn&#39;t holding for you, at that point, yes, we m=
ay<br>
&gt; still need a hook like this to solve the problem.<br>
Try reverting this kernel patch from linux-yocto and menuconfig will fail.<=
br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"f=
ont-size:small">s/this/your/ ?</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">I&#39;m continuing to carry it, since that tree is part of more than =
just yocto builds so</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">it is needed for other reasons as well.</div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
menuconfig actually did work with the upstream kernel until the yocto chang=
e below was introduced:<br>
&quot;cml1.bbclass: Handle ncurses-native being available via pkg-config&qu=
ot;<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dmast=
er-next&amp;id=3Dce447d70df386ca55ce1672478b245851556374e" rel=3D"noreferre=
r" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit=
/?h=3Dmaster-next&amp;id=3Dce447d70df386ca55ce1672478b245851556374e</a><br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">That&#39;s the one I was referring to.=C2=A0</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">You need to take that up with the subm=
itter of that change, since it has broken</div><div class=3D"gmail_default"=
 style=3D"font-size:small">your workflow.=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">My change will indeed fix (mask) it, but considering=
 that commit claims to solve</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">the same problem, it should be root caused on the oe core mai=
ling list.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 scripts/kconfig/mconf-cfg.sh | 8 ++++++++<br>
&gt;&gt;&gt;&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;&gt;&gt;&gt;=C2=A0 mode change 100755 =3D&gt; 100644 scripts/kconfig/mc=
onf-cfg.sh<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfi=
g/mconf-cfg.sh<br>
&gt;&gt;&gt;&gt; old mode 100755<br>
&gt;&gt;&gt;&gt; new mode 100644<br>
&gt;&gt;&gt;&gt; index aa68ec95620d..32448bc198a5<br>
&gt;&gt;&gt;&gt; --- a/scripts/kconfig/mconf-cfg.sh<br>
&gt;&gt;&gt;&gt; +++ b/scripts/kconfig/mconf-cfg.sh<br>
&gt;&gt;&gt;&gt; @@ -4,6 +4,14 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 PKG=3D&quot;ncursesw&quot;<br>
&gt;&gt;&gt;&gt;=C2=A0 PKG2=3D&quot;ncurses&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +if [ &quot;$CROSS_CURSES_LIB&quot; !=3D &quot;&quot; ]; t=
hen<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 echo libs=3D\&#39;$CROSS_CURSES_LIB\&#39;<b=
r>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if [ x&quot;$CROSS_CURSES_INC&quot; !=3D x =
]; then<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo cflags=3D\&#39;$CROSS_CUR=
SES_INC\&#39;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 exit 0<br>
&gt;&gt;&gt;&gt; +fi<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 if [ -n &quot;$(command -v pkg-config)&quot; ]; then=
<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg-config --exists $P=
KG; then<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo cflags=3D\&quot;$(pkg-config --cflags $PKG)\&quot;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; 2.17.1<br>
&gt;&gt;&gt;&gt;<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000495e6a05b5713768--
