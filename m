Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T2PYd-00022E-Km
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:37:59 +0200
Received: by obc16 with SMTP id 16so5399789obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=IXmjESwjQZBH7o0a/tE9lxtSGHrdFmCrXjGLY+Acjnc=;
	b=B6VrL6BV1lUMagSoDi/LGAT8GMHYvXJ1OD7GNrbdJRAEjgt7qBH2tSkkioPvBRRoC9
	RAm73Uftp9+tHo25CDN+VDyTSvZrPe2vN8YVKDnKQ2TngQ1wQC9GIMNYx2p69b+vdc2f
	UgTMUbw/YSp8H72PsevDvwiCjsRhxQmoCq/UCBodeu8lx4C01YREiCDzEPseo9Jm4bGI
	BgPCSO4l/FVZJlQJ6TudRVF0npRaETvWAl0cpot34rNCJLxpsKb7Wy3IM0YNvnVxRbG1
	3kQymB9O/vOHcSoz4g8v0NRfHf9lOKwBDCzF8YqVTzPonlYl+EvqXJVzfeKUHvIcfXmM
	KoWQ==
MIME-Version: 1.0
Received: by 10.182.131.98 with SMTP id ol2mr4225386obb.69.1345220760362; Fri,
	17 Aug 2012 09:26:00 -0700 (PDT)
Received: by 10.76.93.35 with HTTP; Fri, 17 Aug 2012 09:26:00 -0700 (PDT)
X-Originating-IP: [109.166.134.228]
Received: by 10.76.93.35 with HTTP; Fri, 17 Aug 2012 09:26:00 -0700 (PDT)
In-Reply-To: <502E6F19.4000402@linux.intel.com>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
	<1345121720-25925-7-git-send-email-constantinx.musca@intel.com>
	<502E6F19.4000402@linux.intel.com>
Date: Fri, 17 Aug 2012 19:26:00 +0300
Message-ID: <CAK18fxGrrvm2hq-tYwmZH_UgA+sUZ-y_p4tT11aZLNLvvp6=WQ@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlUo4Ee61rcoofy2WrrDWhMfFpCZcumKRdzuWIotTzFwBcaYDZDyTeoSKZcYBJbyW6unw9N
Subject: Re: [PATCH 6/6] connman: upgrade to 1.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 16:38:00 -0000
Content-Type: multipart/alternative; boundary=e89a8f5028be90e04204c7789de2

--e89a8f5028be90e04204c7789de2
Content-Type: text/plain; charset=ISO-8859-1

That patch was included in 1.4 version.
On Aug 17, 2012 7:20 PM, "Saul Wold" <sgw@linux.intel.com> wrote:

