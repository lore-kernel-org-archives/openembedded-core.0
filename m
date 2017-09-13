Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id B83977869C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 22:05:07 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id t10so1721327vke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kaFI5c6WDGFPE6Tw9QszL90XZNEHy0fn/ILrcxPoSP8=;
	b=rC4bzit5Bc8RLJqOhLTlaZV5J8tf43gLgYbWp8a5vVQbt0VrvNoUt3r3GLZoDpp1Rc
	rQLNx4CKIt6O+SoC0Rtl5/qcuxVclyP9Swe7qhzpuzc2mEJAXSFATGjL/f+97K2vx9zZ
	cQlZTqImkpnKUxb3RkUfz9o4pvgc5L9jXeXWJ9y/DrTYC9q6kQp4q5Eq01Q3BrTRkcEx
	PpVH5ThF/DJsJCb+zShikzzmtuQnCWx24pz+WmYyGC/9TVR7649h1LzJSwfN7mTTzWYl
	ZhTG7ME9P/utME18fw4Rn1m0xug4mUq5W7bscYdHhzcz0RgRkKHdZmk4qE9YNRrnfAfW
	OwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kaFI5c6WDGFPE6Tw9QszL90XZNEHy0fn/ILrcxPoSP8=;
	b=rOsRcR40NFuHduGC4a2tMhmjk0BAi+VaDJI80fnWHRa5WueysnqhcHyxRVqxGTYCd3
	lwlblo7ObMBJkGrUDuIpSm9R6IvTC6PtKONK+YkFDRg+TeszFhdBiz78lQ1zMZdlcfMk
	3DcVAbxBFZhxnpEVIBYihrLI8BgnRfo8spiHuDQHt8JUFTJLbE7heJe7rJosF9QHK8/V
	6HeuUyl/UvMKKYee52v62ZzFpy3jhV7hPLkO95aYrMkKXXdy+gEAof09td9UcgZiDDCL
	MMRDpmb3UpqywQqmIsSSmHkhyCC2e/f32BQpf3uTfBEbPX2ypviYKPEPrDSo13YZZDNL
	oK7A==
X-Gm-Message-State: AHPjjUgfMCEV9NTGo7vzCwweBvafQDkmshYmdVrlLQ6GITI4sGuAbjXA
	a0MLKg7qSvBuHAX/strvhNakSJkQyTJj9pjwmXI=
X-Google-Smtp-Source: AOwi7QDeT51JHgOmo9WftPM/o85kd43fgi8phYHk4g+3ZP5diwpHFy6uC+ADpZAUDh7F6ykBDYo738aXo7qf0amxIIk=
X-Received: by 10.31.41.136 with SMTP id p130mr14000094vkp.122.1505340308497; 
	Wed, 13 Sep 2017 15:05:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 15:05:07 -0700 (PDT)
In-Reply-To: <89eb6c7d-f000-117a-7f3c-381499c8af88@windriver.com>
References: <20170815185534.118522-1-jason.wessel@windriver.com>
	<CA+chaQcVcpkTVPCa7xdpMJZ+dWWdHCZrf66nPsyFOpj+iEos=A@mail.gmail.com>
	<89eb6c7d-f000-117a-7f3c-381499c8af88@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2017 00:05:07 +0200
Message-ID: <CA+chaQeL6R0UiqaECau0QFYSzkccDxfdwvLREVp_tuaP8h_i8A@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix rootfs transaction error when PACKAGECONFIG has polkit
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
X-List-Received-Date: Wed, 13 Sep 2017 22:05:08 -0000
Content-Type: multipart/alternative; boundary="001a113ef4305aac7a0559195ad7"

--001a113ef4305aac7a0559195ad7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, you're right it shouldn't use passwd/group from host.

I've tried to reproduce it in different build directory and now I see that
it properly adds polkitd user in do_prepare_recipe_sysroot task already:
OE @ ~ $ tail -n 15
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/temp/lo=
g.do_prepare_recipe_sysroot
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
DEBUG: Executing shell function useradd_sysroot
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot-native/usr/sbin/useradd
Running groupadd commands...
NOTE: systemd: Performing groupadd with [--root
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot
-r lock]
NOTE: systemd: Performing groupadd with [--root
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot
-r systemd-journal]
Running useradd commands...
NOTE: systemd: Performing useradd with [--root
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot
   --system -d / -M --shell /bin/nologin systemd-timesync]
NOTE: systemd: Performing useradd with [--root
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot
--system -d / -M --shell /bin/nologin systemd-network]
NOTE: systemd: Performing useradd with [--root
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot
 --system -d / -M --shell /bin/nologin systemd-resolve]
