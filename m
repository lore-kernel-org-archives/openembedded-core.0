Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id A6A5F7970D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Sep 2018 22:58:26 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id o18-v6so19549497wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Sep 2018 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b6Gwpq0GIUv2b3WQ6XNrPl3+L2V7a4+N7gTUR5bGVXY=;
	b=R7XJlmocGg6h2he1NEatquQelP1weUu1ouVMO6uT2ZDzNxc89z5JvSMziOL1GHiqwY
	cQOCA+y5ugRJ283ss7YAE3wNicmf9Vp7p/P5vGbjlrFCy/ZZ1K42jnXboPdBA84Tvq3v
	8cZpXIiVvf90BI+wBgFwL35zIE5k/ktLjKsWSwR7EtcknvgeJRDU0VBtAMdcQTI+O643
	oqVE0MuQLQl2IIuTpE0e9jxbZpV7tNU1zNsHX9e5skt6dHnR8XazN7QXn41qMwohkbNC
	WOwmLNlDTcG7nWbgG6ebGa7PU2HgX7pDKPGH9Xob5sxlTqEHl3xch0ChJMmZTr3Wduso
	IjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b6Gwpq0GIUv2b3WQ6XNrPl3+L2V7a4+N7gTUR5bGVXY=;
	b=DV1KFXcs2q3rLvrqw27EunoIy9g+419YS0TBiIaZmLx3PXibqLJSz0/bJrlxxf1vNK
	D8xzjIARa0iVaJNnshNbna2w2OnGdhALeBnYnLmT7pN0cV9Trku6h+Ds929u7OZQo032
	sDswisJSGi+Y2clMSMPvEb3PtzN4kRTodYl9BLrSMNTEWF/y8iIU9PYyh52PYA/mzDV0
	2aLrY9CPCY3D48LiwJnCPWd0Udc1tQEh1NoJmXxAGPvya+bOmKV9MYg6DTlb0l920blw
	qwhgQQX+/OjSxhM3tLrHQLtddU0P40AXNJAoFVQpHh0Exg5uMre2tXLSJ89vsTQxGD3h
	YdiQ==
X-Gm-Message-State: APzg51Dz9EjNAv1CgcRVyBcNSAuuNG0pr+9iq9ElhMjHbouK3I8U+qFv
	PWHvOmQb3UOeoVmQuu6wsWwTAgYtaI5lEgCZCBj/P2zi
X-Google-Smtp-Source: ANB0VdZi104KSJkfUKGg+32KwJRnrHHPUTPq6vcCYMP23umJvUP7JF31lLU72KUaUpYDZqCFmat825TF3eOyu15q9sM=
X-Received: by 2002:a1c:8f0e:: with SMTP id
	r14-v6mr11751352wmd.79.1536533907073; 
	Sun, 09 Sep 2018 15:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535216766.git.kai.kang@windriver.com>
	<55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
	<CA+chaQfurea5vwojwt6fgzNvhUfRDF9HmPf_YFBhgEGhQPO2dA@mail.gmail.com>
	<4800fed2-8a51-7bb0-b6c6-fa1402289831@windriver.com>
	<ab609cc5-dd34-bbc1-294f-be6985a30a2a@windriver.com>
	<CA+chaQfWbCDxvytN8-akLY7B4Ymo7HnGU4s2CL=u4BahZ+bCfw@mail.gmail.com>
In-Reply-To: <CA+chaQfWbCDxvytN8-akLY7B4Ymo7HnGU4s2CL=u4BahZ+bCfw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 10 Sep 2018 00:58:15 +0200
Message-ID: <CA+chaQdRbdwPWYKZMmWzHwLv4vRd=79dTCrEE4sepvE=5-RRGg@mail.gmail.com>
To: Kai Kang <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] update_font_cache: update script for multilib
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
X-List-Received-Date: Sun, 09 Sep 2018 22:58:27 -0000
Content-Type: multipart/alternative; boundary="000000000000b76f790575782d48"

--000000000000b76f790575782d48
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And it fails in regular image build as well, because of qemu segfault:

NOTE: > Executing update_gio_module_cache intercept ...
NOTE: Exit code 139. Output:
+ [ True =3D False ]
+ qemu-i386 -r 3.2.0 -E
LD_LIBRARY_PATH=3DWORKDIR/rootfs/usr/lib:WORKDIR/rootfs/lib -L WORKDIR/root=
fs
WORKDIR/rootfs/usr/libexec/gio-querymodules
WORKDIR/rootfs/usr/lib/gio/modules/
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault

ERROR: The postinstall intercept hook 'update_gio_module_cache' failed,
details in WORKDIR/temp/log.do_rootfs


On Sun, Sep 9, 2018 at 10:39 PM Martin Jansa <martin.jansa@gmail.com> wrote=
:

> I'm still able to reproduce the issue in my builds, I'll find out what's
> different here.
>
> It fails because of missing nativesdk-qemuwrapper here:
>
> NOTE: Running intercept scripts:
> NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
> NOTE: Exit code 127. Output:
> SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6=
b676ebe12fb99/update_gio_module_cache-nativesdk:
> 10:
> SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6=
b676ebe12fb99/update_gio_module_cache-nativesdk:
> nativesdk-qemuwrapper: not found
>
> WARNING: The postinstall intercept hook
> 'update_gio_module_cache-nativesdk' failed, details in
> SDK/temp/log.do_populate_sdk
>
>
> On Thu, Sep 6, 2018 at 5:28 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
>> On 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 18:02, Kang Kai wrote:
>>
>> On 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 17:44, Martin Jansa wrote:
>>
>> Hi Kai,
>>
>> do you have similar fix for update_gio_module_cache intercept? It seems
>> to fail similarly with multilib enabled.
>>
>>
>> The fix is from script update_gio_module_cache, so I thought it works an=
d
>> didn't meet the failure. I'll check it.
>>
>> Hi Martin,
>>
>> It has been done by
>> http://git.openembedded.org/openembedded-core/commit/?id=3D1f53140528d79=
c38d4f3a82cd0a03bd0ddc87275
>> Add lib23-gconf to image which inherits gio-module-cache, then build
>> image successfully.
>>
>> Regards,
>> Kai
>>
>>
>>
>> Thanks,
>> Kai
>>
>>
>> Regards,
>>
>> On Sat, Aug 25, 2018 at 7:14 PM Kai Kang <kai.kang@windriver.com> wrote:
>>
>>> Packages which inherit fontcache.bbclass call postinstall script
>>> update_font_cache. And in update_font_cache, it calls ${bindir}/fc-cach=
e
>>> by qemuwrapper. When multilib is enabled, both packages foo and lib32-f=
oo
>>> will call ${bindir}/fc-cache and one of them will fail to run obviously=
.
>>>
>>> Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and
>>> call proper fc-cache in update_font_cache.
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>  meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 8 +++++++-
>>>  scripts/postinst-intercepts/update_font_cache         | 2 +-
>>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>> index d4cbce80b45..db36c867741 100644
>>> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>>> @@ -35,9 +35,15 @@ do_configure_prepend() {
>>>      rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
>>>  }
>>>
>>> +do_install_append_class-target() {
>>> +    # duplicate fc-cache for postinstall script
>>> +    mkdir -p ${D}${libexecdir}
>>> +    cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
>>> +}
>>> +
>>>  PACKAGES =3D+ "fontconfig-utils"
>>>  FILES_${PN} =3D+ "${datadir}/xml/*"
>>> -FILES_fontconfig-utils =3D "${bindir}/*"
>>> +FILES_fontconfig-utils =3D "${bindir}/* ${libexecdir}/*"
>>>
>>>  # Work around past breakage in debian.bbclass
>>>  RPROVIDES_fontconfig-utils =3D "libfontconfig-utils"
>>> diff --git a/scripts/postinst-intercepts/update_font_cache
>>> b/scripts/postinst-intercepts/update_font_cache
>>> index 20e9048adfc..e0ec471964c 100644
>>> --- a/scripts/postinst-intercepts/update_font_cache
>>> +++ b/scripts/postinst-intercepts/update_font_cache
>>> @@ -2,5 +2,5 @@
>>>
>>>  set -e
>>>
>>> -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheen=
v}
>>> $D${bindir}/fc-cache --sysroot=3D$D --system-only ${fontconfigcachepara=
ms}
>>> +PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheen=
v}
>>> $D${libexecdir}/${binprefix}fc-cache --sysroot=3D$D --system-only
>>> ${fontconfigcacheparams}
>>>  chown -R root:root $D${fontconfigcachedir}
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>> --
>> Regards,
>> Neil | Kai Kang
>>
>>
>> --
>> Regards,
>> Neil | Kai Kang
>>
>>

