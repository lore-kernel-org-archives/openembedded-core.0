Return-Path: <v.mayoralv@gmail.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9544662062
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 13:12:30 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id pb11so3706932veb.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=v7VX5JuJ2VXpbVeW8f3cadyxu5iUHvfvR/s4gsfva78=;
	b=lL76GJibfBdEXRXGSkn+8gottR2yF1YbeRIqbiDGsfjy2gUo0mZDCe8dyxeiX1R4zj
	C08VwPi9Rhqm75dtvZ8vD9cp6JhPZTpP2PHWHptXUI5Kit1iRWkO7rGnUuojEqJbLTO5
	cv47sYrJjWG2A8yuavCP7siGTHCJRSUn+G7wUYSpJcTc6WWCQqkO+2ErZcaLv7EH8nkv
	sO9Y5G48cmRkTN2Kk6eg9QHOfNQqiNDqQHgqz5m0vsK05tOoTm3tsOS4bqkbTBoAeBZg
	lRVF11tpiS5Bd/n4B+w6GbmElZWJDz32hZpperkyp6uzcA665COl+lTLRN5AmpbPg5xE
	1TnA==
MIME-Version: 1.0
X-Received: by 10.220.10.193 with SMTP id q1mr9477826vcq.2.1372684350902; Mon,
	01 Jul 2013 06:12:30 -0700 (PDT)
Received: by 10.58.210.42 with HTTP; Mon, 1 Jul 2013 06:12:30 -0700 (PDT)
Date: Mon, 1 Jul 2013 15:12:30 +0200
Message-ID: <CAKpQ200meOQcEu+vwbWBQpVC+FtvJw1uXLVV2qufvLud5aEvLg@mail.gmail.com>
From: =?ISO-8859-1?Q?V=EDctor_MV?= <v.mayoralv@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: apr: Add EXTRA_OECONF += "apr_cv_mutex_recursive=yes"
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
X-List-Received-Date: Mon, 01 Jul 2013 13:12:31 -0000
X-Groupsio-MsgNum: 41234
Content-Type: multipart/mixed; boundary=001a11c3aba61fdab204e072fb4d

--001a11c3aba61fdab204e072fb4d
Content-Type: multipart/alternative; boundary=001a11c3aba61fdaae04e072fb4b

--001a11c3aba61fdaae04e072fb4b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Working with the meta-ros project we detected that the ROS nodes didn't
launch properly the reason was that by default apr_cv_mutex_recursive in
apr is set to no and this leads to the APRENOTIMPL return value of
apr_thread_mutex_create in thread_mutex.c when APR_THREAD_MUTEX_NESTED is
requested via flags. Added EXTRA_OECONF +=3D "apr_cv_mutex_recursive=3Dyes"=
 to
sources/openembedded-core/meta/recipes-support/apr/apr_1.4.6.bb to fix this
issue.

Regards,

V=EDctor.

--001a11c3aba61fdaae04e072fb4b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Working with the meta-ros project we detected t=
hat the ROS nodes didn&#39;t launch properly the reason was that by default=
 apr_cv_mutex_recursive in apr is set to no and this leads to the APRENOTIM=
PL return value of apr_thread_mutex_create in thread_mutex.c when APR_THREA=
D_MUTEX_NESTED is requested via flags. Added EXTRA_OECONF +=3D &quot;apr_cv=
_mutex_recursive=3Dyes&quot; to sources/openembedded-core/meta/recipes-supp=
ort/apr/<a href=3D"http://apr_1.4.6.bb">apr_1.4.6.bb</a> to fix this issue.=
</div>
<div style><br></div><div style>Regards,</div><div style><br></div><div sty=
le>V=EDctor.</div><div><br></div></div>

--001a11c3aba61fdaae04e072fb4b--

--001a11c3aba61fdab204e072fb4d
Content-Type: application/octet-stream; 
	name="0001-Patch-to-apr_1.4.6.bb-to-make-rosnodes-work.patch"
Content-Disposition: attachment; 
	filename="0001-Patch-to-apr_1.4.6.bb-to-make-rosnodes-work.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hilot39e0

RnJvbSAxY2NmYzEwYzBhZmVjN2M2ZmQ3MzgwNGUxYWM0OGNjNDZmZDMxZWIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB2aWN0b3IgPHYubWF5b3JhbHZAZ21haWwuY29tPgpEYXRlOiBN
b24sIDEgSnVsIDIwMTMgMTQ6NDY6NDIgKzAyMDAKU3ViamVjdDogW1BBVENIXSBQYXRjaCB0byBh
cHJfMS40LjYuYmIgdG8gbWFrZSByb3Nub2RlcyB3b3JrCgpCeSBkZWZhdWx0IGFwcl9jdl9tdXRl
eF9yZWN1cnNpdmUgaW4gYXByIGlzIHNldCB0byBubyBhbmQgdGhpcyBsZWFkcyB0byB0aGUgQVBS
RU5PVElNUEwgcmV0dXJuIHZhbHVlIG9mIGFwcl90aHJlYWRfbXV0ZXhfY3JlYXRlIGluIHRocmVh
ZF9tdXRleC5jIHdoZW4gQVBSX1RIUkVBRF9NVVRFWF9ORVNURUQgaXMgcmVxdWVzdGVkIHZpYSBm
bGFncy4gQWRkZWQgRVhUUkFfT0VDT05GICs9ICJhcHJfY3ZfbXV0ZXhfcmVjdXJzaXZlPXllcyIg
dG8gc291cmNlcy9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHIvYXBy
XzEuNC42LmJiLgoKU2lnbmVkLW9mZi1ieTogVsOtY3RvciBNYXlvcmFsIFZpbGNoZXMgPHYubWF5
b3JhbHZAZ21haWwuY29tPgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS40LjYu
YmIgfCAgICAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS40LjYuYmIgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHIvYXByXzEuNC42LmJiCmluZGV4IDg5NmY3OWYuLjkyMDBkY2MgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2Fwci9hcHJfMS40LjYuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvYXByL2Fwcl8xLjQuNi5iYgpAQCAtMjMsNiArMjMsOSBAQCBpbmhlcml0IGF1
dG90b29scyBsaWJfcGFja2FnZSBiaW5jb25maWcgbXVsdGlsaWJfaGVhZGVyCiAKIE9FX0JJTkNP
TkZJR19FWFRSQV9NQU5HTEUgPSAiIC1lICdzOmxvY2F0aW9uPXNvdXJjZTpsb2NhdGlvbj1pbnN0
YWxsZWQ6JyIKIAorIyBBZGRlZCB0byBmaXggc29tZSBpc3N1ZXMgd2l0aCBjbWFrZS4gUmVmZXIg
dG8gaHR0cHM6Ly9naXRodWIuY29tL2Jtd2Nhcml0L21ldGEtcm9zL2lzc3Vlcy82OCNpc3N1ZWNv
bW1lbnQtMTk4OTY5MjgKK0VYVFJBX09FQ09ORiArPSAiYXByX2N2X211dGV4X3JlY3Vyc2l2ZT15
ZXMiCisKIGRvX2NvbmZpZ3VyZV9wcmVwZW5kKCkgewogCWNkICR7U30KIAkuL2J1aWxkY29uZgot
LSAKMS43LjkuNQoK

--001a11c3aba61fdab204e072fb4d--
