Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 74BE777EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 07:50:49 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g75so42824075wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 23:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kDa7kT34uLVKUiu+mw+1GXJwZeSUGSFuJfXDkaRh8lA=;
	b=OpxWHD+gNmkkCXZBiUejFTmzYQO1hhyMJSshXULAPQc049+D6tQ1NIvK1hVdK6pAjD
	deseAwAB/FrsH8PZWZdaUW7J23/B3L5hltkVhW44yAMGb7xanmw5CDCn5wUlm2+MV1hT
	HZH+cg8n9cGDwjqXXdzekA2nN097Miy66S+ryM52n5PdGsRT9IESQIuMt8aZ0Xq3qABS
	3eVIWI7lA0b5O/DrQRD30nYi6YL6F9TTimN6mzzi+Gv3tQsZwkou/HtypBQ4Y3wq22qX
	ivFnOOV3sRp5SVuIUKUwKEV9WO1/S3LmZRjlhsq80/dckRGymMKEVXrtU+0xXmTuYEUY
	qA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kDa7kT34uLVKUiu+mw+1GXJwZeSUGSFuJfXDkaRh8lA=;
	b=ACmTeeG/JxoCkEwq7ORfYaSf/aSrbFgtlTee47mdCuy0min+CflL573JJGdPMgvk84
	wYfdmH1EDR/sWlBec3tqkZSd/XXn3qgFpehs/Rf1Of+xNAPb72+UzfEyboYZdEcMPK4l
	90BcFYX9fzXI+02MD6TkrM7RXnZM8+woWV4EE+ojMgwlJYiekWr4rBDneOARNTc9LHCj
	WSj6JjYmUaTjGyDkxVB17CHXUyvf1doeE0qXbHFqVkbpCKjRKE2LXWb1/P8vsWhYWGQq
	MKSwotK9To+FsWJ0yJ9bX+/7Bb55JN+iCf1YuHT2AEvyow8RvPor9er1SH7Yu6ReVQWi
	ntqQ==
X-Gm-Message-State: AKGB3mKtG7CmWhWzSoNoC/8BUEGu8iFw3fZyxnaSkWLF3RFNVasEnDqN
	Fdu8Mgikg9W+mcDMUdLYKgQFeVAaGhoJ8X280Qg=
X-Google-Smtp-Source: ACJfBot07JbkY0j+qRfnG2r7qqeKBxsdc4grAe+UBJuqkxg/X0cb4kQb3ujoMHZ1O9uTLOL5Ja/zx9cVeWlTTBBV+EY=
X-Received: by 10.28.65.65 with SMTP id o62mr26884172wma.112.1514447450449;
	Wed, 27 Dec 2017 23:50:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Wed, 27 Dec 2017 23:50:49 -0800 (PST)
In-Reply-To: <65fe0d11-ecff-c982-a5b4-9c2559653012@windriver.com>
References: <20171228022126.219745-1-jibin.xu@windriver.com>
	<CA+chaQeUVEHAjLEGAVTxyr0JbBX5VTeaOeZsEL1ohhe7ijP7wg@mail.gmail.com>
	<65fe0d11-ecff-c982-a5b4-9c2559653012@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Dec 2017 08:50:49 +0100
Message-ID: <CA+chaQdBwU7HjBwtwMoyWjZYgQTmyM3n6q_2KpLWLNMsieYYhg@mail.gmail.com>
To: Jibin Xu <jibin.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontcache : fix build warning when using quemu usermode
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
X-List-Received-Date: Thu, 28 Dec 2017 07:50:50 -0000
Content-Type: multipart/alternative; boundary="001a114a444e50abe8056161c653"

--001a114a444e50abe8056161c653
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> No,some MACHINEs not support qemu usermode

That's not what I was asking.

You're disabling whole build-time postinst when qemu-usermode is in
MACHINE_FEATURES with:
${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false',
d)}

and in that case read-only images will fail to build and even if you remove
that error (failed postinst scripts are causing errors when the image is
configured to be read-only), then the image is still bad for runtime,
because with read-only rootfs you cannot generate fontcache even on the
device.


On Thu, Dec 28, 2017 at 8:42 AM, Jibin Xu <jibin.xu@windriver.com> wrote:

