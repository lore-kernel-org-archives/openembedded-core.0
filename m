Return-Path: <ghalibkhanexaleap@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id ED34E7F62D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 04:59:21 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id c9so5172883wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 20:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=G3o3VCkBUxKhvLXTIWjT6z6M1mWSGVas2ymZ2VKzMzQ=;
	b=PmVtKOyjgfCNCwyK+rSviRGiAHfRrAmfOT9DLSF8Gwk9tiOoDb2XTmvzaBrPiINyYw
	hCctroHG2k+WkNoqqp0+JmGQhpbn+M02n53YLTMQ0aM14PichD2cLg55WZUfKOReUSlE
	7f/nEoQgwDFgTizvAXM7FJPY0wAix0C2nC19qwL6jD6rzD1lmbByT1IpN5o77v9BRUsH
	w6JOqWtT07tSXwHRB2nun2ypKocIisWd43NRCVUzxy9oJfUeTkOs6UKB8BbirM6EK6aw
	7sKnb/9d1f8b5H3bTgq2bok4Fr9egp+g4wGR+unyIjzRTG3lTgqkdyWTxnL1YqOJBGU0
	RlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=G3o3VCkBUxKhvLXTIWjT6z6M1mWSGVas2ymZ2VKzMzQ=;
	b=N+wKEHasQsewq1mrtiZW8G/4fn4eiGv+SncYAyTzfbsiy03lk1HMy67HQmW3L0rJ20
	RCM7kpNO7VdvOHFfw57idRpeZRdgturAwvp1e7IWv88+m4VbfW3d50nKFl2FZgcs26Nq
	mmB8V2lWXmuHGTnyhpZZkfLGupaY0U1Y0f8XBKVc3QQb+bdGZq6FsSGrU/IxUIIJg6GR
	QCr76y0jaQ6Yk97YltxLuIPVCfKjTo469IWxDK12PVXbYuGFpBzvTDaVagej0WzMHfDI
	+5y/TJf2FI6c56UTXSO0hi+I7wRQ/nTqnajhrtlKeIqYxJ28xwMRCNmPE2H6r6ng8duG
	NWRw==
X-Gm-Message-State: APjAAAVWC85t1qG4U1HTPGqypqE89uj4quOPiHBEkmlPFxT/Idr00bEE
	14ft9ca6NBxbDDT8iTxnBQ0ntYNCQ9ItxH2hN0fxr3At
X-Google-Smtp-Source: APXvYqxuzGc/BNztQMJHeByAFNLzayEPwJWXQ5FFrtTuB4Z3coPzmLIe4UlWD+zCSioASnu1yQvDZm32LF1lE60hwcM=
X-Received: by 2002:a5d:4847:: with SMTP id n7mr10385782wrs.30.1576213162164; 
	Thu, 12 Dec 2019 20:59:22 -0800 (PST)
MIME-Version: 1.0
From: ghalib exaleap <ghalibkhanexaleap@gmail.com>
Date: Fri, 13 Dec 2019 10:29:10 +0530
Message-ID: <CANTMPe2PGPzM=hF8DVm9d8+yzf9VbR-DQgHe-UXDGfVqSR9MbA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Add New recipe in custom layer.
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
X-List-Received-Date: Fri, 13 Dec 2019 04:59:22 -0000
X-Groupsio-MsgNum: 132492
Content-Type: multipart/mixed; boundary="0000000000009fd2c905998eb953"

--0000000000009fd2c905998eb953
Content-Type: multipart/alternative; boundary="0000000000009fd2c705998eb951"

--0000000000009fd2c705998eb951
Content-Type: text/plain; charset="UTF-8"

Hi,

   I Added a New Layer & Recipe in yocto project ( *Openembedded-core* ),
to add Layer & recipe i have gone through following step's

