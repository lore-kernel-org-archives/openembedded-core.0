Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF19C25B7C
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:01:48 +0000 (UTC)
Subject: Re: [PATCH] buildhistory: Fix do_package race issues
To: openembedded-core@lists.openembedded.org
From: pmi183@gmail.com
X-Originating-Location: Vila Nova de Foz Coa, Guarda, PT (213.205.68.220)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 29 May 2024 02:01:40 -0700
References: <CANNYZj-LvZ6akEmDgfGGLCf6xdy_0k1rb=Z428gJVr35Xg6u+w@mail.gmail.com>
In-Reply-To: <CANNYZj-LvZ6akEmDgfGGLCf6xdy_0k1rb=Z428gJVr35Xg6u+w@mail.gmail.com>
Message-ID: <26273.1716973300075372023@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="Vmad3X1iKuhDj37KQ2CV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 09:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199995

--Vmad3X1iKuhDj37KQ2CV
Content-Type: multipart/alternative; boundary="WqGCCI5e7YLZ44LoUKvl"

--WqGCCI5e7YLZ44LoUKvl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

As requested, i created a set of small patches with the changes and unit te=
sts to support these changes.
Also i tested against the unit tests mentioned to be sure that everything k=
eeps running fine. I decided not to copy paste
the content of the patches here otherwise the message would get huge since =
we already discussed before the content.

Patch 1 - fixes race condition detected while executing functions registere=
d on `SSTATEPOSTINSTFUNCS`
Patch 2 - fixes `find` usage, avoiding hiding errors on the command executi=
on and creates buildhistory output folder if doesnt exist.
Patch 3 - fixes usage of 2 features combined, `BUILDHISTORY_PRESERVE` and `=
BUILDHISTORY_RESET`, restoring files to buildhistory main folder.
Patch 4 - adds unit tests to validate files-in-package.txt generation and f=
eature combination from patch 3.

I hope this goes towards your vision.

--WqGCCI5e7YLZ44LoUKvl
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgrou=
nd-color: #ffffff; text-decoration-thickness: initial; text-decoration-styl=
e: initial; text-decoration-color: initial; display: inline !important; flo=
at: none;">Hi Alex,</span><br style=3D"color: #222222; font-family: Arial, =
Helvetica, sans-serif; font-size: small; font-style: normal; font-variant-l=
igatures: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform=
: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white=
-space: normal; background-color: #ffffff; text-decoration-thickness: initi=
al; text-decoration-style: initial; text-decoration-color: initial;" /><br =
style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-si=
ze: small; font-style: normal; font-variant-ligatures: normal; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-a=
lign: start; text-indent: 0px; text-transform: none; widows: 2; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-col=
or: #ffffff; text-decoration-thickness: initial; text-decoration-style: ini=
tial; text-decoration-color: initial;" /><span style=3D"color: #222222; fon=
t-family: Arial, Helvetica, sans-serif; font-size: small; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: normal; background-color: #ffffff; text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial; display: inline !important; float: none;">As requested, i created=
 a set of small patches with the changes and unit tests to support these ch=
anges.</span><br style=3D"color: #222222; font-family: Arial, Helvetica, sa=
ns-serif; font-size: small; font-style: normal; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; widow=
s: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: norma=
l; background-color: #ffffff; text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;" /><span style=3D"co=
lor: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial; display: inline !important; float: none;">Also i=
 tested against the unit tests mentioned to be sure that everything keeps r=
unning fine. I decided not to copy paste</span><br style=3D"color: #222222;=
 font-family: Arial, Helvetica, sans-serif; font-size: small; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent=
: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: normal; background-color: #ffffff; text-decora=
tion-thickness: initial; text-decoration-style: initial; text-decoration-co=
lor: initial;" /><span style=3D"color: #222222; font-family: Arial, Helveti=
ca, sans-serif; font-size: small; font-style: normal; font-variant-ligature=
s: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: nor=
mal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space:=
 normal; background-color: #ffffff; text-decoration-thickness: initial; tex=
