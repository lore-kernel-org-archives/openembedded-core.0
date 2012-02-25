Received: from col0-omc3-s6.col0.hotmail.com ([65.55.34.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1S15QQ-0006Mu-SB
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 01:23:47 +0100
Received: from COL120-W40 ([65.55.34.137]) by col0-omc3-s6.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 24 Feb 2012 16:15:19 -0800
Message-ID: <COL120-W40B503FFC0574E4957B971DD6B0@phx.gbl>
X-Originating-IP: [70.137.141.9]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>,
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Feb 2012 16:15:19 -0800
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Feb 2012 00:15:19.0049 (UTC)
	FILETIME=[8E7F7F90:01CCF352]
Subject: BOTAN crypto library
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
X-List-Received-Date: Sat, 25 Feb 2012 00:23:47 -0000
X-Groupsio-MsgNum: 17958
Content-Type: multipart/mixed;
	boundary="_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_"

--_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_
Content-Type: multipart/alternative;
	boundary="_fd2288e3-3a85-4f8a-8fc6-bb3c559ef695_"

--_fd2288e3-3a85-4f8a-8fc6-bb3c559ef695_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=2C

I hope this is right place to ask for help regarding this. I am trying to b=
uild the Botan crytpo library using
system builder. I created a recipe for this and I am getting an error when =
I try to $make the library.
This is the error I am getting:

| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder=
/build_p4080ds_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder=
/build_p4080ds_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: 20)
| /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080d=
s_release/sysroots/
ppce500mc-linux/usr/lib/crti.o: could not read symbols: File in wrong forma=
t
| collect2: ld returned 1 exit status
| make: *** [libbotan-1.10.so.0.1] Error 1
| ERROR: Function do_install failed

I am guessing this has to do something with the linking of the libbotan-1.1=
0.so.0.1 file. Please advice. I have attached
the recipe that I created
Thank you for any help.

Simran
 		 	   		  =

--_fd2288e3-3a85-4f8a-8fc6-bb3c559ef695_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Tahoma
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>
Hello=2C<br><br>I hope this is right place to ask for help regarding this. =
I am trying to build the Botan crytpo library using<br>system builder. I cr=
eated a recipe for this and I am getting an error when I try to $make the l=
ibrary.<br>This is the error I am getting:<br><br>| /usr/bin/ld: /home/Simr=
an/Freescale/QorIQ-DPAA-SDK-20111026-systembuilder/build_p4080ds_release/sy=
sroots/<br>ppce500mc-linux/usr/lib/crti.o: Relocations in generic ELF (EM: =
20)<br>| /usr/bin/ld: /home/Simran/Freescale/QorIQ-DPAA-SDK-20111026-system=
builder/build_p4080ds_release/sysroots/<br>ppce500mc-linux/usr/lib/crti.o: =
Relocations in generic ELF (EM: 20)<br>| /home/Simran/Freescale/QorIQ-DPAA-=
SDK-20111026-systembuilder/build_p4080ds_release/sysroots/<br>ppce500mc-lin=
ux/usr/lib/crti.o: could not read symbols: File in wrong format<br>| collec=
t2: ld returned 1 exit status<br>| make: *** [libbotan-1.10.so.0.1] Error 1=
<br>| ERROR: Function do_install failed<br><br>I am guessing this has to do=
 something with the linking of the libbotan-1.10.so.0.1 file. Please advice=
. I have attached<br>the recipe that I created<br>Thank you for any help.<b=
r><br>Simran<br> 		 	   		  </div></body>
</html>=

--_fd2288e3-3a85-4f8a-8fc6-bb3c559ef695_--

--_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="botan_1.0.bb"

REVTQ1JJUFRJT04gPSAiQm90YW4gbGlicmFyeSIKUFIgPSAicjAiClNSQ19VUkkgPSAiZmlsZTov
LyR7UE59LSR7UFZ9LnRhci5neiIKCmluaGVyaXQgYXV0b3Rvb2xzCgpTID0gIiR7V09SS0RJUn0i
Cgpkb19pbnN0YWxsKCkgewoKCW1rZGlyIC1wICR7RH0vdXNyL2JvdGFuCgljZCBCb3Rhbi0xLjEw
LjEKIwlweXRob24gY29uZmlndXJlLnB5IC0tcHJlZml4PSR7RH0vdXNyL2JvdGFuCglweXRob24g
Y29uZmlndXJlLnB5CgltYWtlCiMJbWFrZSBpbnN0YWxsCgp9CgpGSUxFU18ke1BOfSArPSAiL3Vz
ci9iaW4vYm90YW4iCg==

--_1ed1f953-ee02-48c3-99e9-b4747e4ff39e_--