1. cloned yocto
2. source oe-init-build-env
3. bitbake-layers add-layer ../meta-<MY-LAYER>
4. bitbake core-image-minimal ---->  ( Here Meta layers Build's fine )
5. bitbake -c compile <MY-RECIPE>

In my custom Recipe <MY-RECIPE> added <MY-RECIPE>_0.1.bb has Written
following statements...
SRC_URI = "file://Makefile \
file://build_cross_native.sh \
           file://COPYING \

do_compile() {
${WORKDIR}/build_cross_native.sh
}

*Out-put:--*
* what where i mentioned in SRC_URI it's coping to build a directory of
yocto into its recipe folder, and script also running but *it stuck*, i
don't know whats worg, Can any you help me to overcome this?
* I have attached the log of this Recipes Build, if what any clarification
please go through that.

*console output: *
Loading cache: 100%
|########################################################################################################################################################################|
Time: 0:00:00
Loaded 1298 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.44.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "x86_64-oe-linux"
MACHINE              = "qemux86-64"
DISTRO               = "nodistro"
DISTRO_VERSION       = "nodistro.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta
meta-myclang         = "master:cb5e746a2398d70b14a14ada7cef82bfd5e80d0e"

Initialising tasks: 100%
|###################################################################################################################################################################|
Time: 0:00:00
Sstate summary: Wanted 0 Found 0 Missed 0 Current 53 (0% match, 100%
complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
Currently  1 running tasks (429 of 429)  99%
|############################################################################################################################################################
|
0: khanclang-0.1-r0 do_compile - *15h19m31s *(pid 12476)

Thanks in advance
Ghalib khan c.

--0000000000009fd2c705998eb951
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>=C2=A0 =C2=A0I Added a New Layer &a=
mp; Recipe in yocto project (=C2=A0<b style=3D"color:rgb(0,0,0);font-family=
:&quot;Times New Roman&quot;;font-size:medium"><font color=3D"#000000">Open=
embedded-core</font></b>=C2=A0), to add Layer &amp; recipe i have gone thro=
ugh following step&#39;s</div><div><br></div><div>1. cloned yocto=C2=A0</di=
v><div>2.=C2=A0source oe-init-build-env</div><div>3.=C2=A0bitbake-layers ad=
d-layer ../meta-&lt;MY-LAYER&gt;</div><div>4. bitbake core-image-minimal --=
--&gt;=C2=A0 ( Here Meta layers Build&#39;s fine )</div><div>5. bitbake -c =
compile &lt;MY-RECIPE&gt;</div><div><br></div><div>In my custom Recipe &lt;=
MY-RECIPE&gt; added=C2=A0&lt;MY-RECIPE&gt;_<a href=3D"http://0.1.bb">0.1.bb=
</a> has Written following statements...</div><div>SRC_URI =3D &quot;file:/=
/Makefile \<br>	file://build_cross_native.sh \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0file://COPYING \<br></div><div><br></div><div>do_compile()=
 {<br>${WORKDIR}/build_cross_native.sh<br>}<br></div><div><br></div><div><b=
>Out-put:--</b></div><div>* what where i mentioned=C2=A0in=C2=A0SRC_URI it&=
#39;s coping to build a directory=C2=A0of yocto into its recipe folder, and=
 script also running=C2=A0but <b style=3D"background-color:rgb(255,255,0)">=
it stuck</b>, i don&#39;t know whats worg, Can any you help me to overcome =
this?=C2=A0<br></div><div>* I have attached the log of this Recipes Build, =
if what any clarification please go through that.=C2=A0</div><div><br></div=
><div><b>console output:=C2=A0</b></div><div>Loading cache: 100% |#########=
###########################################################################=
###########################################################################=
#########| Time: 0:00:00<br>Loaded 1298 entries from dependency cache.<br>N=
OTE: Resolving any missing task queue dependencies<br><br>Build Configurati=
on:<br>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.44.0&quot;=
<br>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-lin=
ux&quot;<br>NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;ubuntu-16.04&quot=
;<br>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-oe-linu=
x&quot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;qemux86-64&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;nodistro&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;nodistro.0&quot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;m=
64 core2&quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&=
quot;<br>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>m=
eta-myclang =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:cb5e746a2398d70b14=
a14ada7cef82bfd5e80d0e&quot;<br><br>Initialising tasks: 100% |#############=
###########################################################################=
###########################################################################=
| Time: 0:00:00<br>Sstate summary: Wanted 0 Found 0 Missed 0 Current 53 (0%=
 match, 100% complete)<br>NOTE: Executing Tasks<br>NOTE: Setscene tasks com=
pleted<br>Currently =C2=A01 running tasks (429 of 429) =C2=A099% |#########=
###########################################################################=
######################################################################## |<=
br>0: khanclang-0.1-r0 do_compile - <b style=3D"background-color:rgb(255,25=
5,0)">15h19m31s </b>(pid 12476)<br></div><div><br></div><div>Thanks in=C2=
=A0advance</div><div>Ghalib khan c.</div></div>

--0000000000009fd2c705998eb951--

--0000000000009fd2c905998eb953
Content-Type: application/octet-stream; name="log.do_compile.12476"
Content-Disposition: attachment; filename="log.do_compile.12476"
Content-Transfer-Encoding: base64
Content-ID: <f_k43ojvmv0>
X-Attachment-Id: f_k43ojvmv0

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gYXV0b3Rvb2xzX2FjbG9jYWxzCkRFQlVH
OiBTSVRFIGZpbGVzIFsnZW5kaWFuLWxpdHRsZScsICdjb21tb24tbGludXgnLCAnY29tbW9uLWds
aWJjJywgJ2JpdC02NCcsICd4ODZfNjQtbGludXgnLCAnY29tbW9uJ10KREVCVUc6IFB5dGhvbiBm
dW5jdGlvbiBhdXRvdG9vbHNfYWNsb2NhbHMgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBzaGVs
bCBmdW5jdGlvbiBkb19jb21waWxlCk5PVEU6ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKgpOT1RFOiAjCQkJCSMgRnJvbSBraGFuY2xhbmcuYmIgIwkJCQkJ
CQkjCk5PVEU6ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KgoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKIwkJCQkJIyBGcm9tIGJ1
aWxkX2Nyb3NzX25hdGl2ZS5zaCAjCQkJCQkjCioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKgovaG9tZS9leGFsZWFwc2VydmVyL2toYW5fd3Mva2hhbi90b29scy95b2N0b193
cy93cy9yaXNjdi15b2N0by9vcGVuZW1iZWRkZWQtY29yZS9idWlsZC90bXAtZ2xpYmMvd29yay9x
ZW11eDg2XzY0LW9lLWxpbnV4L2toYW5jbGFuZy8wLjEtcjAvYnVpbGQKQ2xvbmluZyBpbnRvICdy
aXNjdi1nbnUtdG9vbGNoYWluJy4uLgpTdWJtb2R1bGUgJ3FlbXUnIChodHRwczovL2dpdC5xZW11
Lm9yZy9naXQvcWVtdS5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ3FlbXUnClN1Ym1vZHVsZSAn
cmlzY3YtYmludXRpbHMnIChodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYmludXRpbHMt
Z2RiLmdpdCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAncmlzY3YtYmludXRpbHMnClN1Ym1vZHVsZSAn
cmlzY3YtZGVqYWdudScgKGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1kZWphZ251Lmdp
dCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAncmlzY3YtZGVqYWdudScKU3VibW9kdWxlICdyaXNjdi1n
Y2MnIChodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtZ2NjLmdpdCkgcmVnaXN0ZXJlZCBm
b3IgcGF0aCAncmlzY3YtZ2NjJwpTdWJtb2R1bGUgJ3Jpc2N2LWdkYicgKGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi9yaXNjdi1iaW51dGlscy1nZGIuZ2l0KSByZWdpc3RlcmVkIGZvciBwYXRoICdy
aXNjdi1nZGInClN1Ym1vZHVsZSAncmlzY3YtZ2xpYmMnIChodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3YvcmlzY3YtZ2xpYmMuZ2l0KSByZWdpc3RlcmVkIGZvciBwYXRoICdyaXNjdi1nbGliYycKU3Vi
bW9kdWxlICdyaXNjdi1uZXdsaWInIChodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtbmV3
bGliLmdpdCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAncmlzY3YtbmV3bGliJwpDbG9uaW5nIGludG8g
J3FlbXUnLi4uClN1Ym1vZHVsZSBwYXRoICdxZW11JzogY2hlY2tlZCBvdXQgJzU3ZGZjMmM0ZDUx
ZTc3MGVkM2Y2MTdlNWQxNDU2ZDFlMmJhY2YzZjAnClN1Ym1vZHVsZSAnY2Fwc3RvbmUnIChodHRw
czovL2dpdC5xZW11Lm9yZy9naXQvY2Fwc3RvbmUuZ2l0KSByZWdpc3RlcmVkIGZvciBwYXRoICdj
YXBzdG9uZScKU3VibW9kdWxlICdkdGMnIChodHRwczovL2dpdC5xZW11Lm9yZy9naXQvZHRjLmdp
dCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAnZHRjJwpTdWJtb2R1bGUgJ3JvbXMvUWVtdU1hY0RyaXZl
cnMnIChodHRwczovL2dpdC5xZW11Lm9yZy9naXQvUWVtdU1hY0RyaXZlcnMuZ2l0KSByZWdpc3Rl
cmVkIGZvciBwYXRoICdyb21zL1FlbXVNYWNEcml2ZXJzJwpTdWJtb2R1bGUgJ3JvbXMvU0xPRicg
KGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9TTE9GLmdpdCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAn
cm9tcy9TTE9GJwpTdWJtb2R1bGUgJ3JvbXMvZWRrMicgKGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dp
dC9lZGsyLmdpdCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAncm9tcy9lZGsyJwpTdWJtb2R1bGUgJ3Jv
bXMvaXB4ZScgKGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9pcHhlLmdpdCkgcmVnaXN0ZXJlZCBm
b3IgcGF0aCAncm9tcy9pcHhlJwpTdWJtb2R1bGUgJ3JvbXMvb3BlbmJpb3MnIChodHRwczovL2dp
dC5xZW11Lm9yZy9naXQvb3BlbmJpb3MuZ2l0KSByZWdpc3RlcmVkIGZvciBwYXRoICdyb21zL29w
ZW5iaW9zJwpTdWJtb2R1bGUgJ3JvbXMvb3BlbmhhY2t3YXJlJyAoaHR0cHM6Ly9naXQucWVtdS5v
cmcvZ2l0L29wZW5oYWNrd2FyZS5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ3JvbXMvb3Blbmhh
Y2t3YXJlJwpTdWJtb2R1bGUgJ3JvbXMvcWVtdS1wYWxjb2RlJyAoaHR0cHM6Ly9naXQucWVtdS5v
cmcvZ2l0L3FlbXUtcGFsY29kZS5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ3JvbXMvcWVtdS1w
YWxjb2RlJwpTdWJtb2R1bGUgJ3JvbXMvc2VhYmlvcycgKGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dp
dC9zZWFiaW9zLmdpdC8pIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ3JvbXMvc2VhYmlvcycKU3VibW9k
dWxlICdyb21zL3NlYWJpb3MtaHBwYScgKGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9zZWFiaW9z
LWhwcGEuZ2l0KSByZWdpc3RlcmVkIGZvciBwYXRoICdyb21zL3NlYWJpb3MtaHBwYScKU3VibW9k
dWxlICdyb21zL3NnYWJpb3MnIChodHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2dhYmlvcy5naXQp
IHJlZ2lzdGVyZWQgZm9yIHBhdGggJ3JvbXMvc2dhYmlvcycKU3VibW9kdWxlICdyb21zL3NraWJv
b3QnIChodHRwczovL2dpdC5xZW11Lm9yZy9naXQvc2tpYm9vdC5naXQpIHJlZ2lzdGVyZWQgZm9y
IHBhdGggJ3JvbXMvc2tpYm9vdCcKU3VibW9kdWxlICdyb21zL3UtYm9vdCcgKGh0dHBzOi8vZ2l0
LnFlbXUub3JnL2dpdC91LWJvb3QuZ2l0KSByZWdpc3RlcmVkIGZvciBwYXRoICdyb21zL3UtYm9v
dCcKU3VibW9kdWxlICdyb21zL3UtYm9vdC1zYW00NjBleCcgKGh0dHBzOi8vZ2l0LnFlbXUub3Jn
L2dpdC91LWJvb3Qtc2FtNDYwZXguZ2l0KSByZWdpc3RlcmVkIGZvciBwYXRoICdyb21zL3UtYm9v
dC1zYW00NjBleCcKU3VibW9kdWxlICdzbGlycCcgKGh0dHBzOi8vZ2l0LnFlbXUub3JnL2dpdC9s
aWJzbGlycC5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ3NsaXJwJwpTdWJtb2R1bGUgJ3Rlc3Rz
L2ZwL2JlcmtlbGV5LXNvZnRmbG9hdC0zJyAoaHR0cHM6Ly9naXQucWVtdS5vcmcvZ2l0L2Jlcmtl
bGV5LXNvZnRmbG9hdC0zLmdpdCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAndGVzdHMvZnAvYmVya2Vs
ZXktc29mdGZsb2F0LTMnClN1Ym1vZHVsZSAndGVzdHMvZnAvYmVya2VsZXktdGVzdGZsb2F0LTMn
IChodHRwczovL2dpdC5xZW11Lm9yZy9naXQvYmVya2VsZXktdGVzdGZsb2F0LTMuZ2l0KSByZWdp
c3RlcmVkIGZvciBwYXRoICd0ZXN0cy9mcC9iZXJrZWxleS10ZXN0ZmxvYXQtMycKU3VibW9kdWxl
ICd1aS9rZXljb2RlbWFwZGInIChodHRwczovL2dpdC5xZW11Lm9yZy9naXQva2V5Y29kZW1hcGRi
LmdpdCkgcmVnaXN0ZXJlZCBmb3IgcGF0aCAndWkva2V5Y29kZW1hcGRiJwpDbG9uaW5nIGludG8g
J2NhcHN0b25lJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVtdS9jYXBzdG9uZSc6IGNoZWNrZWQgb3V0
ICcyMmVhZDNlMGJmZGI4NzUxNjY1NjQ1MzMzNjE2MGUwYTM3YjA2NmJmJwpDbG9uaW5nIGludG8g
J2R0YycuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUvZHRjJzogY2hlY2tlZCBvdXQgJzg4ZjE4OTA5
ZGI3MzFhNjI3NDU2ZjI2ZDc3OTQ0NWY4NGU0NDk1MzYnCkNsb25pbmcgaW50byAncm9tcy9RZW11
TWFjRHJpdmVycycuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUvcm9tcy9RZW11TWFjRHJpdmVycyc6
IGNoZWNrZWQgb3V0ICc5MGM0ODhkNWY0YTQwNzM0MjI0N2I5ZWE4NjlkZjFjMmQ5YzhlMjY2JwpD
bG9uaW5nIGludG8gJ3JvbXMvU0xPRicuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUvcm9tcy9TTE9G
JzogY2hlY2tlZCBvdXQgJ2E1YjQyOGUxYzFlYWU3MDNiZGQ2MmEzZjUyNzIyM2MyOTFlZTNmZGMn
CkNsb25pbmcgaW50byAncm9tcy9lZGsyJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVtdS9yb21zL2Vk
azInOiBjaGVja2VkIG91dCAnMjBkMmU1YTEyNWUzNGZjODUwMTAyNjYxM2E3MTU0OWIyYTFhM2U1
NCcKU3VibW9kdWxlICdTb2Z0RmxvYXQnIChodHRwczovL2dpdGh1Yi5jb20vdWNiLWJhci9iZXJr
ZWxleS1zb2Z0ZmxvYXQtMy5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ0FybVBrZy9MaWJyYXJ5
L0FybVNvZnRGbG9hdExpYi9iZXJrZWxleS1zb2Z0ZmxvYXQtMycKU3VibW9kdWxlICdDcnlwdG9Q
a2cvTGlicmFyeS9PcGVuc3NsTGliL29wZW5zc2wnIChodHRwczovL2dpdGh1Yi5jb20vb3BlbnNz
bC9vcGVuc3NsKSByZWdpc3RlcmVkIGZvciBwYXRoICdDcnlwdG9Qa2cvTGlicmFyeS9PcGVuc3Ns
TGliL29wZW5zc2wnCkNsb25pbmcgaW50byAnQXJtUGtnL0xpYnJhcnkvQXJtU29mdEZsb2F0TGli
L2JlcmtlbGV5LXNvZnRmbG9hdC0zJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVtdS9yb21zL2VkazIv
QXJtUGtnL0xpYnJhcnkvQXJtU29mdEZsb2F0TGliL2JlcmtlbGV5LXNvZnRmbG9hdC0zJzogY2hl
Y2tlZCBvdXQgJ2I2NGFmNDFjMzI3NmY5N2YwZTE4MTkyMDQwMGVlMDU2YjljODgwMzcnCkNsb25p
bmcgaW50byAnQ3J5cHRvUGtnL0xpYnJhcnkvT3BlbnNzbExpYi9vcGVuc3NsJy4uLgpTdWJtb2R1
bGUgcGF0aCAncWVtdS9yb21zL2VkazIvQ3J5cHRvUGtnL0xpYnJhcnkvT3BlbnNzbExpYi9vcGVu
c3NsJzogY2hlY2tlZCBvdXQgJzUwZWFhYzlmMzMzNzY2NzI1OWRlNzI1NDUxZjIwMWU3ODQ1OTk2
ODcnClN1Ym1vZHVsZSAnYm9yaW5nc3NsJyAoaHR0cHM6Ly9ib3Jpbmdzc2wuZ29vZ2xlc291cmNl
LmNvbS9ib3Jpbmdzc2wpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ2JvcmluZ3NzbCcKU3VibW9kdWxl
ICdrcmI1JyAoaHR0cHM6Ly9naXRodWIuY29tL2tyYjUva3JiNSkgcmVnaXN0ZXJlZCBmb3IgcGF0
aCAna3JiNScKU3VibW9kdWxlICdweWNhLmNyeXB0b2dyYXBoeScgKGh0dHBzOi8vZ2l0aHViLmNv
bS9weWNhL2NyeXB0b2dyYXBoeS5naXQpIHJlZ2lzdGVyZWQgZm9yIHBhdGggJ3B5Y2EtY3J5cHRv
Z3JhcGh5JwpDbG9uaW5nIGludG8gJ2JvcmluZ3NzbCcuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUv
cm9tcy9lZGsyL0NyeXB0b1BrZy9MaWJyYXJ5L09wZW5zc2xMaWIvb3BlbnNzbC9ib3Jpbmdzc2wn
OiBjaGVja2VkIG91dCAnMjA3MGY4YWQ5MTUxZGM4ZjNhNzNiZmZhYTE0NmI1ZTY5MzdhNTgzZicK
Q2xvbmluZyBpbnRvICdrcmI1Jy4uLgpTdWJtb2R1bGUgcGF0aCAncWVtdS9yb21zL2VkazIvQ3J5
cHRvUGtnL0xpYnJhcnkvT3BlbnNzbExpYi9vcGVuc3NsL2tyYjUnOiBjaGVja2VkIG91dCAnYjlh
ZDZjNDk1MDVjOTZhMDg4MzI2YjYyYTUyNTY4ZTM0ODRmMjE2OCcKQ2xvbmluZyBpbnRvICdweWNh
LWNyeXB0b2dyYXBoeScuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUvcm9tcy9lZGsyL0NyeXB0b1Br
Zy9MaWJyYXJ5L09wZW5zc2xMaWIvb3BlbnNzbC9weWNhLWNyeXB0b2dyYXBoeSc6IGNoZWNrZWQg
b3V0ICcwOTQwMzEwMGRlMmY2ZjFjZGQwZDQ4NGRjYjhlNjIwZjFjMzM1YzhmJwpDbG9uaW5nIGlu
dG8gJ3JvbXMvaXB4ZScuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUvcm9tcy9pcHhlJzogY2hlY2tl
ZCBvdXQgJ2RlNDU2NWNiZTc2ZWE5Zjc5MTNhMDFmMzMxYmUzZWU5MDFiYjZlMTcnCkNsb25pbmcg
aW50byAncm9tcy9vcGVuYmlvcycuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUvcm9tcy9vcGVuYmlv
cyc6IGNoZWNrZWQgb3V0ICdjNzllMGVjYjg0ZjRmMWVlM2Y3M2Y1MjE2MjJlMjY0ZWRkMWJmMTc0
JwpDbG9uaW5nIGludG8gJ3JvbXMvb3BlbmhhY2t3YXJlJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVt
dS9yb21zL29wZW5oYWNrd2FyZSc6IGNoZWNrZWQgb3V0ICdjNTU5ZGE3YzhlZWM1ZTQ1ZWYxZjY3
OTc4ODI3YWY2ZjBiOTU0NmY1JwpDbG9uaW5nIGludG8gJ3JvbXMvcWVtdS1wYWxjb2RlJy4uLgpT
dWJtb2R1bGUgcGF0aCAncWVtdS9yb21zL3FlbXUtcGFsY29kZSc6IGNoZWNrZWQgb3V0ICdiZjBl
MTM2OTg4NzI0NTAxNjRmYTcwNDBkYTM2YTk1ZDJkNGIzMjZmJwpDbG9uaW5nIGludG8gJ3JvbXMv
c2VhYmlvcycuLi4KU3VibW9kdWxlIHBhdGggJ3FlbXUvcm9tcy9zZWFiaW9zJzogY2hlY2tlZCBv
dXQgJ2E1Y2FiNThlOWEzZmI2ZTE2OGFiYTkxOWM1NjY5YmVhNDA2NTczYjQnCkNsb25pbmcgaW50
byAncm9tcy9zZWFiaW9zLWhwcGEnLi4uClN1Ym1vZHVsZSBwYXRoICdxZW11L3JvbXMvc2VhYmlv
cy1ocHBhJzogY2hlY2tlZCBvdXQgJzBmNGZlODQ2NTgxNjVlOTZjZTM1ODcwZmQxOWZjNjM0ZTE4
MmU3N2InCkNsb25pbmcgaW50byAncm9tcy9zZ2FiaW9zJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVt
dS9yb21zL3NnYWJpb3MnOiBjaGVja2VkIG91dCAnY2JhZWU1MjI4N2U1ZjMyMzczMTgxY2ZmNTBh
MDBiNmM0YWM5MDE1YScKQ2xvbmluZyBpbnRvICdyb21zL3NraWJvb3QnLi4uClN1Ym1vZHVsZSBw
YXRoICdxZW11L3JvbXMvc2tpYm9vdCc6IGNoZWNrZWQgb3V0ICcyNjFjYThlNzc5ZTUxMzg4Njlh
NDVmMTc0Y2FhNDliZTZhMjc0NTAxJwpDbG9uaW5nIGludG8gJ3JvbXMvdS1ib290Jy4uLgpTdWJt
b2R1bGUgcGF0aCAncWVtdS9yb21zL3UtYm9vdCc6IGNoZWNrZWQgb3V0ICdkMzY4OTI2N2Y5MmM1
OTU2ZTA5Y2M3ZDFiYWE0NzAwMTQxNjYyYmZmJwpDbG9uaW5nIGludG8gJ3JvbXMvdS1ib290LXNh
bTQ2MGV4Jy4uLgpTdWJtb2R1bGUgcGF0aCAncWVtdS9yb21zL3UtYm9vdC1zYW00NjBleCc6IGNo
ZWNrZWQgb3V0ICc2MGIzOTE2ZjMzZTYxN2E4MTU5NzNjNWE2ZGY3NzA1NWIyZTNhNTg4JwpDbG9u
aW5nIGludG8gJ3NsaXJwJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVtdS9zbGlycCc6IGNoZWNrZWQg
b3V0ICdmMGRhNjcyNjIwN2I3NDBmNjEwMTAyOGIyOTkyZjkxODQ3N2E0YjA4JwpDbG9uaW5nIGlu
dG8gJ3Rlc3RzL2ZwL2JlcmtlbGV5LXNvZnRmbG9hdC0zJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVt
dS90ZXN0cy9mcC9iZXJrZWxleS1zb2Z0ZmxvYXQtMyc6IGNoZWNrZWQgb3V0ICdiNjRhZjQxYzMy
NzZmOTdmMGUxODE5MjA0MDBlZTA1NmI5Yzg4MDM3JwpDbG9uaW5nIGludG8gJ3Rlc3RzL2ZwL2Jl
cmtlbGV5LXRlc3RmbG9hdC0zJy4uLgpTdWJtb2R1bGUgcGF0aCAncWVtdS90ZXN0cy9mcC9iZXJr
ZWxleS10ZXN0ZmxvYXQtMyc6IGNoZWNrZWQgb3V0ICc1YTU5ZGNlYzE5MzI3Mzk2YTAxMWExN2Zk
OTI0YWVkNGZlYzQxNmIzJwpDbG9uaW5nIGludG8gJ3VpL2tleWNvZGVtYXBkYicuLi4KU3VibW9k
dWxlIHBhdGggJ3FlbXUvdWkva2V5Y29kZW1hcGRiJzogY2hlY2tlZCBvdXQgJzZiM2Q3MTZlMmI2
NDcyZWI3MTg5ZDMyMjA1NTIyODBlZjNkODMyY2UnCkNsb25pbmcgaW50byAncmlzY3YtYmludXRp
bHMnLi4uClN1Ym1vZHVsZSBwYXRoICdyaXNjdi1iaW51dGlscyc6IGNoZWNrZWQgb3V0ICdkOTFj
YWRiNDVmM2VmOWY5NmM2ZWJlOGZmYjIwNDcyODI0ZWQwNWE3JwpDbG9uaW5nIGludG8gJ3Jpc2N2
LWRlamFnbnUnLi4uClN1Ym1vZHVsZSBwYXRoICdyaXNjdi1kZWphZ251JzogY2hlY2tlZCBvdXQg
JzRlYTQ5OGE4ZTFmYWZlYjU2ODUzMGQ4NGRiMTg4MDA2NjQ3OGM4NmInCkNsb25pbmcgaW50byAn
cmlzY3YtZ2NjJy4uLgpTdWJtb2R1bGUgcGF0aCAncmlzY3YtZ2NjJzogY2hlY2tlZCBvdXQgJzU0
OTQ1ZWI4YWQ1YTA2NmRhMmQ0ZTZhNjJmZmViNTEzZDM0MWViNDEnCkNsb25pbmcgaW50byAncmlz
Y3YtZ2RiJy4uLgpTdWJtb2R1bGUgcGF0aCAncmlzY3YtZ2RiJzogY2hlY2tlZCBvdXQgJ2MzZWI0
MDc4NTIwZGFkODIzNGZmZDdmYmY4OTNhYzBkYTIzYWQzYzgnCkNsb25pbmcgaW50byAncmlzY3Yt
Z2xpYmMnLi4uClN1Ym1vZHVsZSBwYXRoICdyaXNjdi1nbGliYyc6IGNoZWNrZWQgb3V0ICcwNjk4
M2ZlNTJjZmU4ZTQ3NzkwMzVjMjdlOGNjNWQyY2FhYjMxNTMxJwpDbG9uaW5nIGludG8gJ3Jpc2N2
LW5ld2xpYicuLi4KU3VibW9kdWxlIHBhdGggJ3Jpc2N2LW5ld2xpYic6IGNoZWNrZWQgb3V0ICcw
ZDI0YTg2ODIyYTVlZTczZDZhNmFhNjllMmEwMTE4YWExZTM1MjA0Jwpjb25maWd1cmU6IGxvYWRp
bmcgc2l0ZSBzY3JpcHQgL2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4vdG9vbHMveW9j
dG9fd3Mvd3MvcmlzY3YteW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9zaXRlL2VuZGlhbi1s
aXR0bGUKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL2V4YWxlYXBzZXJ2ZXIv
a2hhbl93cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRlZC1j
b3JlL21ldGEvc2l0ZS9jb21tb24tbGludXgKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0
IC9ob21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2
LXlvY3RvL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvc2l0ZS9jb21tb24tZ2xpYmMKY29uZmlndXJl
OiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93cy9raGFuL3Rv
b2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvc2l0ZS94
ODZfNjQtbGludXgKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL2V4YWxlYXBz
ZXJ2ZXIva2hhbl93cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJl
ZGRlZC1jb3JlL21ldGEvc2l0ZS9jb21tb24KY2hlY2tpbmcgZm9yIHg4Nl82NC1vZS1saW51eC1n
Y2MuLi4geDg2XzY0LW9lLWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUy
IC1tc3NlMyAtbWZwbWF0aD1zc2UgLS1zeXNyb290PS9ob21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93
cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRlZC1jb3JlL2J1
aWxkL3RtcC1nbGliYy93b3JrL3FlbXV4ODZfNjQtb2UtbGludXgva2hhbmNsYW5nLzAuMS1yMC9y
ZWNpcGUtc3lzcm9vdApjaGVja2luZyB3aGV0aGVyIHRoZSBDIGNvbXBpbGVyIHdvcmtzLi4uIHll
cwpjaGVja2luZyBmb3IgQyBjb21waWxlciBkZWZhdWx0IG91dHB1dCBmaWxlIG5hbWUuLi4gYS5v
dXQKY2hlY2tpbmcgZm9yIHN1ZmZpeCBvZiBleGVjdXRhYmxlcy4uLiAKY2hlY2tpbmcgd2hldGhl
ciB3ZSBhcmUgY3Jvc3MgY29tcGlsaW5nLi4uIHllcwpjaGVja2luZyBmb3Igc3VmZml4IG9mIG9i
amVjdCBmaWxlcy4uLiBvCmNoZWNraW5nIHdoZXRoZXIgd2UgYXJlIHVzaW5nIHRoZSBHTlUgQyBj
b21waWxlci4uLiB5ZXMKY2hlY2tpbmcgd2hldGhlciB4ODZfNjQtb2UtbGludXgtZ2NjICAtbTY0
IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2UzIC1tZnBtYXRoPXNzZSAtLXN5c3Jvb3Q9
L2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4vdG9vbHMveW9jdG9fd3Mvd3MvcmlzY3Yt
eW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvYnVpbGQvdG1wLWdsaWJjL3dvcmsvcWVtdXg4Nl82NC1v
ZS1saW51eC9raGFuY2xhbmcvMC4xLXIwL3JlY2lwZS1zeXNyb290IGFjY2VwdHMgLWcuLi4geWVz
CmNoZWNraW5nIGZvciB4ODZfNjQtb2UtbGludXgtZ2NjICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1
bmU9Y29yZTIgLW1zc2UzIC1tZnBtYXRoPXNzZSAtLXN5c3Jvb3Q9L2hvbWUvZXhhbGVhcHNlcnZl
ci9raGFuX3dzL2toYW4vdG9vbHMveW9jdG9fd3Mvd3MvcmlzY3YteW9jdG8vb3BlbmVtYmVkZGVk
LWNvcmUvYnVpbGQvdG1wLWdsaWJjL3dvcmsvcWVtdXg4Nl82NC1vZS1saW51eC9raGFuY2xhbmcv
MC4xLXIwL3JlY2lwZS1zeXNyb290IG9wdGlvbiB0byBhY2NlcHQgSVNPIEM4OS4uLiBub25lIG5l
ZWRlZApjaGVja2luZyBmb3IgZ3JlcCB0aGF0IGhhbmRsZXMgbG9uZyBsaW5lcyBhbmQgLWUuLi4g
L2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4vdG9vbHMveW9jdG9fd3Mvd3MvcmlzY3Yt
eW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvYnVpbGQvdG1wLWdsaWJjL2hvc3R0b29scy9ncmVwCmNo
ZWNraW5nIGZvciBmZ3JlcC4uLiAvaG9tZS9leGFsZWFwc2VydmVyL2toYW5fd3Mva2hhbi90b29s
cy95b2N0b193cy93cy9yaXNjdi15b2N0by9vcGVuZW1iZWRkZWQtY29yZS9idWlsZC90bXAtZ2xp
YmMvaG9zdHRvb2xzL2dyZXAgLUYKY2hlY2tpbmcgZm9yIGdyZXAgdGhhdCBoYW5kbGVzIGxvbmcg
bGluZXMgYW5kIC1lLi4uIChjYWNoZWQpIC9ob21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93cy9raGFu
L3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRlZC1jb3JlL2J1aWxkL3Rt
cC1nbGliYy9ob3N0dG9vbHMvZ3JlcApjaGVja2luZyBmb3IgYmFzaC4uLiAvYmluL2Jhc2gKY2hl
Y2tpbmcgZm9yIF9fZ21wel9pbml0IGluIC1sZ21wLi4uIG5vCmNoZWNraW5nIGZvciBtcGZyX2lu
aXQgaW4gLWxtcGZyLi4uIG5vCmNoZWNraW5nIGZvciBtcGNfaW5pdDIgaW4gLWxtcGMuLi4gbm8K
Y2hlY2tpbmcgZm9yIGN1cmwuLi4gbm8KY2hlY2tpbmcgZm9yIHdnZXQuLi4gL2hvbWUvZXhhbGVh
cHNlcnZlci9raGFuX3dzL2toYW4vdG9vbHMveW9jdG9fd3Mvd3MvcmlzY3YteW9jdG8vb3BlbmVt
YmVkZGVkLWNvcmUvYnVpbGQvdG1wLWdsaWJjL2hvc3R0b29scy93Z2V0CmNoZWNraW5nIGZvciBm
dHAuLi4gbm8KY29uZmlndXJlOiBjcmVhdGluZyAuL2NvbmZpZy5zdGF0dXMKY29uZmlnLnN0YXR1
czogY3JlYXRpbmcgTWFrZWZpbGUKY29uZmlnLnN0YXR1czogY3JlYXRpbmcgc2NyaXB0cy93cmFw
cGVyL2F3ay9hd2sKY29uZmlnLnN0YXR1czogY3JlYXRpbmcgc2NyaXB0cy93cmFwcGVyL3NlZC9z
ZWQKL2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4vdG9vbHMveW9jdG9fd3Mvd3Mvcmlz
Y3YteW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvYnVpbGQvdG1wLWdsaWJjL3dvcmsvcWVtdXg4Nl82
NC1vZS1saW51eC9raGFuY2xhbmcvMC4xLXIwL2J1aWxkL3Jpc2N2L3Jpc2N2LWdudS10b29sY2hh
aW4vcmlzY3YtZ2xpYmMKbWtkaXIgLXAgL2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4v
dG9vbHMveW9jdG9fd3Mvd3MvcmlzY3YteW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvYnVpbGQvdG1w
LWdsaWJjL3dvcmsvcWVtdXg4Nl82NC1vZS1saW51eC9raGFuY2xhbmcvMC4xLXIwL2J1aWxkLy4u
L3Jpc2N2L2luc3RhbGwvLnRlc3QgfHwgXAoJKGVjaG8gIlNvcnJ5LCB5b3UgZG9uJ3QgaGF2ZSBw
ZXJtaXNzaW9uIHRvIHdyaXRlIHRvIiBcCgkgIicvaG9tZS9leGFsZWFwc2VydmVyL2toYW5fd3Mv
a2hhbi90b29scy95b2N0b193cy93cy9yaXNjdi15b2N0by9vcGVuZW1iZWRkZWQtY29yZS9idWls
ZC90bXAtZ2xpYmMvd29yay9xZW11eDg2XzY0LW9lLWxpbnV4L2toYW5jbGFuZy8wLjEtcjAvYnVp
bGQvLi4vcmlzY3YvaW5zdGFsbCcsIHVzZSAtLXByZWZpeCB0byBzcGVjaWZ5IiBcCgkgImFub3Ro
ZXIgcGF0aCwgb3IgdXNlICdzdWRvIG1ha2UnIGlmIHlvdSAqUkVBTExZKiB3YW50IHRvIiBcCgkg
Imluc3RhbGwgaW50byAnL2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4vdG9vbHMveW9j
dG9fd3Mvd3MvcmlzY3YteW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvYnVpbGQvdG1wLWdsaWJjL3dv
cmsvcWVtdXg4Nl82NC1vZS1saW51eC9raGFuY2xhbmcvMC4xLXIwL2J1aWxkLy4uL3Jpc2N2L2lu
c3RhbGwnIiAmJiBleGl0IDEpCnJtIC1yIC9ob21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93cy9raGFu
L3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRlZC1jb3JlL2J1aWxkL3Rt
cC1nbGliYy93b3JrL3FlbXV4ODZfNjQtb2UtbGludXgva2hhbmNsYW5nLzAuMS1yMC9idWlsZC8u
Li9yaXNjdi9pbnN0YWxsLy50ZXN0Cm1rZGlyIC1wIHN0YW1wcy8gJiYgdG91Y2ggc3RhbXBzL2No
ZWNrLXdyaXRlLXBlcm1pc3Npb24Kcm0gLXJmIHN0YW1wcy9idWlsZC1iaW51dGlscy1saW51eCBi
dWlsZC1iaW51dGlscy1saW51eApta2RpciBidWlsZC1iaW51dGlscy1saW51eApjZCBidWlsZC1i
aW51dGlscy1saW51eCAmJiBDQ19GT1JfVEFSR0VUPXJpc2N2NjQtdW5rbm93bi1saW51eC1nbnUt
Z2NjIC9ob21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jp
c2N2LXlvY3RvL29wZW5lbWJlZGRlZC1jb3JlL2J1aWxkL3RtcC1nbGliYy93b3JrL3FlbXV4ODZf
NjQtb2UtbGludXgva2hhbmNsYW5nLzAuMS1yMC9idWlsZC9yaXNjdi9yaXNjdi1nbnUtdG9vbGNo
YWluL2J1aWxkLy4uL3Jpc2N2LWJpbnV0aWxzL2NvbmZpZ3VyZSBcCgktLXRhcmdldD1yaXNjdjY0
LXVua25vd24tbGludXgtZ251IFwKCSBcCgktLXByZWZpeD0vaG9tZS9leGFsZWFwc2VydmVyL2to
YW5fd3Mva2hhbi90b29scy95b2N0b193cy93cy9yaXNjdi15b2N0by9vcGVuZW1iZWRkZWQtY29y
ZS9idWlsZC90bXAtZ2xpYmMvd29yay9xZW11eDg2XzY0LW9lLWxpbnV4L2toYW5jbGFuZy8wLjEt
cjAvYnVpbGQvLi4vcmlzY3YvaW5zdGFsbCBcCgktLXdpdGgtc3lzcm9vdD0vaG9tZS9leGFsZWFw
c2VydmVyL2toYW5fd3Mva2hhbi90b29scy95b2N0b193cy93cy9yaXNjdi15b2N0by9vcGVuZW1i
ZWRkZWQtY29yZS9idWlsZC90bXAtZ2xpYmMvd29yay9xZW11eDg2XzY0LW9lLWxpbnV4L2toYW5j
bGFuZy8wLjEtcjAvYnVpbGQvLi4vcmlzY3YvaW5zdGFsbC9zeXNyb290IFwKCS0tZGlzYWJsZS1t
dWx0aWxpYiBcCgkgXAoJLS1kaXNhYmxlLXdlcnJvciBcCgktLWRpc2FibGUtbmxzIFwKCS0td2l0
aC1leHBhdD15ZXMgIFwKCS0tZGlzYWJsZS1nZGIgXAoJLS1kaXNhYmxlLXNpbSBcCgktLWRpc2Fi
bGUtbGliZGVjbnVtYmVyIFwKCS0tZGlzYWJsZS1yZWFkbGluZQpjb25maWd1cmU6IGxvYWRpbmcg
c2l0ZSBzY3JpcHQgL2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4vdG9vbHMveW9jdG9f
d3Mvd3MvcmlzY3YteW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9zaXRlL2VuZGlhbi1saXR0
bGUKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL2V4YWxlYXBzZXJ2ZXIva2hh
bl93cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRlZC1jb3Jl
L21ldGEvc2l0ZS9jb21tb24tbGludXgKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9o
b21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlv
Y3RvL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvc2l0ZS9jb21tb24tZ2xpYmMKY29uZmlndXJlOiBs
b2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL2V4YWxlYXBzZXJ2ZXIva2hhbl93cy9raGFuL3Rvb2xz
L3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRlZC1jb3JlL21ldGEvc2l0ZS94ODZf
NjQtbGludXgKY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9ob21lL2V4YWxlYXBzZXJ2
ZXIva2hhbl93cy9raGFuL3Rvb2xzL3lvY3RvX3dzL3dzL3Jpc2N2LXlvY3RvL29wZW5lbWJlZGRl
ZC1jb3JlL21ldGEvc2l0ZS9jb21tb24KY2hlY2tpbmcgYnVpbGQgc3lzdGVtIHR5cGUuLi4geDg2
XzY0LXBjLWxpbnV4LWdudQpjaGVja2luZyBob3N0IHN5c3RlbSB0eXBlLi4uIHg4Nl82NC1wYy1s
aW51eC1nbnUKY2hlY2tpbmcgdGFyZ2V0IHN5c3RlbSB0eXBlLi4uIHJpc2N2NjQtdW5rbm93bi1s
aW51eC1nbnUKY2hlY2tpbmcgZm9yIGEgQlNELWNvbXBhdGlibGUgaW5zdGFsbC4uLiAvaG9tZS9l
eGFsZWFwc2VydmVyL2toYW5fd3Mva2hhbi90b29scy95b2N0b193cy93cy9yaXNjdi15b2N0by9v
cGVuZW1iZWRkZWQtY29yZS9idWlsZC90bXAtZ2xpYmMvaG9zdHRvb2xzL2luc3RhbGwgLWMKY2hl
Y2tpbmcgd2hldGhlciBsbiB3b3Jrcy4uLiB5ZXMKY2hlY2tpbmcgd2hldGhlciBsbiAtcyB3b3Jr
cy4uLiB5ZXMKY2hlY2tpbmcgZm9yIGEgc2VkIHRoYXQgZG9lcyBub3QgdHJ1bmNhdGUgb3V0cHV0
Li4uIChjYWNoZWQpIHNlZApjaGVja2luZyBmb3IgZ2F3ay4uLiAvaG9tZS9leGFsZWFwc2VydmVy
L2toYW5fd3Mva2hhbi90b29scy95b2N0b193cy93cy9yaXNjdi15b2N0by9vcGVuZW1iZWRkZWQt
Y29yZS9idWlsZC90bXAtZ2xpYmMvaG9zdHRvb2xzL2dhd2sKY2hlY2tpbmcgZm9yIGdjYy4uLiB4
ODZfNjQtb2UtbGludXgtZ2NjICAtbTY0IC1tYXJjaD1jb3JlMiAtbXR1bmU9Y29yZTIgLW1zc2Uz
IC1tZnBtYXRoPXNzZSAtLXN5c3Jvb3Q9L2hvbWUvZXhhbGVhcHNlcnZlci9raGFuX3dzL2toYW4v
dG9vbHMveW9jdG9fd3Mvd3MvcmlzY3YteW9jdG8vb3BlbmVtYmVkZGVkLWNvcmUvYnVpbGQvdG1w
LWdsaWJjL3dvcmsvcWVtdXg4Nl82NC1vZS1saW51eC9raGFuY2xhbmcvMC4xLXIwL3JlY2lwZS1z
eXNyb290Cg==

--0000000000009fd2c905998eb953--
