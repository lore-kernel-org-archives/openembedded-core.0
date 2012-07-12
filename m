Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpIf7-0006ki-Jw
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 14:38:30 +0200
Received: by ghbz2 with SMTP id z2so2150038ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 05:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=cU2ghL7ga/5DMuFSIYJ+9P+XAYMplH0oB3+gPG59WxM=;
	b=aH28wZ/jVRFmQUdFJKQJP5SeUvVrW0jTh6wGrlNaVhLH2neE2WSPK4f8b+hiIgD6CG
	Zlw14QOMwqJAFrQ+dLcVibzSwlS6BzxUNnsFRKBi6y+sZrA0MMK1gT4oA8wMs3aVJBOK
	wzUuIgtg2pXf97De9oQNdGbv7lMinuXlkh7fIM78PwhHN2nZQU97Gjm42ThzpX01oZIq
	cuapzgp1W7G2K65teBKPSLy5qBEicv1QImVNK8TJOIAb6pIhQt1bUA3txZFkndkHxK6B
	MTXvf2KAwW5GsjPoFxNOypXQwDrifwuEJ5e+lk7S15PY+LOYElPrtzAn9J/ffjpp6vyl
	fO8g==
Received: by 10.60.11.9 with SMTP id m9mr7298875oeb.5.1342096035902; Thu, 12
	Jul 2012 05:27:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.81.37 with HTTP; Thu, 12 Jul 2012 05:26:55 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <4FFDE7B3.8050804@linux.intel.com>
References: <1342015854-30040-1-git-send-email-koen@dominion.thruhere.net>
	<4FFDE7B3.8050804@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 12 Jul 2012 15:26:55 +0300
Message-ID: <CAK18fxGaTeNPMeVq_JUSTmJggPHjmDLta6hun4p3kqoZbF167A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlGGRJqPXu0x40MjgR55kZjB3S6e+ietqqeVMzKeG7VMU+tFTocoEUCXIN0KR2waYvajX8Y
Subject: Re: [PATCH] xz: update to 5.1.2alpha
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
X-List-Received-Date: Thu, 12 Jul 2012 12:38:30 -0000
Content-Type: multipart/alternative; boundary=e89a8fb2055079762104c4a11511

--e89a8fb2055079762104c4a11511
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 11, 2012 at 11:53 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/11/2012 07:10 AM, Koen Kooi wrote:
>
>> This contains bugfixes from the 5.0.3 and 5.0.4 releases
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>>   meta/recipes-extended/xz/{xz_**5.1.1alpha.bb <http://xz_5.1.1alpha.bb>=>
>> xz_5.1.2alpha.bb} |    7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>   rename meta/recipes-extended/xz/{xz_**5.1.1alpha.bb<http://xz_5.1.1alpha.bb>=>
>> xz_5.1.2alpha.bb} (86%)
>>
>> diff --git a/meta/recipes-extended/xz/xz_**5.1.1alpha.bb<http://xz_5.1.1alpha.bb>b/meta/recipes-extended/xz/
>> xz_**5.1.2alpha.bb <http://xz_5.1.2alpha.bb>
>> similarity index 86%
>> rename from meta/recipes-extended/xz/xz_5.**1.1alpha.bb<http://xz_5.1.1alpha.bb>
>> rename to meta/recipes-extended/xz/xz_5.**1.2alpha.bb<http://xz_5.1.2alpha.bb>
>> index 7fa7177..9d68720 100644
>> --- a/meta/recipes-extended/xz/xz_**5.1.1alpha.bb<http://xz_5.1.1alpha.bb>
>> +++ b/meta/recipes-extended/xz/xz_**5.1.2alpha.bb<http://xz_5.1.2alpha.bb>
>> @@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=**
>> c475b6c7dca236740ace4bba553e8e**1c \
>>                       file://lib/getopt.c;endline=**23;md5=**
>> 2069b0ee710572c03bb3114e4532cd**84 "
>>
>>   SRC_URI = "http://tukaani.org/xz/xz-${**PV}.tar.gz<http://tukaani.org/xz/xz-$%7BPV%7D.tar.gz>
>> "
>> -
>> -SRC_URI[md5sum] = "**bb24436fa12780808e1c1429804841**04"
>> -SRC_URI[sha256sum] = "**54e59a83690a4a0ec88a7d7c3bdef9**
>> 0c6b196c892a93463863c71c24fe87**951a"
>> -
>> -PR = "r0"
>> +SRC_URI[md5sum] = "**9bad1e249537ce69b206815cf28ca8**7b"
>> +SRC_URI[sha256sum] = "**70e792d2a67cfbb8f2dffd0feab6ca**
>> 6e5a4a618d65070fb44a367629d1ba**94e5"
>>
>>   inherit autotools gettext
>>
>>
>>
> How stable is this alpha release?  We don't generally take up re-releases,
> correct?
>
>
We already have an alpha release... so another alpha shouldn't be a
problem, right? .1a it's a good deal as it implements multithreaded
compression and decompression. .2a adds some bug fixes (including some
portability issues).

