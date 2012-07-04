Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SmOkE-0000vm-9Z
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 14:31:46 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 04 Jul 2012 05:19:37 -0700
Received: by lbbgj3 with SMTP id gj3so9156644lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 05:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=g3esWAJxfMcEwFwfXT3U/p/arMoYWvoH4bzNGC2biso=;
	b=E6aunlks+IDZy64wbn8bRNAvStvb0mhXSeJ5PtJeS41zj3QP+aI8+jxP/5v320eVd2
	tzEB/5WgUME1fD2l9kbjdD+3EHZtM1U7JmqeguSkjX3hZW2piT8cgzmXqIN9QJtuKFJB
	u/I8jn/bGq6itB5ti1PEmT3zka2J7xHE4sqivTzJXJdqQamG8HRTDzUMltSI/d18g845
	jsi2ZmSgufnntbPTsPocOrWKS60PVePCLvnltyO6fWXi4WzA8k6PiORX5CfYfHThh9Bi
	01VLsBZK9riJKiHvycmU1ubeqZQnMB0frRRlRBOx58NVC/8xFeNnjoYpLZEBkgcHUX+0
	xTIA==
MIME-Version: 1.0
Received: by 10.112.86.132 with SMTP id p4mr9720876lbz.22.1341404375537; Wed,
	04 Jul 2012 05:19:35 -0700 (PDT)
Received: by 10.112.38.132 with HTTP; Wed, 4 Jul 2012 05:19:35 -0700 (PDT)
Date: Wed, 4 Jul 2012 15:19:35 +0300
Message-ID: <CAJ2CSBv9amOtH=LdU+37ZoNo0LB0B6uJ-=osARD0d_Chuppu9Q@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQknc3iBGii5h9fiB3BCmTq5bRFQ4iCyGj8d6byLK7n83MCzeJL4rjoBpggxN2cAKQtJ2f42
Subject: Files not getting into the debug packages
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
X-List-Received-Date: Wed, 04 Jul 2012 12:31:46 -0000
X-Groupsio-MsgNum: 24650
Content-Type: multipart/mixed; boundary=bcaec554d5224dda7c04c4000b72

--bcaec554d5224dda7c04c4000b72
Content-Type: multipart/alternative; boundary=bcaec554d5224dda7704c4000b70

--bcaec554d5224dda7704c4000b70
Content-Type: text/plain; charset=ISO-8859-1

Hi guys,

I'm trying to run a udev package upgrade (See attached patch).

I get this error,

ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/v4l_id
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/cdrom_id
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/mtd_probe
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/accelerometer
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/scsi_id
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/udevd
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/keymap
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/collect
ERROR: QA Issue: non debug package contains .debug directory: udev path
/work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/ata_id
ERROR: QA run found fatal errors. Please consider fixing them.


although I added the files to the debug package (I think)

 FILES_${PN}-dbg += "${libexecdir}/.debug"
+FILES_${PN}-dbg += "${libexecdir}/udev/udev/.debug/"
+FILES_${PN}-dbg += "${libexecdir}/udev/udev/.debug/*"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"

Can somebody please point out what I'm doing wrong ?

Cheers,
Alex

--bcaec554d5224dda7704c4000b70
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi guys,<br><br>I&#39;m trying to run a udev package upgrade (See attached =
patch).<br><br>I get this error, <br><br>ERROR: QA Issue: non debug package=
 contains .debug directory: udev path /work/i586-poky-linux/udev-182-r0/pac=
kages-split/udev/lib/udev/udev/.debug/v4l_id<br>
ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/cdr=
om_id<br>ERROR: QA Issue: non debug package contains .debug directory: udev=
 path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.=
debug/mtd_probe<br>
ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/acc=
elerometer<br>ERROR: QA Issue: non debug package contains .debug directory:=
 udev path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/u=
