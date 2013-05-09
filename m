Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UaLsG-0003Fh-H4
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 10:06:55 +0200
Received: by mail-wi0-f180.google.com with SMTP id h11so2772819wiv.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 00:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=y1yoaqVybbo8oi4ZcgZSJaMUYrYxJaMAlVa6k8dwMyo=;
	b=Y2bLgL0q1+iW/AFlGUOLNXUVeuWchiCxoiLAAe5QSwRSjKVj6qv88uOm07NGn5mGap
	P1JSX82y9tgJl3Ou3oby56b8y2mkD0cXpjqHakjTSGZ1ueti37G3YJM0VfIDYEGjXskN
	w2nGdf+in1irOB7C40sQENpPzmGM3azzIuT2yWz1HXeZcFA+O5XNM+3FAQElBmkMOPrR
	q9O43nRXpAuyvJPytuq2Qs6dffjsDvi7pO8s45DQfSkH57OdDXVfYuxx5g8EqkBWAe/7
	kRaswHkJ3xeC5VxghwHE/s29BioRiMmW5KjyivkqUtGxhRMzNC2Xq/QY6TUfcO5uzd3o
	UO1w==
X-Received: by 10.180.73.206 with SMTP id n14mr26741706wiv.27.1368085725155;
	Thu, 09 May 2013 00:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.38 with HTTP; Thu, 9 May 2013 00:48:25 -0700 (PDT)
In-Reply-To: <518A6154.6090007@linux.intel.com>
References: <1368014380-23653-1-git-send-email-bogdan.a.marinescu@intel.com>
	<518A6154.6090007@linux.intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 9 May 2013 10:48:25 +0300
Message-ID: <CAMZjud3VRbezUb96Zy4czjAF60xe8MkzRFt6Eyn4_ifGSCwcAw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkshQCePLVtc4yuadgEiU6wGKCV94bhra0XNO+zIGuHbx9oti4NeLDYyGFl4IxXWJ3m4laz
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: upgraded to 7.6
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
X-List-Received-Date: Thu, 09 May 2013 08:07:06 -0000
Content-Type: multipart/alternative; boundary=f46d0435c5fcaba92f04dc4447e9

--f46d0435c5fcaba92f04dc4447e9
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 8, 2013 at 5:29 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/08/2013 04:59 AM, Bogdan Marinescu wrote:
>
>> 'gdbserver-cflags-last.diff' was integrated into upstream.
>>
>>  Was it really?  I note that the patch from Marcin still incorporates a
> similar patch, please verify this should not be a rebase.
>

I will recheck. However, does it make sense for us to work in parallel on
upgrading the same package?

Thanks,
Bogdan