> On 08/16/2012 05:55 AM, Constantin Musca wrote:
>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> ---
>>   ...ck-that-the-string-isn-t-**empty-before-spl.patch |   37
>> --------------------
>>
> Why was the patch removed, need to have that in the commit message also.
>
> Sau!
>
>    .../connman/{connman_1.3.bb => connman_1.4.bb}     |    9 +++--
>>   2 files changed, 4 insertions(+), 42 deletions(-)
>>   delete mode 100644 meta/recipes-connectivity/**
>> connman/connman/0001-storage-**check-that-the-string-isn-t-**
>> empty-before-spl.patch
>>   rename meta/recipes-connectivity/**connman/{connman_1.3.bb =>
>> connman_1.4.bb} (69%)
>>
>> diff --git a/meta/recipes-connectivity/**connman/connman/0001-storage-**
>> check-that-the-string-isn-t-**empty-before-spl.patch
>> b/meta/recipes-connectivity/**connman/connman/0001-storage-**
>> check-that-the-string-isn-t-**empty-before-spl.patch
>> deleted file mode 100644
>> index c92b586..0000000
>> --- a/meta/recipes-connectivity/**connman/connman/0001-storage-**
>> check-that-the-string-isn-t-**empty-before-spl.patch
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From ea8c7b3efce4c1762411e073893e94**8de5d552d6 Mon Sep 17 00:00:00 2001
>> -From: Ross Burton <ross.burton@intel.com>
>> -Date: Tue, 17 Jul 2012 16:04:12 +0100
>> -Subject: [PATCH] storage: check that the string isn't empty before
>> splitting
>> -
>> -If the string was non-NULL but empty (str="\0"), the following \0
>> assignment
>> -would write to str[-1] and thus cause memory corruption.
>> -
>> -On PPC and MIPS, this was causing crashes in glibc.
>> -
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -Upstream-Status: Submitted
>> -
>> ----
>> - src/storage.c |    6 +++++-
>> - 1 file changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/src/storage.c b/src/storage.c
>> -index 47bd0cb..20766a3 100644
>> ---- a/src/storage.c
>> -+++ b/src/storage.c
>> -@@ -212,7 +212,11 @@ gchar **connman_storage_get_**services()
>> -       closedir(dir);
>> -
>> -       str = g_string_free(result, FALSE);
>> --      if (str) {
>> -+      if (str && str[0] != '\0') {
>> -+              /*
>> -+               * Remove the trailing separator so that services doesn't
>> end up
>> -+               * with an empty element.
>> -+               */
>> -               str[strlen(str) - 1] = '\0';
>> -               services = g_strsplit(str, "/", -1);
>> -       }
>> ---
>> -1.7.10.4
>> -
>> diff --git a/meta/recipes-connectivity/**connman/connman_1.3.bbb/meta/recipes-connectivity/
>> **connman/connman_1.4.bb
>> similarity index 69%
>> rename from meta/recipes-connectivity/**connman/connman_1.3.bb
>> rename to meta/recipes-connectivity/**connman/connman_1.4.bb
>> index 4d82794..bd8ba65 100644
>> --- a/meta/recipes-connectivity/**connman/connman_1.3.bb
>> +++ b/meta/recipes-connectivity/**connman/connman_1.4.bb
>> @@ -1,13 +1,12 @@
>>   require connman.inc
>>
>> -# 1.3 tag
>> -SRCREV = "**3c0fa84091524c7cd6237744f2088f**fee2f1d5ad"
>> +# 1.4 tag
>> +SRCREV = "**f701bbca259f1f35e68d338f31f537**3f75f3da5f"
>>   SRC_URI  = "git://git.kernel.org/pub/scm/**network/connman/connman.git<http://git.kernel.org/pub/scm/network/connman/connman.git>\
>>               file://0001-plugin.h-Change-**visibility-to-default-for-**debug-symb.patch
>> \
>>               file://add_xuser_dbus_**permission.patch \
>>               file://connman \
>>               file://0002-storage.c-If-**there-is-no-d_type-support-**use-fstatat.patch
>> \
>> -            file://0001-timezone.c-If-**there-is-no-d_type-support-**use-fstatat.patch
>> \
>> -            file://0001-storage-check-**that-the-string-isn-t-empty-**
>> before-spl.patch"
>> +            file://0001-timezone.c-If-**there-is-no-d_type-support-**
>> use-fstatat.patch"
>>   S = "${WORKDIR}/git"
>> -PR = "${INC_PR}.2"
>> +PR = "${INC_PR}.0"
>>
>>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--e89a8f5028be90e04204c7789de2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>That patch was included in 1.4 version.</p>
<div class=3D"gmail_quote">On Aug 17, 2012 7:20 PM, &quot;Saul Wold&quot; &=
lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt; wrote=
:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On 08/16/2012 05:55 AM, Constantin Musca wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Constantin Musca &lt;<a href=3D"mailto:constantinx.musca@int=
el.com" target=3D"_blank">constantinx.musca@intel.com</a>&gt;<br>
---<br>
=A0 ...ck-that-the-string-isn-t-<u></u>empty-before-spl.patch | =A0 37 ----=
----------------<br>
</blockquote>
Why was the patch removed, need to have that in the commit message also.<br=
>
<br>
Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=A0 .../connman/{<a href=3D"http://connman_1.3.bb" target=3D"_blank">connma=
n_1.3.bb</a> =3D&gt; <a href=3D"http://connman_1.4.bb" target=3D"_blank">co=
nnman_1.4.bb</a>} =A0 =A0 | =A0 =A09 +++--<br>
=A0 2 files changed, 4 insertions(+), 42 deletions(-)<br>
=A0 delete mode 100644 meta/recipes-connectivity/<u></u>connman/connman/000=
1-storage-<u></u>check-that-the-string-isn-t-<u></u>empty-before-spl.patch<=
br>
=A0 rename meta/recipes-connectivity/<u></u>connman/{<a href=3D"http://conn=
man_1.3.bb" target=3D"_blank">connman_1.3.bb</a> =3D&gt; <a href=3D"http://=
connman_1.4.bb" target=3D"_blank">connman_1.4.bb</a>} (69%)<br>
<br>
diff --git a/meta/recipes-connectivity/<u></u>connman/connman/0001-storage-=
<u></u>check-that-the-string-isn-t-<u></u>empty-before-spl.patch b/meta/rec=
ipes-connectivity/<u></u>connman/connman/0001-storage-<u></u>check-that-the=
-string-isn-t-<u></u>empty-before-spl.patch<br>

deleted file mode 100644<br>
index c92b586..0000000<br>
--- a/meta/recipes-connectivity/<u></u>connman/connman/0001-storage-<u></u>=
check-that-the-string-isn-t-<u></u>empty-before-spl.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-From ea8c7b3efce4c1762411e073893e94<u></u>8de5d552d6 Mon Sep 17 00:00:00 2=
001<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_=
blank">ross.burton@intel.com</a>&gt;<br>
-Date: Tue, 17 Jul 2012 16:04:12 +0100<br>
-Subject: [PATCH] storage: check that the string isn&#39;t empty before spl=
itting<br>
-<br>
-If the string was non-NULL but empty (str=3D&quot;\0&quot;), the following=
 \0 assignment<br>
-would write to str[-1] and thus cause memory corruption.<br>
-<br>
-On PPC and MIPS, this was causing crashes in glibc.<br>
-<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" ta=
rget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
-Upstream-Status: Submitted<br>
-<br>
----<br>
- src/storage.c | =A0 =A06 +++++-<br>
- 1 file changed, 5 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/storage.c b/src/storage.c<br>
-index 47bd0cb..20766a3 100644<br>
---- a/src/storage.c<br>
-+++ b/src/storage.c<br>
-@@ -212,7 +212,11 @@ gchar **connman_storage_get_<u></u>services()<br>
- =A0 =A0 =A0 closedir(dir);<br>
-<br>
- =A0 =A0 =A0 str =3D g_string_free(result, FALSE);<br>
-- =A0 =A0 =A0if (str) {<br>
-+ =A0 =A0 =A0if (str &amp;&amp; str[0] !=3D &#39;\0&#39;) {<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0/*<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 * Remove the trailing separator so that serv=
ices doesn&#39;t end up<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 * with an empty element.<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 */<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 str[strlen(str) - 1] =3D &#39;\0&#39;;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 services =3D g_strsplit(str, &quot;/&quot;, -=
1);<br>
- =A0 =A0 =A0 }<br>
---<br>
-1.7.10.4<br>
-<br>
diff --git a/meta/recipes-connectivity/<u></u>connman/<a href=3D"http://con=
nman_1.3.bb" target=3D"_blank">connman_1.3.bb</a> b/meta/recipes-connectivi=
ty/<u></u>connman/<a href=3D"http://connman_1.4.bb" target=3D"_blank">connm=
an_1.4.bb</a><br>