> I will send a right one for the typos.
>
> "Does this mean that MACHINEs which use qemu usermode won't be able to us=
e
> read-only images where this postinst cannot be executed on read-only
> rootfs?"
>
> No,some MACHINEs not support qemu usermode, when used, it will lead to a
> qemu core dump: "qemu: uncaught target signal 11 (Segmentation fault) -
> core dumped".
>
> so when use qemu usermode,check whether the machine supports it first.
>
> Thanks,
>
> Jibin
> On 2017=E5=B9=B412=E6=9C=8828=E6=97=A5 15:11, Martin Jansa wrote:
>
> There are 2 typos in "qemu".
>
> Does this mean that MACHINEs which use qemu usermode won't be able to use
> read-only images where this postinst cannot be executed on read-only root=
fs?
>
> On Thu, Dec 28, 2017 at 3:21 AM, Jibin Xu <jibin.xu@windriver.com> wrote:
>
>> fontcache uses quemu usermode by default, but some architecture
>> such as Intel skylake does not support qemu usermode, this can
>> lead to a build warning as below:
>> "WARNING: The postinstall intercept hook 'update_font_cache' failed".
>>
>> Add a judgement of qemu usermode to fix the build warning.
>>
>> Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
>> ---
>>  meta/classes/fontcache.bbclass | 18 +++++++++++-------
>>  1 file changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes/fontcache.bbclass
>> b/meta/classes/fontcache.bbclass
>> index e76331131e..3eb868fa08 100644
>> --- a/meta/classes/fontcache.bbclass
>> +++ b/meta/classes/fontcache.bbclass
>> @@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?=3D "-v"
>>  FONTCONFIG_CACHE_ENV ?=3D "FC_DEBUG=3D1"
>>  fontcache_common() {
>>  if [ -n "$D" ] ; then
>> -       $INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG}
>> mlprefix=3D${MLPREFIX} \
>> -               'bindir=3D"${bindir}"' \
>> -               'libdir=3D"${libdir}"' \
>> -               'base_libdir=3D"${base_libdir}"' \
>> -               'fontconfigcachedir=3D"${FONTCONFIG_CACHE_DIR}"' \
>> -               'fontconfigcacheparams=3D"${FONTCONFIG_CACHE_PARAMS}"' \
>> -               'fontconfigcacheenv=3D"${FONTCONFIG_CACHE_ENV}"'
>> +       if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode',
>> 'true','false', d)}; then
>> +               $INTERCEPT_DIR/postinst_intercept update_font_cache
>> ${PKG} mlprefix=3D${MLPREFIX} \
>> +                       'bindir=3D"${bindir}"' \
>> +                       'libdir=3D"${libdir}"' \
>> +                       'base_libdir=3D"${base_libdir}"' \
>> +                       'fontconfigcachedir=3D"${FONTCONFIG_CACHE_DIR}"'=
 \