>
>
> Sau!
>
>
>  Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   meta/recipes-devtools/gdb/gdb-**common.inc            |    6 ++----
>>   ...-canadian_7.5.1.bb => gdb-cross-canadian_7.6.bb} |    2 --
>>   .../gdb/{gdb-cross_7.5.1.bb => gdb-cross_7.6.bb}    |    2 --
>>   meta/recipes-devtools/gdb/gdb.**inc                   |    1 -
>>   .../gdb/gdb/gdbserver-cflags-**last.diff              |   19
>> -------------------
>>   .../gdb/{gdb_7.5.1.bb => gdb_7.6.bb}                |    1 -
>>   6 files changed, 2 insertions(+), 29 deletions(-)
>>   rename meta/recipes-devtools/gdb/{gdb**-cross-canadian_7.5.1.bb<http://gdb-cross-canadian_7.5.1.bb>=>
>> gdb-cross-canadian_7.6.bb} (87%)
>>   rename meta/recipes-devtools/gdb/{gdb**-cross_7.5.1.bb<http://gdb-cross_7.5.1.bb>=>
>> gdb-cross_7.6.bb} (82%)
>>   delete mode 100644 meta/recipes-devtools/gdb/gdb/**
>> gdbserver-cflags-last.diff
>>   rename meta/recipes-devtools/gdb/{gdb**_7.5.1.bb <http://gdb_7.5.1.bb>=>
>> gdb_7.6.bb} (94%)
>>
>> diff --git a/meta/recipes-devtools/gdb/**gdb-common.inc
>> b/meta/recipes-devtools/gdb/**gdb-common.inc
>> index f574d5c..eca66b4 100644
>> --- a/meta/recipes-devtools/gdb/**gdb-common.inc
>> +++ b/meta/recipes-devtools/gdb/**gdb-common.inc
>> @@ -12,8 +12,6 @@ LTTNGUST_mips64 = ""
>>   LTTNGUST_mips64el = ""
>>   LTTNGUST_sh4 = ""
>>
>> -INC_PR = "r0"
>> -
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=**59530bdf33659b29e73d4adb9f9f65
>> **52 \
>>                 file://COPYING.LIB;md5=**9f604d8a4f8e74f4f5140845a21b66**74
>> \
>>                 file://COPYING3;md5=**d32239bcb673463ab874e80d47fae5**04
>> \
>> @@ -22,8 +20,8 @@ inherit autotools
>>
>>   SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.**tar.gz \
>>             "
>> -SRC_URI[md5sum] = "**b1519bf899890d21d4774845a6e602**fe"
>> -SRC_URI[sha256sum] = "**f99f26e2c1127f12ba14ece0947a9a**
>> 9948be45e96b69ef363131e469a698**636e"
>> +SRC_URI[md5sum] = "**a9836707337e5f7bf76a009a8904f4**70"
>> +SRC_URI[sha256sum] = "**8070389a5dcc104eb0be483d582729**
>> f98ed4d761ad19cedd3f17b5d2502f**aa36"
>>
>>   export CC_FOR_BUILD = "${BUILD_CC}"
>>   export CXX_FOR_BUILD = "${BUILD_CXX}"
>> diff --git a/meta/recipes-devtools/gdb/gd**b-cross-canadian_7.5.1.bb<http://gdb-cross-canadian_7.5.1.bb>b/meta/recipes-devtools/gdb/
>> gd**b-cross-canadian_7.6.bb <http://gdb-cross-canadian_7.6.bb>
>> similarity index 87%
>> rename from meta/recipes-devtools/gdb/gdb-**cross-canadian_7.5.1.bb<http://gdb-cross-canadian_7.5.1.bb>
>> rename to meta/recipes-devtools/gdb/gdb-**cross-canadian_7.6.bb<http://gdb-cross-canadian_7.6.bb>
>> index c15aa7a..cbb7402 100644
>> --- a/meta/recipes-devtools/gdb/gd**b-cross-canadian_7.5.1.bb<http://gdb-cross-canadian_7.5.1.bb>
>> +++ b/meta/recipes-devtools/gdb/gd**b-cross-canadian_7.6.bb<http://gdb-cross-canadian_7.6.bb>
>> @@ -1,8 +1,6 @@
>>   require gdb-common.inc
>>   require gdb-cross-canadian.inc
>>
>> -PR = "${INC_PR}.0"
>> -
>>   GDBPROPREFIX = "--program-prefix='${TARGET_**PREFIX}'"
>>
>>   S = "${WORKDIR}/${BPN}-${PV}"
>> diff --git a/meta/recipes-devtools/gdb/gd**b-cross_7.5.1.bb<http://gdb-cross_7.5.1.bb>b/meta/recipes-devtools/gdb/
>> gd**b-cross_7.6.bb <http://gdb-cross_7.6.bb>
>> similarity index 82%
>> rename from meta/recipes-devtools/gdb/gdb-**cross_7.5.1.bb<http://gdb-cross_7.5.1.bb>
>> rename to meta/recipes-devtools/gdb/gdb-**cross_7.6.bb<http://gdb-cross_7.6.bb>
>> index a14d0ba..8836119 100644
>> --- a/meta/recipes-devtools/gdb/gd**b-cross_7.5.1.bb<http://gdb-cross_7.5.1.bb>
>> +++ b/meta/recipes-devtools/gdb/gd**b-cross_7.6.bb<http://gdb-cross_7.6.bb>
>> @@ -2,6 +2,4 @@ require gdb-cross.inc
>>
>>   SRC_URI += "file://sim-install-6.6.patch"
>>
>> -PR = "${INC_PR}.0"
>> -
>>   S = "${WORKDIR}/${BPN}-${PV}"
>> diff --git a/meta/recipes-devtools/gdb/**gdb.inc
>> b/meta/recipes-devtools/gdb/**gdb.inc
>> index a620eca..eb65939 100644
>> --- a/meta/recipes-devtools/gdb/**gdb.inc
>> +++ b/meta/recipes-devtools/gdb/**gdb.inc
>> @@ -3,7 +3,6 @@ require gdb-common.inc
>>   inherit gettext
>>
>>   SRC_URI += "file://kill_arm_map_symbols.**patch \
>> -            file://gdbserver-cflags-last.**diff;striplevel=0 \
>>             file://renesas-sh-native-**support.patch \
>>              "
>>   #LDFLAGS_append = " -s"
>> diff --git a/meta/recipes-devtools/gdb/**gdb/gdbserver-cflags-last.diff
>> b/meta/recipes-devtools/gdb/**gdb/gdbserver-cflags-last.diff
>> deleted file mode 100644
>> index 8256f17..0000000
>> --- a/meta/recipes-devtools/gdb/**gdb/gdbserver-cflags-last.diff
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Index: gdb/gdbserver/Makefile.in
>> -=============================**==============================**========
>> ---- gdb/gdbserver/Makefile.in.orig     2011-03-09 23:32:02.000000000
>> -0800
>> -+++ gdb/gdbserver/Makefile.in  2011-08-05 21:16:43.592202579 -0700
>> -@@ -94,10 +94,10 @@
>> - CFLAGS = @CFLAGS@
>> -
>> - # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.
>> --INTERNAL_CFLAGS_BASE =  ${CFLAGS} ${GLOBAL_CFLAGS} \
>> -+INTERNAL_CFLAGS_BASE =  ${GLOBAL_CFLAGS} \
>> -       ${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}
>> - INTERNAL_WARN_CFLAGS =  ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
>> --INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS)
>> -+INTERNAL_CFLAGS =  ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS}
>> -
>> - # LDFLAGS is specifically reserved for setting from the command line
>> - # when running make.
>> diff --git a/meta/recipes-devtools/gdb/gd**b_7.5.1.bb<http://gdb_7.5.1.bb>b/meta/recipes-devtools/gdb/
>> gd**b_7.6.bb <http://gdb_7.6.bb>
>> similarity index 94%
>> rename from meta/recipes-devtools/gdb/gdb_**7.5.1.bb<http://gdb_7.5.1.bb>
>> rename to meta/recipes-devtools/gdb/gdb_**7.6.bb <http://gdb_7.6.bb>
>> index 0645b56..cd323f5 100644
>> --- a/meta/recipes-devtools/gdb/gd**b_7.5.1.bb <http://gdb_7.5.1.bb>
>> +++ b/meta/recipes-devtools/gdb/gd**b_7.6.bb <http://gdb_7.6.bb>
>> @@ -4,6 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=**
>> 59530bdf33659b29e73d4adb9f9f65**52 \
>>                     file://COPYING3;md5=**d32239bcb673463ab874e80d47fae5*
>> *04 \
>>                     file://COPYING3.LIB;md5=**
>> 6a6a8e020838b23406c81b19c1d46d**f6 \
>>                     file://COPYING.LIB;md5=**
>> 9f604d8a4f8e74f4f5140845a21b66**74"
>> -PR = "${INC_PR}.0"
>>
>>   S = "${WORKDIR}/${BPN}-${PV}"
>>
>>

--f46d0435c5fcaba92f04dc4447e9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 8, 2013 at 5:29 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 05/08/2013 04:59 AM, Bo=
gdan Marinescu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
&#39;gdbserver-cflags-last.diff&#39; was integrated into upstream.<br>
<br>
</blockquote></div>
Was it really? =A0I note that the patch from Marcin still incorporates a si=
milar patch, please verify this should not be a rebase.<br></blockquote><di=
v><br></div><div style>I will recheck. However, does it make sense for us t=
o work in parallel on upgrading the same package?</div>

<div style><br></div><div style>Thanks,</div><div style>Bogdan</div><div>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0 meta/recipes-devtools/gdb/gdb-<u></u>common.inc =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A06 ++----<br>
=A0 ...-<a href=3D"http://canadian_7.5.1.bb" target=3D"_blank">canadian_7.5=
.1.bb</a> =3D&gt; <a href=3D"http://gdb-cross-canadian_7.6.bb" target=3D"_b=
lank">gdb-cross-canadian_7.6.bb</a>} | =A0 =A02 --<br>
=A0 .../gdb/{<a href=3D"http://gdb-cross_7.5.1.bb" target=3D"_blank">gdb-cr=
oss_7.5.1.bb</a> =3D&gt; <a href=3D"http://gdb-cross_7.6.bb" target=3D"_bla=
nk">gdb-cross_7.6.bb</a>} =A0 =A0| =A0 =A02 --<br>
=A0 meta/recipes-devtools/gdb/gdb.<u></u>inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A01 -<br>
=A0 .../gdb/gdb/gdbserver-cflags-<u></u>last.diff =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 19 -------------------<br>
=A0 .../gdb/{<a href=3D"http://gdb_7.5.1.bb" target=3D"_blank">gdb_7.5.1.bb=
</a> =3D&gt; <a href=3D"http://gdb_7.6.bb" target=3D"_blank">gdb_7.6.bb</a>=
} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 -<br>
=A0 6 files changed, 2 insertions(+), 29 deletions(-)<br>
=A0 rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross-canadian_=
7.5.1.bb" target=3D"_blank">gdb<u></u>-cross-canadian_7.5.1.bb</a> =3D&gt; =
<a href=3D"http://gdb-cross-canadian_7.6.bb" target=3D"_blank">gdb-cross-ca=
nadian_7.6.bb</a>} (87%)<br>


=A0 rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb-cross_7.5.1.bb"=
 target=3D"_blank">gdb<u></u>-cross_7.5.1.bb</a> =3D&gt; <a href=3D"http://=
gdb-cross_7.6.bb" target=3D"_blank">gdb-cross_7.6.bb</a>} (82%)<br>
=A0 delete mode 100644 meta/recipes-devtools/gdb/gdb/<u></u>gdbserver-cflag=
s-last.diff<br>
=A0 rename meta/recipes-devtools/gdb/{<a href=3D"http://gdb_7.5.1.bb" targe=
t=3D"_blank">gdb<u></u>_7.5.1.bb</a> =3D&gt; <a href=3D"http://gdb_7.6.bb" =
target=3D"_blank">gdb_7.6.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-devtools/gdb/<u></u>gdb-common.inc b/meta/recipes=
-devtools/gdb/<u></u>gdb-common.inc<br>
index f574d5c..eca66b4 100644<br>
--- a/meta/recipes-devtools/gdb/<u></u>gdb-common.inc<br>
+++ b/meta/recipes-devtools/gdb/<u></u>gdb-common.inc<br>
@@ -12,8 +12,6 @@ LTTNGUST_mips64 =3D &quot;&quot;<br>
=A0 LTTNGUST_mips64el =3D &quot;&quot;<br>
=A0 LTTNGUST_sh4 =3D &quot;&quot;<br>
<br>
-INC_PR =3D &quot;r0&quot;<br>
-<br>
=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>59530bdf33659b29=
e73d4adb9f9f65<u></u>52 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING.LIB;md5=3D<u></u>9f604d8a4f8=
e74f4f5140845a21b66<u></u>74 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING3;md5=3D<u></u>d32239bcb67346=
3ab874e80d47fae5<u></u>04 \<br>
@@ -22,8 +20,8 @@ inherit autotools<br>
<br>
=A0 SRC_URI =3D &quot;${GNU_MIRROR}/gdb/gdb-${PV}.<u></u>tar.gz \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;<u></u>b1519bf899890d21d4774845a6e602<u></u>fe&q=
uot;<br>
-SRC_URI[sha256sum] =3D &quot;<u></u>f99f26e2c1127f12ba14ece0947a9a<u></u>9=
948be45e96b69ef363131e469a698<u></u>636e&quot;<br>
+SRC_URI[md5sum] =3D &quot;<u></u>a9836707337e5f7bf76a009a8904f4<u></u>70&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>8070389a5dcc104eb0be483d582729<u></u>f=
98ed4d761ad19cedd3f17b5d2502f<u></u>aa36&quot;<br>
<br>
=A0 export CC_FOR_BUILD =3D &quot;${BUILD_CC}&quot;<br>
=A0 export CXX_FOR_BUILD =3D &quot;${BUILD_CXX}&quot;<br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian=
_7.5.1.bb" target=3D"_blank">gd<u></u>b-cross-canadian_7.5.1.bb</a> b/meta/=
recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_7.6.bb" target=3D=
"_blank">gd<u></u>b-cross-canadian_7.6.bb</a><br>


similarity index 87%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_=
7.5.1.bb" target=3D"_blank">gdb-<u></u>cross-canadian_7.5.1.bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_7.=
6.bb" target=3D"_blank">gdb-<u></u>cross-canadian_7.6.bb</a><br>
index c15aa7a..cbb7402 100644<br>
--- a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_7.5.1.=
bb" target=3D"_blank">gd<u></u>b-cross-canadian_7.5.1.bb</a><br>
+++ b/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross-canadian_7.6.bb=
" target=3D"_blank">gd<u></u>b-cross-canadian_7.6.bb</a><br>
@@ -1,8 +1,6 @@<br>
=A0 require gdb-common.inc<br>
=A0 require gdb-cross-canadian.inc<br>
<br>
-PR =3D &quot;${INC_PR}.0&quot;<br>
-<br>
=A0 GDBPROPREFIX =3D &quot;--program-prefix=3D&#39;${TARGET_<u></u>PREFIX}&=
#39;&quot;<br>
<br>
=A0 S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.5.1.bb=
" target=3D"_blank">gd<u></u>b-cross_7.5.1.bb</a> b/meta/recipes-devtools/g=
db/<a href=3D"http://gdb-cross_7.6.bb" target=3D"_blank">gd<u></u>b-cross_7=
.6.bb</a><br>


similarity index 82%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.5.1.bb"=
 target=3D"_blank">gdb-<u></u>cross_7.5.1.bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.6.bb" tar=
get=3D"_blank">gdb-<u></u>cross_7.6.bb</a><br>
index a14d0ba..8836119 100644<br>
--- a/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.5.1.bb" targe=
t=3D"_blank">gd<u></u>b-cross_7.5.1.bb</a><br>
+++ b/meta/recipes-devtools/gdb/<a href=3D"http://gdb-cross_7.6.bb" target=
=3D"_blank">gd<u></u>b-cross_7.6.bb</a><br>
@@ -2,6 +2,4 @@ require gdb-cross.inc<br>
<br>
=A0 SRC_URI +=3D &quot;file://sim-install-6.6.patch&quot;<br>
<br>
-PR =3D &quot;${INC_PR}.0&quot;<br>
-<br>
=A0 S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
diff --git a/meta/recipes-devtools/gdb/<u></u>gdb.inc b/meta/recipes-devtoo=
ls/gdb/<u></u>gdb.inc<br>
index a620eca..eb65939 100644<br>
--- a/meta/recipes-devtools/gdb/<u></u>gdb.inc<br>
+++ b/meta/recipes-devtools/gdb/<u></u>gdb.inc<br>
@@ -3,7 +3,6 @@ require gdb-common.inc<br>
=A0 inherit gettext<br>
<br>
=A0 SRC_URI +=3D &quot;file://kill_arm_map_symbols.<u></u>patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://gdbserver-cflags-last.<u></u>diff;stripleve=
l=3D0 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://renesas-sh-native-<u></u>support.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0&quot;<br>
=A0 #LDFLAGS_append =3D &quot; -s&quot;<br>
diff --git a/meta/recipes-devtools/gdb/<u></u>gdb/gdbserver-cflags-last.dif=
f b/meta/recipes-devtools/gdb/<u></u>gdb/gdbserver-cflags-last.diff<br>
deleted file mode 100644<br>
index 8256f17..0000000<br>
--- a/meta/recipes-devtools/gdb/<u></u>gdb/gdbserver-cflags-last.diff<br>
+++ /dev/null<br>
@@ -1,19 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Index: gdb/gdbserver/Makefile.in<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gdb/gdbserver/Makefile.in.orig =A0 =A0 2011-03-09 23:32:02.000000000 -=
0800<br>
-+++ gdb/gdbserver/Makefile.in =A02011-08-05 21:16:43.592202579 -0700<br>
-@@ -94,10 +94,10 @@<br>
- CFLAGS =3D @CFLAGS@<br>
-<br>
- # INTERNAL_CFLAGS is the aggregate of all other *CFLAGS macros.<br>
--INTERNAL_CFLAGS_BASE =3D =A0${CFLAGS} ${GLOBAL_CFLAGS} \<br>
-+INTERNAL_CFLAGS_BASE =3D =A0${GLOBAL_CFLAGS} \<br>
- =A0 =A0 =A0 ${PROFILE_CFLAGS} ${INCLUDE_CFLAGS}<br>
- INTERNAL_WARN_CFLAGS =3D =A0${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)<br>
--INTERNAL_CFLAGS =3D =A0${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS)<br>
-+INTERNAL_CFLAGS =3D =A0${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) ${CFLAGS}=
<br>
-<br>
- # LDFLAGS is specifically reserved for setting from the command line<br>
- # when running make.<br>
diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.5.1.bb" targ=
et=3D"_blank">gd<u></u>b_7.5.1.bb</a> b/meta/recipes-devtools/gdb/<a href=
=3D"http://gdb_7.6.bb" target=3D"_blank">gd<u></u>b_7.6.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.5.1.bb" targe=
t=3D"_blank">gdb_<u></u>7.5.1.bb</a><br>
rename to meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.6.bb" target=3D=
"_blank">gdb_<u></u>7.6.bb</a><br>
index 0645b56..cd323f5 100644<br>
--- a/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.5.1.bb" target=3D"_=
blank">gd<u></u>b_7.5.1.bb</a><br>
+++ b/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.6.bb" target=3D"_bl=
ank">gd<u></u>b_7.6.bb</a><br>
@@ -4,6 +4,5 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>5953=
0bdf33659b29e73d4adb9f9f65<u></u>52 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING3;md5=3D<u></u>d32239=
bcb673463ab874e80d47fae5<u></u>04 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING3.LIB;md5=3D<u></u>6a=
6a8e020838b23406c81b19c1d46d<u></u>f6 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://COPYING.LIB;md5=3D<u></u>9f6=
04d8a4f8e74f4f5140845a21b66<u></u>74&quot;<br>
-PR =3D &quot;${INC_PR}.0&quot;<br>
<br>
=A0 S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--f46d0435c5fcaba92f04dc4447e9--