--000000000000b76f790575782d48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>And it fails in regular image build =
as well, because of qemu segfault:</div><div><br></div><div>NOTE: &gt; Exec=
uting update_gio_module_cache intercept ...</div><div>NOTE: Exit code 139. =
Output:</div><div>+ [ True =3D False ]</div><div>+ qemu-i386 -r 3.2.0 -E LD=
_LIBRARY_PATH=3DWORKDIR/rootfs/usr/lib:WORKDIR/rootfs/lib -L WORKDIR/rootfs=
 WORKDIR/rootfs/usr/libexec/gio-querymodules WORKDIR/rootfs/usr/lib/gio/mod=
ules/</div><div>qemu: uncaught target signal 11 (Segmentation fault) - core=
 dumped</div><div>Segmentation fault</div><div><br></div><div>ERROR: The po=
stinstall intercept hook &#39;update_gio_module_cache&#39; failed, details =
in WORKDIR/temp/log.do_rootfs</div><div><br></div></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Sun, Sep 9, 2018 at 10:39 PM Martin J=
ansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr">I&#39;m still able to reproduce the issue in my builds, I&#39;=
ll find out what&#39;s different here.<div><br></div><div>It fails because =
of missing nativesdk-qemuwrapper here:</div><div><br></div><div><div>NOTE: =
Running intercept scripts:</div><div>NOTE: &gt; Executing update_gio_module=
_cache-nativesdk intercept ...</div><div>NOTE: Exit code 127. Output:</div>=
<div>SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84c=
fd6b676ebe12fb99/update_gio_module_cache-nativesdk: 10: SDK/intercept_scrip=
ts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6b676ebe12fb99/update_=
gio_module_cache-nativesdk: nativesdk-qemuwrapper: not found</div><div><br>=
</div><div>WARNING: The postinstall intercept hook &#39;update_gio_module_c=
ache-nativesdk&#39; failed, details in SDK/temp/log.do_populate_sdk</div></=
div><div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Thu, Sep 6, 2018 at 5:28 PM Kang Kai &lt;<a href=3D"mailto:Kai.Kang@=
windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"m_-2700466882960693652m_7851569581499868850moz-cite-prefi=
x">On 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 18:02, Kang Kai wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div class=3D"m_-2700466882960693652m_7851569581499868850moz-cite-pre=
fix">On 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 17:44, Martin Jansa
        wrote:<br>
      </div>
      <blockquote type=3D"cite">
        <div dir=3D"ltr">
          <div dir=3D"ltr">Hi Kai,
            <div><br>
            </div>
            <div>do you have similar fix for=C2=A0update_gio_module_cache
              intercept? It seems to fail similarly with multilib
              enabled.</div>
          </div>
        </div>
      </blockquote>
      <br>
      The fix is from script update_gio_module_cache, so I thought it
      works and didn&#39;t meet the failure. I&#39;ll check it.<br>
    </blockquote>
    Hi Martin,<br>
    <br>
    It has been done by
<a class=3D"m_-2700466882960693652m_7851569581499868850moz-txt-link-freetex=
t" href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D1f531=
40528d79c38d4f3a82cd0a03bd0ddc87275" target=3D"_blank">http://git.openembed=
ded.org/openembedded-core/commit/?id=3D1f53140528d79c38d4f3a82cd0a03bd0ddc8=
7275</a><br>
    Add lib23-gconf to image which inherits gio-module-cache, then build
    image successfully.<br>
    <br>
    Regards,<br>
    Kai<br>
    <br>
    <br>
    <blockquote type=3D"cite"> <br>
      Thanks,<br>
      Kai<br>
      <br>
      <blockquote type=3D"cite">
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div><br>
            </div>
            <div>Regards,</div>
          </div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr">On Sat, Aug 25, 2018 at 7:14 PM Kai Kang &lt;<a =