dev/.debug/scsi_id<br>
ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/ude=
vd<br>ERROR: QA Issue: non debug package contains .debug directory: udev pa=
th /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.deb=
ug/keymap<br>
ERROR: QA Issue: non debug package contains .debug directory: udev path /wo=
rk/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.debug/col=
lect<br>ERROR: QA Issue: non debug package contains .debug directory: udev =
path /work/i586-poky-linux/udev-182-r0/packages-split/udev/lib/udev/udev/.d=
ebug/ata_id<br>
ERROR: QA run found fatal errors. Please consider fixing them.<br><br><br>a=
lthough I added the files to the debug package (I think)<br><br>=A0FILES_${=
PN}-dbg +=3D &quot;${libexecdir}/.debug&quot;<br>+FILES_${PN}-dbg +=3D &quo=
t;${libexecdir}/udev/udev/.debug/&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libexecdir}/udev/udev/.debug/*&quot;<br>=A0FI=
LES_${PN}-dev =3D &quot;${datadir}/pkgconfig/udev.pc&quot;<br><br>Can someb=
ody please point out what I&#39;m doing wrong ?<br><br>Cheers,<br>Alex<br>

--bcaec554d5224dda7704c4000b70--

--bcaec554d5224dda7c04c4000b72
Content-Type: application/octet-stream; name="0001-udev-upgrade.patch"
Content-Disposition: attachment; filename="0001-udev-upgrade.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h48djy9r0

RnJvbSAzMTZhZDZkNzU3NmM4Y2FhMmQwZmE2ZTJkNjA1OGRlMDg2Yzc1ZmE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kcnUgREFNSUFOIDxhbGV4YW5kcnUuZGFtaWFuQGlu
dGVsLmNvbT4KRGF0ZTogVHVlLCAzIEp1bCAyMDEyIDE0OjQ2OjUzICswMzAwClN1YmplY3Q6IFtQ
QVRDSCAxLzFdIHVkZXYgdXBncmFkZQoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYu
aW5jICAgICAgICAgICAgICAgICAgIHwgICAgOSArKy0tCiBtZXRhL3JlY2lwZXMtY29yZS91ZGV2
L3VkZXYvdWRldi0xNjYtdjRsMS0xLnBhdGNoIHwgICA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IG1ldGEvcmVjaXBlcy1jb3JlL3VkZXYvdWRldl8xNjQuYmIgICAgICAgICAgICAgICAgfCAgICA4
IC0tLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3VkZXYvdWRldl8xODIuYmIgICAgICAgICAgICAgICAg
fCAgICA5ICsrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2L3Vk
ZXYtMTY2LXY0bDEtMS5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3Jl
L3VkZXYvdWRldl8xNjQuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS91
ZGV2L3VkZXZfMTgyLmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2
LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL3VkZXYvdWRldi5pbmMKaW5kZXggM2U3MjUxNS4uMTFm
YjJlMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2LmluYworKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYuaW5jCkBAIC02LDkgKzYsMTAgQEAgTElDRU5TRSA9
ICJHUEx2Mi4wKyAmIExHUEx2Mi4xKyIKIExJQ0VOU0VfJHtQTn0gPSAiR1BMdjIuMCsiCiBMSUNF
TlNFX2xpYnVkZXYgPSAiTEdQTHYyLjErIgogTElDRU5TRV9saWJndWRldiA9ICJMR1BMdjIuMSsi
Ci1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT03NTE0MTkyNjBhYTk1NDQ5
OWY3YWJhYWJhYTg4MmJiZSBcCi0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9saWJ1ZGV2L0NP
UFlJTkc7bWQ1PWE2Zjg5ZTIxMDBkOWI2Y2RmZmNlYTRmMzk4ZTM3MzQzIFwKLSAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL2V4dHJhcy9ndWRldi9DT1BZSU5HO21kNT1hNmY4OWUyMTAwZDliNmNk
ZmZjZWE0ZjM5OGUzNzM0MyIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwKKyAgICAgICAgICAgICAgICAgICAg
ZmlsZTovL3NyYy9DT1BZSU5HO21kNT0xN2M0ZTVmYjQ5NWU2NzA3YWM5MmEzODY0OTI2Zjk3OSBc
CisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zcmMvZ3VkZXYvQ09QWUlORzttZDU9ZmI0OTQ0
ODVhN2QwNTA1MzA4Y2I2OGU0OTk3Y2MyNjYiCisgICAgICAgICAgICAgICAgICAgIAogCiBERVBF
TkRTID0gImFjbCBnbGliLTIuMCBsaWJ1c2IgdXNidXRpbHMgcGNpdXRpbHMgZ3BlcmYtbmF0aXZl
IGxpYnhzbHQtbmF0aXZlIgogUlBST1ZJREVTXyR7UE59ID0gImhvdHBsdWciCkBAIC01MCw2ICs1
MSw4IEBAIEZJTEVTXyR7UE59ICs9ICIke2xpYmV4ZWNkaXJ9ICR7bGliZGlyfS9Db25zb2xlS2l0
IgogUlJFQ09NTUVORFNfJHtQTn0gKz0gInVkZXYtdXRpbHMiCiAKIEZJTEVTXyR7UE59LWRiZyAr
PSAiJHtsaWJleGVjZGlyfS8uZGVidWciCitGSUxFU18ke1BOfS1kYmcgKz0gIiR7bGliZXhlY2Rp
cn0vdWRldi91ZGV2Ly5kZWJ1Zy8iCitGSUxFU18ke1BOfS1kYmcgKz0gIiR7bGliZXhlY2Rpcn0v
dWRldi91ZGV2Ly5kZWJ1Zy8qIgogRklMRVNfJHtQTn0tZGV2ID0gIiR7ZGF0YWRpcn0vcGtnY29u
ZmlnL3VkZXYucGMiCiBGSUxFU19saWJ1ZGV2ID0gIiR7YmFzZV9saWJkaXJ9L2xpYnVkZXYuc28u
KiIKIEZJTEVTX2xpYnVkZXYtZGJnID0gIiR7YmFzZV9saWJkaXJ9Ly5kZWJ1Zy9saWJ1ZGV2LnNv
LioiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYvdWRldi0xNjYtdjRs
MS0xLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2L3VkZXYtMTY2LXY0bDEtMS5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMjA4NmZlMS4uMDAwMDAwMAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXYvdWRldi0xNjYtdjRsMS0xLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsNTAgKzAsMCBAQAotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotCi1T
dWJtaXR0ZWQgQnk6ICAgICAgICAgICAgTWF0dCBCdXJnZXNzIDxtYXR0aGV3X2F0X2xpbnV4ZnJv
bXNjcmF0Y2hfZG90X29yZz4KLURhdGU6ICAgICAgICAgICAgICAgICAgICAyMDExLTAzLTI2Ci1J
bml0aWFsIFBhY2thZ2UgVmVyc2lvbjogMTY2Ci1VcHN0cmVhbSBTdGF0dXM6ICAgICAgICAgRnJv
bSB1cHN0cmVhbQotT3JpZ2luOiAgICAgICAgICAgICAgICAgIGh0dHA6Ly9naXQua2VybmVsLm9y
Zy8/cD1saW51eC9ob3RwbHVnL3VkZXYuZ2l0O2E9Y29tbWl0ZGlmZjtoPTRhY2U4YTQzYWMyY2Ji
ZDRkNmY1YzI5ZmM0NjFjM2NhYThmODU0NWIKLURlc2NyaXB0aW9uOiAgICAgICAgICAgICBGaXhl
cyBhIGNvbXBpbGF0aW9uIGVycm9yIGNhdXNlZCBieSB0aGUgcmVtb3ZhbCBvZiB0aGUKLSAgICAg
ICAgICAgICAgICAgICAgICAgICBWaWRlbyBmb3IgTGludXggMSBBUEkgZnJvbSBMaW51eCBrZXJu
ZWxzIGZyb20gMi42LjM4Ci0gICAgICAgICAgICAgICAgICAgICAgICAgb253YXJkcy4KLQotZGlm
ZiAtTmF1ciB1ZGV2LTE2Ni5vcmlnL2V4dHJhcy92NGxfaWQvdjRsX2lkLmMgdWRldi0xNjYvZXh0
cmFzL3Y0bF9pZC92NGxfaWQuYwotLS0tIHVkZXYtMTY2Lm9yaWcvZXh0cmFzL3Y0bF9pZC92NGxf
aWQuYwkyMDA5LTEyLTAzIDEyOjQ1OjAzLjAwMDAwMDAwMCArMDAwMAotKysrIHVkZXYtMTY2L2V4
dHJhcy92NGxfaWQvdjRsX2lkLmMJMjAxMS0wMy0yNSAyMDoyNjozMy4wMDAwMDAwMDAgKzAwMDAK
LUBAIC0yOCw3ICsyOCw2IEBACi0gI2luY2x1ZGUgPHN5cy90eXBlcy5oPgotICNpbmNsdWRlIDxz
eXMvdGltZS5oPgotICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KLS0jaW5jbHVkZSA8bGludXgvdmlk
ZW9kZXYuaD4KLSAjaW5jbHVkZSA8bGludXgvdmlkZW9kZXYyLmg+Ci0gCi0gaW50IG1haW4gKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pCi1AQCAtMzksNyArMzgsNiBAQAotIAl9OwotIAlpbnQgZmQ7
Ci0gCWNoYXIgKmRldmljZTsKLS0Jc3RydWN0IHZpZGVvX2NhcGFiaWxpdHkgdjFjYXA7Ci0gCXN0
cnVjdCB2NGwyX2NhcGFiaWxpdHkgdjJjYXA7Ci0gCi0gCXdoaWxlICgxKSB7Ci1AQCAtODIsMTkg
KzgwLDYgQEAKLSAJCWlmICgodjJjYXAuY2FwYWJpbGl0aWVzICYgVjRMMl9DQVBfUkFESU8pID4g
MCkKLSAJCQlwcmludGYoInJhZGlvOiIpOwotIAkJcHJpbnRmKCJcbiIpOwotLQl9IGVsc2UgaWYg
KGlvY3RsIChmZCwgVklESU9DR0NBUCwgJnYxY2FwKSA9PSAwKSB7Ci0tCQlwcmludGYoIklEX1Y0
TF9WRVJTSU9OPTFcbiIpOwotLQkJcHJpbnRmKCJJRF9WNExfUFJPRFVDVD0lc1xuIiwgdjFjYXAu
bmFtZSk7Ci0tCQlwcmludGYoIklEX1Y0TF9DQVBBQklMSVRJRVM9OiIpOwotLQkJaWYgKCh2MWNh
cC50eXBlICYgVklEX1RZUEVfQ0FQVFVSRSkgPiAwKQotLQkJCXByaW50ZigiY2FwdHVyZToiKTsK
LS0JCWlmICgodjFjYXAudHlwZSAmIFZJRF9UWVBFX09WRVJMQVkpID4gMCkKLS0JCQlwcmludGYo
InZpZGVvX292ZXJsYXk6Iik7Ci0tCQlpZiAodjFjYXAuYXVkaW9zID4gMCkKLS0JCQlwcmludGYo
ImF1ZGlvOiIpOwotLQkJaWYgKCh2MWNhcC50eXBlICYgVklEX1RZUEVfVFVORVIpID4gMCkKLS0J
CQlwcmludGYoInR1bmVyOiIpOwotLQkJcHJpbnRmKCJcbiIpOwotIAl9Ci0gCi0gCWNsb3NlIChm
ZCk7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXZfMTY0LmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2XzE2NC5iYgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggYzU4MTNlYy4uMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91ZGV2L3VkZXZf
MTY0LmJiCisrKyAvZGV2L251bGwKQEAgLTEsOCArMCwwIEBACi1pbmNsdWRlIHVkZXYuaW5jCi0K
LVBSID0gInIxMyIKLQotU1JDX1VSSSArPSAiZmlsZTovL3VkZXYtMTY2LXY0bDEtMS5wYXRjaCIK
LQotU1JDX1VSSVttZDVzdW1dID0gImZkZGFjMmQ1NDc2MWVhMzQ4NjVhZjk0NjczNzdjYTlmIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImMxMmU2NjI4MGI1ZTE0NjVmNjU4N2E4Y2ZhNDdkNzQwNWM0
Y2FhN2U1MmNlNWRkMTM0NzhkMDRmNmVjMDVlNWMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS91ZGV2L3VkZXZfMTgyLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2XzE4Mi5i
YgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi42Njc4ZmUxCi0tLSAvZGV2L251
bGwKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdWRldi91ZGV2XzE4Mi5iYgpAQCAtMCwwICsxLDkg
QEAKK2luY2x1ZGUgdWRldi5pbmMKKworUFIgPSAicjAiCisKKyMgbW9kdWxlLWluaXQtdG9vbHMg
ZnJvbSBrbW9kX2dpdCB3aWxsIHByb3ZpZGUgbGlia21vZCBydW50aW1lCitERVBFTkRTID0gIm1v
ZHVsZS1pbml0LXRvb2xzIgorCitTUkNfVVJJW21kNXN1bV0gPSAiMWI5NjQ0NTYxNzdmYmY0ODAy
M2RmZWU3ZGIzYTcwOGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzg1N2VkMTlmYWZkOGYzY2E4
ZGU0MTAxOTRlOGM3MzM2ZTllYjhhMjA2MjZlYThhNGJhNjQ0OWIwMTdmYWJhNCIKLS0gCjEuNy45
LjUKCg==

--bcaec554d5224dda7c04c4000b72--
