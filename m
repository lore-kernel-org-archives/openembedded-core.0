Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.roxell@gmail.com>) id 1UKuD1-0007Wc-0q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 18:32:23 +0100
Received: by mail-ve0-f179.google.com with SMTP id cz11so933887veb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 10:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=W7ngxPZ2XW8AyUDOLXJxN6rAjIaYEMkNBpccIFwSxMQ=;
	b=FmozIZi5eEXx76V3nbE8sTZFqsbE03tlegNdi14KQ1f99jjSbzBV0FXnCTEPNdXyyP
	r/Sm/50QAo4HWWLyLBiOKAfv5g9wP96Aqt67Q9WGnd1zkDWwFpM2pAtY39tbntfpP0LG
	ok9i4ej+ZFq9bNrDulV4bFgTnf98HSRbL7u5HtpcTocQnZ0Ji2BgshIW4WhmNRPAe/fR
	9/cj8hJ/VZTj2KQkMqNl8iLSm9dalkbJAbwzdcTc2Kq8k62r+rCiIkbPKgfMDA31Cgsr
	8eUqB2wN3xfKf/0rxcqgSV8NpKu7SoATHMEKUAk1MO0QtRHxU9LXybOJ17Wr7ANSbBsA
	DENw==
MIME-Version: 1.0
X-Received: by 10.220.88.145 with SMTP id a17mr23952417vcm.66.1364404521330;
	Wed, 27 Mar 2013 10:15:21 -0700 (PDT)
Received: by 10.59.12.196 with HTTP; Wed, 27 Mar 2013 10:15:21 -0700 (PDT)
In-Reply-To: <515167BF.10305@windriver.com>
References: <1364286013-25970-1-git-send-email-anders.roxell@gmail.com>
	<515167BF.10305@windriver.com>
Date: Wed, 27 Mar 2013 18:15:21 +0100
Message-ID: <CAEUf8Fvh773fTq6SfS4nLtv1qkC95v5wByXyMY0bg0rWmLJqiQ@mail.gmail.com>
From: Anders Roxell <anders.roxell@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: RDEPENDS sed to remove "sed: command not found".
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
X-List-Received-Date: Wed, 27 Mar 2013 17:32:23 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8f14d2ee0b04d8eb2e70

--047d7b3a8f14d2ee0b04d8eb2e70
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 26, 2013 at 10:17 AM, ChenQi <Qi.Chen@windriver.com> wrote:

> On 03/26/2013 04:20 PM, anders.roxell@gmail.com wrote:
>
>> From: Anders Roxell <anders.roxell@enea.com>
>>
>> Log:
>> /etc/rcS.d/S37populate-**volatile.sh: line 13: sed: command not found
>> /etc/rcS.d/S37populate-**volatile.sh: line 152: sed: command not found
>> /etc/rcS.d/S37populate-**volatile.sh: line 152: sed: command not found
>>
>> Signed-off-by: Anders Roxell <anders.roxell@enea.com>
>> ---
>>   meta/recipes-core/initscripts/**initscripts_1.0.bb<http://initscripts_1.0.bb>|    3 ++-
>>   1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/**initscripts/initscripts_1.0.bbb/meta/recipes-core/
>> **initscripts/initscripts_1.0.bb
>> index 649e182..bfd3d28 100644
>> --- a/meta/recipes-core/**initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/**initscripts/initscripts_1.0.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system
>> startup initialization scrip
>>   SECTION = "base"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=**751419260aa954499f7abaabaa882b
>> **be"
>> -PR = "r140"
>> +PR = "r141"
>>     INHIBIT_DEFAULT_DEPS = "1"
>>   @@ -39,6 +39,7 @@ KERNEL_VERSION = ""
>>     inherit update-alternatives
>>   DEPENDS_append = " update-rc.d-native"
>> +RDEPENDS_${PN} = " sed"
>>     ALTERNATIVE_PRIORITY = "90"
>>   ALTERNATIVE_${PN} = "functions"
>>
>
> busybox also provides sed if CONFIG_SED is enabled.
> I'm wondering whether it's necessary to insert dependency here.
> If so, then I think other packages which provide init scripts may also
> rdepend on 'busybox' or 'coreutils' which provide basic commands like
> 'chown' or 'sed'.
>

aha... I missed that busybox could provide sed... I would like to do some
sort of rdepends on busybox or sed (because coreutils does not provide the
sed command).
However, I only want sed if busybox isn't present and vice versa is there a
way to do this?

With kind regards,
Anders

>
> Best Regards,
> Chen Qi
>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--047d7b3a8f14d2ee0b04d8eb2e70
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Mar 26, 2013 at 10:17 AM, ChenQi <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.co=
m</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
3/26/2013 04:20 PM, <a href=3D"mailto:anders.roxell@gmail.com" target=3D"_b=
lank">anders.roxell@gmail.com</a> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@enea.com" target=3D=
"_blank">anders.roxell@enea.com</a>&gt;<br>
<br>
Log:<br>
/etc/rcS.d/S37populate-<u></u>volatile.sh: line 13: sed: command not found<=
br>
/etc/rcS.d/S37populate-<u></u>volatile.sh: line 152: sed: command not found=
<br>
/etc/rcS.d/S37populate-<u></u>volatile.sh: line 152: sed: command not found=
<br>
<br>
Signed-off-by: Anders Roxell &lt;<a href=3D"mailto:anders.roxell@enea.com" =
target=3D"_blank">anders.roxell@enea.com</a>&gt;<br>
---<br>
=A0 meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" tar=
get=3D"_blank"><u></u>initscripts_1.0.bb</a> | =A0 =A03 ++-<br>
=A0 1 files changed, 2 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/<u></u>initscripts/<a href=3D"http://initscr=
ipts_1.0.bb" target=3D"_blank">initscripts_1.0.bb</a> b/meta/recipes-core/<=
u></u>initscripts/<a href=3D"http://initscripts_1.0.bb" target=3D"_blank">i=
nitscripts_1.0.bb</a><br>

index 649e182..bfd3d28 100644<br>
--- a/meta/recipes-core/<u></u>initscripts/<a href=3D"http://initscripts_1.=
0.bb" target=3D"_blank">initscripts_1.0.bb</a><br>
+++ b/meta/recipes-core/<u></u>initscripts/<a href=3D"http://initscripts_1.=
0.bb" target=3D"_blank">initscripts_1.0.bb</a><br>
@@ -3,7 +3,7 @@ DESCRIPTION =3D &quot;Initscripts provide the basic system =
startup initialization scrip<br>
=A0 SECTION =3D &quot;base&quot;<br>
=A0 LICENSE =3D &quot;GPLv2&quot;<br>
=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>751419260aa95449=
9f7abaabaa882b<u></u>be&quot;<br>
-PR =3D &quot;r140&quot;<br>
+PR =3D &quot;r141&quot;<br>
=A0 =A0 INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
=A0 @@ -39,6 +39,7 @@ KERNEL_VERSION =3D &quot;&quot;<br>
=A0 =A0 inherit update-alternatives<br>
=A0 DEPENDS_append =3D &quot; update-rc.d-native&quot;<br>
+RDEPENDS_${PN} =3D &quot; sed&quot;<br>
=A0 =A0 ALTERNATIVE_PRIORITY =3D &quot;90&quot;<br>
=A0 ALTERNATIVE_${PN} =3D &quot;functions&quot;<br>
</blockquote>
<br></div></div>
busybox also provides sed if CONFIG_SED is enabled.<br>
I&#39;m wondering whether it&#39;s necessary to insert dependency here.<br>
If so, then I think other packages which provide init scripts may also rdep=
end on &#39;busybox&#39; or &#39;coreutils&#39; which provide basic command=
s like &#39;chown&#39; or &#39;sed&#39;.<br></blockquote><div style><br>
</div><div style>aha... I missed that busybox could provide sed... I would =
like to do some sort of rdepends on busybox or sed (because coreutils does =
not provide the sed command).</div><div style>However, I only want sed if b=
usybox isn&#39;t present and vice versa is there a way to do this?</div>
<div style><br></div><div style>With kind regards,</div><div style>Anders</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
Best Regards,<br>
Chen Qi<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br></div></div>

--047d7b3a8f14d2ee0b04d8eb2e70--