t-decoration-style: initial; text-decoration-color: initial; display: inlin=
e !important; float: none;">the content of the patches here otherwise the m=
essage would get huge since we already discussed before the content.</span>=
<br style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; fon=
t-size: small; font-style: normal; font-variant-ligatures: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; te=
xt-align: start; text-indent: 0px; text-transform: none; widows: 2; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background=
-color: #ffffff; text-decoration-thickness: initial; text-decoration-style:=
 initial; text-decoration-color: initial;" /><br style=3D"color: #222222; f=
ont-family: Arial, Helvetica, sans-serif; font-size: small; font-style: nor=
mal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: =
0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: normal; background-color: #ffffff; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial;" /><span style=3D"color: #222222; font-family: Arial, Helvetica=
, sans-serif; font-size: small; font-style: normal; font-variant-ligatures:=
 normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norma=
l; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; w=
idows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: n=
ormal; background-color: #ffffff; text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color: initial; display: inline =
!important; float: none;">Patch 1 - fixes race condition detected while exe=
cuting functions registered on `SSTATEPOSTINSTFUNCS`</span><br style=3D"col=
or: #222222; font-family: Arial, Helvetica, sans-serif; font-size: small; f=
ont-style: normal; font-variant-ligatures: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start;=
 text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff;=
 text-decoration-thickness: initial; text-decoration-style: initial; text-d=