href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver=
.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Packages
            which inherit fontcache.bbclass call postinstall script<br>
            update_font_cache. And in update_font_cache, it calls
            ${bindir}/fc-cache<br>
            by qemuwrapper. When multilib is enabled, both packages foo
            and lib32-foo<br>
            will call ${bindir}/fc-cache and one of them will fail to
            run obviously.<br>
            <br>
            Duplicate install file fc-cache to ${libexecdir} with
            ${MLPREFIX} and<br>
            call proper fc-cache in update_font_cache.<br>
            <br>
            Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windrive=
r.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
            ---<br>
            =C2=A0meta/recipes-graphics/fontconfig/<a href=3D"http://fontco=
nfig_2.12.6.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</=
a>
            | 8 +++++++-<br>
            =C2=A0scripts/postinst-intercepts/update_font_cache=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2
            +-<br>
            =C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
            <br>
            diff --git a/meta/recipes-graphics/fontconfig/<a href=3D"http:/=
/fontconfig_2.12.6.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12=
.6.bb</a>
            b/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig=
_2.12.6.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</a><b=
r>
            index d4cbce80b45..db36c867741 100644<br>
            --- a/meta/recipes-graphics/fontconfig/<a href=3D"http://fontco=
nfig_2.12.6.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</=
a><br>
            +++ b/meta/recipes-graphics/fontconfig/<a href=3D"http://fontco=
nfig_2.12.6.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.6.bb</=
a><br>
            @@ -35,9 +35,15 @@ do_configure_prepend() {<br>
            =C2=A0 =C2=A0 =C2=A0rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjs=
hash.gperf<br>
            =C2=A0}<br>
            <br>
            +do_install_append_class-target() {<br>
            +=C2=A0 =C2=A0 # duplicate fc-cache for postinstall script<br>
            +=C2=A0 =C2=A0 mkdir -p ${D}${libexecdir}<br>
            +=C2=A0 =C2=A0 cp ${D}${bindir}/fc-cache
            ${D}${libexecdir}/${MLPREFIX}fc-cache<br>
            +}<br>
            +<br>
            =C2=A0PACKAGES =3D+ &quot;fontconfig-utils&quot;<br>
            =C2=A0FILES_${PN} =3D+ &quot;${datadir}/xml/*&quot;<br>
            -FILES_fontconfig-utils =3D &quot;${bindir}/*&quot;<br>
            +FILES_fontconfig-utils =3D &quot;${bindir}/* ${libexecdir}/*&q=
uot;<br>
            <br>
            =C2=A0# Work around past breakage in debian.bbclass<br>
            =C2=A0RPROVIDES_fontconfig-utils =3D &quot;libfontconfig-utils&=
quot;<br>
            diff --git a/scripts/postinst-intercepts/update_font_cache
            b/scripts/postinst-intercepts/update_font_cache<br>
            index 20e9048adfc..e0ec471964c 100644<br>
            --- a/scripts/postinst-intercepts/update_font_cache<br>
            +++ b/scripts/postinst-intercepts/update_font_cache<br>
            @@ -2,5 +2,5 @@<br>
            <br>
            =C2=A0set -e<br>
            <br>
            -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E
            ${fontconfigcacheenv} $D${bindir}/fc-cache --sysroot=3D$D
            --system-only ${fontconfigcacheparams}<br>
            +PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E
            ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache
            --sysroot=3D$D --system-only ${fontconfigcacheparams}<br>
            =C2=A0chown -R root:root $D${fontconfigcachedir}<br>
            -- <br>
            2.11.0<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href=3D"mailto:Openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
            <a href=3D"http://lists.openembedded.org/mailman/listinfo/opene=
mbedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedde=
d.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"m_-2700466882960693652m_7851569581499868850moz-signatur=
e" cols=3D"72">--=20
Regards,
Neil | Kai Kang</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"m_-2700466882960693652m_7851569581499868850moz-signature"=
 cols=3D"72">--=20
Regards,
Neil | Kai Kang</pre>
  </div>

</blockquote></div>
</blockquote></div>

--000000000000b76f790575782d48--
