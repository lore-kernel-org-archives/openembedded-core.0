Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD1A60745
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 13:46:10 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id y3so1988307wrh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 05:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uFAVp1iJKOJwjEByTSJ1/jvPwFde0MzzRUTxh+wKvrs=;
	b=SITAVoFII7B3/3JekRMC+6N7XKgt3/oGwKV4wednO1lYEXvLFiB5QWrUiSBQdYail3
	4OHe7lwXgZb4bixQQ2uREZNdjcriDoxnYijzLVTJr/UCEApzU9B27KQK5jBnr9kDpXNC
	hFRLVZLq3tliDj+aGR3U0wGlVvcTwAmXFY4TilwmHvHwYtG7ub77V1oKPNHdy0s+VLur
	e1O83BHcUYE02kHG5xxpIaUo+HS34eHokEMIUdD8Ynww2lbOLLanReP/3PNKEp2v45+9
	50VFYb0IjuL1xGFZ+O1DcoBsYcanzSHaqx8hAjM/ZKtCH3rOmtaN5P/VdmWx9sM9ukPr
	RujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uFAVp1iJKOJwjEByTSJ1/jvPwFde0MzzRUTxh+wKvrs=;
	b=nbsmeAES5/lerkY8TgwrOhq/g0Oz0zdc2WbiYtKRkSpC0Oem+Sb4UTLTh3n4HimjSd
	v3cocVJloyiV4aWKurZjg91c/7NXKWjIt9qdcp0A5dzGynYJNN+Tbi5dl0iyZKQrKE3N
	zz8+JbE/9a/GWMi+UYpITk1BlhhJFCqYWRQ+Nu1Kf2rMHlD3MpxA4HxPNp8Iab9etQff
	z/aOS75sOF0IowlHev7ocNO/CKqvL1Rj8LF8xs7kBlWLGQPOmvWo6/8Yzlm+ZYNgxX6A
	bPO/tcRMduvK8Il+/rfWvHIwcuZU0NO9lMkWrN5+/iZncw6TiatUr04hFMNL3Mnp6J1K
	3FDg==
X-Gm-Message-State: APf1xPBPsM3nLDUcXmpcK/W8K6sGDUnpsR+syu+XckMutyxgHDnsGHHn
	XuHMpQ4IU3gyY+YZRpUsGlOGAVY0CWCOjHPkxCg=
X-Google-Smtp-Source: AH8x227VnYIVhHPjQQqJJgfhYr+5WwoyLwpCOZ84OUZJg2Ki3mDTqrtkyppFQfDqV+lLih0O4DE3Wm3T8SbxVBBj5Jo=
X-Received: by 10.223.195.78 with SMTP id e14mr2275170wrg.68.1517924771803;
	Tue, 06 Feb 2018 05:46:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 6 Feb 2018 05:46:11 -0800 (PST)
In-Reply-To: <CAJTo0LYjiyxqvM-4qNJOZGJ_eYBhf=JkA4WFCjfmzLO=YyY-0g@mail.gmail.com>
References: <20180201143405.17663-1-Martin.Jansa@gmail.com>
	<CAJTo0LYjiyxqvM-4qNJOZGJ_eYBhf=JkA4WFCjfmzLO=YyY-0g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 6 Feb 2018 14:46:11 +0100
Message-ID: <CA+chaQdBp4v4kBLcx==wzR2ORzKen29_+HgvzAfSrkAF9tw+6g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] libpam: be more strict about user's sanity
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
X-List-Received-Date: Tue, 06 Feb 2018 13:46:11 -0000
Content-Type: multipart/alternative; boundary="f403045fa746d1ba2c05648b66ff"

--f403045fa746d1ba2c05648b66ff
Content-Type: text/plain; charset="UTF-8"

I'm sorry, I haven't seen this one, because I have packagegroup-core-lsb
blacklisted for long time.

What is preferred fix?
1) add the same restriction to packagegroup-core-lsb and core-image-lsb and
someone will fix poky-lsb build (it doesn't seem like separate distro), to
include pam in DISTRO_FEATURES.
2) include libpam and pam-plugin-wheel in packagegroup-core-lbs
(and RDEPENDS_packagegroup-core-lsb-runtime-add) only when pam is in
DISTRO_FEATURES?

