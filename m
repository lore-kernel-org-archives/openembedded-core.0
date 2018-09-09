Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD7B79718
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Sep 2018 20:39:17 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z96-v6so19769367wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Sep 2018 13:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zvQ6ck2X4yW6leCHtxXcInRUgAHlYW+dD3OYmafhbXk=;
	b=IoYI5cRyvbDKTIvkgNjmZ0RYta5zjvS3PXfCVcJPsu5nOs1nJ/mKgionDyHsb72kyg
	rL6mnz1hWYW0BcwAERYdZsAS48yqzBYuW6MOxLqi9Z4tnhTA8kq0swei5IKoR6Pz+dkg
	yp1rlXQgPNGeu/wjX36EUxyjFPTKuVZRGP3rqZrKTS3d+8Jp7X9/+vZgdB75Ue2Jd2jx
	xUCWulRJ4yS/V+E0svnimM/AMDN0IPKawDSWnNrZZ+PqELqBzeWODZiFKAWFFIqMETmm
	fePjbVPWCAt1ew4jtr4c3XwV/rbKWBbbsu98A5QuaiYu8zy6VGH2nIolDoXpW4P9spB0
	uMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zvQ6ck2X4yW6leCHtxXcInRUgAHlYW+dD3OYmafhbXk=;
	b=l9g8jrDG8HJQ4/5fsAd0VLtKEiks2xNM6bC3HgSgcfufAtsQ9a6b1ZOe75o0prae6E
	s4s5JvOBozYfLdtIMqYpOSk1dS5IimgZ8iS3H+qhehd4pIP7gqc9NrRGrBHDvTWhoUOW
	gKB1VxcOEilcgnF0FfYVhmKmop2IMGxVOJsvAa+nExrbUGjm32sunjPEkpE33RZDA7K0
	w73ypcIavr1TB6ntMjwoD75cKmjV0lJoUcsZbyZ1td2K3kKzuCTrrxGgyF/hylLDtsq9
	DMoD4AzOud3QhpgPPHVnDAnWNSD8B4oGhYNBPojtN8vV2+PiCugHnzBMA0ccQ6brZSAg
	+rCw==
X-Gm-Message-State: APzg51DwjlCxr6BE+Z4dYhIY1jSXB8AqBw/skhubhgYPhEwNRK4t1pzA
	H/KX0KeqxmwdhIMFDfL9UxdbwVowi2jskryM7Lw=
X-Google-Smtp-Source: ANB0VdZDsPIdXCIrZq/Ek/E2u4calqqin5xYWNvpIzE3rrOSSmYEJjqLxUCrpEx5vvGwd9LcCi+j9nSWV4IlQMK1vSA=
X-Received: by 2002:adf:8567:: with SMTP id
	94-v6mr13343366wrh.223.1536525558470; 
	Sun, 09 Sep 2018 13:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535216766.git.kai.kang@windriver.com>
	<55b7afd2fc5b383ab482f4b004e38cb0797ca29c.1535216766.git.kai.kang@windriver.com>
	<CA+chaQfurea5vwojwt6fgzNvhUfRDF9HmPf_YFBhgEGhQPO2dA@mail.gmail.com>
	<4800fed2-8a51-7bb0-b6c6-fa1402289831@windriver.com>
	<ab609cc5-dd34-bbc1-294f-be6985a30a2a@windriver.com>
In-Reply-To: <ab609cc5-dd34-bbc1-294f-be6985a30a2a@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 9 Sep 2018 22:39:07 +0200
Message-ID: <CA+chaQfWbCDxvytN8-akLY7B4Ymo7HnGU4s2CL=u4BahZ+bCfw@mail.gmail.com>
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
X-List-Received-Date: Sun, 09 Sep 2018 20:39:18 -0000
Content-Type: multipart/alternative; boundary="00000000000019dabe0575763c8b"

--00000000000019dabe0575763c8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm still able to reproduce the issue in my builds, I'll find out what's
different here.

It fails because of missing nativesdk-qemuwrapper here:

NOTE: Running intercept scripts:
NOTE: > Executing update_gio_module_cache-nativesdk intercept ...
NOTE: Exit code 127. Output:
SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6b6=
76ebe12fb99/update_gio_module_cache-nativesdk:
10:
SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6b6=
76ebe12fb99/update_gio_module_cache-nativesdk:
nativesdk-qemuwrapper: not found

WARNING: The postinstall intercept hook 'update_gio_module_cache-nativesdk'
failed, details in SDK/temp/log.do_populate_sdk


