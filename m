Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TiCg9-0007zg-42
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 00:22:41 +0100
Received: by mail-vb0-f47.google.com with SMTP id e21so3029339vbm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 15:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=1k1hm0PkgihTPnIsm25MjByIHHo0VoIi1EdORnQmuYE=;
	b=aruglgumRjgx1tQmzxBnokPhDW8NS6dFEX+Dsq3Z+9z7sxK2lnsYO8krUFvP3/TGXy
	h9avKQwompzysR03LKDEvn8MomP4/D+80ZOS+zjZBhIv6+xmq8pbRZvksul5Q3+IsiSB
	HXbnL72fxtGC1e0ivXAxPT2Hf2esUy9yLpEUseraOKjyJrhs76oZBJY8VWeaeskQQKHN
	ntRIdOw3C0/L/jy7kh9do+LYTtSg7bn2+dJtvdh32LeWmEUAGzoJoV6tZj0HlhSiG1ML
	kRaGpBSJQlexB3BWNcCsBy46KG0tiVkz8FE65RoAep7TCcLSxfEyFEt7nV3xYcLjiGjJ
	6bPw==
Received: by 10.52.36.100 with SMTP id p4mr9117931vdj.16.1355180876992; Mon,
	10 Dec 2012 15:07:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.102.132 with HTTP; Mon, 10 Dec 2012 15:07:36 -0800 (PST)
X-Originating-IP: [5.13.218.224]
In-Reply-To: <50C666FB.90001@linux.intel.com>
References: <1354793849-9595-1-git-send-email-andrei.gherzan@windriver.com>
	<50C666FB.90001@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 11 Dec 2012 01:07:36 +0200
Message-ID: <CAK18fxHFcBxiYqD6mqnbSDUKX-4oN3Nf1rO9uksN8vXd0QENbQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmgnSEkW6fljwKzzEuzVSDqmYhfAffeBsU/mBOAmaVRtbnWPiYOZ2JnE6sEt7ytvfR8au2r
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: Rebase remove-lscpu.patch for the current version
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
X-List-Received-Date: Mon, 10 Dec 2012 23:22:42 -0000
Content-Type: multipart/alternative; boundary=20cf307c9f14c790c704d087a2c8

--20cf307c9f14c790c704d087a2c8
Content-Type: text/plain; charset=ISO-8859-1

I see. Thanks.



*Andrei Gherzan*
mobile +40.744.478.414  fax +40.31.816.28.12
Email: andrei@gherzan.ro
Email: andrei.gherzan@windriver.com
Romania



On Tue, Dec 11, 2012 at 12:49 AM, Saul Wold <sgw@linux.intel.com> wrote:

>
> Andrei,
>
> I think our patches crossed on the list, already applied a similar patch.
>
> Sau!
>
>
> On 12/06/2012 03:37 AM, Andrei Gherzan wrote:
>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>> ---
>>   .../util-linux/util-linux/**remove-lscpu.patch       |   30
>> +++++++++----------
>>   meta/recipes-core/util-linux/u**til-linux_2.22.1.bb<http://util-linux_2.22.1.bb> |    2 +-
>>   2 files changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/meta/recipes-core/util-**linux/util-linux/remove-lscpu.**patch
>> b/meta/recipes-core/util-**linux/util-linux/remove-lscpu.**patch
>> index a15c1e3..4d0b311 100644
>> --- a/meta/recipes-core/util-**linux/util-linux/remove-lscpu.**patch
>> +++ b/meta/recipes-core/util-**linux/util-linux/remove-lscpu.**patch
>> @@ -3,12 +3,13 @@ Upstream-Status: Inappropriate [distribution]
>>   Take out lscpu stuff from the code
>>
>>   Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> +Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>>
>> -Index: util-linux-2.21/configure.ac
>> +Index: util-linux-2.22.1/configure.ac
>>   ==============================**==============================**=======
>> ---- util-linux-2.21.orig/configure**.ac <http://configure.ac>
>> -+++ util-linux-2.21/configure.ac
>> -@@ -871,7 +871,7 @@ UL_REQUIRES_BUILD([lsblk], [libblkid])
>> +--- util-linux-2.22.1.orig/configu**re.ac <http://configure.ac>
>>  2012-12-06 13:22:58.209874400 +0200
>> ++++ util-linux-2.22.1/configure.ac     2012-12-06 13:23:18.721873663
>> +0200
>> +@@ -934,7 +934,7 @@
>>    AM_CONDITIONAL(BUILD_LSBLK, test "x$build_lsblk" = xyes)
>>
>>
>> @@ -17,24 +18,21 @@ Index: util-linux-2.21/configure.ac
>>    UL_REQUIRES_LINUX([lscpu])
>>    UL_REQUIRES_HAVE([lscpu], [cpu_set_t], [cpu_set_t type])
>>    AM_CONDITIONAL(BUILD_LSCPU, test "x$build_lscpu" = xyes)
>> -Index: util-linux-2.21/sys-utils/**Makefile.am
>> +Index: util-linux-2.22.1/sys-utils/**Makemodule.am
>>   ==============================**==============================**=======
>> ---- util-linux-2.21.orig/sys-**utils/Makefile.am
>> -+++ util-linux-2.21/sys-utils/**Makefile.am
>> -@@ -108,16 +108,6 @@ swapon_CFLAGS = $(AM_CFLAGS) -I$(ul_libb
>> - swapon_LDADD = $(ul_libblkid_la)
>> +--- util-linux-2.22.1.orig/sys-**utils/Makemodule.am     2012-12-06
>> 13:23:07.585874063 +0200
>> ++++ util-linux-2.22.1/sys-utils/**Makemodule.am  2012-12-06
>> 13:23:34.217873111 +0200
>> +@@ -224,13 +224,6 @@
>> + swapoff_LDADD = $(LDADD) libmount.la
>>    endif
>>
>>   -if BUILD_LSCPU
>>   -usrbin_exec_PROGRAMS += lscpu
>> --lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c \
>> --                      $(top_srcdir)/lib/strutils.c \
>> --                      $(top_srcdir)/lib/mbsalign.c \
>> --                      $(top_srcdir)/lib/tt.c \
>> --                      $(top_srcdir)/lib/path.c
>> --dist_man_MANS += lscpu.1
>> +-lscpu_SOURCES = sys-utils/lscpu.c
>> +-lscpu_LDADD = $(LDADD) libcommon.la
>> +-dist_man_MANS += sys-utils/lscpu.1
>>   -endif
>>   -
>>    if BUILD_CHCPU
>>    sbin_PROGRAMS += chcpu
>> - chcpu_SOURCES = chcpu.c $(top_srcdir)/lib/cpuset.c \
>> + chcpu_SOURCES = sys-utils/chcpu.c
>> diff --git a/meta/recipes-core/util-**linux/util-linux_2.22.1.bbb/meta/recipes-core/util-
>> **linux/util-linux_2.22.1.bb
>> index 0177bba..f5d777f 100644
>> --- a/meta/recipes-core/util-**linux/util-linux_2.22.1.bb
>> +++ b/meta/recipes-core/util-**linux/util-linux_2.22.1.bb
>> @@ -1,5 +1,5 @@
>>   MAJOR_VERSION = "2.22"
>> -PR = "r1"
>> +PR = "r2"
>>   require util-linux.inc
>>
>>   # note that `lscpu' is under GPLv3+
>>
>>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--20cf307c9f14c790c704d087a2c8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I see. Thanks.<div class=3D"gmail_extra"><br clear=3D"all"><div><div style=
=3D"text-align:center"></div><div style=3D"text-align:center"><div align=3D=
"left" style=3D"font-family:&#39;Times New Roman&#39;;font-size:medium"><fo=
nt face=3D"Arial" color=3D"#333333" size=3D"-1"><br>

<br><strong>Andrei Gherzan</strong></font><br><font face=3D"Arial" color=3D=
"#333333" size=3D"-1">mobile +40.744.478.414=A0=A0fax +40.31.816.28.12</fon=
t><br><font face=3D"Arial" color=3D"#333333" size=3D"-1">Email: <a href=3D"=
mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a></font><br=
>

<font face=3D"Arial" color=3D"#333333" size=3D"-1">Email: <a href=3D"mailto=
:andrei.gherzan@windriver.com" target=3D"_blank">andrei.gherzan@windriver.c=
om</a></font><br><font face=3D"Arial" color=3D"#333333" size=3D"-1">Romania=
</font></div>

</div></div><br>
<br><br><div class=3D"gmail_quote">On Tue, Dec 11, 2012 at 12:49 AM, Saul W=
old <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"=
_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">

<br>
Andrei,<br>
<br>
I think our patches crossed on the list, already applied a similar patch.<b=
r>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 12/06/2012 03:37 AM, Andrei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@windrive=
r.com" target=3D"_blank">andrei.gherzan@windriver.com</a>&gt;<br>
---<br>
=A0 .../util-linux/util-linux/<u></u>remove-lscpu.patch =A0 =A0 =A0 | =A0 3=
0 +++++++++----------<br>
=A0 meta/recipes-core/util-linux/<a href=3D"http://util-linux_2.22.1.bb" ta=
rget=3D"_blank">u<u></u>til-linux_2.22.1.bb</a> =A0| =A0 =A02 +-<br>
=A0 2 files changed, 15 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/util-<u></u>linux/util-linux/remove-lscpu.<u=
></u>patch b/meta/recipes-core/util-<u></u>linux/util-linux/remove-lscpu.<u=
></u>patch<br>
index a15c1e3..4d0b311 100644<br>
--- a/meta/recipes-core/util-<u></u>linux/util-linux/remove-lscpu.<u></u>pa=
tch<br>
+++ b/meta/recipes-core/util-<u></u>linux/util-linux/remove-lscpu.<u></u>pa=
tch<br>
@@ -3,12 +3,13 @@ Upstream-Status: Inappropriate [distribution]<br>
=A0 Take out lscpu stuff from the code<br>
<br>
=A0 Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" tar=
get=3D"_blank">sgw@linux.intel.com</a>&gt;<br>
+Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei.gherzan@windriv=
er.com" target=3D"_blank">andrei.gherzan@windriver.com</a>&gt;<br>
<br>
-Index: util-linux-2.21/<a href=3D"http://configure.ac" target=3D"_blank">c=
onfigure.ac</a><br>
+Index: util-linux-2.22.1/<a href=3D"http://configure.ac" target=3D"_blank"=
>configure.ac</a><br>
=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D<b=
r>
---- util-linux-2.21.orig/<a href=3D"http://configure.ac" target=3D"_blank"=
>configure<u></u>.ac</a><br>
-+++ util-linux-2.21/<a href=3D"http://configure.ac" target=3D"_blank">conf=
igure.ac</a><br>
-@@ -871,7 +871,7 @@ UL_REQUIRES_BUILD([lsblk], [libblkid])<br>
+--- util-linux-2.22.1.orig/<a href=3D"http://configure.ac" target=3D"_blan=
k">configu<u></u>re.ac</a> =A0 =A0 =A0 =A02012-12-06 13:22:58.209874400 +02=
00<br>
++++ util-linux-2.22.1/<a href=3D"http://configure.ac" target=3D"_blank">co=
nfigure.ac</a> =A0 =A0 2012-12-06 13:23:18.721873663 +0200<br>
+@@ -934,7 +934,7 @@<br>
=A0 =A0AM_CONDITIONAL(BUILD_LSBLK, test &quot;x$build_lsblk&quot; =3D xyes)=
<br>
<br>
<br>
@@ -17,24 +18,21 @@ Index: util-linux-2.21/<a href=3D"http://configure.ac" =
target=3D"_blank">configure.ac</a><br>
=A0 =A0UL_REQUIRES_LINUX([lscpu])<br>
=A0 =A0UL_REQUIRES_HAVE([lscpu], [cpu_set_t], [cpu_set_t type])<br>
=A0 =A0AM_CONDITIONAL(BUILD_LSCPU, test &quot;x$build_lscpu&quot; =3D xyes)=
<br>
-Index: util-linux-2.21/sys-utils/<u></u>Makefile.am<br>
+Index: util-linux-2.22.1/sys-utils/<u></u>Makemodule.am<br>
=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D<b=
r>
---- util-linux-2.21.orig/sys-<u></u>utils/Makefile.am<br>
-+++ util-linux-2.21/sys-utils/<u></u>Makefile.am<br>
-@@ -108,16 +108,6 @@ swapon_CFLAGS =3D $(AM_CFLAGS) -I$(ul_libb<br>
- swapon_LDADD =3D $(ul_libblkid_la)<br>
+--- util-linux-2.22.1.orig/sys-<u></u>utils/Makemodule.am =A0 =A0 2012-12-=
06 13:23:07.585874063 +0200<br>
++++ util-linux-2.22.1/sys-utils/<u></u>Makemodule.am =A02012-12-06 13:23:3=
4.217873111 +0200<br>
+@@ -224,13 +224,6 @@<br>
+ swapoff_LDADD =3D $(LDADD) <a href=3D"http://libmount.la" target=3D"_blan=
k">libmount.la</a><br>
=A0 =A0endif<br>
<br>
=A0 -if BUILD_LSCPU<br>
=A0 -usrbin_exec_PROGRAMS +=3D lscpu<br>
--lscpu_SOURCES =3D lscpu.c $(top_srcdir)/lib/cpuset.c \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$(top_srcdir)/lib/strutils.c =
\<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$(top_srcdir)/lib/mbsalign.c =
\<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$(top_srcdir)/lib/tt.c \<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$(top_srcdir)/lib/path.c<br>
--dist_man_MANS +=3D lscpu.1<br>
+-lscpu_SOURCES =3D sys-utils/lscpu.c<br>
+-lscpu_LDADD =3D $(LDADD) <a href=3D"http://libcommon.la" target=3D"_blank=
">libcommon.la</a><br>
+-dist_man_MANS +=3D sys-utils/lscpu.1<br>
=A0 -endif<br>
=A0 -<br>
=A0 =A0if BUILD_CHCPU<br>
=A0 =A0sbin_PROGRAMS +=3D chcpu<br>
- chcpu_SOURCES =3D chcpu.c $(top_srcdir)/lib/cpuset.c \<br>
+ chcpu_SOURCES =3D sys-utils/chcpu.c<br>
diff --git a/meta/recipes-core/util-<u></u>linux/<a href=3D"http://util-lin=
ux_2.22.1.bb" target=3D"_blank">util-linux_2.22.1.bb</a> b/meta/recipes-cor=
e/util-<u></u>linux/<a href=3D"http://util-linux_2.22.1.bb" target=3D"_blan=
k">util-linux_2.22.1.bb</a><br>


index 0177bba..f5d777f 100644<br>
--- a/meta/recipes-core/util-<u></u>linux/<a href=3D"http://util-linux_2.22=
.1.bb" target=3D"_blank">util-linux_2.22.1.bb</a><br>
+++ b/meta/recipes-core/util-<u></u>linux/<a href=3D"http://util-linux_2.22=
.1.bb" target=3D"_blank">util-linux_2.22.1.bb</a><br>
@@ -1,5 +1,5 @@<br>
=A0 MAJOR_VERSION =3D &quot;2.22&quot;<br>
-PR =3D &quot;r1&quot;<br>
+PR =3D &quot;r2&quot;<br>
=A0 require util-linux.inc<br>
<br>
=A0 # note that `lscpu&#39; is under GPLv3+<br>
<br>
</blockquote>
<br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--20cf307c9f14c790c704d087a2c8--