@g

--e89a8fb2055079762104c4a11511
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jul 11, 2012 at 11:53 PM, Saul Wold <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">=
sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>

On 07/11/2012 07:10 AM, Koen Kooi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
This contains bugfixes from the 5.0.3 and 5.0.4 releases<br>
<br>
Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net" =
target=3D"_blank">koen@dominion.thruhere.net</a>&gt;<br>
---<br>
=A0 meta/recipes-extended/xz/{<a href=3D"http://xz_5.1.1alpha.bb" target=3D=
"_blank">xz_<u></u>5.1.1alpha.bb</a> =3D&gt; <a href=3D"http://xz_5.1.2alph=
a.bb" target=3D"_blank">xz_5.1.2alpha.bb</a>} | =A0 =A07 ++-----<br>
=A0 1 file changed, 2 insertions(+), 5 deletions(-)<br>
=A0 rename meta/recipes-extended/xz/{<a href=3D"http://xz_5.1.1alpha.bb" ta=
rget=3D"_blank">xz_<u></u>5.1.1alpha.bb</a> =3D&gt; <a href=3D"http://xz_5.=
1.2alpha.bb" target=3D"_blank">xz_5.1.2alpha.bb</a>} (86%)<br>
<br>
diff --git a/meta/recipes-extended/xz/<a href=3D"http://xz_5.1.1alpha.bb" t=
arget=3D"_blank">xz_<u></u>5.1.1alpha.bb</a> b/meta/recipes-extended/xz/<a =
href=3D"http://xz_5.1.2alpha.bb" target=3D"_blank">xz_<u></u>5.1.2alpha.bb<=
/a><br>


similarity index 86%<br>
rename from meta/recipes-extended/xz/<a href=3D"http://xz_5.1.1alpha.bb" ta=
rget=3D"_blank">xz_5.<u></u>1.1alpha.bb</a><br>
rename to meta/recipes-extended/xz/<a href=3D"http://xz_5.1.2alpha.bb" targ=
et=3D"_blank">xz_5.<u></u>1.2alpha.bb</a><br>
index 7fa7177..9d68720 100644<br>
--- a/meta/recipes-extended/xz/<a href=3D"http://xz_5.1.1alpha.bb" target=
=3D"_blank">xz_<u></u>5.1.1alpha.bb</a><br>
+++ b/meta/recipes-extended/xz/<a href=3D"http://xz_5.1.2alpha.bb" target=
=3D"_blank">xz_<u></u>5.1.2alpha.bb</a><br>
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>c=
475b6c7dca236740ace4bba553e8e<u></u>1c \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://lib/getopt.c;endline=3D<=
u></u>23;md5=3D<u></u>2069b0ee710572c03bb3114e4532cd<u></u>84 &quot;<br>
<br>
=A0 SRC_URI =3D &quot;<a href=3D"http://tukaani.org/xz/xz-$%7BPV%7D.tar.gz"=
 target=3D"_blank">http://tukaani.org/xz/xz-${<u></u>PV}.tar.gz</a>&quot;<b=
r>
-<br>
-SRC_URI[md5sum] =3D &quot;<u></u>bb24436fa12780808e1c1429804841<u></u>04&q=
uot;<br>
-SRC_URI[sha256sum] =3D &quot;<u></u>54e59a83690a4a0ec88a7d7c3bdef9<u></u>0=
c6b196c892a93463863c71c24fe87<u></u>951a&quot;<br>
-<br>
-PR =3D &quot;r0&quot;<br>
+SRC_URI[md5sum] =3D &quot;<u></u>9bad1e249537ce69b206815cf28ca8<u></u>7b&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>70e792d2a67cfbb8f2dffd0feab6ca<u></u>6=
e5a4a618d65070fb44a367629d1ba<u></u>94e5&quot;<br>
<br>
=A0 inherit autotools gettext<br>
<br>
<br>
</blockquote>
<br>
How stable is this alpha release? =A0We don&#39;t generally take up re-rele=
ases, correct?<br><br></blockquote><div>=A0</div><div>We already have an al=
pha release... so another alpha shouldn&#39;t be a problem, right? .1a it&#=
39;s a good deal as it implements multithreaded compression and decompressi=
on. .2a adds some bug fixes (including=A0some portability issues).</div>

<div><br></div><div>@g</div></div>

--e89a8fb2055079762104c4a11511--
