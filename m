Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UPTwy-0007Uy-GH
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 10:30:46 +0200
Received: by mail-we0-f172.google.com with SMTP id r3so5252555wey.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 01:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=VS3n+7n/gEPXQ18NW1EXhWHoZ8DdLyo8KPmc2v0Plgc=;
	b=Jb/n0gacwU0woFcttm1CDeSUsBhl1cHRpCiOohP6oBGEIOLoY6LCPJXZCeGrMyxQd+
	y3/T6FLOm82L2xepIj+j2HsQ1gLhUjs5Jde+PMUBW6w4KV/mYzZNl2Yajt3yIToTeIko
	7qlI5A/u5bD0m4XL54sCjB6Te35Jy6S0TUTDB7hfpl/cynsHQL47ClNIcETsHeFyNUH+
	jEHrG2aTyNCe+03pD2FYj9Lf1jn+Jhpcyp9l4pO9f2FzD2BO8LoPljSgM+bY+su8elZ6
	a4dnsskJEBcIXkvRccZgC31uh4DT+xS3H9HKEX1WDj9PI18x5dGmK3xSDb1q3sjwy87L
	Ai1g==
X-Received: by 10.180.39.207 with SMTP id r15mr17947181wik.16.1365495204638;
	Tue, 09 Apr 2013 01:13:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.40.6 with HTTP; Tue, 9 Apr 2013 01:13:04 -0700 (PDT)
In-Reply-To: <CAMZjud3RpPwm=8h6z87caWireAT5rzVtkfwyJqRF0u7bcvCQ4Q@mail.gmail.com>
References: <1365433358-29073-1-git-send-email-bogdan.a.marinescu@intel.com>
	<5162EACA.7000905@windriver.com>
	<CAMZjud3RpPwm=8h6z87caWireAT5rzVtkfwyJqRF0u7bcvCQ4Q@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Tue, 9 Apr 2013 11:13:04 +0300
Message-ID: <CAMZjud1nLLaHQoqqXBFAST0Jqn4PyFSYy=3xTF74512nMOHHEw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmgz0WkN8I90KQp2Gk6F5fFF7cc6S07smexJVx+kHE3aGBecHWYCJZr9T35SSMPpKu9XBYV
Subject: [PATCH] smart: disable CHANNELSDIR
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
X-List-Received-Date: Tue, 09 Apr 2013 08:30:54 -0000
Content-Type: multipart/alternative; boundary=001a11c23f309d80a204d9e92074

--001a11c23f309d80a204d9e92074
Content-Type: text/plain; charset=ISO-8859-1

Sorry, hit "reply" instead of "reply to all" by mistake.

---------- Forwarded message ----------
From: Marinescu, Bogdan A <bogdan.a.marinescu@intel.com>
Date: Tue, Apr 9, 2013 at 11:11 AM
Subject: Re: [OE-core] [PATCH] smart: disable CHANNELSDIR
To: Mark Hatle <mark.hatle@windriver.com>





