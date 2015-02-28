Return-Path: <mgloff@emacinc.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id D018D65C7B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Feb 2015 20:39:00 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so38945242iec.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Feb 2015 12:39:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=b8MdQMoNEa9XFTPKqEJnjwmEGJTLOJTBQimu94zax1U=;
	b=dgHQxLsxZy4rKqARR+I/TFaN1utf00Rf5iz+cwXNKsX0/fi7homm7jmhquZBz27VN/
	VkwFzNzG7aWI/iuR5v8U92tunXuFO9hRCrGT//p8w62XkpvSuNrXO3fC7yZitDNqGIfc
	tban9bKJlnRhMBauEBzI3v11AWHhnv5ZilQC8ZhdFG9u7smM+K4xleNRkvNLuIzm+XUF
	OHkI1qI4XSjyz+m+mKfyIbrWfiiZ7lL6FemGEhKXVqCGq918lQG02j+uwUSuDKGAyYu3
	soRLBv61WA8+akMGmXtgqJnXyqP7T2VjVTBov/okDNPJVU43UiSiaP218983CizPsat0
	2+sg==
X-Gm-Message-State: ALoCoQljj2OYOFvepkX2yFone84qnM1k2eF+KTiQhk7L2caQQz+nhNWX+EtmbmhFgy5N1NO99vL+
MIME-Version: 1.0
X-Received: by 10.42.249.2 with SMTP id mi2mr22541190icb.36.1425155941317;
	Sat, 28 Feb 2015 12:39:01 -0800 (PST)
Received: by 10.107.46.169 with HTTP; Sat, 28 Feb 2015 12:39:01 -0800 (PST)
Date: Sat, 28 Feb 2015 14:39:01 -0600
Message-ID: <CALXw4G4Sw72OzA10BKVrOA7cz2=WM8M2gnAdT_RdoZ+M8P5xMg@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: NFS server
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
X-List-Received-Date: Sat, 28 Feb 2015 20:39:01 -0000
X-Groupsio-MsgNum: 62838
Content-Type: multipart/mixed; boundary=90e6ba4fbda4a1f26305102bf9c6

--90e6ba4fbda4a1f26305102bf9c6
Content-Type: multipart/alternative; boundary=90e6ba4fbda4a1f26005102bf9c4

--90e6ba4fbda4a1f26005102bf9c4
Content-Type: text/plain; charset=UTF-8

All,
I have run into the issue of nfs server seg faulting when trying to start.
After some searching I found that it is related to GCC 4.9.x and
nfs-utils-1.3.X

http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-July/027853.html

There is a patch that I have tested locally that works.

I'm not sure how to proceed, but this pretty much breaks nfs server
capabilities.

Michael Gloff

--90e6ba4fbda4a1f26005102bf9c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>All, <br></div>I have run into the iss=
ue of nfs server seg faulting when trying to start. After some searching I =
found that it is related to GCC 4.9.x and nfs-utils-1.3.X<br><br><a href=3D=
"http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-July/027853.html=
">http://lists.linuxfromscratch.org/pipermail/blfs-dev/2014-July/027853.htm=
l</a><br><br></div>There is a patch that I have tested locally that works.<=
br><br></div>I&#39;m not sure how to proceed, but this pretty much breaks n=
fs server capabilities.<br><br></div>Michael Gloff<br></div>

--90e6ba4fbda4a1f26005102bf9c4--

--90e6ba4fbda4a1f26305102bf9c6
Content-Type: text/x-patch; charset=US-ASCII; name="nfs-gcc.patch"
Content-Disposition: attachment; filename="nfs-gcc.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i6pgtj0h0

