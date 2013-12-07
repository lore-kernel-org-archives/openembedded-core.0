Return-Path: <andrei@gherzan.ro>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5636B5E7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2013 18:01:23 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so1899373wes.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2013 10:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=n1NNCFt19agsZ26GrYuXpBZNUqC8fU579wb7Sr1Gy3o=;
	b=CLi3E7YMUmhkXmPiqeSlhfDNMKBXuMsy9zqYQozuAAErmDdGmVkaY3hVzvjdnxTEKw
	e5BITj/aCJDbpfYLZqSuwinqKzIUliOzQpQ4nLZnTyFt0du20aVHI97V4MfJx5qBEkxR
	0T0yGMr856Nmy1okpONUQH+ky8Ho8WVcLCDbGJ2+mu0GxKZ5CFuMSKSa8ywsmrzxa3nE
	ALO6njf1VyKXwUkf0KGwEfGbcWORA6EZLAK8EtzWS+QRKaZfYx1zM47Wghylcj9Bxapo
	cbnDxXnjvC/IUKuXjzlGeUbLw5fRF+cZi5kuHy6qhP0ap09z2Fi5DqJRxncvCPqOA8E1
	id1g==
X-Gm-Message-State: ALoCoQlWIEWeYhTCaFumGU9SG3IDw/IscU/sWSv6HVw8xASSUK9ldCwloYSTnhtVlsm0O8FkGYMs
X-Received: by 10.180.160.239 with SMTP id xn15mr7612376wib.17.1386439281993; 
	Sat, 07 Dec 2013 10:01:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.217.150.199 with HTTP; Sat, 7 Dec 2013 10:01:01 -0800 (PST)
X-Originating-IP: [5.13.147.220]
In-Reply-To: <52A0D341.7090007@linux.intel.com>
References: <1386234101-21411-1-git-send-email-andrei@gherzan.ro>
	<1386234101-21411-2-git-send-email-andrei@gherzan.ro>
	<52A0D341.7090007@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 7 Dec 2013 20:01:01 +0200
Message-ID: <CAK18fxH9pFKON9PK2HGkobR70-5_eiPCu+KhZ7+MJvm4si8xXg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2][ 2/2] libav: Update to v0.8.9
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
X-List-Received-Date: Sat, 07 Dec 2013 18:01:24 -0000
Content-Type: multipart/alternative; boundary=047d7b624278e8038b04ecf58c80

--047d7b624278e8038b04ecf58c80
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 5, 2013 at 9:25 PM, Saul Wold <sgw@linux.intel.com> wrote:

>
> Andrei:
>
> I see RP already merged this, but I have a couple of comments
>
>
>
> On 12/05/2013 01:01 AM, Andrei Gherzan wrote:
>
>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> ---
>>   .../0001-configure-enable-pic-for-AArch64.patch                   | 0
>>   meta/recipes-multimedia/libav/{libav_0.8.8.bb => libav_0.8.9.bb}  | 8
>> +++-----
>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>   rename meta/recipes-multimedia/libav/{libav-0.8.8 =>
>> libav-0.8.9}/0001-configure-enable-pic-for-AArch64.patch (100%)
>>   rename meta/recipes-multimedia/libav/{libav_0.8.8.bb => libav_0.8.9.bb}
>> (69%)
>>
>> diff --git a/meta/recipes-multimedia/libav/libav-0.8.8/0001-
>> configure-enable-pic-for-AArch64.patch b/meta/recipes-multimedia/
>> libav/libav-0.8.9/0001-configure-enable-pic-for-AArch64.patch
>> similarity index 100%
>> rename from meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-
>> enable-pic-for-AArch64.patch
>> rename to meta/recipes-multimedia/libav/libav-0.8.9/0001-configure-
>> enable-pic-for-AArch64.patch
>>
>
> We are generally trying to get rid of versioned patch directory in favor
> of just a general recipe name (libav in this case).
>
>
>  diff --git a/meta/recipes-multimedia/libav/libav_0.8.8.bbb/meta/recipes-multimedia/
>> libav/libav_0.8.9.bb
>> similarity index 69%
>> rename from meta/recipes-multimedia/libav/libav_0.8.8.bb
>> rename to meta/recipes-multimedia/libav/libav_0.8.9.bb
>> index 9cb4cf2..065a6d2 100644
>> --- a/meta/recipes-multimedia/libav/libav_0.8.8.bb
>> +++ b/meta/recipes-multimedia/libav/libav_0.8.9.bb
>> @@ -1,10 +1,10 @@
>>   require libav.inc
>>
>> -SRC_URI = "http://libav.org/releases/libav-0.8.8.tar.xz \
>> +SRC_URI = "http://libav.org/releases/libav-0.8.9.tar.xz \
>>
> why not convert this to ${BP} so it does not need to be edited in the
> future. BP = BPN-PV.
>
> Sau!


