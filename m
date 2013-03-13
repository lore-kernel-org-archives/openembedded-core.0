Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFdmu-0007Tg-3H
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 05:59:43 +0100
Received: by mail-vc0-f181.google.com with SMTP id fw7so314622vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 21:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=nfSb1BtloxCiSwXcCTE5cIUeD5aAjjql+6XpJuIQL8M=;
	b=KbmJWzKMqJ6mpBBa4VQVPrupYivJDyPa2ii+NpwKuZdNn6/lJNVHjS8Vef4FbB1Ys3
	OIy7XA10bTW2aJzvqvzFS/NF9658FYmes2ZI3Z6ive94Y5tFNXYA2sMaWk78LXwRVW+9
	axH7suWOKR2fa8HVX4zE+iet0AIrqO9AK98DGMnbTK7Jr9Xn8AY5AloC9ElBZJfUvJ1l
	Q6l4745Ho3IgBjdAjFtD5yy3Hu+lnxikiOpVPdP0esfomJiW9fsQOvBl2jWEAxV/Qkrj
	7BUP4uC8Cb1qhBX0n218WWHTmn5Ze7A1RqRXr6YNYCKIUczD6+eFrnjme55EEg7KR2ve
	fxwA==
X-Received: by 10.52.230.197 with SMTP id ta5mr4391413vdc.103.1363149779267;
	Tue, 12 Mar 2013 21:42:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Tue, 12 Mar 2013 21:42:38 -0700 (PDT)
In-Reply-To: <20130312214846.GM9724@jama.dyndns-home.com>
References: <1363107795-2140-1-git-send-email-cristian.iorga@intel.com>
	<1363107795-2140-4-git-send-email-cristian.iorga@intel.com>
	<20130312214846.GM9724@jama.dyndns-home.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2013 21:42:38 -0700
Message-ID: <CAJTo0LYBe10HhsMtynzpuS5arEDtXBFxcLKqryPFWEV=7Q7SbQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnUVqAViVTVkZUEd5oolP9wrv3fkJXpGWxIejoTDAHANdxz6TUDdloZYfRYeh7Czxqd9epX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 3/4] bluez5: conflicts with bluez4
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
X-List-Received-Date: Wed, 13 Mar 2013 04:59:44 -0000
Content-Type: multipart/alternative; boundary=089e0111d6b05eb7a604d7c70ad6

--089e0111d6b05eb7a604d7c70ad6
Content-Type: text/plain; charset=UTF-8

 But bluez4 doesn't provide bluez5 and vice versa - the runtime API are
different.

Ross
-- 
Ross Burton
Sent with Sparrow <http://www.sparrowmailapp.com/?sig>

On Tuesday, 12 March 2013 at 14:48, Martin Jansa wrote:

On Tue, Mar 12, 2013 at 07:03:14PM +0200, Cristian Iorga wrote:

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
meta/recipes-connectivity/bluez5/bluez5_5.3.bb | 2 ++
1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.3.bbb/meta/recipes-connectivity/bluez5/
bluez5_5.3.bb
index 311562f..5963483 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
@@ -6,6 +6,8 @@ SRC_URI += "file://bluetooth.conf \
SRC_URI[md5sum] = "44de20f6422bf90a01b8df48e7dfe4ed"
SRC_URI[sha256sum] =
"828e2cd1109835c2fc1d731fb7fd7b46951044e451cc8556a37e1312d8c8c9a6"
+RCONFLICTS_${PN} = "bluez4"


That's not enough for upgrade path, add RREPLACES/RPROVIDES too.