The warning says that libpam is broken without pam in DISTRO_FEATURES, I'm
not sure how much LSB tests exercise it, but if the warning is correct,
then it was broken in poky-lsb builds runtime already.

Regards,

On Mon, Feb 5, 2018 at 12:54 PM, Burton, Ross <ross.burton@intel.com> wrote:

> This breaks world builds on the autobuilder with poky-lsb:
>
> https://autobuilder.yocto.io/builders/nightly-world/builds/
> 736/steps/BuildImages/logs/stdio
>
> Ross
>
> On 1 February 2018 at 14:34, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> * replace do_pam_sanity function with distro_features_check inherit
>> * fixes:
>>   WARNING: libpam-1.3.0-r5 do_pam_sanity: Building libpam but 'pam' isn't
>> in DISTRO_FEATURES, PAM won't work correctly
>>   in world builds and prevents user to build libpam at all without pam
>>   in DISTRO_FEATURES, I don't see any users of this which wouldn't respect
>>   pam in DISTRO_FEATURES
>> * only libuser is depending on libpam without respecting DISTRO_FEATURES
>> * there are few recipes in meta-oe layers depending on libpam without
>>   respecting DISTRO_FEATURES, I've sent patch for them:
>>   samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam,
>> smbnetfs
>>   and omxplayer in meta-raspberrypi, I've sent PR for that one:
>>   https://github.com/agherzan/meta-raspberrypi/pull/192
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-extended/libuser/libuser_0.62.bb | 3 +++
>>  meta/recipes-extended/pam/libpam_1.3.0.bb     | 7 ++-----
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb
>> b/meta/recipes-extended/libuser/libuser_0.62.bb
>> index 1765346646..7ec54eb16e 100644
>> --- a/meta/recipes-extended/libuser/libuser_0.62.bb
>> +++ b/meta/recipes-extended/libuser/libuser_0.62.bb
>> @@ -22,6 +22,9 @@ SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33e
>> eea961109dd60d4b40b6a9df4fa3c
>>
>>  DEPENDS = "popt libpam glib-2.0 python3"
>>
>> +inherit distro_features_check
>> +REQUIRED_DISTRO_FEATURES = "pam"
>> +
>>  inherit autotools gettext python3native python3-dir pkgconfig gtk-doc
>>
>>  EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_I
>> NCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
>> diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb
>> b/meta/recipes-extended/pam/libpam_1.3.0.bb
>> index 8f7753d001..92ab72a42f 100644
>> --- a/meta/recipes-extended/pam/libpam_1.3.0.bb
>> +++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
>> @@ -151,11 +151,8 @@ do_install() {
>>         fi
>>  }
>>
>> -python do_pam_sanity () {
>> -    if not bb.utils.contains('DISTRO_FEATURES', 'pam', True, False, d):
>> -        bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM
>> won't work correctly")
>> -}
>> -addtask pam_sanity before do_configure
>> +inherit distro_features_check
>> +REQUIRED_DISTRO_FEATURES = "pam"
>>
>>  BBCLASSEXTEND = "nativesdk native"
>>
>> --
>> 2.15.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--f403045fa746d1ba2c05648b66ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sorry, I haven&#39;t seen this one, because I have=
 packagegroup-core-lsb blacklisted for long time.<div><br></div><div>What i=
s preferred fix?</div><div>1) add the same restriction to packagegroup-core=
-lsb and core-image-lsb and someone will fix poky-lsb build (it doesn&#39;t=
 seem like separate distro), to include pam in DISTRO_FEATURES.</div><div>2=
) include libpam and=C2=A0pam-plugin-wheel in packagegroup-core-lbs (and=C2=
=A0RDEPENDS_packagegroup-core-lsb-runtime-add) only when pam is in DISTRO_F=
EATURES?</div><div><br></div><div>The warning says that libpam is broken wi=
thout pam in DISTRO_FEATURES, I&#39;m not sure how much LSB tests exercise =
it, but if the warning is correct, then it was broken in poky-lsb builds ru=
ntime already.</div><div><br></div><div>Regards,</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Mon, Feb 5, 2018 at 12:54 PM,=
 Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div dir=3D"ltr">This breaks world builds on the aut=