similarity index 69%<br>
rename from meta/recipes-connectivity/<u></u>connman/<a href=3D"http://conn=
man_1.3.bb" target=3D"_blank">connman_1.3.bb</a><br>
rename to meta/recipes-connectivity/<u></u>connman/<a href=3D"http://connma=
n_1.4.bb" target=3D"_blank">connman_1.4.bb</a><br>
index 4d82794..bd8ba65 100644<br>
--- a/meta/recipes-connectivity/<u></u>connman/<a href=3D"http://connman_1.=
3.bb" target=3D"_blank">connman_1.3.bb</a><br>
+++ b/meta/recipes-connectivity/<u></u>connman/<a href=3D"http://connman_1.=
4.bb" target=3D"_blank">connman_1.4.bb</a><br>
@@ -1,13 +1,12 @@<br>
=A0 require connman.inc<br>
<br>
-# 1.3 tag<br>
-SRCREV =3D &quot;<u></u>3c0fa84091524c7cd6237744f2088f<u></u>fee2f1d5ad&qu=
ot;<br>
+# 1.4 tag<br>
+SRCREV =3D &quot;<u></u>f701bbca259f1f35e68d338f31f537<u></u>3f75f3da5f&qu=
ot;<br>
=A0 SRC_URI =A0=3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/net=
work/connman/connman.git" target=3D"_blank">git.kernel.org/pub/scm/<u></u>n=
etwork/connman/connman.git</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 file://0001-plugin.h-Change-<u></u>visibility-t=
o-default-for-<u></u>debug-symb.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 file://add_xuser_dbus_<u></u>permission.patch \=
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 file://connman \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 file://0002-storage.c-If-<u></u>there-is-no-d_t=
ype-support-<u></u>use-fstatat.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://0001-timezone.c-If-<u></u>there-is-no-d_typ=
e-support-<u></u>use-fstatat.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0file://0001-storage-check-<u></u>that-the-string-i=
sn-t-empty-<u></u>before-spl.patch&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0file://0001-timezone.c-If-<u></u>there-is-no-d_typ=
e-support-<u></u>use-fstatat.patch&quot;<br>
=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
-PR =3D &quot;${INC_PR}.2&quot;<br>
+PR =3D &quot;${INC_PR}.0&quot;<br>
<br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</blockquote></div>

--e89a8f5028be90e04204c7789de2--