+
do_install_append() {
 install -d ${D}${sysconfdir}/bluetooth/
install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
-- 
1.7.10.4


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


-- 
Martin 'JaMa' Jansa jabber: Martin.Jansa@gmail.com
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--089e0111d6b05eb7a604d7c70ad6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


    <div>
        But bluez4 doesn&#39;t provide bluez5 and vice versa - the runtime =
API are different.
    </div>
    <div><div><br></div><div>Ross</div>--=C2=A0<br>Ross Burton<br><div>Sent=
 with <a href=3D"http://www.sparrowmailapp.com/?sig" target=3D"_blank">Spar=
row</a></div><div><br></div></div>
    =20
    <p style=3D"color:#a0a0a8">On Tuesday, 12 March 2013 at 14:48, Martin J=
ansa wrote:</p>
    <blockquote type=3D"cite" style=3D"border-left-style:solid;border-width=
:1px;margin-left:0px;padding-left:10px">
        <div><div><div>On Tue, Mar 12, 2013 at 07:03:14PM +0200, Cristian I=
orga wrote:</div><blockquote type=3D"cite"><div><div>Signed-off-by: Cristia=
n Iorga &lt;<a href=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">c=
ristian.iorga@intel.com</a>&gt;</div>

<div>---</div><div> meta/recipes-connectivity/bluez5/<a href=3D"http://blue=
z5_5.3.bb" target=3D"_blank">bluez5_5.3.bb</a> |    2 ++</div><div> 1 file =
changed, 2 insertions(+)</div><div><br></div><div>diff --git a/meta/recipes=
-connectivity/bluez5/<a href=3D"http://bluez5_5.3.bb" target=3D"_blank">blu=
ez5_5.3.bb</a> b/meta/recipes-connectivity/bluez5/<a href=3D"http://bluez5_=
5.3.bb" target=3D"_blank">bluez5_5.3.bb</a></div>

<div>index 311562f..5963483 100644</div><div>--- a/meta/recipes-connectivit=
y/bluez5/<a href=3D"http://bluez5_5.3.bb" target=3D"_blank">bluez5_5.3.bb</=
a></div><div>+++ b/meta/recipes-connectivity/bluez5/<a href=3D"http://bluez=
5_5.3.bb" target=3D"_blank">bluez5_5.3.bb</a></div>

<div>@@ -6,6 +6,8 @@ SRC_URI +=3D &quot;file://bluetooth.conf \</div><div> =
SRC_URI[md5sum] =3D &quot;44de20f6422bf90a01b8df48e7dfe4ed&quot;</div><div>=
 SRC_URI[sha256sum] =3D &quot;828e2cd1109835c2fc1d731fb7fd7b46951044e451cc8=
556a37e1312d8c8c9a6&quot;</div>

<div>+RCONFLICTS_${PN} =3D &quot;bluez4&quot;</div></div></blockquote><div>=
<br></div><div>That&#39;s not enough for upgrade path, add RREPLACES/RPROVI=
DES too.</div><blockquote type=3D"cite"><div><div>+</div><div> do_install_a=
ppend() {</div>

<div> 	install -d ${D}${sysconfdir}/bluetooth/</div><div> 	install -m 0644 =
${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluetooth/</div><div>-- <=
/div><div>1.7.10.4</div><div><br></div><div><br></div><div>________________=
_______________________________</div>

<div>Openembedded-core mailing list</div><div><a href=3D"mailto:Openembedde=
d-core@lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.op=
enembedded.org</a></div><div><a href=3D"http://lists.linuxtogo.org/cgi-bin/=
mailman/listinfo/openembedded-core" target=3D"_blank">http://lists.linuxtog=
o.org/cgi-bin/mailman/listinfo/openembedded-core</a></div>

</div></blockquote><div><br></div><div>-- </div><div>Martin &#39;JaMa&#39; =
Jansa     jabber: <a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blan=
k">Martin.Jansa@gmail.com</a></div><div>___________________________________=
____________</div>

<div>Openembedded-core mailing list</div><div><a href=3D"mailto:Openembedde=
d-core@lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.op=
enembedded.org</a></div><div><a href=3D"http://lists.linuxtogo.org/cgi-bin/=
mailman/listinfo/openembedded-core" target=3D"_blank">http://lists.linuxtog=
o.org/cgi-bin/mailman/listinfo/openembedded-core</a></div>

</div></div>
        =20
        =20
        =20
        =20
    </blockquote>
    =20
    <div>
        <br>
    </div>

--089e0111d6b05eb7a604d7c70ad6--