obuilder with poky-lsb:<div><br></div><div><a href=3D"https://autobuilder.y=
octo.io/builders/nightly-world/builds/736/steps/BuildImages/logs/stdio" tar=
get=3D"_blank">https://autobuilder.yocto.io/<wbr>builders/nightly-world/bui=
lds/<wbr>736/steps/BuildImages/logs/<wbr>stdio</a><br></div><div><br></div>=
<div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te"><div><div class=3D"h5">On 1 February 2018 at 14:34, Martin Jansa <span =
dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank"=
>martin.jansa@gmail.com</a>&gt;</span> wrote:<br></div></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div><div class=3D"h5">* replace do_pam_sanity function wi=
th distro_features_check inherit<br>
* fixes:<br>
=C2=A0 WARNING: libpam-1.3.0-r5 do_pam_sanity: Building libpam but &#39;pam=
&#39; isn&#39;t in DISTRO_FEATURES, PAM won&#39;t work correctly<br>
=C2=A0 in world builds and prevents user to build libpam at all without pam=
<br>
=C2=A0 in DISTRO_FEATURES, I don&#39;t see any users of this which wouldn&#=
39;t respect<br>
=C2=A0 pam in DISTRO_FEATURES<br>
* only libuser is depending on libpam without respecting DISTRO_FEATURES<br=
>
* there are few recipes in meta-oe layers depending on libpam without<br>
=C2=A0 respecting DISTRO_FEATURES, I&#39;ve sent patch for them:<br>
=C2=A0 samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-p=
am, smbnetfs<br>
=C2=A0 and omxplayer in meta-raspberrypi, I&#39;ve sent PR for that one:<br=
>
=C2=A0 <a href=3D"https://github.com/agherzan/meta-raspberrypi/pull/192" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/agherzan/me<wbr>ta-ra=
spberrypi/pull/192</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/<wbr>libuser/<a href=3D"http://libuser_0.62.bb"=
 rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a> | 3 +++<br>
=C2=A0meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>pam_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0| =
7 ++-----<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/libuse<wbr>r/<a href=3D"http://libuser_0=
.62.bb" rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a> b/meta/rec=
ipes-extended/libuse<wbr>r/<a href=3D"http://libuser_0.62.bb" rel=3D"norefe=
rrer" target=3D"_blank">libuser_0.62.bb</a><br>
index 1765346646..7ec54eb16e 100644<br>
--- a/meta/recipes-extended/libuse<wbr>r/<a href=3D"http://libuser_0.62.bb"=
 rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a><br>
+++ b/meta/recipes-extended/libuse<wbr>r/<a href=3D"http://libuser_0.62.bb"=
 rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a><br>
@@ -22,6 +22,9 @@ SRC_URI[sha256sum] =3D &quot;a58ff4fabb01a25043b142185a33=
e<wbr>eea961109dd60d4b40b6a9df4fa3c<br>
<br>
=C2=A0DEPENDS =3D &quot;popt libpam glib-2.0 python3&quot;<br>
<br>
+inherit distro_features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;pam&quot;<br>
+<br>
=C2=A0inherit autotools gettext python3native python3-dir pkgconfig gtk-doc=
<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;PYTHON_CPPFLAGS=3D-I${STAGING_I<wbr>NCDIR}/${P=
YTHON_DIR}${PYTHON_A<wbr>BI}&quot;<br>
diff --git a/meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>bpam_1.3.0.bb</a> b/meta/recipes=
-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">li<wbr>bpam_1.3.0.bb</a><br>
index 8f7753d001..92ab72a42f 100644<br>
--- a/meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>bpam_1.3.0.bb</a><br>
+++ b/meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>bpam_1.3.0.bb</a><br>
@@ -151,11 +151,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-python do_pam_sanity () {<br>
-=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_FEAT<wbr>URES&#39;, &#3=
9;pam&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Building libpam but &#39;pam&#39=
; isn&#39;t in DISTRO_FEATURES, PAM won&#39;t work correctly&quot;)<br>
-}<br>
-addtask pam_sanity before do_configure<br>
+inherit distro_features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;pam&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;nativesdk native&quot;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m=
_-1740614866312516153HOEnZb"><font color=3D"#888888"><br>
--<br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>

--f403045fa746d1ba2c05648b66ff--
