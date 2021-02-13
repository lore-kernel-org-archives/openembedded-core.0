Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web09.9558.1613253846646976182
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 14:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=TP+aN1r3;
 spf=pass (domain: web.de, ip: 212.227.15.4, mailfrom: patchesthomas.vie@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1613253844;
	bh=3AJaBq0RzUXprQIKNE0oy2ftS+H/r5V87TgujaHWiIg=;
	h=X-UI-Sender-Class:To:From:Subject:Date;
	b=TP+aN1r3sxEHqERWQx1mBrVpe56wHlqVQ2zmYq8pTHMOnSj4rKQ729EQ7JFj9G1hW
	 lRACJdCbVaRx48aYV1QA4Mlhkma7joeEH3KS/01WUdDzVUWaKYpvwiyrgM/CGW26b5
	 2GV0oljJm7olXE71l3a0UM+iZQcTAgO7vHwdE5c8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([77.190.31.127]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M1Wxd-1lzyof2dgH-00tQxN for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 23:04:04 +0100
To: openembedded-core@lists.openembedded.org
From: "Thomas Viehweger" <patchesThomas.Vie@web.de>
Subject: [PATCH] mtd-utils: Remove duplicate assignments to alternative link names
Message-ID: <e5700d4c-f63c-4b81-7723-8cb3337ff176@web.de>
Date: Sat, 13 Feb 2021 23:04:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:dh/MDBiZv0O/ROZ9sUdDjxFkGUCmveWBfI7B7z6Hqf392Rk2DaT
 sg5avR5nn1QtuNYhw+qLvtku9fl+rC5mQgJmlopBUGLx0EFjPwQIACqJCAR/ZLV9vaL6xu7
 l4pF1ixRYKc7Pn551GYAZS692UwNb+0Bn8IOG2sna65eW1LuhqSdIPmZ39Q0dL4wxocUlI3
 3TYVN1yLgSYXh8WD7efkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hmXDAaNWSYM=:LgwnwWJL9TVCVZ4cydg2lN
 WYhfUWLmUhaDVBv48y0QJv0lSj0h9Q8xllxon77QXHydBJyJ6O5iDmeCFT8mA8SiY7Q5qMEr+
 XO5Wcj4KRoSzEDB5g5QZnLiBIPYfbOTE5IfjZnX6db9nHAV4U39q/Z+JMmxzmGc3kd5Eb4Z+n
 cB+uHm5xYXl1I6H7lLBX5EzY1wfX96Mz38POkU2r0ImIMgjt0XaMOsUQRVB8x2e/8AaZ2khTf
 0de+nfJJagotwdL7w1h9M4Cef+DnYlEF6nVBH/ty7nGT6oZtyxDVqb8hf9rMPsZb2EG0nkwFU
 nj6sOoxUh+QoxLLhuB4hcKIT3NgPzXyN+tkdYkiJhR4GOCeXixW+tTAjz4OFUMZvVfAN8jzFu
 iKKEhV+AfGTMuRYX6uTJfoRiL9E3RjhiIqS9UjLa3MXdiKnkrmoJdxXAD/obBCBcxQEJ2tqjk
 GWilOrx6+2MiLycyiZrKYqImvFGQ9AfB19+0TCom36d+plqBzncWRgVlWuhAIQJtVwKglXfk/
 L55f/KYpMu5Jy5oJ8HhVUmrt+P5WA29suroSODBFq6UqfBLwUDy9BQpIJr1MkG80pOM0lAf86
 7EtXoF9eQgHhxZDwPjCJ3DVQHCHLFjeXDTtcRbsLYgCwYACzyilav5TO1N7awgHIgPwPGzWVQ
 q8EdzzhHXKOqMqWbKzhEP0yAIpRCl9ovFrkx7ZAe0Q9oU0HpXYMdLHGBxIAD4e7/J1YHQRMaP
 Ct5bGdwGP4E18yETkIWRCHx9WQf95uBZaXFD3Qw2vQ0y8tEcdUYJwzdPq95pKG51USN1bh5d1
 ymUZp3ud/FrctN6VzowNSBGd/Ya+TawWBqoruJiK+GLi7mtHApCfBnO/0HfdN0gY/IqiOwF3b
 1uVvmvyuqGBn/hGSLZgFv08I5FfCiZmkNw0fmGEZE=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

The two duplicate lines are not needed. The existence is confusing.

Signed-off-by: Thomas Viehweger <patchesThomas.Vie@web.de>
---
 =C2=A0meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 --
 =C2=A01 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-utils_git.bb
index 8d6bbfca3f..ff42219513 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -42,11 +42,9 @@ ALTERNATIVE_PRIORITY =3D "100"
 =C2=A0ALTERNATIVE_${PN} =3D "flashcp flash_eraseall flash_lock flash_unl=
ock nanddump nandwrite"
 =C2=A0ALTERNATIVE_${PN}-ubifs =3D "ubiattach ubidetach ubimkvol ubirenam=
e ubirmvol ubirsvol ubiupdatevol"

-ALTERNATIVE_LINK_NAME[flash_eraseall] =3D "${sbindir}/flash_eraseall"
 =C2=A0ALTERNATIVE_LINK_NAME[nandwrite] =3D "${sbindir}/nandwrite"
 =C2=A0ALTERNATIVE_LINK_NAME[nanddump] =3D "${sbindir}/nanddump"
 =C2=A0ALTERNATIVE_LINK_NAME[ubiattach] =3D "${sbindir}/ubiattach"
-ALTERNATIVE_LINK_NAME[ubiattach] =3D "${sbindir}/ubiattach"
 =C2=A0ALTERNATIVE_LINK_NAME[ubidetach] =3D "${sbindir}/ubidetach"
 =C2=A0ALTERNATIVE_LINK_NAME[ubimkvol] =3D "${sbindir}/ubimkvol"
 =C2=A0ALTERNATIVE_LINK_NAME[ubirename] =3D "${sbindir}/ubirename"
--=20
2.30.0



