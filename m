Received: from mail-we0-f173.google.com ([74.125.82.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UZyEJ-00080Z-Ae
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 08:51:59 +0200
Received: by mail-we0-f173.google.com with SMTP id q54so1388224wes.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 23:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=61ZhsQUzwe8rd/gXs9sLKYcQ7XUr6OTlDNhCvgWVaNc=;
	b=Or8bgTkqKpc2/1Xj66NJbUOfWvZ0i0hYs48u8hZXN+W2CuD7Uit/QZu1qK4hW+qhzD
	lstClrCAc3j9AfZztoS3R84rN0+TH+Hpun3AursK2VyKBxketo2Z2JNStGBStePMSqvF
	pkNOkldvKhkdHUcwW9+DIZCJFabB1PAffzTg018DDsb84Z3nKZ3UCi5AOk/2wDThebIU
	BihMDYUkxY/EcWv6OceiWtFBBlyDYrB5fNkR59Pghit121skovLq5hX6pHd3nJ9DDT2B
	DKg2w4fXaMqDFMVN1AgSuHhcMZrkJF5FXBHJV6Qn4VLh9+sRYr3IRe7R5KWmLqS4kPU7
	32ig==
X-Received: by 10.180.72.227 with SMTP id g3mr24525497wiv.1.1367994837535;
	Tue, 07 May 2013 23:33:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.38 with HTTP; Tue, 7 May 2013 23:33:37 -0700 (PDT)
In-Reply-To: <51895996.1030101@linux.intel.com>
References: <1367922876-26933-1-git-send-email-bogdan.a.marinescu@intel.com>
	<51895996.1030101@linux.intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Wed, 8 May 2013 09:33:37 +0300
Message-ID: <CAMZjud3N-J2y5C8DSJskPKbZ1r-5DBxD_NM_GbWJvKjDqEsUQg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkDJFf9/zby141GqiZdp2eCZNpVY2VV9+ZJbNrHvo/zOV0MhnZG4quCviUVaEkmiBMGdQBO
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mpfr: upgraded to 3.1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 06:51:59 -0000
Content-Type: multipart/alternative; boundary=f46d043c8192589f8104dc2f1e93

--f46d043c8192589f8104dc2f1e93
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 7, 2013 at 10:44 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/07/2013 03:34 AM, Bogdan Marinescu wrote:
>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   .../mpfr/{mpfr-3.1.1 => mpfr-3.1.2}/long-long-thumb.**patch      |    0
>>   meta/recipes-support/mpfr/{mpf**r_3.1.1.bb <http://mpfr_3.1.1.bb> =>
>> mpfr_3.1.2.bb}     |    8 ++++----
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>   rename meta/recipes-support/mpfr/{**mpfr-3.1.1 =>
>> mpfr-3.1.2}/long-long-thumb.**patch (100%)
>>   rename meta/recipes-support/mpfr/{mpf**r_3.1.1.bb<http://mpfr_3.1.1.bb>=>
>> mpfr_3.1.2.bb} (59%)
>>
>> diff --git a/meta/recipes-support/mpfr/**mpfr-3.1.1/long-long-thumb.**patch
>> b/meta/recipes-support/mpfr/**mpfr-3.1.2/long-long-thumb.**patch
>> similarity index 100%
>> rename from meta/recipes-support/mpfr/**mpfr-3.1.1/long-long-thumb.**
>> patch
>> rename to meta/recipes-support/mpfr/**mpfr-3.1.2/long-long-thumb.**patch
>> diff --git a/meta/recipes-support/mpfr/mp**fr_3.1.1.bb<http://mpfr_3.1.1.bb>b/meta/recipes-support/mpfr/
>> mp**fr_3.1.2.bb <http://mpfr_3.1.2.bb>
>> similarity index 59%
>> rename from meta/recipes-support/mpfr/mpfr**_3.1.1.bb<http://mpfr_3.1.1.bb>
>> rename to meta/recipes-support/mpfr/mpfr**_3.1.2.bb<http://mpfr_3.1.2.bb>
>> index 7f34e71..2c2aaf3 100644
>> --- a/meta/recipes-support/mpfr/mp**fr_3.1.1.bb <http://mpfr_3.1.1.bb>
>> +++ b/meta/recipes-support/mpfr/mp**fr_3.1.2.bb <http://mpfr_3.1.2.bb>
>> @@ -3,14 +3,14 @@ LICENSE="GPLv3&LGPLv3"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=**d32239bcb673463ab874e80d47fae5
>> **04 \
>>                     file://COPYING.LESSER;md5=**
>> 6a6a8e020838b23406c81b19c1d46d**f6"
>>   DEPENDS = "gmp"
>> -PR = "r0"
>>
>> -SRC_URI = "http://www.mpfr.org/mpfr-${**PV}/mpfr-${PV}.tar.bz2<http://www.mpfr.org/mpfr-$%7BPV%7D/mpfr-$%7BPV%7D.tar.bz2>\
>> +SRC_URI = "http://www.mpfr.org/mpfr-${**PV}/mpfr-${PV}.tar.xz<http://www.mpfr.org/mpfr-$%7BPV%7D/mpfr-$%7BPV%7D.tar.xz>\
>>              file://long-long-thumb.patch \
>>              "
>>
>> -SRC_URI[md5sum] = "**e90e0075bb1b5f626c6e31aaa9c64e**3b"
>> -SRC_URI[sha256sum] = "**7b66c3f13dc8385f08264c805853f3**
>> e1a8eedab8071d582f3e661971c9ac**d5fd"
>> +SRC_URI[md5sum] = "**ee2c3ac63bf0c2359bf08fc3ee094c**19"
>> +SRC_URI[sha256sum] = "**79c73f60af010a30a5c27a955a1d2d**
>> 01ba095b72537dab0ecaad57f5a7bb**1b6b"
>> +
>>
>
> My local test comes up with a different set of check-sums then these.
>
> Can you please verify.
>

Have you tried the second version of the patch?

Thanks,
Bogdan


>
> Thanks
>         Sau!
>
>
>
>
>    S = "${WORKDIR}/mpfr-${PV}"
>>
>>   BBCLASSEXTEND = "native nativesdk"
>>
>>

--f46d043c8192589f8104dc2f1e93
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, May 7, 2013 at 10:44 PM, Saul Wold <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com<=
/a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
5/07/2013 03:34 AM, Bogdan Marinescu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0 .../mpfr/{mpfr-3.1.1 =3D&gt; mpfr-3.1.2}/long-long-thumb.<u></u>patch =
=A0 =A0 =A0| =A0 =A00<br>
=A0 meta/recipes-support/mpfr/{<a href=3D"http://mpfr_3.1.1.bb" target=3D"_=
blank">mpf<u></u>r_3.1.1.bb</a> =3D&gt; <a href=3D"http://mpfr_3.1.2.bb" ta=
rget=3D"_blank">mpfr_3.1.2.bb</a>} =A0 =A0 | =A0 =A08 ++++----<br>
=A0 2 files changed, 4 insertions(+), 4 deletions(-)<br>
=A0 rename meta/recipes-support/mpfr/{<u></u>mpfr-3.1.1 =3D&gt; mpfr-3.1.2}=
/long-long-thumb.<u></u>patch (100%)<br>
=A0 rename meta/recipes-support/mpfr/{<a href=3D"http://mpfr_3.1.1.bb" targ=
et=3D"_blank">mpf<u></u>r_3.1.1.bb</a> =3D&gt; <a href=3D"http://mpfr_3.1.2=
.bb" target=3D"_blank">mpfr_3.1.2.bb</a>} (59%)<br>
<br>
diff --git a/meta/recipes-support/mpfr/<u></u>mpfr-3.1.1/long-long-thumb.<u=
></u>patch b/meta/recipes-support/mpfr/<u></u>mpfr-3.1.2/long-long-thumb.<u=
></u>patch<br>
similarity index 100%<br>
rename from meta/recipes-support/mpfr/<u></u>mpfr-3.1.1/long-long-thumb.<u>=
</u>patch<br>
rename to meta/recipes-support/mpfr/<u></u>mpfr-3.1.2/long-long-thumb.<u></=
u>patch<br>
diff --git a/meta/recipes-support/mpfr/<a href=3D"http://mpfr_3.1.1.bb" tar=
get=3D"_blank">mp<u></u>fr_3.1.1.bb</a> b/meta/recipes-support/mpfr/<a href=
=3D"http://mpfr_3.1.2.bb" target=3D"_blank">mp<u></u>fr_3.1.2.bb</a><br>
similarity index 59%<br>
rename from meta/recipes-support/mpfr/<a href=3D"http://mpfr_3.1.1.bb" targ=
et=3D"_blank">mpfr<u></u>_3.1.1.bb</a><br>
rename to meta/recipes-support/mpfr/<a href=3D"http://mpfr_3.1.2.bb" target=
=3D"_blank">mpfr<u></u>_3.1.2.bb</a><br>
index 7f34e71..2c2aaf3 100644<br>
--- a/meta/recipes-support/mpfr/<a href=3D"http://mpfr_3.1.1.bb" target=3D"=
_blank">mp<u></u>fr_3.1.1.bb</a><br>
+++ b/meta/recipes-support/mpfr/<a href=3D"http://mpfr_3.1.2.bb" target=3D"=
_blank">mp<u></u>fr_3.1.2.bb</a><br>
@@ -3,14 +3,14 @@ LICENSE=3D&quot;GPLv3&amp;LGPLv3&quot;<br>
=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>d32239bcb673463a=
b874e80d47fae5<u></u>04 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING.LESSER;md5=3D<u></u>=
6a6a8e020838b23406c81b19c1d46d<u></u>f6&quot;<br>
=A0 DEPENDS =3D &quot;gmp&quot;<br>
-PR =3D &quot;r0&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.mpfr.org/mpfr-$%7BPV%7D/mpfr-$%7BP=
V%7D.tar.bz2" target=3D"_blank">http://www.mpfr.org/mpfr-${<u></u>PV}/mpfr-=
${PV}.tar.bz2</a> \<br>
+SRC_URI =3D &quot;<a href=3D"http://www.mpfr.org/mpfr-$%7BPV%7D/mpfr-$%7BP=
V%7D.tar.xz" target=3D"_blank">http://www.mpfr.org/mpfr-${<u></u>PV}/mpfr-$=
{PV}.tar.xz</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0file://long-long-thumb.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<u></u>e90e0075bb1b5f626c6e31aaa9c64e<u></u>3b&q=
uot;<br>
-SRC_URI[sha256sum] =3D &quot;<u></u>7b66c3f13dc8385f08264c805853f3<u></u>e=
1a8eedab8071d582f3e661971c9ac<u></u>d5fd&quot;<br>
+SRC_URI[md5sum] =3D &quot;<u></u>ee2c3ac63bf0c2359bf08fc3ee094c<u></u>19&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>79c73f60af010a30a5c27a955a1d2d<u></u>0=
1ba095b72537dab0ecaad57f5a7bb<u></u>1b6b&quot;<br>
+<br>
</blockquote>
<br></div></div>
My local test comes up with a different set of check-sums then these.<br>
<br>
Can you please verify.<br></blockquote><div><br></div><div style>Have you t=
ried the second version of the patch?</div><div style><br></div><div style>=
Thanks,</div><div style>Bogdan</div><div style>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">


<br>
Thanks<br>
=A0 =A0 =A0 =A0 Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=A0 S =3D &quot;${WORKDIR}/mpfr-${PV}&quot;<br>
<br>
=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--f46d043c8192589f8104dc2f1e93--
