Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (unknown [209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id B953F65EE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 06:57:01 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id b8so2295759lan.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 23:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=IhfiFRzgcI5c7YLpVh+QoGJdN4lxI1sVfzNN9laLa3o=;
	b=VqIDXRDLO1AhPT4/M4gz12JpYQ1KY/5U30+TX1ZjCnYGenaIIjqOEPocLI9SQ7WJgG
	+e3J8VC/h7457/eh+qKkuCCapFHo1+VDU0SsyuEPKdn6Fr+68yaShy32y/T/oFGeFldq
	Bfd/jHkWhwqMu/g6vS4uSD9zXawxSnvb4rKJgr+Jg1vEsoJIUarFUgQldHvyNTNUzrns
	CyMMM64YLSY827MNT4zXnAq7mQyXXx8yZMTtVKtNXp8qab2A6JLmeWaBquU0SmxwJJKM
	sY0N484zQPFNwtUU6KYqmcW9X8AGNrWi1qD6JbIb93gfFJYckgDGR5rAjdH0k2CEwUO1
	QOCw==
MIME-Version: 1.0
X-Received: by 10.112.146.202 with SMTP id te10mr168084lbb.75.1400741822483;
	Wed, 21 May 2014 23:57:02 -0700 (PDT)
Received: by 10.112.138.4 with HTTP; Wed, 21 May 2014 23:57:02 -0700 (PDT)
Date: Thu, 22 May 2014 08:57:02 +0200
Message-ID: <CAPbeDCmO-PZOr+8uohAQy5cQR4LPV+-3=048hhLWAijuU5cNWg@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Saul Wold <sgw@linux.intel.com>, sebastian.wiegand@gersys.de
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/16] CVE Patches and updates
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
X-List-Received-Date: Thu, 22 May 2014 06:57:03 -0000
Content-Type: multipart/alternative; boundary=047d7b3a83e0c0503104f9f79ec1

--047d7b3a83e0c0503104f9f79ec1
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed, May 21, 2014 at 8:01 PM, Saul Wold <sgw@linux.intel.com> wrote:

> Richard,
>
> Another set of CVE fixes and some Updates.
>
> Thanks
>         Sau!
>
> The following changes since commit
> 7decf9dce56868e39902dac5957eb72f6e1e9acd:
>
>   cups: fix for cups not building without avahi (2014-05-21 09:08:11 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
>
> Chong Lu (3):
>   flex: Update to 2.5.39 version
>   byacc: Update to 20140422 version
>   guile: Update to 2.0.11 version
>
> Sebastian Wiegand (1):
>   distro_features_check.bbclass: fix wrong indentation
>
>
Doesn't this commit, 986db87a3931edce8be79f309d07497e4179a810, only check
that the first required distro feature found is available,  and skips
checking the remaining ?

Shouldnt we do something like this

diff --git a/meta/classes/distro_features_check.bbclass
b/meta/classes/distro_features_check.bbclass
index 61b11b7..b728bdc 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -14,9 +14,9 @@ python () {
         distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
         for f in required_distro_features:
             if f in distro_features:
-                break
-        else:
-            raise bb.parse.SkipPackage("missing required distro feature %s
(not in DISTRO_FEATURES)" % required_distro_features)
+                continue
+            else:
+                raise bb.parse.SkipPackage("missing required distro
feature %s (not in DISTRO_FEATURES)" % required_distro_features)

     conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES', True)
     if conflict_distro_features:

/Jacob

--047d7b3a83e0c0503104f9f79ec1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,<br><br></div><div class=3D"=
gmail_extra"><div class=3D"gmail_quote">On Wed, May 21, 2014 at 8:01 PM, Sa=
ul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Richard,<br>
<br>
Another set of CVE fixes and some Updates.<br>
<br>
Thanks<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<br>
<br>
The following changes since commit 7decf9dce56868e39902dac5957eb72f6e1e9acd=
:<br>
<br>
=C2=A0 cups: fix for cups not building without avahi (2014-05-21 09:08:11 +=
0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" target=3D"_blank">git.openembedded.org/openembedded-core-contrib</a> sg=
w/stage<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Dsgw/stage" target=3D"_blank">http://cgit.openembedded.org/c=
git.cgi/openembedded-core-contrib/log/?h=3Dsgw/stage</a><br>
<br>
Chong Lu (3):<br>
=C2=A0 flex: Update to 2.5.39 version<br>
=C2=A0 byacc: Update to 20140422 version<br>
=C2=A0 guile: Update to 2.0.11 version<br>
<br>
Sebastian Wiegand (1):<br>
=C2=A0 distro_features_check.bbclass: fix wrong indentation<br>
<br></blockquote><br></div>Doesn&#39;t this commit, 986db87a3931edce8be79f3=
09d07497e4179a810, only check that the first required distro feature found =
is available,=C2=A0 and skips checking the remaining ?<br><br></div><div cl=
ass=3D"gmail_extra">
Shouldnt we do something like this<br><br>diff --git a/meta/classes/distro_=
features_check.bbclass b/meta/classes/distro_features_check.bbclass<br>inde=
x 61b11b7..b728bdc 100644<br>--- a/meta/classes/distro_features_check.bbcla=
ss<br>
+++ b/meta/classes/distro_features_check.bbclass<br>@@ -14,9 +14,9 @@ pytho=
n () {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 distro_features =
=3D (d.getVar(&#39;DISTRO_FEATURES&#39;, True) or &quot;&quot;).split()<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for f in required_distro_f=
eatures:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 f in distro_features:<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break<br>-=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 else:<br>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 raise bb.parse.SkipPackage(&quot;missing required =
distro feature %s (not in DISTRO_FEATURES)&quot; % required_distro_features=
)<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 continue<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else:<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise bb.parse.SkipPack=
age(&quot;missing required distro feature %s (not in DISTRO_FEATURES)&quot;=
 % required_distro_features)<br>=C2=A0<br>=C2=A0=C2=A0=C2=A0=C2=A0 conflict=
_distro_features =3D d.getVar(&#39;CONFLICT_DISTRO_FEATURES&#39;, True)<br>
=C2=A0=C2=A0=C2=A0=C2=A0 if conflict_distro_features:<br><br></div><div cla=
ss=3D"gmail_extra">/Jacob<br></div></div>

--047d7b3a83e0c0503104f9f79ec1--