ecoration-color: initial;" /><span style=3D"color: #222222; font-family: Ar=
ial, Helvetica, sans-serif; font-size: small; font-style: normal; font-vari=
ant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-=
spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tran=
sform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
white-space: normal; background-color: #ffffff; text-decoration-thickness: =
initial; text-decoration-style: initial; text-decoration-color: initial; di=
splay: inline !important; float: none;">Patch 2 - fixes `find` usage, avoid=
ing hiding errors on the command execution and creates buildhistory output =
folder if doesnt exist.</span><br style=3D"color: #222222; font-family: Ari=
al, Helvetica, sans-serif; font-size: small; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: normal; background-color: #ffffff; text-decoration-thickness: i=
nitial; text-decoration-style: initial; text-decoration-color: initial;" />=
<span style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; f=
ont-size: small; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgrou=
nd-color: #ffffff; text-decoration-thickness: initial; text-decoration-styl=
e: initial; text-decoration-color: initial; display: inline !important; flo=
at: none;">Patch 3 - fixes usage of 2 features combined, `BUILDHISTORY_PRES=
ERVE` and `BUILDHISTORY_RESET`, restoring files to buildhistory main folder=
.</span><br style=3D"color: #222222; font-family: Arial, Helvetica, sans-se=
rif; font-size: small; font-style: normal; font-variant-ligatures: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphan=
s: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; ba=
ckground-color: #ffffff; text-decoration-thickness: initial; text-decoratio=
n-style: initial; text-decoration-color: initial;" /><span style=3D"color: =
#222222; font-family: Arial, Helvetica, sans-serif; font-size: small; font-=
style: normal; font-variant-ligatures: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; tex=
t-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; white-space: normal; background-color: #ffffff; tex=
t-decoration-thickness: initial; text-decoration-style: initial; text-decor=
ation-color: initial; display: inline !important; float: none;">Patch 4 - a=
dds unit tests to validate files-in-package.txt generation and feature comb=
ination from patch 3.</span><br style=3D"color: #222222; font-family: Arial=
, Helvetica, sans-serif; font-size: small; font-style: normal; font-variant=
-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spa=
cing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfo=
rm: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; whi=
te-space: normal; background-color: #ffffff; text-decoration-thickness: ini=
tial; text-decoration-style: initial; text-decoration-color: initial;" /><b=
r style=3D"color: #222222; font-family: Arial, Helvetica, sans-serif; font-=
size: small; font-style: normal; font-variant-ligatures: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text=
-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-c=
olor: #ffffff; text-decoration-thickness: initial; text-decoration-style: i=
nitial; text-decoration-color: initial;" /><span style=3D"color: #222222; f=
ont-family: Arial, Helvetica, sans-serif; font-size: small; font-style: nor=
mal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: =
0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; white-space: normal; background-color: #ffffff; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial; display: inline !important; float: none;">I hope this goes towa=
rds your vision.</span>

--WqGCCI5e7YLZ44LoUKvl--

--Vmad3X1iKuhDj37KQ2CV
Content-Type: application/octet-stream; name="0001-sstate-fixing-possible-race-codition.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-sstate-fixing-possible-race-codition.patch"

RnJvbSBhNTNiYjYxNGUxYjIyNTZkN2IzOWMwMTgxMmFjOGE4NGQ5YTljZTYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaW5ldHRlIEFkaGlrYXJpIDxuaW5ldHRlQHRoZWhvb2RpZWZp
cm0uY29tPgpEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDE2OjUyOjUyICswMjAwClN1YmplY3Q6IFtQ
QVRDSCAxLzNdIHNzdGF0ZTogZml4aW5nIHBvc3NpYmxlIHJhY2UgY29kaXRpb24KCkZpeGVzIHJh
Y2UgY29uZGl0aW9uIGJldHdlZW4gcGFyYWxsZWwgZXhlY3V0aW9uIG9mCmZ1bmN0aW9ucyByZWdp
c3RlcmVkIGluIGBTU1RBVEVQT1NUSU5TVEZVTkNTYCBhbmQKcmVuYW1lIG9wZXJhdGlvbnMgb24g
Zm9sZGVycyByZWxhdGVkIHRvIHNzdGF0ZQoKU2lnbmVkLW9mZi1ieTogUGVkcm8gRmVycmVpcmEg
PHBtaTE4M0BnbWFpbC5jb20+Ci0tLQogbWV0YS9jbGFzc2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFz
cyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFzcyBiL21ldGEv
Y2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJiY2xhc3MKaW5kZXggNzZhN2I1OTYzNi4uOTg4NzE2OWU0
ZiAxMDA2NDQKLS0tIGEvbWV0YS9jbGFzc2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFzcworKysgYi9t
ZXRhL2NsYXNzZXMtZ2xvYmFsL3NzdGF0ZS5iYmNsYXNzCkBAIC00MDMsNyArNDAzLDYgQEAgZGVm
IHNzdGF0ZV9pbnN0YWxscGtnZGlyKHNzLCBkKToKICAgICBmb3Igc3RhdGUgaW4gc3NbJ2RpcnMn
XToKICAgICAgICAgcHJlcGRpcihzdGF0ZVsxXSkKICAgICAgICAgYmIudXRpbHMucmVuYW1lKHNz
dGF0ZWluc3QgKyBzdGF0ZVswXSwgc3RhdGVbMV0pCi0gICAgc3N0YXRlX2luc3RhbGwoc3MsIGQp
CiAKICAgICBmb3IgcGxhaW4gaW4gc3NbJ3BsYWluZGlycyddOgogICAgICAgICB3b3JrZGlyID0g
ZC5nZXRWYXIoJ1dPUktESVInKQpAQCAtNDE2LDYgKzQxNSw4IEBAIGRlZiBzc3RhdGVfaW5zdGFs
bHBrZ2RpcihzcywgZCk6CiAgICAgICAgIHByZXBkaXIoZGVzdCkKICAgICAgICAgYmIudXRpbHMu
cmVuYW1lKHNyYywgZGVzdCkKIAorICAgIHNzdGF0ZV9pbnN0YWxsKHNzLCBkKQorCiAgICAgcmV0
dXJuIFRydWUKIAogcHl0aG9uIHNzdGF0ZV9oYXJkY29kZV9wYXRoX3VucGFjayAoKSB7Ci0tIAoy
LjI1LjEKCg==

--Vmad3X1iKuhDj37KQ2CV
Content-Type: application/octet-stream; name="0002-buildhistory-files-in-package.txt-missing.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0002-buildhistory-files-in-package.txt-missing.patch"

RnJvbSA4MTUxNzI3MGJhYTI2OWU1N2E4NzFkZWJhOGZiYjVkMjc2YjlhZmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZWRybyBGZXJyZWlyYSA8UGVkcm8uTVMuRmVycmVpcmFAY3R3
LmJtd2dyb3VwLmNvbT4KRGF0ZTogVHVlLCAyOCBNYXkgMjAyNCAwODo0Njo0MyArMDAwMApTdWJq
ZWN0OiBbUEFUQ0ggMi8zXSBidWlsZGhpc3Rvcnk6IGZpbGVzLWluLXBhY2thZ2UudHh0IG1pc3Np
bmcKClVuaGlkZXMgaXNzdWUgdXNpbmcgZmluZCBjb21tYW5kIHRvIHJldHJpZXZlIHRyZWUgb2YK
Zm9sZGVycyBvbiBgUEtHREVTVGAgYW5kIGVuc3VyZXMgY3JlYXRpb24gb2YgYG91dGZvbGRlcmAK
c2luY2UgdGhpcyByZXNwb25zYWJpbGl0eSBpcyB1bmRlciB0YXNrIGBwYWNrYWdlRGF0YWAgYW5k
CmBmaWxlcy1pbi1wYWNrYWdlLnR4dGAgaXMgY3JlYXRlZCBvbiB0YXNrIGBwYWNrYWdlYAoKU2ln
bmVkLW9mZi1ieTogUGVkcm8gRmVycmVpcmEgPHBtaTE4M0BnbWFpbC5jb20+Ci0tLQogbWV0YS9j
bGFzc2VzL2J1aWxkaGlzdG9yeS5iYmNsYXNzIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNz
ZXMvYnVpbGRoaXN0b3J5LmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvYnVpbGRoaXN0b3J5LmJiY2xh
c3MKaW5kZXggZmQ1M2U5MjQwMi4uMWY0Mzk2OTg5YSAxMDA2NDQKLS0tIGEvbWV0YS9jbGFzc2Vz
L2J1aWxkaGlzdG9yeS5iYmNsYXNzCisrKyBiL21ldGEvY2xhc3Nlcy9idWlsZGhpc3RvcnkuYmJj
bGFzcwpAQCAtNTk5LDE1ICs1OTksMTMgQEAgYnVpbGRoaXN0b3J5X2xpc3RfZmlsZXNfbm9fb3du
ZXJzKCkgewogCiBidWlsZGhpc3RvcnlfbGlzdF9wa2dfZmlsZXMoKSB7CiAJIyBDcmVhdGUgaW5k
aXZpZHVhbCBmaWxlcy1pbi1wYWNrYWdlIGZvciBlYWNoIHJlY2lwZSdzIHBhY2thZ2UKLQlmb3Ig
cGtnZGlyIGluICQoZmluZCAke1BLR0RFU1R9LyogLW1heGRlcHRoIDAgLXR5cGUgZCk7IGRvCisg
ICAgcGtnZGlybGlzdD0kKGZpbmQgJHtQS0dERVNUfS8qIC1tYXhkZXB0aCAwIC10eXBlIGQpCisJ
Zm9yIHBrZ2RpciBpbiAkcGtnZGlybGlzdDsgZG8KIAkJcGtnbmFtZT0kKGJhc2VuYW1lICRwa2dk
aXIpCiAJCW91dGZvbGRlcj0iJHtCVUlMREhJU1RPUllfRElSX1BBQ0tBR0V9LyRwa2duYW1lIgog
CQlvdXRmaWxlPSIkb3V0Zm9sZGVyL2ZpbGVzLWluLXBhY2thZ2UudHh0IgogCQkjIE1ha2Ugc3Vy
ZSB0aGUgb3V0cHV0IGZvbGRlciBleGlzdHMgc28gd2UgY2FuIGNyZWF0ZSB0aGUgZmlsZQotCQlp
ZiBbICEgLWQgJG91dGZvbGRlciBdIDsgdGhlbgotCQkJYmJkZWJ1ZyAyICJGb2xkZXIgJG91dGZv
bGRlciBkb2VzIG5vdCBleGlzdCwgZmlsZSAkb3V0ZmlsZSBub3QgY3JlYXRlZCIKLQkJCWNvbnRp
bnVlCi0JCWZpCisgICAgICAgIG1rZGlyIC1wICRvdXRmb2xkZXIKIAkJYnVpbGRoaXN0b3J5X2xp
c3RfZmlsZXMgJHBrZ2RpciAkb3V0ZmlsZSBmYWtlcm9vdAogCWRvbmUKIH0KLS0gCjIuMjUuMQoK

--Vmad3X1iKuhDj37KQ2CV
Content-Type: application/octet-stream; name="0003-buildhistory-preserve-files-while-buildhitory-reset-.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0003-buildhistory-preserve-files-while-buildhitory-reset-.patch"

RnJvbSBhMWVmYjQ2YzJiYmE3NzI0ZWI2ZTVmM2NmNDQ3NTIzZjcxMThkOWRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZWRybyBGZXJyZWlyYSA8UGVkcm8uTVMuRmVycmVpcmFAY3R3
LmJtd2dyb3VwLmNvbT4KRGF0ZTogVHVlLCAyOCBNYXkgMjAyNCAwODo1NTo0NCArMDAwMApTdWJq
ZWN0OiBbUEFUQ0ggMy8zXSBidWlsZGhpc3Rvcnk6IHByZXNlcnZlIGZpbGVzIHdoaWxlIGJ1aWxk
aGl0b3J5IHJlc2V0CiBlbmFibGVkCgpXaGVuIGBCVUlMREhJU1RPUllfUkVTRVRgIGlzIGVuYWJs
ZWQsIGZpbGVzIG1lbnRpb25lZCBvbgpgQlVJTERISVNUT1JZX1BSRVNFUlZFYCBhcmUgbm90IGJl
aW5nIGtlcHQuIFRoaXMgbGVhZHMgdG8KZmlsZSBsb3NzLgpBZGRzIG9uIHRhc2sgYHBhY2thZ2VE
YXRhYCBhIHJvdXRpbmUgdG8gY29weSBmaWxlcyBmcm9tCmBvbGRwa2doaXN0ZGlyYCB0byBgcGtn
aGlzdGRpcmAKClNpZ25lZC1vZmYtYnk6IFBlZHJvIEZlcnJlaXJhIDxwbWkxODNAZ21haWwuY29t
PgotLS0KIG1ldGEvY2xhc3Nlcy9idWlsZGhpc3RvcnkuYmJjbGFzcyB8IDIyICsrKysrKysrKysr
KysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2J1aWxkaGlzdG9yeS5iYmNsYXNzIGIvbWV0
YS9jbGFzc2VzL2J1aWxkaGlzdG9yeS5iYmNsYXNzCmluZGV4IDFmNDM5Njk4OWEuLmM3MDdmNzE2
NTcgMTAwNjQ0Ci0tLSBhL21ldGEvY2xhc3Nlcy9idWlsZGhpc3RvcnkuYmJjbGFzcworKysgYi9t
ZXRhL2NsYXNzZXMvYnVpbGRoaXN0b3J5LmJiY2xhc3MKQEAgLTExMCw2ICsxMTAsNyBAQCBweXRo
b24gYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSgpIHsKICAgICBpbXBvcnQganNvbgogICAg
IGltcG9ydCBzaGxleAogICAgIGltcG9ydCBlcnJubworICAgIGltcG9ydCBzaHV0aWwKIAogICAg
IHBrZ2hpc3RkaXIgPSBkLmdldFZhcignQlVJTERISVNUT1JZX0RJUl9QQUNLQUdFJykKICAgICBv
bGRwa2doaXN0ZGlyID0gZC5nZXRWYXIoJ0JVSUxESElTVE9SWV9PTERfRElSX1BBQ0tBR0UnKQpA
QCAtMjIzLDYgKzIyNCwyMCBAQCBweXRob24gYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSgp
IHsKICAgICAgICAgaXRlbXMuc29ydCgpCiAgICAgICAgIHJldHVybiAnICcuam9pbihpdGVtcykK
IAorICAgIGRlZiBwcmVzZXJ2ZWJ1aWxkaGlzdG9yeWZpbGVzKHBrZywgcHJlc2VydmUpOgorICAg
ICAgICBpZiBvcy5wYXRoLmV4aXN0cyhvcy5wYXRoLmpvaW4ob2xkcGtnaGlzdGRpciwgcGtnKSk6
CisgICAgICAgICAgICBsaXN0b2ZvYmpzID0gb3MubGlzdGRpcihvcy5wYXRoLmpvaW4ob2xkcGtn
aGlzdGRpciwgcGtnKSkKKyAgICAgICAgICAgIGZvciBvYmogaW4gbGlzdG9mb2JqczoKKyAgICAg
ICAgICAgICAgICBpZiBvYmogbm90IGluIHByZXNlcnZlOgorICAgICAgICAgICAgICAgICAgICBj
b250aW51ZQorICAgICAgICAgICAgICAgIHRyeToKKyAgICAgICAgICAgICAgICAgICAgYmIudXRp
bHMubWtkaXJoaWVyKG9zLnBhdGguam9pbihwa2doaXN0ZGlyLCBwa2cpKQorICAgICAgICAgICAg
ICAgICAgICBzaHV0aWwuY29weWZpbGUob3MucGF0aC5qb2luKG9sZHBrZ2hpc3RkaXIsIHBrZywg
b2JqKSwgb3MucGF0aC5qb2luKHBrZ2hpc3RkaXIsIHBrZywgb2JqKSkKKyAgICAgICAgICAgICAg
ICBleGNlcHQgSU9FcnJvciBhcyBlOgorICAgICAgICAgICAgICAgICAgICBiYi5ub3RlKCJVbmFi
bGUgdG8gY29weSBmaWxlLiAlcyIgJSBlKQorICAgICAgICAgICAgICAgIGV4Y2VwdCBFbnZpcm9u
bWVudEVycm9yIGFzIGU6CisgICAgICAgICAgICAgICAgICAgIGJiLm5vdGUoIlVuYWJsZSB0byBj
b3B5IGZpbGUuICVzIiAlIGUpCisKICAgICBwbiA9IGQuZ2V0VmFyKCdQTicpCiAgICAgcGUgPSBk
LmdldFZhcignUEUnKSBvciAiMCIKICAgICBwdiA9IGQuZ2V0VmFyKCdQVicpCkBAIC0yNTAsNiAr
MjY1LDExIEBAIHB5dGhvbiBidWlsZGhpc3RvcnlfZW1pdF9wa2doaXN0b3J5KCkgewogICAgIGlm
IG5vdCBvcy5wYXRoLmV4aXN0cyhwa2doaXN0ZGlyKToKICAgICAgICAgYmIudXRpbHMubWtkaXJo
aWVyKHBrZ2hpc3RkaXIpCiAgICAgZWxzZToKKyAgICAgICAgIyBDb3B5IGFsbCBmaWxlcyBtYXJr
ZWQgdG8gcHJlc2VydmUKKyAgICAgICAgaWYgZC5nZXRWYXIoIkJVSUxESElTVE9SWV9SRVNFVCIp
OgorICAgICAgICAgICAgZm9yIHBrZyBpbiBwYWNrYWdlbGlzdDoKKyAgICAgICAgICAgICAgICBw
cmVzZXJ2ZWJ1aWxkaGlzdG9yeWZpbGVzKHBrZywgcHJlc2VydmUpCisKICAgICAgICAgIyBSZW1v
dmUgZmlsZXMgZm9yIHBhY2thZ2VzIHRoYXQgbm8gbG9uZ2VyIGV4aXN0CiAgICAgICAgIGZvciBp
dGVtIGluIG9zLmxpc3RkaXIocGtnaGlzdGRpcik6CiAgICAgICAgICAgICBpZiBpdGVtIG5vdCBp
biBwcmVzZXJ2ZToKQEAgLTU5OSw3ICs2MTksNyBAQCBidWlsZGhpc3RvcnlfbGlzdF9maWxlc19u
b19vd25lcnMoKSB7CiAKIGJ1aWxkaGlzdG9yeV9saXN0X3BrZ19maWxlcygpIHsKIAkjIENyZWF0
ZSBpbmRpdmlkdWFsIGZpbGVzLWluLXBhY2thZ2UgZm9yIGVhY2ggcmVjaXBlJ3MgcGFja2FnZQot
ICAgIHBrZ2Rpcmxpc3QgPSAkKGZpbmQgJHtQS0dERVNUfS8qIC1tYXhkZXB0aCAwIC10eXBlIGQp
CisgICAgcGtnZGlybGlzdD0kKGZpbmQgJHtQS0dERVNUfS8qIC1tYXhkZXB0aCAwIC10eXBlIGQp
CiAJZm9yIHBrZ2RpciBpbiAkcGtnZGlybGlzdDsgZG8KIAkJcGtnbmFtZT0kKGJhc2VuYW1lICRw
a2dkaXIpCiAJCW91dGZvbGRlcj0iJHtCVUlMREhJU1RPUllfRElSX1BBQ0tBR0V9LyRwa2duYW1l
IgotLSAKMi4yNS4xCgo=

--Vmad3X1iKuhDj37KQ2CV
Content-Type: application/octet-stream; name="0004-buildhistory-unit-tests-for-files-in-package.txt.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0004-buildhistory-unit-tests-for-files-in-package.txt.patch"

RnJvbSAyMDdmOTA0OWJiMGU5ZmYwOTUwMDYxZmY4NjUxY2VhMDE2MGEzMTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQZWRybyBGZXJyZWlyYSA8UGVkcm8uTVMuRmVycmVpcmFAY3R3
LmJtd2dyb3VwLmNvbT4KRGF0ZTogV2VkLCAyOSBNYXkgMjAyNCAwODoyNzowNSArMDAwMApTdWJq
ZWN0OiBbUEFUQ0ggNC80XSBidWlsZGhpc3Rvcnk6IHVuaXQgdGVzdHMgZm9yIGZpbGVzLWluLXBh
Y2thZ2UudHh0CgpBZGRzIHVuaXQgdGVzdHMgdG8gY292ZXIgZmlsZSBjcmVhdGlvbiBhbmQgcmVz
ZXQKcGx1cyBwcmVzZXJ2ZSBmZWF0dXJlLgoKU2lnbmVkLW9mZi1ieTogUGVkcm8gRmVycmVpcmEg
PHBtaTE4M0BnbWFpbC5jb20+Ci0tLQogbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9idWls
ZG9wdGlvbnMucHkgfCAyNiArKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2Vz
L2J1aWxkb3B0aW9ucy5weSBiL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvYnVpbGRvcHRp
b25zLnB5CmluZGV4IDMxZGFmYWE5YzUuLmUwNWJhYzdjNmMgMTAwNjQ0Ci0tLSBhL21ldGEvbGli
L29lcWEvc2VsZnRlc3QvY2FzZXMvYnVpbGRvcHRpb25zLnB5CisrKyBiL21ldGEvbGliL29lcWEv
c2VsZnRlc3QvY2FzZXMvYnVpbGRvcHRpb25zLnB5CkBAIC0xNzYsNiArMTc2LDMyIEBAIGNsYXNz
IEJ1aWxkaGlzdG9yeVRlc3RzKEJ1aWxkaGlzdG9yeUJhc2UpOgogICAgICAgICAgICAgc2VsZi5h
c3NlcnRFcXVhbChkYXRhWydGSUxFTElTVCddLCAnJykKICAgICAgICAgc2VsZi5hc3NlcnRFcXVh
bChpbnQoZGF0YVsnUEtHU0laRSddKSwgMCkKIAorICAgIGRlZiB0ZXN0X2ZpbGVzX2luX3BhY2th
Z2VfdHh0X2NyZWF0aW9uKHNlbGYpOgorICAgICAgICBzZWxmLmNvbmZpZ19idWlsZGhpc3Rvcnko
KQorICAgICAgICBiaXRiYWtlKCd4Y3Vyc29yLXRyYW5zcGFyZW50LXRoZW1lIC1jIGNsZWFuc3N0
YXRlJykKKyAgICAgICAgYml0YmFrZSgneGN1cnNvci10cmFuc3BhcmVudC10aGVtZScpCisgICAg
ICAgIGhpc3RvcnlfZGlyID0gZ2V0X2JiX3ZhcignQlVJTERISVNUT1JZX0RJUl9QQUNLQUdFJywg
J3hjdXJzb3ItdHJhbnNwYXJlbnQtdGhlbWUnKQorICAgICAgICBzZWxmLmFzc2VydFRydWUob3Mu
cGF0aC5pc2RpcihoaXN0b3J5X2RpciksICdidWlsZGhpc3RvcnkgZGlyIHdhcyBub3QgY3JlYXRl
ZC4nKQorICAgICAgICBzdWJmb2xkZXJzID0gWyBmb2JqZWN0LnBhdGggZm9yIGZvYmplY3QgaW4g
b3Muc2NhbmRpcihoaXN0b3J5X2RpcikgaWYgZm9iamVjdC5pc19kaXIoKSBdCisgICAgICAgIHNl
bGYuYXNzZXJ0VHJ1ZShsZW4oc3ViZm9sZGVycyksICJObyBmb2xkZXJzIGluc2lkZSBwYWNrYWdl
LiIpCisgICAgICAgIGZvciBzdWJwYXRoIGluIHN1YmZvbGRlcnM6CisgICAgICAgICAgICBzZWxm
LmFzc2VydFRydWUob3MucGF0aC5pc2ZpbGUob3MucGF0aC5qb2luKHN1YnBhdGgsICdmaWxlcy1p
bi1wYWNrYWdlLnR4dCcpKSkKKworICAgIGRlZiB0ZXN0X2ZpbGVzX2luX3BhY2thZ2VfdHh0X3Jl
c2V0X2FuZF9wcmVzZXJ2ZWQoc2VsZik6CisgICAgICAgIHNlbGYuY29uZmlnX2J1aWxkaGlzdG9y
eSgpCisgICAgICAgIHNlbGYuYXBwZW5kX2NvbmZpZygiQlVJTERISVNUT1JZX1JFU0VUID0gJzEn
IikKKyAgICAgICAgc2VsZi5hcHBlbmRfY29uZmlnKCJCVUlMREhJU1RPUllfUFJFU0VSVkU6YXBw
ZW5kID0gJyBmaWxlcy1pbi1wYWNrYWdlLnR4dCciKQorICAgICAgICBiaXRiYWtlKCd4Y3Vyc29y
LXRyYW5zcGFyZW50LXRoZW1lIC1jIGNsZWFuc3N0YXRlJykKKyAgICAgICAgYml0YmFrZSgneGN1
cnNvci10cmFuc3BhcmVudC10aGVtZScpCisgICAgICAgIHNodXRpbC5ybXRyZWUoZ2V0X2JiX3Zh
cignVE1QRElSJykpCisgICAgICAgIGJpdGJha2UoJ3hjdXJzb3ItdHJhbnNwYXJlbnQtdGhlbWUn
KQorICAgICAgICBoaXN0b3J5X2RpciA9IGdldF9iYl92YXIoJ0JVSUxESElTVE9SWV9ESVJfUEFD
S0FHRScsICd4Y3Vyc29yLXRyYW5zcGFyZW50LXRoZW1lJykKKyAgICAgICAgc2VsZi5hc3NlcnRU
cnVlKG9zLnBhdGguaXNkaXIoaGlzdG9yeV9kaXIpLCAnYnVpbGRoaXN0b3J5IGRpciB3YXMgbm90
IGNyZWF0ZWQuJykKKyAgICAgICAgc3ViZm9sZGVycyA9IFsgZm9iamVjdC5wYXRoIGZvciBmb2Jq
ZWN0IGluIG9zLnNjYW5kaXIoaGlzdG9yeV9kaXIpIGlmIGZvYmplY3QuaXNfZGlyKCkgXQorICAg
ICAgICBzZWxmLmFzc2VydFRydWUobGVuKHN1YmZvbGRlcnMpLCAiTm8gZm9sZGVycyBpbnNpZGUg
cGFja2FnZS4iKQorICAgICAgICBmb3Igc3VicGF0aCBpbiBzdWJmb2xkZXJzOgorICAgICAgICAg
ICAgc2VsZi5hc3NlcnRUcnVlKG9zLnBhdGguaXNmaWxlKG9zLnBhdGguam9pbihzdWJwYXRoLCAn
ZmlsZXMtaW4tcGFja2FnZS50eHQnKSkpCisKIGNsYXNzIEFyY2hpdmVyVGVzdChPRVNlbGZ0ZXN0
VGVzdENhc2UpOgogICAgIGRlZiB0ZXN0X2FyY2hfd29ya19kaXJfYW5kX2V4cG9ydF9zb3VyY2Uo
c2VsZik6CiAgICAgICAgICIiIgotLSAKMi4yNS4xCgo=

--Vmad3X1iKuhDj37KQ2CV--

