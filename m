Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.73.1614015607460470899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2sCe0hC;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id hs11so30806873ejc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 09:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A37vysxfHjbSbZ8tLLj5HJicnjJJeGl9NlbNoDBs9Y4=;
        b=p2sCe0hCxCMLwzlWeV0w32F2JABQgJvpUrb92n1fxsBAxf4Ouub+bYqvFc1X28W5eV
         wF8lqF8pwfHVlDNXsghximvHHvjw1ipdTwdvwX+nBEubM9TjGQIqqMGm51lGTAuoRS11
         7+RLUHTWUyP49taLHkSJ5jzVZJukOHePAlR0eOWP1nUKHcSkxo6AbFzD0SQxnROSmoNo
         Qv76G2olYIzWIlSnxEf6KcW0GabxDNk3N0G/+lIRa/sGNCuPOkWM2t4KotdssGvO4Njr
         6QtUO8+IEaQeiz2YjqBn5V4VebR+64rOGRRVHQ+FOi/LN4yFxodfwJFlbjBtpCHCyIcG
         4Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A37vysxfHjbSbZ8tLLj5HJicnjJJeGl9NlbNoDBs9Y4=;
        b=IjD8EUaUnh9aKbKZdeTDhskQFqTJvn9Hhy52dto9bP+pjZ4enu4zmsMtr3yz/LKOmt
         YdMwV1Fae54eufDpiKnqtGbb3jc+2Qdpv6VCVbktfz7bnQCj2QhhJGWLiXavLX5CZEjy
         Fi59+qXduskFmiLip+eVDaSAIdchHV4gHG7usJodWMuEwyRdX6CSgMz5KW+L+QwPRr3f
         xshkoRR6n7UirhQNVopgqjC+UYGGi8iwhaO1N9CK2qqEkpuT9pA+wW7dXhPJZxX7kqOI
         wqP7zWqz3cEI7Lan4RdYFUvPkNtj2mNst0fyIz25+hgzDKhevvopnzz75mJZD0r8tdxy
         CNOg==
X-Gm-Message-State: AOAM5318APQClPaT7WBVBXvgGRwHRkb/zAw2kXxPSZxTvXAwaEjKxqV/
	/jypIWR3TXH+00RCpBco8fKuAt0XphN4rgKAJtI=
X-Google-Smtp-Source: ABdhPJyCYXmiJ7K4ZVYKmJn/y+ZHDvZUYBwybU18Onj6UGFpHLDKzt2c2qM7u1+lmAOTJ0hQe9F9n4MHGlMri2GhPj0=
X-Received: by 2002:a17:907:3da5:: with SMTP id he37mr21898661ejc.300.1614015605904;
 Mon, 22 Feb 2021 09:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20210219175307.46218-1-jatedev@gmail.com> <20210219175307.46218-2-jatedev@gmail.com>
 <CANPvuRkEwbKHMDf7EzD9r8PwDR-akj8JJtc6D3-youOiYiU4Wg@mail.gmail.com> <CAPphmgayRkWXYqSmoCB-8LrTxfuSj+n+cVPX9F7HzpYe3QstCw@mail.gmail.com>
In-Reply-To: <CAPphmgayRkWXYqSmoCB-8LrTxfuSj+n+cVPX9F7HzpYe3QstCw@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 22 Feb 2021 17:39:54 +0000
Message-ID: <CANPvuRkSZxTOLM-gANOs_jrmkkMVZD83AJQMcJsWq5OCnhh1Lw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000da192205bbf04a15"

--000000000000da192205bbf04a15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Jate Sujjavanich <jatedev@gmail.com> escreveu no dia segunda, 22/02/2021
=C3=A0(s) 15:58:

> If libcap is disabled in PACKAGECONFIG, then arguments two and three mean
> find_program find could setcap on the build machine. This would mean it i=
s
> not strictly determined by the recipe and it's determined by the
> configuration of the build machine instead.
>