NOTE: systemd: Performing useradd with [--root
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot
--system --no-create-home --user-group --home-dir /etc/polkit-1 polkitd]
NOTE: systemd: Performing useradd with [--root
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot
 --system -d / -M --shell /bin/nologin systemd-bus-proxy]
DEBUG: Shell function useradd_sysroot finished
DEBUG: Python function useradd_sysroot_sstate finished

tomorrow I'll try to reproduce it in the directory where it failed before,
my guess is that in that build do_prepare_recipe_sysroot wasn't re-executed
correctly and unlike here:
OE @ ~ $ grep -R polkitd
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot/etc
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot/etc/group:polkitd:!:994:
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot/etc/group-:polkitd:!:994:
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot/etc/passwd-:polkitd:!:996:994::/etc/polkit-1:
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-=
sysroot/etc/passwd:polkitd:!:996:994::/etc/polkit-1:

or there might be another issue in pseudo or something like that.

Thanks


On Wed, Sep 13, 2017 at 2:40 PM, Jason Wessel <jason.wessel@windriver.com>
wrote:

> It should work because it has nothing to do with that particular passwd
> file.   This is builds successfully on a ubuntu 16.04 host which has no
> polkitd user.
>
> Also with the user add stanza in the patch it should be adding the user
> that is required when PACKAGECONFIG has the polkitd added to the psuedo
> passwd file.   We have quite a few configurations building properly.  Whe=
re
> I have seen transient failures before is when the -native sysroot does no=
t
> get rebuilt but that is typically with other recipes.
>
> Is this still a problem?
>
>
> Jason.
>
>
> On 09/06/2017 01:35 PM, Martin Jansa wrote:
>
> Does this work on hosts without polkitd user?
>
> Here it failed with:
>
> | chown: invalid user: =E2=80=98polkitd:root=E2=80=99
>
>
>
>
>
>
> On Tue, Aug 15, 2017 at 8:55 PM, Jason Wessel <jason.wessel@windriver.com=
>
> wrote:
>
>> The systemd 234 added some files to the polkit directory and the
>> directory the files live in must be owned by the polkitd user, else
>> you will receive the following error when the rootfs is being
>> assembled:
>>
>> Error: Transaction check error:
>>   file /usr/share/polkit-1/rules.d conflicts between attempted installs
>> of polkit-0.113-r0.15.core2_64 and systemd-1:234-r0.0.core2_64
>>
>> The fix similar to other packages such as libvirt where the user must
>> exist and the directory must be created with the proper attributes.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  meta/recipes-core/systemd/systemd_234.bb | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_234.bb
>> b/meta/recipes-core/systemd/systemd_234.bb
>> index ad7fc99b90..4560cf4175 100644
>> --- a/meta/recipes-core/systemd/systemd_234.bb
>> +++ b/meta/recipes-core/systemd/systemd_234.bb
>> @@ -245,6 +245,14 @@ do_install() {
>>                 ln -s ../run/systemd/resolve/resolv.conf
>> ${D}${sysconfdir}/resolv-conf.systemd
>>         fi
>>         install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETO=
N
>> ${D}${systemd_unitdir}/systemd-sysv-install
>> +
>> +       # If polkit is setup fixup permissions and ownership
>> +       if [ "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit',
>> '', d)}" =3D "polkit" ] ; then
>> +           if [ -d ${D}${datadir}/polkit-1/rules.d ] ; then
>> +               chmod 700 ${D}${datadir}/polkit-1/rules.d
>> +               chown polkitd:root ${D}${datadir}/polkit-1/rules.d
>> +           fi
>> +       fi
>>  }
>>
>>  do_install_ptest () {
>> @@ -308,6 +316,7 @@ USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACK=
AGECONFIG',
>> 'timesyncd', '--sy
>>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', ''=
,
>> d)}"
>>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '=
',
>> d)}"
>>  USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
>> 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', ''=
,
>> d)}"
>> +USERADD_PARAM_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'polkit=
',
>> '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-=
1
>> polkitd;', '', d)}"
>>  GROUPADD_PARAM_${PN} =3D "-r lock; -r systemd-journal"
>>  USERADD_PARAM_${PN}-extra-utils +=3D "--system -d / -M --shell
>> /bin/nologin systemd-bus-proxy;"
>>
>> --
>> 2.11.0
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