On Thu, Sep 6, 2018 at 5:28 PM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 18:02, Kang Kai wrote:
>
> On 2018=E5=B9=B409=E6=9C=8804=E6=97=A5 17:44, Martin Jansa wrote:
>
> Hi Kai,
>
> do you have similar fix for update_gio_module_cache intercept? It seems t=
o
> fail similarly with multilib enabled.
>
>
> The fix is from script update_gio_module_cache, so I thought it works and
> didn't meet the failure. I'll check it.
>
> Hi Martin,
>
> It has been done by
> http://git.openembedded.org/openembedded-core/commit/?id=3D1f53140528d79c=
38d4f3a82cd0a03bd0ddc87275
> Add lib23-gconf to image which inherits gio-module-cache, then build imag=
e
> successfully.
>
> Regards,
> Kai
>
>
>
> Thanks,
> Kai
>
>
> Regards,
>
> On Sat, Aug 25, 2018 at 7:14 PM Kai Kang <kai.kang@windriver.com> wrote:
>
>> Packages which inherit fontcache.bbclass call postinstall script
>> update_font_cache. And in update_font_cache, it calls ${bindir}/fc-cache
>> by qemuwrapper. When multilib is enabled, both packages foo and lib32-fo=
o
>> will call ${bindir}/fc-cache and one of them will fail to run obviously.
>>
>> Duplicate install file fc-cache to ${libexecdir} with ${MLPREFIX} and
>> call proper fc-cache in update_font_cache.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb | 8 +++++++-
>>  scripts/postinst-intercepts/update_font_cache         | 2 +-
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> index d4cbce80b45..db36c867741 100644
>> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
>> @@ -35,9 +35,15 @@ do_configure_prepend() {
>>      rm -f ${S}/src/fcobjshash.h ${S}/src/fcobjshash.gperf
>>  }
>>
>> +do_install_append_class-target() {
>> +    # duplicate fc-cache for postinstall script
>> +    mkdir -p ${D}${libexecdir}
>> +    cp ${D}${bindir}/fc-cache ${D}${libexecdir}/${MLPREFIX}fc-cache
>> +}
>> +
>>  PACKAGES =3D+ "fontconfig-utils"
>>  FILES_${PN} =3D+ "${datadir}/xml/*"
>> -FILES_fontconfig-utils =3D "${bindir}/*"
>> +FILES_fontconfig-utils =3D "${bindir}/* ${libexecdir}/*"
>>
>>  # Work around past breakage in debian.bbclass
>>  RPROVIDES_fontconfig-utils =3D "libfontconfig-utils"
>> diff --git a/scripts/postinst-intercepts/update_font_cache
>> b/scripts/postinst-intercepts/update_font_cache
>> index 20e9048adfc..e0ec471964c 100644
>> --- a/scripts/postinst-intercepts/update_font_cache
>> +++ b/scripts/postinst-intercepts/update_font_cache
>> @@ -2,5 +2,5 @@
>>
>>  set -e
>>
>> -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv=
}
>> $D${bindir}/fc-cache --sysroot=3D$D --system-only ${fontconfigcacheparam=
s}
>> +PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E ${fontconfigcacheenv=
}
>> $D${libexecdir}/${binprefix}fc-cache --sysroot=3D$D --system-only
>> ${fontconfigcacheparams}
>>  chown -R root:root $D${fontconfigcachedir}
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
> --
> Regards,
> Neil | Kai Kang
>
>
> --
> Regards,
> Neil | Kai Kang
>
>

--00000000000019dabe0575763c8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I&#39;m still able to reproduce the issue=
 in my builds, I&#39;ll find out what&#39;s different here.<div><br></div><=
div>It fails because of missing nativesdk-qemuwrapper here:</div><div><br><=
/div><div><div>NOTE: Running intercept scripts:</div><div>NOTE: &gt; Execut=
ing update_gio_module_cache-nativesdk intercept ...</div><div>NOTE: Exit co=
de 127. Output:</div><div>SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1=
df1e231252a4e81ebd84cfd6b676ebe12fb99/update_gio_module_cache-nativesdk: 10=
: SDK/intercept_scripts-b9d7b319af0f1ca17a1619924c1df1e231252a4e81ebd84cfd6=
b676ebe12fb99/update_gio_module_cache-nativesdk: nativesdk-qemuwrapper: not=
 found</div><div><br></div><div>WARNING: The postinstall intercept hook &#3=
9;update_gio_module_cache-nativesdk&#39; failed, details in SDK/temp/log.do=
_populate_sdk</div></div><div><br></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Thu, Sep 6, 2018 at 5:28 PM Kang Kai &lt;<a hre=
f=3D"mailto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"m_7851569581499868850moz-cite-prefix">On 2018=E5=B9=B409=
=E6=9C=8804=E6=97=A5 18:02, Kang Kai wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div class=3D"m_7851569581499868850moz-cite-prefix">On 2018=E5=B9=B40=
9=E6=9C=8804=E6=97=A5 17:44, Martin Jansa
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
<a class=3D"m_7851569581499868850moz-txt-link-freetext" href=3D"http://git.=
openembedded.org/openembedded-core/commit/?id=3D1f53140528d79c38d4f3a82cd0a=
03bd0ddc87275" target=3D"_blank">http://git.openembedded.org/openembedded-c=
ore/commit/?id=3D1f53140528d79c38d4f3a82cd0a03bd0ddc87275</a><br>
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
      <pre class=3D"m_7851569581499868850moz-signature" cols=3D"72">--=20
Regards,
Neil | Kai Kang</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"m_7851569581499868850moz-signature" cols=3D"72">--=20
Regards,
Neil | Kai Kang</pre>
  </div>

</blockquote></div>

--00000000000019dabe0575763c8b--