RnJvbSAyNWU4M2MyMjcwYjJkMjk2NmM5OTI4ODVmYWVkMGI3OWJlMDlmNDc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZWZmIExheXRvbiA8amxheXRvbkBwb29jaGllcmVkcy5uZXQ+
CkRhdGU6IFRodSwgMSBNYXkgMjAxNCAxMToxNToxNiAtMDQwMApTdWJqZWN0OiBbUEFUQ0ggW25m
cy11dGlsc11dIG1vdW50ZDogZml4IHNlZ2ZhdWx0IGluIGFkZF9uYW1lIHdpdGggbmV3ZXIgZ2Nj
CiBjb21waWxlcnMKCkkgaGl0IGEgc2VnZmF1bHQgaW4gYWRkX25hbWUgd2l0aCBhIG1vdW50ZCBi
dWlsdCB3aXRoIGdjYy00LjkuMC4gU29tZQpOVUxMIHBvaW50ZXIgY2hlY2tzIGdvdCByZW9yZGVy
ZWQgc3VjaCB0aGF0IGEgcG9pbnRlciB3YXMgZGVyZWZlcmVuY2VkCmJlZm9yZSBjaGVja2luZyB0
byBzZWUgd2hldGhlciBpdCB3YXMgTlVMTC4gVGhlIHByb2JsZW0gd2FzIGR1ZSB0bwpuZnMtdXRp
bHMgcmVseWluZyBvbiB1bmRlZmluZWQgYmVoYXZpb3IsIHdoaWNoIHRyaWNrZWQgZ2NjIGludG8g
YXNzdW1pbmcKdGhhdCB0aGUgcG9pbnRlciB3b3VsZCBuZXZlciBiZSBOVUxMLgoKQXQgZmlyc3Qg
SSBhc3N1bWVkIHRoYXQgdGhpcyB3YXMgYSBjb21waWxlciBidWcsIGJ1dCBKYWt1YiBKZWxpbmVr
IGFuZApKZWZmIExhdyBwb2ludGVkIG91dDoKCiJJZiBvbGQgaXMgTlVMTCwgdGhlbjoKCglzdHJu
Y3B5KG5ldywgb2xkLCBjcC1vbGQpOwoKaXMgdW5kZWZpbmVkIGJlaGF2aW9yIChldmVuIHdoZW4g
Y3AgPT0gb2xkID09IE5VTEwgaW4gdGhhdCBjYXNlKSwKdGhlcmVmb3JlIGdjYyBhc3N1bWVzIHRo
YXQgb2xkIGlzIG5ldmVyIE5VTEwsIGFzIG90aGVyd2lzZSBpdCB3b3VsZCBiZQppbnZhbGlkLgoK
SnVzdCBndWFyZAoJc3RybmNweShuZXcsIG9sZCwgY3Atb2xkKTsKCW5ld1tjcC1vbGRdID0gMDsK
d2l0aCBpZiAob2xkKSB7IC4uLiB9LiIKClRoaXMgcGF0Y2ggZG9lcyB0aGF0LiBJZiBvbGQgaXMg
TlVMTCB0aG91Z2gsIHRoZW4gd2Ugc3RpbGwgbmVlZCB0bwplbnN1cmUgdGhhdCBuZXcgaXMgTlVM
TCB0ZXJtaW5hdGVkLCBsZXN0IHRoZSBzdWJzZXF1ZW50IHN0cmNhdHMgd2FsayBvZmYKdGhlIGVu
ZCBvZiBpdC4KCkNjOiBKZWZmIExhdyA8bGF3QHJlZGhhdC5jb20+CkNjOiBKYWt1YiBKZWxpbmVr
IDxqYWt1YkByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBw
b29jaGllcmVkcy5uZXQ+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIERpY2tzb24gPHN0ZXZlZEByZWRo
YXQuY29tPgotLS0KIHN1cHBvcnQvZXhwb3J0L2NsaWVudC5jIHwgOCArKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9z
dXBwb3J0L2V4cG9ydC9jbGllbnQuYyBiL3N1cHBvcnQvZXhwb3J0L2NsaWVudC5jCmluZGV4IGRi
ZjQ3YjkuLmY4NWUxMWMgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvZXhwb3J0L2NsaWVudC5jCisrKyBi
L3N1cHBvcnQvZXhwb3J0L2NsaWVudC5jCkBAIC00ODIsOCArNDgyLDEyIEBAIGFkZF9uYW1lKGNo
YXIgKm9sZCwgY29uc3QgY2hhciAqYWRkKQogCQllbHNlCiAJCQljcCA9IGNwICsgc3RybGVuKGNw
KTsKIAl9Ci0Jc3RybmNweShuZXcsIG9sZCwgY3Atb2xkKTsKLQluZXdbY3Atb2xkXSA9IDA7CisJ
aWYgKG9sZCkgeworCQlzdHJuY3B5KG5ldywgb2xkLCBjcC1vbGQpOworCQluZXdbY3Atb2xkXSA9
IDA7CisJfSBlbHNlIHsKKwkJbmV3WzBdID0gMDsKKwl9CiAJaWYgKGNwICE9IG9sZCAmJiAhKmNw
KQogCQlzdHJjYXQobmV3LCAiLCIpOwogCXN0cmNhdChuZXcsIGFkZCk7Ci0tIAoyLjAuMAoK

--90e6ba4fbda4a1f26305102bf9c6--