--001a113ef4305aac7a0559195ad7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, you&#39;re right it shouldn&#39;t use passwd/group fr=
om host.<div><br></div><div>I&#39;ve tried to reproduce it in different bui=
ld directory and now I see that it properly adds polkitd user in do_prepare=
_recipe_sysroot task already:</div><div><div>OE @ ~ $ tail -n 15 /OE/build/=
oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/temp/log.do_prepa=
re_recipe_sysroot</div><div>DEBUG: SITE files [&#39;endian-little&#39;, &#3=
9;common-linux&#39;, &#39;common-glibc&#39;, &#39;bit-64&#39;, &#39;x86_64-=
linux&#39;, &#39;common&#39;]</div><div>DEBUG: SITE files [&#39;endian-litt=
le&#39;, &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;bit-64&#39;, =
&#39;x86_64-linux&#39;, &#39;common&#39;]</div><div>DEBUG: Executing shell =
function useradd_sysroot</div><div>/OE/build/oe-core/tmp-glibc/work/core2-6=
4-oe-linux/systemd/1_234-r0/recipe-sysroot-native/usr/sbin/useradd</div><di=
v>Running groupadd commands...</div><div>NOTE: systemd: Performing groupadd=
 with [--root /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_=
234-r0/recipe-sysroot -r lock]</div><div>NOTE: systemd: Performing groupadd=
 with [--root /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_=
234-r0/recipe-sysroot=C2=A0 -r systemd-journal]</div><div>Running useradd c=
ommands...</div><div>NOTE: systemd: Performing useradd with [--root /OE/bui=
ld/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-sysroot=
=C2=A0 =C2=A0 =C2=A0--system -d / -M --shell /bin/nologin systemd-timesync]=
</div><div>NOTE: systemd: Performing useradd with [--root /OE/build/oe-core=
/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-sysroot=C2=A0 --s=
ystem -d / -M --shell /bin/nologin systemd-network]</div><div>NOTE: systemd=
: Performing useradd with [--root /OE/build/oe-core/tmp-glibc/work/core2-64=
-oe-linux/systemd/1_234-r0/recipe-sysroot=C2=A0 =C2=A0--system -d / -M --sh=
ell /bin/nologin systemd-resolve]</div><div>NOTE: systemd: Performing usera=
dd with [--root /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/=
1_234-r0/recipe-sysroot=C2=A0 --system --no-create-home --user-group --home=
-dir /etc/polkit-1 polkitd]</div><div>NOTE: systemd: Performing useradd wit=
h [--root /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-=
r0/recipe-sysroot=C2=A0 =C2=A0--system -d / -M --shell /bin/nologin systemd=
-bus-proxy]</div><div>DEBUG: Shell function useradd_sysroot finished</div><=
div>DEBUG: Python function useradd_sysroot_sstate finished</div></div><div>=
<br></div><div>tomorrow I&#39;ll try to reproduce it in the directory where=
 it failed before, my guess is that in that build do_prepare_recipe_sysroot=
 wasn&#39;t re-executed correctly and unlike here:</div><div><div>OE @ ~ $ =
grep -R polkitd /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/=
1_234-r0/recipe-sysroot/etc<br></div><div>/OE/build/oe-core/tmp-glibc/work/=
core2-64-oe-linux/systemd/1_234-r0/recipe-sysroot/etc/group:polkitd:!:994:<=
/div><div>/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd/1_234-=
r0/recipe-sysroot/etc/group-:polkitd:!:994:</div><div>/OE/build/oe-core/tmp=
-glibc/work/core2-64-oe-linux/systemd/1_234-r0/recipe-sysroot/etc/passwd-:p=
olkitd:!:996:994::/etc/polkit-1:</div><div>/OE/build/oe-core/tmp-glibc/work=
/core2-64-oe-linux/systemd/1_234-r0/recipe-sysroot/etc/passwd:polkitd:!:996=
:994::/etc/polkit-1:</div></div><div><br></div><div>or there might be anoth=
er issue in pseudo or something like that.</div><div><br></div><div>Thanks<=
/div><div><br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Wed, Sep 13, 2017 at 2:40 PM, Jason Wessel <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@wi=
ndriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <div class=3D"gmail-m_-529113778308613453moz-cite-prefix">It should wor=
k because it has nothing
      to do with that particular passwd file.=C2=A0=C2=A0 This is builds
      successfully on a ubuntu 16.04 host which has no polkitd user.<br>
      <br>
      Also with the user add stanza in the patch it should be adding the
      user that is required when PACKAGECONFIG has the polkitd added to
      the psuedo passwd file.=C2=A0=C2=A0 We have quite a few configuration=
s
      building properly.=C2=A0 Where I have seen transient failures before =
is
      when the -native sysroot does not get rebuilt but that is
      typically with other recipes. <br>
      <br>
      Is this still a problem? <br>
      <br>
      <br>
      Jason. <br>
      <br>
      <br>
      On 09/06/2017 01:35 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Does this work on hosts without polkitd user?
        <div><br>
        </div>
        <div>Here it failed with:</div>
        <div><br>
        </div>
        <div>
          <div>| chown: invalid user: =E2=80=98polkitd:root=E2=80=99</div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
        </div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On Tue, Aug 15, 2017 at 8:55 PM, Jason
          Wessel <span dir=3D"ltr">&lt;<a href=3D"mailto:jason.wessel@windr=
iver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote">The systemd 234 added some
            files to the polkit directory and the<br>
            directory the files live in must be owned by the polkitd
            user, else<br>
            you will receive the following error when the rootfs is
            being<br>
            assembled:<br>
            <br>
            Error: Transaction check error:<br>
            =C2=A0 file /usr/share/polkit-1/rules.d conflicts between
            attempted installs of polkit-0.113-r0.15.core2_64 and
            systemd-1:234-r0.0.core2_64<br>
            <br>
            The fix similar to other packages such as libvirt where the
            user must<br>
            exist and the directory must be created with the proper
            attributes.<br>
            <br>
            Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@=
windriver.com" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br>
            ---<br>
            =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_234.b=
b" rel=3D"noreferrer" target=3D"_blank">sys<wbr>temd_234.bb</a>
            | 9 +++++++++<br>
            =C2=A01 file changed, 9 insertions(+)<br>
            <br>
            diff --git a/meta/recipes-core/systemd/<a href=3D"http://system=
d_234.bb" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a>
            b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" r=
el=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
            index ad7fc99b90..4560cf4175 100644<br>
            --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.b=
b" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
            +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.b=
b" rel=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
            @@ -245,6 +245,14 @@ do_install() {<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s .=
./run/systemd/resolve/resolv.<wbr>conf
            ${D}${sysconfdir}/resolv-conf.<wbr>systemd<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm 0755 ${S}/src/systemctl=
/systemd-sys<wbr>v-install.SKELETON
            ${D}${systemd_unitdir}/systemd<wbr>-sysv-install<br>
            +<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0# If polkit is setup fixup permissi=
ons and ownership<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${@bb.utils.contains(&#3=
9;PACKAGE<wbr>CONFIG&#39;,
            &#39;polkit&#39;, &#39;polkit&#39;, &#39;&#39;, d)}&quot; =3D &=
quot;polkit&quot; ] ; then<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${datadir=
}/polkit-1/rules.<wbr>d ] ;
            then<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 7=
00 ${D}${datadir}/polkit-1/rules.<wbr>d<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chown p=
olkitd:root
            ${D}${datadir}/polkit-1/rules.<wbr>d<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
            =C2=A0}<br>
            <br>
            =C2=A0do_install_ptest () {<br>
            @@ -308,6 +316,7 @@ USERADD_PARAM_${PN} +=3D
            &quot;${@bb.utils.contains(&#39;PACKAGE<wbr>CONFIG&#39;, &#39;t=
imesyncd&#39;,
            &#39;--sy<br>
            =C2=A0USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;=
PACKAGE<wbr>CONFIG&#39;,
            &#39;networkd&#39;, &#39;--system -d / -M --shell /bin/nologin
            systemd-network;&#39;, &#39;&#39;, d)}&quot;<br>
            =C2=A0USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;=
PACKAGE<wbr>CONFIG&#39;,
            &#39;coredump&#39;, &#39;--system -d / -M --shell /bin/nologin
            systemd-coredump;&#39;, &#39;&#39;, d)}&quot;<br>
            =C2=A0USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;=
PACKAGE<wbr>CONFIG&#39;,
            &#39;resolved&#39;, &#39;--system -d / -M --shell /bin/nologin
            systemd-resolve;&#39;, &#39;&#39;, d)}&quot;<br>
            +USERADD_PARAM_${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKA=
GE<wbr>CONFIG&#39;,
            &#39;polkit&#39;, &#39;--system --no-create-home --user-group -=
-home-dir
            ${sysconfdir}/polkit-1 polkitd;&#39;, &#39;&#39;, d)}&quot;<br>
            =C2=A0GROUPADD_PARAM_${PN} =3D &quot;-r lock; -r systemd-journa=
l&quot;<br>
            =C2=A0USERADD_PARAM_${PN}-extra-uti<wbr>ls +=3D &quot;--system =
-d / -M
            --shell /bin/nologin systemd-bus-proxy;&quot;<span class=3D"gma=
il-HOEnZb"><font color=3D"#888888"><br>
            <span class=3D"gmail-m_-529113778308613453HOEnZb"><br>
              --<br>
              2.11.0<br>
              <br>
              --<br>
              ______________________________<wbr>_________________<br>
              Openembedded-core mailing list<br>
              <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
              <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            </span></font></span></blockquote><span class=3D"gmail-HOEnZb">=
<font color=3D"#888888">
        </font></span></div><span class=3D"gmail-HOEnZb"><font color=3D"#88=
8888">
        <br>
      </font></span></div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div><br></div></div>

--001a113ef4305aac7a0559195ad7--
