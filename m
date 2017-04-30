Return-Path: <jan.kiszka@web.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 30 Apr 2017 15:33:13 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE6977AB3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Apr 2017 15:33:12 +0000 (UTC)
Received: from md1f2u6c.ww002.siemens.net ([95.157.57.47]) by smtp.web.de
	(mrweb001 [213.165.67.108]) with ESMTPSA (Nemesis) id
	0McneT-1dMnI83spd-00Ht56 for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Apr 2017 17:28:10 +0200
To: openembedded-core@lists.openembedded.org
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
Date: Sun, 30 Apr 2017 17:28:01 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
X-Provags-ID: V03:K0:efBwaSJ1j5gH8RnkNEAiM2TqU2HSaWqOY43nqw8nxm6s6ZPFhzQ
	3G6qHe0vMdgUPaWi0v98y256BefHDIncWi6JO+I9SWOpMBHR9rAdtXuZuZVnbpMgzaNkkvj
	f4Rv4NHdqKHBLeSPtVVwUrXemcp65M11w22KgGywZ7b7qxx5w5oqkiMYnl06XSTVl8XDzsq
	9ZlrcDhQ2MG/X2inbVrCg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:uJ9XPlOtfpo=:hKJb2t9EyB46U7Cnjjr0jv
	asiPy/0rDAyJW4XjiA90ZTJ8NLRsdNkr1O3oSo3W1v440gGujDwsO6GYK4YqBzZJUQTgVqA7P
	/msnVoQrJswq3HQ5zVtF4QvWREH4azhgnw7lk5svpEqukrPs1L4IPvEfFrramxl4ptxxI4B0P
	5HdRe8rkONmFXdFdFoDX7MyALX9gDxjX0rIdV2O5zFpoTpnZYqZ/joPHE6G/9Qejnlnz2Ciez
	BFiPDfMOT585DB4WUl4eU0Eb+xny4ZJ8Sxx/wUZXO3Ic+DzikHBwzuAu+HubcIp9VIfSehhE2
	KFkzsz8LDzPkg6FHikqx7USXkkA7JeWrdN0sqDtJeQxICI/SrC1tZflRt9FMWoNC1MbvvvGal
	Wtetc+Sq1CmKyeJsMmKH4nYWGL4IFvf7XDLxGDvcf5q3gs3WW8vCjYISNvByl8oaJurbvN7zI
	XibEJLio6uuFhymSScJlwdTiaehMIaOvKALwHgif4xiKEqHsoTN0uej9kSsLYY8KmoAmMQ5n2
	tpxeH/0o6OKgnWjf3u1FbHJqVczw5ZKH6lyOra/HcyBJqnDy2I8YK21Y4XySsePPZ4PzMhnSD
	XaQw9fKckbp0KxFJzy5L71YqngVgIo2b0yIvl64cXL8kr9Tn2h16UUOXfqv4J2gj2D/Bdwbda
	72yOHTwXOMKVwQeczxKXCK3qbO1LPpwoXM0Tfed2xYbYpuZ9oT4dVzXpSDjLvGrtRQpnBsNlp
	UR/d8WhDcNfT3mm5S6TaCS+mmpRgz3pW1opSiV15MWXp2ALKGIb3nYUMQ5Y=
Subject: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Sun, 30 Apr 2017 15:33:14 -0000
X-Groupsio-MsgNum: 96793
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="w2pm1SW1FdaRKlH1CWxAIJt5rNf96PfR4"

--w2pm1SW1FdaRKlH1CWxAIJt5rNf96PfR4
Content-Type: multipart/mixed; boundary="bOlbUbfbDFTikPaoXgIa6TblwbRRnlhoX";
 protected-headers="v1"
From: Jan Kiszka <jan.kiszka@web.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
Subject: [PATCH] tcf-agent: Fix daemon termination

--bOlbUbfbDFTikPaoXgIa6TblwbRRnlhoX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jan Kiszka <jan.kiszka@siemens.com>

The upstream init script uses SIGUSR2 to terminate that daemon because
SIGTERM is ignored. As the killproc function does not support specifying
a signal, switch to start-stop-daemon. Drop the retry loop because
SIGUSR2 is lethal for agent.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init | 11 +---------=
-
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init b/m=
eta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
index 6303280aae..bd602c67cb 100755
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
@@ -33,16 +33,7 @@ case "$1" in
=20
     stop)
         echo -n "Stopping $DAEMON_NAME: "
-        count=3D0
-        while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
-            killproc $DAEMON_PATH >& /dev/null
-            sleep 1
-            RETVAL=3D$?
-            if [ $RETVAL !=3D 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; th=
en
-                sleep 3
-            fi
-            count=3D`expr $count + 1`
-        done
+        start-stop-daemon -K -q -x $DAEMON_PATH -s USR2
         rm -f /var/lock/subsys/$DAEMON_NAME
         if [ -n "`/bin/pidof $DAEMON_PATH`" ] ; then
             echo "FAIL"


--bOlbUbfbDFTikPaoXgIa6TblwbRRnlhoX--

--w2pm1SW1FdaRKlH1CWxAIJt5rNf96PfR4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlkGAogACgkQitSsb3rl5xSI2wCg6RhDTZX8ux6bCS2MepCEb7IR
aZAAoMqtMoFJBfkZte60mThQdHvSmoaL
=Mon8
-----END PGP SIGNATURE-----

--w2pm1SW1FdaRKlH1CWxAIJt5rNf96PfR4--
