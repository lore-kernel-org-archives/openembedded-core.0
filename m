Received: from col0-omc3-s2.col0.hotmail.com ([65.55.34.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1S9joE-0003gO-86
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 22:08:06 +0100
Received: from COL120-W39 ([65.55.34.136]) by col0-omc3-s2.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 19 Mar 2012 13:59:10 -0700
Message-ID: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl>
X-Originating-IP: [70.137.142.215]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 13:59:10 -0700
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Mar 2012 20:59:10.0471 (UTC)
	FILETIME=[21CB0170:01CD0613]
Subject: Linking two recipes
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
X-List-Received-Date: Mon, 19 Mar 2012 21:08:06 -0000
X-Groupsio-MsgNum: 19158
Content-Type: multipart/mixed;
	boundary="_525c1da2-0e4f-4213-9684-d0e691f753e9_"

--_525c1da2-0e4f-4213-9684-d0e691f753e9_
Content-Type: multipart/alternative;
	boundary="_9682766c-f1ae-475e-b5ae-cff3eb63eab9_"

--_9682766c-f1ae-475e-b5ae-cff3eb63eab9_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=2CI have recipes for two applications Recipe A and Recipe B. Recipe B=
 requires a lib.so file and init.h file which are installed by Recipe A.How=
 do I acknowledge this dependency in Recipe B. I tried doing do_stage() fun=
ction in recipe A with no success. Please advice.I am attaching the two rec=
ipes.Thank you for any help.
Simran 		 	   		  =

--_9682766c-f1ae-475e-b5ae-cff3eb63eab9_
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
Hello=2C<div>I have recipes for two applications Recipe A and Recipe B. Rec=
ipe B requires a lib.so file and init.h file which are installed by Recipe =
A.</div><div>How do I acknowledge this dependency in Recipe B. I tried doin=
g do_stage() function in recipe A with no success. Please advice.</div><div=
>I am attaching the two recipes.</div><div>Thank you for any help.</div><di=
v><br></div><div>Simran</div> 		 	   		  </div></body>
</html>=

--_9682766c-f1ae-475e-b5ae-cff3eb63eab9_--

--_525c1da2-0e4f-4213-9684-d0e691f753e9_
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="recipeA.bb"

REVTQ1JJUFRJT04gPSAiQm90YW4gbGlicmFyeSIKUFIgPSAicjAiClNSQ19VUkkgPSAiZmlsZTov
LyR7UE59LSR7UFZ9LnRhci5neiIKCmV4cG9ydCBMREZMQUdTID0gIi1MJHtTVEFHSU5HX0xJQkRJ
Un0iCgpTID0gIiR7V09SS0RJUn0iCgojRVhUUkFfT0VNQUtFID0gJ0xJTlVYPSR7U1RBR0lOR19L
RVJORUxfRElSfSBFWExERkxBR1M9IiR7TERGTEFHU30iIFwKIwkJTUFDSElORT0ke1RBUkdFVF9B
UkNIfSBDQz0iJHtDQ30iIEFSPSIke0FSfSIgUFJFRklYPSIke3ByZWZpeH0iJwoKZG9fY29uZmln
dXJlKCkgewoKCW1rZGlyIC1wICR7RH0vdXNyL2JvdGFuCgljZCBCb3Rhbi0xLjEwLjEKCiMJZXhw
b3J0IFBBVEg9JHtXT1JLRElSfToke1BBVEh9CiMJZXhwb3J0IENDPWdjYwojCWV4cG9ydCBDWFg9
ZysrCgoJcHl0aG9uIGNvbmZpZ3VyZS5weSAtLXByZWZpeD0ke0R9L3Vzci9ib3RhbgojCW1ha2UK
IwltYWtlIGluc3RhbGwKCn0KCiNUQVJHRVRfQ0NfQVJDSCArPSAiJHtMREZMQUdTfSIKCmRvX2Nv
bXBpbGUoKSB7CgojCWV4cG9ydCBQQVRIPSR7V09SS0RJUn06JHtQQVRIfQojCWV4cG9ydCBDQz1n
Y2MKIwlleHBvcnQgQ1hYPWcrKwoKCWNkIEJvdGFuLTEuMTAuMQoJbWFrZQoJCn0KCmZha2Vyb290
IGRvX2luc3RhbGwoKSB7CgoJY2QgQm90YW4tMS4xMC4xCgltYWtlIGluc3RhbGwKCWNwIC1yICR7
V09SS0RJUn0vQm90YW4tMS4xMC4xLyogJHtEfS91c3IvYm90YW4KCn0KCmRvX3N0YWdlKCkgewoj
CWluc3RhbGwgLW0gMDc1NSAke0R9L3Vzci9ib3Rhbi9saWJib3Rhbi0xLjEwLnNvLjAuMSAke1NU
QUdJTkdfTElCRElSfS9ib3RhbgoJaW5zdGFsbCAtZCAke1NUQUdJTkdfSU5DRElSfS8KCWluc3Rh
bGwgLWQgJHtTVEFHSU5HX0xJQkRJUn0KIwljZCAke0R9L3Vzci9ib3RhbgoJb2VfbGliaW5zdGFs
bCAtc28gbGliYm90YW4tMS4xMC5zby4wLjEgJHtTVEFHSU5HX0xJQkRJUn0KCn0KCiNGSUxFU18k
e1BOfSArPSAiJHtkYXRhZGlyfS9ib3RhbiIKRklMRVNfJHtQTn0gKz0gIi91c3IvYmluL2JvdGFu
IgojRklMRVNfJHtQTn0gPSAiJHtiYXNlX2xpYmRpcn0vbGliZ2NjKi5zby4qIgoKCg==

--_525c1da2-0e4f-4213-9684-d0e691f753e9_
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="recipeB.bb"

REVTQ1JJUFRJT04gPSAiU29mdEhTTSIKUFIgPSAicjAiClNSQ19VUkkgPSAiZmlsZTovLyR7UE59
LSR7UFZ9LnRhci5neiIKClMgPSAiJHtXT1JLRElSfSIKCkRFUEVORFMgPSAiYm90YW4gc3FsaXRl
MyIKI1JERVBFTkRTID0gImJvdGFuIgoKZXhwb3J0IExERkxBR1MgPSAiLUwke1NUQUdJTkdfTElC
RElSfSIKZXhwb3J0IFNUQUdJTkdfTElCRElSCgpkb19jb25maWd1cmUoKSB7CgoJbWtkaXIgLXAg
JHtEfS91c3Ivc29mdGhzbQoKCS4vc29mdGhzbS0xLjMuMS9jb25maWd1cmUgLS1ob3N0IC0tcHJl
Zml4PSR7RH0vdXNyL3NvZnRoc20gLS13aXRoLWxvZ2xldmVsPTQgIy0td2l0aC1ib3Rhbj0ke1NU
QUdJTkdfTElCRElSfS9ib3RhbgoKfQoKZG9fY29tcGlsZSgpIHsKCgltYWtlCgkKfQoKZmFrZXJv
b3QgZG9faW5zdGFsbCgpIHsKCgltYWtlIGluc3RhbGwKCn0KCgpGSUxFU18ke1BOfSArPSAiL3Vz
ci9iaW4vc29mdGhzbSIKI0ZJTEVTXyR7UE59ICs9ICIvaG9tZS9TaW1yYW4vRnJlZXNjYWxlL1Fv
cklRLURQQUEtU0RLLTIwMTExMDI2LXN5c3RlbWJ1aWxkZXIvYnVpbGRfcDQwODBkc19yZWxlYXNl
L3dvcmsvcHBjZTUwMG1jLWxpbnV4L2JvdGFuLTEuMC1yMC9pbWFnZS91c3IvYm90YW4iCgoK

--_525c1da2-0e4f-4213-9684-d0e691f753e9_--