Pushing a patch to address these comments. Thanks.

-- 
*ag*

--047d7b624278e8038b04ecf58c80
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Thu, Dec 5, 2013 at 9:25 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&g=
t;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Andrei:<br>
<br>
I see RP already merged this, but I have a couple of comments<div class=3D"=
im"><br>
<br>
<br>
On 12/05/2013 01:01 AM, Andrei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" targ=
et=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
---<br>
=A0 .../0001-configure-enable-pic-<u></u>for-AArch64.patch =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 | 0<br>
=A0 meta/recipes-multimedia/libav/<u></u>{<a href=3D"http://libav_0.8.8.bb"=
 target=3D"_blank">libav_0.8.8.bb</a> =3D&gt; <a href=3D"http://libav_0.8.9=
.bb" target=3D"_blank">libav_0.8.9.bb</a>} =A0| 8 +++-----<br>
=A0 2 files changed, 3 insertions(+), 5 deletions(-)<br>
=A0 rename meta/recipes-multimedia/libav/<u></u>{libav-0.8.8 =3D&gt; libav-=
0.8.9}/0001-configure-<u></u>enable-pic-for-AArch64.patch (100%)<br>
=A0 rename meta/recipes-multimedia/libav/<u></u>{<a href=3D"http://libav_0.=
8.8.bb" target=3D"_blank">libav_0.8.8.bb</a> =3D&gt; <a href=3D"http://liba=
v_0.8.9.bb" target=3D"_blank">libav_0.8.9.bb</a>} (69%)<br>
<br>
diff --git a/meta/recipes-multimedia/<u></u>libav/libav-0.8.8/0001-<u></u>c=
onfigure-enable-pic-for-<u></u>AArch64.patch b/meta/recipes-multimedia/<u><=
/u>libav/libav-0.8.9/0001-<u></u>configure-enable-pic-for-<u></u>AArch64.pa=
tch<br>


similarity index 100%<br>
rename from meta/recipes-multimedia/libav/<u></u>libav-0.8.8/0001-configure=
-<u></u>enable-pic-for-AArch64.patch<br>
rename to meta/recipes-multimedia/libav/<u></u>libav-0.8.9/0001-configure-<=
u></u>enable-pic-for-AArch64.patch<br>
</blockquote>
<br></div>
We are generally trying to get rid of versioned patch directory in favor of=
 just a general recipe name (libav in this case).<div class=3D"im"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
diff --git a/meta/recipes-multimedia/<u></u>libav/<a href=3D"http://libav_0=
.8.8.bb" target=3D"_blank">libav_0.8.8.bb</a> b/meta/recipes-multimedia/<u>=
</u>libav/<a href=3D"http://libav_0.8.9.bb" target=3D"_blank">libav_0.8.9.b=
b</a><br>


similarity index 69%<br>
rename from meta/recipes-multimedia/libav/<a href=3D"http://libav_0.8.8.bb"=
 target=3D"_blank"><u></u>libav_0.8.8.bb</a><br>
rename to meta/recipes-multimedia/libav/<a href=3D"http://libav_0.8.9.bb" t=
arget=3D"_blank"><u></u>libav_0.8.9.bb</a><br>
index 9cb4cf2..065a6d2 100644<br>
--- a/meta/recipes-multimedia/<u></u>libav/<a href=3D"http://libav_0.8.8.bb=
" target=3D"_blank">libav_0.8.8.bb</a><br>
+++ b/meta/recipes-multimedia/<u></u>libav/<a href=3D"http://libav_0.8.9.bb=
" target=3D"_blank">libav_0.8.9.bb</a><br>
@@ -1,10 +1,10 @@<br>
=A0 require libav.inc<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://libav.org/releases/libav-0.8.8.tar.xz"=
 target=3D"_blank">http://libav.org/releases/<u></u>libav-0.8.8.tar.xz</a> =
\<br>
+SRC_URI =3D &quot;<a href=3D"http://libav.org/releases/libav-0.8.9.tar.xz"=
 target=3D"_blank">http://libav.org/releases/<u></u>libav-0.8.9.tar.xz</a> =
\<br>
</blockquote></div>
why not convert this to ${BP} so it does not need to be edited in the futur=
e. BP =3D BPN-PV.<br>
<br>
Sau!</blockquote></div><br>Pushing a patch to address these comments. Thank=
s.</div><div class=3D"gmail_extra"><div><br></div>--=A0</div><div class=3D"=
gmail_extra"><b style=3D"text-align:center;color:rgb(51,51,51);font-family:=
Arial">ag</b>
</div></div>

--047d7b624278e8038b04ecf58c80--