In this case the meson will not use the setcap from the build machine
because the libcap not found on the target sysroot.
The libcap is a dependencie when PACKAGECONFIG+=3D"libcap" and in this case
the meson it will fallback to use setuid.
https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8d82bc4d2d23=
12d8a/meson.build#L221

But as Richard says the setuid can be problematic too!


> find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required :
> false)
>
> - Jate
>
> On Sat, Feb 20, 2021 at 6:01 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
>> Hi Jate,
>>
>> IMHO as I mention on the last version of this patch
>> the file 0001-Limit-setcap-search-to-PATH-for-cross-builds.patch is not
>> needed
>> to make the iputils deterministic, the PACKAGECONFIG[libcap] changes on
>> this [Patch 2/2] will do it.
>>
>> On [Patch 1/2] the option -DNO_SETCAP_OR_SUID=3Dtrue has been removed wi=
th
>> the reverted change.
>> This will make the meson to use the setuid when setcap and libcap not
>> found and -DUSE_CAP=3Dfalse.
>>
>> Only with the addition of the libcap-native on the DEPENDS the meson
>> will use the native setcap
>> without host contamination.
>>
>> When the libcap package config is enabled (default option).
>> The libcap-native will provide the setcap binary in the sysoot
>> native STAGING_DIR_NATIVE so the meson
>> will find the setcaps binary on the STAGING_DIR_NATIVE.
>>
>> The find_program('setcaps', ....) will return the full path of the nativ=
e
>> setcap and not the host setcap.
>> Without the libcap-native the meson find_program('setcaps', ....) will
>> fail to find the first argument
>> because it not found on the PATH and will fallback to the next argument.
>> The next argument have a full PATH so the find_program will find on the
>> host in this case
>> and this will cause the contamination.
>>
>> from the meson help:
>>
>>     program find_program(program_name1, program_name2, ...)
>>
>> program_name1 here is a string that can be an executable or script to be
>> searched for in PATH or other places inside the project.
>> (since 0.37.0) program_name2 and later positional arguments are used as
>> fallback strings to search for.
>> This is meant to be used for cases where the program may have many
>> alternative names, such as foo and foo.py.
>> The function will check for the arguments one by one and the first one
>> that is found is returned.
>>
>> Jose
>>
>> Jate Sujjavanich <jatedev@gmail.com> escreveu no dia sexta, 19/02/2021
>> =C3=A0(s) 17:53:
>>
>>> Limit setcap search to PATH for cross builds preventing host
>>> contamination. Add DEPENDS for libcap-native to supply this for
>>> PACKAGECONFIG libcap.
>>>
>>> The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
>>> /bin/ping and other executables.
>>>
>>> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
>>> ---
>>>  ...tcap-search-to-PATH-for-cross-builds.patch | 33 +++++++++++++++++++
>>>  .../iputils/iputils_s20200821.bb              |  3 +-
>>>  2 files changed, 35 insertions(+), 1 deletion(-)
>>>  create mode 100644
>>> meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PATH-=
for-cross-builds.patch
>>>
>>> diff --git
>>> a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PAT=
H-for-cross-builds.patch
>>> b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PAT=
H-for-cross-builds.patch
>>> new file mode 100644
>>> index 0000000000..b09cdb5f13
>>> --- /dev/null
>>> +++
>>> b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PAT=
H-for-cross-builds.patch
>>> @@ -0,0 +1,33 @@
>>> +From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 2001
>>> +From: Jate Sujjavanich <jatedev@gmail.com>
>>> +Date: Thu, 18 Feb 2021 21:35:03 -0500
>>> +Subject: [PATCH] Limit setcap search to PATH for cross builds
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + meson.build | 9 ++++++++-
>>> + 1 file changed, 8 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/meson.build b/meson.build
>>> +index aff75a2..16bbfb6 100644
>>> +--- a/meson.build
>>> ++++ b/meson.build
>>> +@@ -215,7 +215,14 @@ config_h =3D configure_file(
>>> +       output : 'config.h',
>>> +       configuration : conf)
>>> +
>>> +-setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
>>> required : false)
>>> ++if meson.is_cross_build()
>>> ++      message('limit setcap search to PATH')
>>> ++      path_setcap =3D ['setcap']
>>> ++else
>>> ++      message('search for setcap in PATH and admin dirs')
>>> ++      path_setcap =3D ['setcap', '/usr/sbin/setcap', '/sbin/setcap']
>>> ++endif
>>> ++setcap =3D find_program(path_setcap, required : false)
>>> + if cap_dep.found() and setcap.found()
>>> +       perm_type =3D 'caps'
>>> +       setcap_path =3D setcap.path()
>>> +--
>>> +2.30.0
>>> +
>>> diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb
>>> b/meta/recipes-extended/iputils/iputils_s20200821.bb
>>> index 8b63a23c61..31fe1acdaf 100644
>>> --- a/meta/recipes-extended/iputils/iputils_s20200821.bb
>>> +++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
>>> @@ -12,6 +12,7 @@ DEPENDS =3D "gnutls"
>>>
>>>  SRC_URI =3D "git://github.com/iputils/iputils \
>>>             file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
>>> +
>>>  file://0001-Limit-setcap-search-to-PATH-for-cross-builds.patch \
>>>             "
>>>  SRCREV =3D "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
>>>
>>> @@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST +=3D "CVE-2000-1213 CVE-2000-1214=
"
>>>  PACKAGECONFIG ??=3D "libcap rarpd \
>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
>>> 'ninfod traceroute6', '', d)} \
>>>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
>>> -PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap=
"
>>> +PACKAGECONFIG[libcap] =3D "-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libcap
>>> libcap-native"
>>>  PACKAGECONFIG[libidn] =3D "-DUSE_IDN=3Dtrue, -DUSE_IDN=3Dfalse, libidn=
2"
>>>  PACKAGECONFIG[gettext] =3D "-DUSE_GETTEXT=3Dtrue, -DUSE_GETTEXT=3Dfals=
e,
>>> gettext"
>>>  PACKAGECONFIG[ninfod] =3D "-DBUILD_NINFOD=3Dtrue,-DBUILD_NINFOD=3Dfals=
e,"
>>> --
>>> 2.25.1
>>>
>>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000da192205bbf04a15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gma=
il.com">jatedev@gmail.com</a>&gt; escreveu no dia segunda, 22/02/2021 =C3=
=A0(s) 15:58:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv dir=3D"ltr"><div>If libcap is disabled in PACKAGECONFIG, then arguments =
two and three mean find_program find could setcap on the build machine. Thi=
s would mean it is not strictly determined by the recipe and it&#39;s deter=
mined by the configuration of the build machine instead.<br></div></div></b=
lockquote><div><br></div><div>In this case the meson will not use the setca=
p from the build machine because the libcap not found on the target sysroot=
.</div><div>The libcap is a dependencie when PACKAGECONFIG+=3D&quot;libcap&=
quot; and in this case the meson it will fallback to use setuid.</div><div>=
<a href=3D"https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8=
d82bc4d2d2312d8a/meson.build#L221">https://github.com/iputils/iputils/blob/=
f0c64bbb2b1563647bfeeed8d82bc4d2d2312d8a/meson.build#L221</a><br></div><div=
><br></div><div>But as Richard says the setuid can be problematic too!</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div></div><div><br></div><div>find_program(&#39;setcap&#39;, &#39=
;/usr/sbin/setcap&#39;, &#39;/sbin/setcap&#39;, required : false)</div><div=
><br></div><div>- Jate<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 20, 2021 at 6:01 PM Jose Quares=
ma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresm=
a.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Jate,</div><div><br></=
div>IMHO as I mention on the last version of this patch<div>the=C2=A0<span =
style=3D"color:rgb(0,0,0)">file 0001-Limit-setcap-sear</span><span style=3D=
"color:rgb(0,0,0)">ch-to-PATH-for-cross-builds.</span><span style=3D"color:=
rgb(0,0,0)">patch is not needed</span><div><font color=3D"#000000">to make =
the iputils=C2=A0</font><span style=3D"color:rgb(0,0,0)">deterministic, the=
=C2=A0</span>PACKAGECONFIG[libcap]<span style=3D"color:rgb(0,0,0)">=C2=A0ch=
anges on this=C2=A0</span>[Patch 2/2]<span style=3D"color:rgb(0,0,0)">=C2=
=A0will do it.</span></div><div><font color=3D"#000000"><br></font></div><d=
iv><font color=3D"#000000">On [Patch 1/2] the option=C2=A0</font><span styl=
e=3D"color:rgb(0,0,0)">-DNO_SETCAP_OR_SUID=3Dtrue has been removed with the=
 reverted=C2=A0</span>change<span style=3D"color:rgb(0,0,0)">.</span></div>=
<div><div><font color=3D"#000000">This will make the meson to use the=C2=A0=
</font>setuid when=C2=A0setcap and libcap not found and -DUSE_CAP=3Dfalse.<=
/div><div><font color=3D"#000000"><br></font></div><div><font color=3D"#000=
000">Only with the addition of the=C2=A0</font>libcap-native on the=C2=A0<s=
pan style=3D"color:rgb(0,0,0)">DEPENDS the meson will use the native setcap=
=C2=A0</span></div><div><span style=3D"color:rgb(0,0,0)">without host conta=
mination.</span></div><div><span style=3D"color:rgb(0,0,0)"><br></span></di=
v><div><font color=3D"#000000">W</font>hen the=C2=A0libcap package config i=
s enabled (default option).</div><div class=3D"gmail_attr"></div><div>The l=
ibcap-native will provide the setcap binary in the sysoot native=C2=A0STAGI=
NG_DIR_NATIVE so the meson<br></div><div><div class=3D"gmail_quote"><div cl=
ass=3D"gmail_attr">will find the setcaps binary on the=C2=A0STAGING_DIR_NAT=
IVE.</div><div class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">The=
 find_program(&#39;setcaps&#39;, ....) will return the full path of the nat=
ive setcap  and not the host setcap.</div><div class=3D"gmail_attr">Without=
 the=C2=A0libcap-native the meson=C2=A0find_program(&#39;setcaps&#39;, ....=
) will fail to find the first argument</div><div class=3D"gmail_attr">becau=
se it not found on the PATH and will=C2=A0fallback to the next argument.</d=
iv><div class=3D"gmail_attr">The next argument have a full PATH so the=C2=
=A0find_program will find on the host in this case</div><div class=3D"gmail=
_attr">and this will cause the contamination.</div><div class=3D"gmail_attr=
"><br></div><div class=3D"gmail_attr">from the meson help:</div><div class=
=3D"gmail_attr"><br></div><div class=3D"gmail_attr">=C2=A0 =C2=A0 program f=
ind_program(program_name1, program_name2, ...)<br></div><div class=3D"gmail=
_attr"><br></div><div class=3D"gmail_attr">program_name1 here is a string t=
hat can be an executable or script to be searched for in PATH or other plac=
es inside the project.<br></div><div class=3D"gmail_attr">(since 0.37.0) pr=
ogram_name2 and later positional arguments are used as fallback strings to =
search for.</div><div class=3D"gmail_attr">This is meant to be used for cas=
es where the program may have many alternative names, such as foo and foo.p=
y.</div><div class=3D"gmail_attr">The function will check for the arguments=
 one by one and the first one that is found is returned.<br></div><div clas=
s=3D"gmail_attr"><br></div><div class=3D"gmail_attr">Jose</div><div class=
=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">Jate Sujjav=
anich &lt;<a href=3D"mailto:jatedev@gmail.com" target=3D"_blank">jatedev@gm=
ail.com</a>&gt; escreveu no dia sexta, 19/02/2021 =C3=A0(s) 17:53:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Limit setcap search to P=
ATH for cross builds preventing host<br>
contamination. Add DEPENDS for libcap-native to supply this for<br>
PACKAGECONFIG libcap.<br>
<br>
The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of<br>
/bin/ping and other executables.<br>
<br>
Signed-off-by: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" ta=
rget=3D"_blank">jatedev@gmail.com</a>&gt;<br>
---<br>
=C2=A0...tcap-search-to-PATH-for-cross-builds.patch | 33 ++++++++++++++++++=
+<br>
=C2=A0.../iputils/<a href=3D"http://iputils_s20200821.bb" rel=3D"noreferrer=
" target=3D"_blank">iputils_s20200821.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A02 files changed, 35 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/iputils/iputils/0001-Limit-s=
etcap-search-to-PATH-for-cross-builds.patch<br>
<br>
diff --git a/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search=
-to-PATH-for-cross-builds.patch b/meta/recipes-extended/iputils/iputils/000=
1-Limit-setcap-search-to-PATH-for-cross-builds.patch<br>
new file mode 100644<br>
index 0000000000..b09cdb5f13<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/iputils/iputils/0001-Limit-setcap-search-to-PAT=
H-for-cross-builds.patch<br>
@@ -0,0 +1,33 @@<br>
+From aedb7811d1e9b0eae5d33b5bed39f6219a06a8dc Mon Sep 17 00:00:00 2001<br>
+From: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" target=3D"=
_blank">jatedev@gmail.com</a>&gt;<br>
+Date: Thu, 18 Feb 2021 21:35:03 -0500<br>
+Subject: [PATCH] Limit setcap search to PATH for cross builds<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ meson.build | 9 ++++++++-<br>
+ 1 file changed, 8 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index aff75a2..16bbfb6 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -215,7 +215,14 @@ config_h =3D configure_file(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0output : &#39;config.h&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration : conf)<br>
+ <br>
+-setcap =3D find_program(&#39;setcap&#39;, &#39;/usr/sbin/setcap&#39;, &#3=
9;/sbin/setcap&#39;, required : false)<br>
++if meson.is_cross_build()<br>
++=C2=A0 =C2=A0 =C2=A0 message(&#39;limit setcap search to PATH&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 path_setcap =3D [&#39;setcap&#39;]<br>
++else<br>
++=C2=A0 =C2=A0 =C2=A0 message(&#39;search for setcap in PATH and admin dir=
s&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 path_setcap =3D [&#39;setcap&#39;, &#39;/usr/sbin/se=
tcap&#39;, &#39;/sbin/setcap&#39;]<br>
++endif<br>
++setcap =3D find_program(path_setcap, required : false)<br>
+ if cap_dep.found() and setcap.found()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0perm_type =3D &#39;caps&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0setcap_path =3D setcap.path()<br>
+-- <br>
+2.30.0<br>
+<br>
diff --git a/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200=
821.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a> b/met=
a/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb" rel=3D"n=
oreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
index 8b63a23c61..31fe1acdaf 100644<br>
--- a/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb"=
 rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
+++ b/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb"=
 rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
@@ -12,6 +12,7 @@ DEPENDS =3D &quot;gnutls&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/iputils/iputils"=
 rel=3D"noreferrer" target=3D"_blank">github.com/iputils/iputils</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-rarpd-rdisc-Drop-Priv=
ateUsers.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Limit-setcap-search-t=
o-PATH-for-cross-builds.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;23c3782ae0c7f9c6ae59dbed8ad9204f8758542b&quot;<br>
<br>
@@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2000-1213 CVE-2000-121=
4&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libcap rarpd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ipv6&#39;, &#39;ninfod trac=
eroute6&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>
-PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libca=
p&quot;<br>
+PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libca=
p libcap-native&quot;<br>
=C2=A0PACKAGECONFIG[libidn] =3D &quot;-DUSE_IDN=3Dtrue, -DUSE_IDN=3Dfalse, =
libidn2&quot;<br>
=C2=A0PACKAGECONFIG[gettext] =3D &quot;-DUSE_GETTEXT=3Dtrue, -DUSE_GETTEXT=
=3Dfalse, gettext&quot;<br>
=C2=A0PACKAGECONFIG[ninfod] =3D &quot;-DBUILD_NINFOD=3Dtrue,-DBUILD_NINFOD=
=3Dfalse,&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div></div></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000da192205bbf04a15--