On Mon, Apr 8, 2013 at 7:05 PM, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 4/8/13 10:02 AM, Bogdan Marinescu wrote:
>
>> Make CHANNELSDIR in smart empty, since this causes host contamination
>> issues
>> on some RPM-based hosts on which smart is already installed.
>>
>> [YOCTO #3881]
>>
>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   .../python/python-smartpm/**smart-channelsdir.patch  | 24
>> ++++++++++++++++++++++
>>   .../python/python-smartpm_1.4.**1.bb <http://python-smartpm_1.4.1.bb>                |  3 ++-
>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-devtools/python/**python-smartpm/smart-
>> **channelsdir.patch
>>
>> diff --git a/meta/recipes-devtools/**python/python-smartpm/smart-**channelsdir.patch
>> b/meta/recipes-devtools/**python/python-smartpm/smart-**channelsdir.patch
>> new file mode 100644
>> index 0000000..e621b33
>> --- /dev/null
>> +++ b/meta/recipes-devtools/**python/python-smartpm/smart-**
>> channelsdir.patch
>> @@ -0,0 +1,24 @@
>> +Make CHANNELSDIR in smart empty, since this causes host contamination
>> issues
>> +on some RPM-based hosts on which smart is already installed.
>> +
>> +[YOCTO #3881]
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +diff --git a/smart/plugins/channelsync.py b/smart/plugins/channelsync.py
>> +index 3ba95ff..646d696 100644
>> +--- a/smart/plugins/channelsync.py
>> ++++ b/smart/plugins/channelsync.py
>> +@@ -23,7 +23,11 @@ from smart.channel import *
>> + from smart import *
>> + import os
>> +
>> +-CHANNELSDIR = "/etc/smart/channels/"
>> ++# For now, we leave the definition of CHANNELSDIR empty. This prevents
>> smart
>> ++# from erroneously consider the  build host's channels while setting up
>> its
>> ++# channels [YOCTO #3881]. If this feature will be used in the future,
>> CHANNELSDIR
>> ++# should be set to a proper value.
>> ++CHANNELSDIR = ""
>>
>
> I don't remember if the channelsdir is used by default on the target or if
> there is a different directory.
>
> Did you check if (on the target) you can still add channels and do a
> remove install/update of a package?


No, I just checked the poky source for any reference to CHANNELSDIR and
didn't find anything. Plus, CHANNELSDIR is set to a fixed directory
(/etc/smart/channels) in the original smart source and I coulnd't find a
similar directory structure in the poky rootfs image. Nevertheless, I'll
test this and let you know the results.

Thanks,
Bogdan


>
>  +
>> + def syncChannels(channelsdir, force=None):
>> +
>> diff --git a/meta/recipes-devtools/**python/python-smartpm_1.4.1.bbb/meta/recipes-devtools/
>> **python/python-smartpm_1.4.1.bb
>> index d92933f..001d9e4 100644
>> --- a/meta/recipes-devtools/**python/python-smartpm_1.4.1.bb
>> +++ b/meta/recipes-devtools/**python/python-smartpm_1.4.1.bb
>> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=**393a5ca445f6965873eca0259a17f8
>> **33"
>>
>>   DEPENDS = "python rpm"
>> -PR = "r8"
>> +PR = "r9"
>>   SRCNAME = "smart"
>>
>>   SRC_URI = "\
>> @@ -27,6 +27,7 @@ SRC_URI = "\
>>             file://smart-improve-error-**reporting.patch \
>>             file://smart-multilib-fixes.**patch \
>>             file://smart-yaml-error.patch \
>> +          file://smart-channelsdir.patch \
>>             "
>>
>>   SRC_URI[md5sum] = "**573ef32ba177a6b3c4bf7ef04873fc**b6"
>>
>>
>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--001a11c23f309d80a204d9e92074
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, hit &quot;reply&quot; instead of &quot;reply to all=
&quot; by mistake.<br><br><div class=3D"gmail_quote">---------- Forwarded m=
essage ----------<br>From: <b class=3D"gmail_sendername">Marinescu, Bogdan =
A</b> <span dir=3D"ltr">&lt;<a href=3D"mailto:bogdan.a.marinescu@intel.com"=
>bogdan.a.marinescu@intel.com</a>&gt;</span><br>

Date: Tue, Apr 9, 2013 at 11:11 AM<br>Subject: Re: [OE-core] [PATCH] smart:=
 disable CHANNELSDIR<br>To: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@win=
driver.com">mark.hatle@windriver.com</a>&gt;<br><br><br><div dir=3D"ltr"><b=
r>

<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"><div><div cla=
ss=3D"h5">On Mon, Apr 8, 2013 at 7:05 PM, Mark Hatle <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@wi=
ndriver.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><div>On 4/8/13 10:02 AM, Bogdan Marinescu wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Make CHANNELSDIR in smart empty, since this causes host contamination issue=
s<br>
on some RPM-based hosts on which smart is already installed.<br>
<br>
[YOCTO #3881]<br>
<br>
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0 .../python/python-smartpm/<u></u>smart-channelsdir.patch =A0| 24 ++++++=
++++++++++++++++<br>
=A0 .../python/<a href=3D"http://python-smartpm_1.4.1.bb" target=3D"_blank"=
>python-smartpm_1.4.<u></u>1.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A03 =
++-<br>
=A0 2 files changed, 26 insertions(+), 1 deletion(-)<br>
=A0 create mode 100644 meta/recipes-devtools/python/<u></u>python-smartpm/s=
mart-<u></u>channelsdir.patch<br>
<br>
diff --git a/meta/recipes-devtools/<u></u>python/python-smartpm/smart-<u></=
u>channelsdir.patch b/meta/recipes-devtools/<u></u>python/python-smartpm/sm=
art-<u></u>channelsdir.patch<br>
new file mode 100644<br>
index 0000000..e621b33<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<u></u>python/python-smartpm/smart-<u></u>chann=
elsdir.patch<br>
@@ -0,0 +1,24 @@<br>
+Make CHANNELSDIR in smart empty, since this causes host contamination issu=
es<br>
+on some RPM-based hosts on which smart is already installed.<br>
+<br>
+[YOCTO #3881]<br>
+<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+diff --git a/smart/plugins/channelsync.py b/smart/plugins/channelsync.py<b=
r>
+index 3ba95ff..646d696 100644<br>
+--- a/smart/plugins/channelsync.py<br>
++++ b/smart/plugins/channelsync.py<br>
+@@ -23,7 +23,11 @@ from smart.channel import *<br>
+ from smart import *<br>
+ import os<br>
+<br>
+-CHANNELSDIR =3D &quot;/etc/smart/channels/&quot;<br>
++# For now, we leave the definition of CHANNELSDIR empty. This prevents sm=
art<br>
++# from erroneously consider the =A0build host&#39;s channels while settin=
g up its<br>
++# channels [YOCTO #3881]. If this feature will be used in the future, CHA=
NNELSDIR<br>
++# should be set to a proper value.<br>
++CHANNELSDIR =3D &quot;&quot;<br>
</blockquote>
<br></div></div>
I don&#39;t remember if the channelsdir is used by default on the target or=
 if there is a different directory.<br>
<br>
Did you check if (on the target) you can still add channels and do a remove=
 install/update of a package?</blockquote><div><br></div></div></div><div>N=
o, I just checked the poky source for any reference to CHANNELSDIR and didn=
&#39;t find anything. Plus, CHANNELSDIR is set to a fixed directory (/etc/s=
mart/channels) in the original smart source and I coulnd&#39;t find a simil=
ar directory structure in the poky rootfs image. Nevertheless, I&#39;ll tes=
t this and let you know the results.</div>


<div><br></div><div>Thanks,</div><div>Bogdan</div><div class=3D"im"><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style=
:solid;padding-left:1ex">

<div><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
+<br>
+ def syncChannels(channelsdir, force=3DNone):<br>
+<br>
diff --git a/meta/recipes-devtools/<u></u>python/<a href=3D"http://python-s=
martpm_1.4.1.bb" target=3D"_blank">python-smartpm_1.4.1.bb</a> b/meta/recip=
es-devtools/<u></u>python/<a href=3D"http://python-smartpm_1.4.1.bb" target=
=3D"_blank">python-smartpm_1.4.1.bb</a><br>



index d92933f..001d9e4 100644<br>
--- a/meta/recipes-devtools/<u></u>python/<a href=3D"http://python-smartpm_=
1.4.1.bb" target=3D"_blank">python-smartpm_1.4.1.bb</a><br>
+++ b/meta/recipes-devtools/<u></u>python/<a href=3D"http://python-smartpm_=
1.4.1.bb" target=3D"_blank">python-smartpm_1.4.1.bb</a><br>
@@ -11,7 +11,7 @@ LICENSE =3D &quot;GPLv2&quot;<br>
=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<u></u>393a5ca445f69658=
73eca0259a17f8<u></u>33&quot;<br>
<br>
=A0 DEPENDS =3D &quot;python rpm&quot;<br>
-PR =3D &quot;r8&quot;<br>
+PR =3D &quot;r9&quot;<br>
=A0 SRCNAME =3D &quot;smart&quot;<br>
<br>
=A0 SRC_URI =3D &quot;\<br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;\<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://smart-improve-error-<u></u>reporting.patch \=
<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://smart-multilib-fixes.<u></u>patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://smart-yaml-error.patch \<br>
+ =A0 =A0 =A0 =A0 =A0file://smart-channelsdir.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
<br>
=A0 SRC_URI[md5sum] =3D &quot;<u></u>573ef32ba177a6b3c4bf7ef04873fc<u></u>b=
6&quot;<br>
<br>
</blockquote>
<br>
<br></div>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</blockquote></div></div><br></div></div>
</div><br></div>

--001a11c23f309d80a204d9e92074--