>> +                       'fontconfigcacheparams=3D"${FONTCONFIG_CACHE_PAR=
AMS}"'
>> \
>> +                       'fontconfigcacheenv=3D"${FONTCONFIG_CACHE_ENV}"'
>> +       else
>> +               exit 1
>> +       fi
>>  else
>>         ${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
>>  fi
>> --
>> 2.13.0
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

--001a114a444e50abe8056161c653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8px">No,some MACHINE=
s not support qemu usermode</span><div><span style=3D"font-size:12.8px"><br=
></span></div><div><span style=3D"font-size:12.8px">That&#39;s not what I w=
as asking.</span></div><div><span style=3D"font-size:12.8px"><br></span></d=
iv><div><span style=3D"font-size:12.8px">You&#39;re disabling whole build-t=
ime postinst when qemu-usermode is in MACHINE_FEATURES with:</span></div><d=
iv><span style=3D"font-size:12.8px">${@bb.utils.contains(&#39;MACHINE_</spa=
n><wbr style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">FEATURES=
&#39;, &#39;qemu-usermode&#39;, &#39;true&#39;,&#39;false&#39;, d)}</span><=
span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-s=
ize:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">and in t=
hat case read-only images will fail to build and even if you remove that er=
ror (failed postinst scripts are causing errors when the image is configure=
d to be read-only), then the image is still bad for runtime, because with r=
ead-only rootfs you cannot generate fontcache even on the device.</span></d=
iv><div><span style=3D"font-size:12.8px"><br></span></div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Dec 28, 2017 at 8:4=
2 AM, Jibin Xu <span dir=3D"ltr">&lt;<a href=3D"mailto:jibin.xu@windriver.c=
om" target=3D"_blank">jibin.xu@windriver.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>I will send a right one for the typos.</p><span class=3D"">
    <p>&quot;Does this mean that MACHINEs which use qemu usermode won&#39;t=
 be
      able to use read-only images where this postinst cannot be
      executed on read-only rootfs?&quot;</p>
    </span><p>No,some MACHINEs not support qemu usermode, when used, it wil=
l
      lead to a qemu core dump: &quot;qemu: uncaught target signal 11
      (Segmentation fault) - core dumped&quot;.</p>
    <p>so when use qemu usermode,check whether the machine supports it
      first. <br>
    </p>
    <p>Thanks,</p>
    <p>Jibin<br>
    </p><div><div class=3D"h5">
    <div class=3D"m_5674333459630589526moz-cite-prefix">On 2017=E5=B9=B412=
=E6=9C=8828=E6=97=A5 15:11, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">There are 2 typos in &quot;qemu&quot;.
        <div><br>
        </div>
        <div>Does this mean that MACHINEs which use qemu usermode won&#39;t
          be able to use read-only images where this postinst cannot be
          executed on read-only rootfs?</div>
      </div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On Thu, Dec 28, 2017 at 3:21 AM, Jibin
          Xu <span dir=3D"ltr">&lt;<a href=3D"mailto:jibin.xu@windriver.com=
" target=3D"_blank">jibin.xu@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote">fontcache uses quemu usermode
            by default, but some architecture<br>
            such as Intel skylake does not support qemu usermode, this
            can<br>
            lead to a build warning as below:<br>
            &quot;WARNING: The postinstall intercept hook &#39;update_font_=
cache&#39;
            failed&quot;.<br>
            <br>
            Add a judgement of qemu usermode to fix the build warning.<br>
            <br>
            Signed-off-by: Jibin Xu &lt;<a href=3D"mailto:jibin.xu@windrive=
r.com" target=3D"_blank">jibin.xu@windriver.com</a>&gt;<br>
            ---<br>
            =C2=A0meta/classes/fontcache.<wbr>bbclass | 18 +++++++++++-----=
--<br>
            =C2=A01 file changed, 11 insertions(+), 7 deletions(-)<br>
            <br>
            diff --git a/meta/classes/fontcache.bbcla<wbr>ss
            b/meta/classes/fontcache.bbcla<wbr>ss<br>
            index e76331131e..3eb868fa08 100644<br>
            --- a/meta/classes/fontcache.bbcla<wbr>ss<br>
            +++ b/meta/classes/fontcache.bbcla<wbr>ss<br>
            @@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?=3D &quot;-v&quot;=
<br>
            =C2=A0FONTCONFIG_CACHE_ENV ?=3D &quot;FC_DEBUG=3D1&quot;<br>
            =C2=A0fontcache_common() {<br>
            =C2=A0if [ -n &quot;$D&quot; ] ; then<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERCEPT_DIR/postinst_inter<wbr>c=
ept
            update_font_cache ${PKG} mlprefix=3D${MLPREFIX} \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bi=
ndir=3D&quot;${bindir}&quot;&#39; \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;li=
bdir=3D&quot;${libdir}&quot;&#39; \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ba=
se_libdir=3D&quot;${base_libdir}&quot;<wbr>&#39; \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fo=
ntconfigcachedir=3D&quot;${FONTCO<wbr>NFIG_CACHE_DIR}&quot;&#39;
            \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fo=
ntconfigcacheparams=3D&quot;${FON<wbr>TCONFIG_CACHE_PARAMS}&quot;&#39;
            \<br>
            -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fo=
ntconfigcacheenv=3D&quot;${FONTCO<wbr>NFIG_CACHE_ENV}&quot;&#39;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;MACHIN=
E_<wbr>FEATURES&#39;,
            &#39;qemu-usermode&#39;, &#39;true&#39;,&#39;false&#39;, d)}; t=
hen<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERC=
EPT_DIR/postinst_inter<wbr>cept
            update_font_cache ${PKG} mlprefix=3D${MLPREFIX} \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;bindir=3D&quot;${bindir}&quot;&#39; \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;libdir=3D&quot;${libdir}&quot;&#39; \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;base_libdir=3D&quot;${base_libdir}&quot;<wbr>&#39=
; \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;fontconfigcachedir=3D&quot;${FONTCO<wbr>NFIG_CACH=
E_DIR}&quot;&#39;
            \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;fontconfigcacheparams=3D&quot;${FON<wbr>TCONFIG_C=
ACHE_PARAMS}&quot;&#39;
            \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&#39;fontconfigcacheenv=3D&quot;${FONTCO<wbr>NFIG_CACH=
E_ENV}&quot;&#39;<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<=
br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
            =C2=A0else<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${FONTCONFIG_CACHE_ENV} fc-cache
            ${FONTCONFIG_CACHE_PARAMS}<br>
            =C2=A0fi<br>
            <span class=3D"m_5674333459630589526HOEnZb">--<br>
              2.13.0<br>
              <br>
              --<br>
              ______________________________<wbr>_________________<br>
              Openembedded-core mailing list<br>
              <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
              <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
            </span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--001a114a444e50abe8056161c653--
