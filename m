Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C0DC3ABC1
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.20171.1744723987468305785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Nqn3SHQd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=n4hQRWNR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019639a749cb-8f2ebe7c-80ab-4bf2-a8fe-57f27d365119-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0CzFAqxB5wNUb/4ehrybgQmBlUx+F+LPaMDuhZl1uUc=;
	b=Nqn3SHQd/MWHEiL2e6BAjD1NNoXZtkfoPTN3B9IOpOEH+92sRzUyvZaIgRPmOGnt
	n6mV3kMgxBwUXY72TbwfOjLr8nN33uSuOIVl1+XVSwGCqMOuN+s1VrEZ7ZRo0//mhl+
	h9w6YW2iwnZBpsXVVAEa6Biwi/yIHzC9EA9rgXaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723987;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0CzFAqxB5wNUb/4ehrybgQmBlUx+F+LPaMDuhZl1uUc=;
	b=n4hQRWNRzx8pUhKuvrt7h+cGOtwCy8qNd3IracPy2BZPgDxuHbwxT+IqGQToFHZR
	mOz7kycNA4jTX7c6zxTbC/rJIs8XvB+6op6wxE2RQ3uqMF1dIAexvruM7YVw+luqHCW
	e7T/YwN4l4Tklcq0T9A383ljziACgrC0Aktw5CqA=
Content-Type: multipart/mixed; boundary="===============2079755337658490276=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 3.1.0 SUCCEEDED
Message-ID: <0101019639a749cb-8f2ebe7c-80ab-4bf2-a8fe-57f27d365119-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214916

--===============2079755337658490276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpsaWJqcGVnLXR1cmJvKiB0byAqMy4xLjAqIGhhcyBTdWNjZWVkZWQuCgpOZXh0IHN0ZXBz
OgogICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLWxpYmpwZWctdHVyYm8tdXBncmFk
ZS0zLjAuMS0zLjEuMC5wYXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBw
YXRjaGVzIGFuZCBzdW1tYXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNv
bXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNv
bWUgYmFzaWMgc2FuaXR5IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBv
ZmY6IGdpdCBjb21taXQgLXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRv
IHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxp
ZXZlIHRoZSByZWNpcGUgc2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBj
YW4gZmlsbCBSRUNJUEVfTk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxl
IHNvIHRoYXQKYXV0b21hdGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQu
CgpQbGVhc2UgcmV2aWV3IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlv
biBhbmQgYnVpbGQvdXBkYXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1
ZyBhdCBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9k
dWN0PUF1dG9tYXRlZCUyMFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhl
bHBlcgoKLS0gPjggLS0KRnJvbSBjOGNmZTBlZTE1NWJjMmJiOTdlYTdkYWRmOWRiYjY5MmI4YzA0
ZTI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlv
Y3RvcHJvamVjdC5vcmc+CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDk6Mzc6MTAgKzAwMDAKU3Vi
amVjdDogW1BBVENIXSBsaWJqcGVnLXR1cmJvOiB1cGdyYWRlIDMuMC4xIC0+IDMuMS4wCgotLS0K
IC4uLi10dXJib18zLjAuMS5iYiA9PiBsaWJqcGVnLXR1cmJvXzMuMS4wLmJifSB8IDkxICsrKysr
KysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL3tsaWJqcGVnLXR1cmJv
XzMuMC4xLmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjAuYmJ9ICg0MiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjAuMS5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA0MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10
dXJib18zLjAuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBl
Zy10dXJib18zLjEuMC5iYgppbmRleCA1NmJhYjRkYWNhLi44ZTdjZGExNGJjIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4xLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjAuYmIKQEAgLTEs
MTUgKzEsMTAyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBi
ZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMg
UGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUg
dGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6
JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRh
dGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5tZAorIyArKysgTElD
RU5TRS5tZAorIyBAQCAtMSwzMCArMSwzMyBAQAorIyAgbGlianBlZy10dXJibyBMaWNlbnNlcwor
IyAgPT09PT09PT09PT09PT09PT09PT09PQorIyAgCisjIC1saWJqcGVnLXR1cmJvIGlzIGNvdmVy
ZWQgYnkgdGhyZWUgY29tcGF0aWJsZSBCU0Qtc3R5bGUgb3BlbiBzb3VyY2UgbGljZW5zZXM6Cisj
ICtsaWJqcGVnLXR1cmJvIGlzIGNvdmVyZWQgYnkgdHdvIGNvbXBhdGlibGUgQlNELXN0eWxlIG9w
ZW4gc291cmNlIGxpY2Vuc2VzOgorIyAgCisjICAtIFRoZSBJSkcgKEluZGVwZW5kZW50IEpQRUcg
R3JvdXApIExpY2Vuc2UsIHdoaWNoIGlzIGxpc3RlZCBpbgorIyAgICBbUkVBRE1FLmlqZ10oUkVB
RE1FLmlqZykKKyMgIAorIyAtICBUaGlzIGxpY2Vuc2UgYXBwbGllcyB0byB0aGUgbGlianBlZyBB
UEkgbGlicmFyeSBhbmQgYXNzb2NpYXRlZCBwcm9ncmFtcworIyAtICAoYW55IGNvZGUgaW5oZXJp
dGVkIGZyb20gbGlianBlZywgYW5kIGFueSBtb2RpZmljYXRpb25zIHRvIHRoYXQgY29kZS4pCisj
ICsgIFRoaXMgbGljZW5zZSBhcHBsaWVzIHRvIHRoZSBsaWJqcGVnIEFQSSBsaWJyYXJ5IGFuZCBh
c3NvY2lhdGVkIHByb2dyYW1zLAorIyArICBpbmNsdWRpbmcgYW55IGNvZGUgaW5oZXJpdGVkIGZy
b20gbGlianBlZyBhbmQgYW55IG1vZGlmaWNhdGlvbnMgdG8gdGhhdAorIyArICBjb2RlLiAgTm90
ZSB0aGF0IHRoZSBsaWJqcGVnLXR1cmJvIFNJTUQgc291cmNlIGNvZGUgYmVhcnMgdGhlCisjICsg
IFt6bGliIExpY2Vuc2VdKGh0dHBzOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvWmxpYiksIGJ1
dCBpbiB0aGUgY29udGV4dCBvZgorIyArICB0aGUgb3ZlcmFsbCBsaWJqcGVnIEFQSSBsaWJyYXJ5
LCB0aGUgdGVybXMgb2YgdGhlIHpsaWIgTGljZW5zZSBhcmUgc3Vic3VtZWQKKyMgKyAgYnkgdGhl
IHRlcm1zIG9mIHRoZSBJSkcgTGljZW5zZS4KKyMgIAorIyAgLSBUaGUgTW9kaWZpZWQgKDMtY2xh
dXNlKSBCU0QgTGljZW5zZSwgd2hpY2ggaXMgbGlzdGVkIGJlbG93CisjICAKKyMgLSAgVGhpcyBs
aWNlbnNlIGNvdmVycyB0aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVkIHBy
b2dyYW1zLCBhcworIyAtICB3ZWxsIGFzIHRoZSBidWlsZCBzeXN0ZW0uCisjIC0KKyMgLS0gVGhl
IFt6bGliIExpY2Vuc2VdKGh0dHBzOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvWmxpYikKKyMg
LQorIyAtICBUaGlzIGxpY2Vuc2UgaXMgYSBzdWJzZXQgb2YgdGhlIG90aGVyIHR3bywgYW5kIGl0
IGNvdmVycyB0aGUgbGlianBlZy10dXJibworIyAtICBTSU1EIGV4dGVuc2lvbnMuCisjICsgIFRo
aXMgbGljZW5zZSBhcHBsaWVzIHRvIHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgYW5kIGFzc29j
aWF0ZWQgcHJvZ3JhbXMsIGFzCisjICsgIHdlbGwgYXMgdGhlIGJ1aWxkIHN5c3RlbS4gIE5vdGUg
dGhhdCB0aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IHdyYXBzIHRoZQorIyArICBsaWJqcGVnIEFQ
SSBsaWJyYXJ5LCBzbyBpbiB0aGUgY29udGV4dCBvZiB0aGUgb3ZlcmFsbCBUdXJib0pQRUcgQVBJ
IGxpYnJhcnksCisjICsgIGJvdGggdGhlIHRlcm1zIG9mIHRoZSBJSkcgTGljZW5zZSBhbmQgdGhl
IHRlcm1zIG9mIHRoZSBNb2RpZmllZCAoMy1jbGF1c2UpCisjICsgIEJTRCBMaWNlbnNlIGFwcGx5
LgorIyAgCisjICAKKyMgIENvbXBseWluZyB3aXRoIHRoZSBsaWJqcGVnLXR1cmJvIExpY2Vuc2Vz
CisjICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAgCisjICBU
aGlzIHNlY3Rpb24gcHJvdmlkZXMgYSByb2xsLXVwIG9mIHRoZSBsaWJqcGVnLXR1cmJvIGxpY2Vu
c2luZyB0ZXJtcywgdG8gdGhlCisjIC1iZXN0IG9mIG91ciB1bmRlcnN0YW5kaW5nLgorIyArYmVz
dCBvZiBvdXIgdW5kZXJzdGFuZGluZy4gIFRoaXMgaXMgbm90IGEgbGljZW5zZSBpbiBhbmQgb2Yg
aXRzZWxmLiAgSXQgaXMKKyMgK2ludGVuZGVkIHNvbGVseSBmb3IgY2xhcmlmaWNhdGlvbi4KKyMg
IAorIyAgMS4gIElmIHlvdSBhcmUgZGlzdHJpYnV0aW5nIGEgbW9kaWZpZWQgdmVyc2lvbiBvZiB0
aGUgbGlianBlZy10dXJibyBzb3VyY2UsCisjICAgICAgdGhlbjoKKyMgQEAgLTM4LDcgKzQxLDcg
QEAKKyMgICAgICAgICAgLSBDbGF1c2VzIDEgYW5kIDMgb2YgdGhlIHpsaWIgTGljZW5zZQorIyAg
CisjICAgICAgMi4gIFlvdSBtdXN0IGFkZCB5b3VyIG93biBjb3B5cmlnaHQgbm90aWNlIHRvIHRo
ZSBoZWFkZXIgb2YgZWFjaCBzb3VyY2UKKyMgLSAgICAgICAgZmlsZSB5b3UgbW9kaWZpZWQsIHNv
IG90aGVycyBjYW4gdGVsbCB0aGF0IHlvdSBtb2RpZmllZCB0aGF0IGZpbGUgKGlmCisjICsgICAg
ICAgIGZpbGUgeW91IG1vZGlmaWVkLCBzbyBvdGhlcnMgY2FuIHRlbGwgdGhhdCB5b3UgbW9kaWZp
ZWQgdGhhdCBmaWxlLiAgKElmCisjICAgICAgICAgIHRoZXJlIGlzIG5vdCBhbiBleGlzdGluZyBj
b3B5cmlnaHQgaGVhZGVyIGluIHRoYXQgZmlsZSwgdGhlbiB5b3UgY2FuCisjICAgICAgICAgIHNp
bXBseSBhZGQgYSBub3RpY2Ugc3RhdGluZyB0aGF0IHlvdSBtb2RpZmllZCB0aGUgZmlsZS4pCisj
ICAKKyMgQEAgLTkxLDcgKzk0LDcgQEAKKyMgIFRoZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRCBM
aWNlbnNlCisjICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAgCisjIC1D
b3B5cmlnaHQgKEMpMjAwOS0yMDIzIEQuIFIuIENvbW1hbmRlci4gIEFsbCBSaWdodHMgUmVzZXJ2
ZWQuPGJyPgorIyArQ29weXJpZ2h0IChDKTIwMDktMjAyNCBELiBSLiBDb21tYW5kZXIuICBBbGwg
UmlnaHRzIFJlc2VydmVkLjxicj4KKyMgIENvcHlyaWdodCAoQykyMDE1IFZpa3RvciBTemF0aG3D
oXJ5LiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVz
ZSBpbiBzb3VyY2UgYW5kIGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIEBAIC0xMTks
OCArMTIyLDggQEAKKyMgIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAgCisjICAKKyMg
LVdoeSBUaHJlZSBMaWNlbnNlcz8KKyMgLT09PT09PT09PT09PT09PT09PT0KKyMgK1doeSBUd28g
TGljZW5zZXM/CisjICs9PT09PT09PT09PT09PT09PQorIyAgCisjICBUaGUgemxpYiBMaWNlbnNl
IGNvdWxkIGhhdmUgYmVlbiB1c2VkIGluc3RlYWQgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkg
QlNECisjICBMaWNlbnNlLCBhbmQgc2luY2UgdGhlIElKRyBMaWNlbnNlIGVmZmVjdGl2ZWx5IHN1
YnN1bWVzIHRoZSBkaXN0cmlidXRpb24KKyMgCisjCisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgYWNj
ZWxlcmF0ZWQgSlBFRyBjb21wcmVzc2lvbi9kZWNvbXByZXNzaW9uIGxpYnJhcnkiCiBERVNDUklQ
VElPTiA9ICJsaWJqcGVnLXR1cmJvIGlzIGEgZGVyaXZhdGl2ZSBvZiBsaWJqcGVnIHRoYXQgdXNl
cyBTSU1EIGluc3RydWN0aW9ucyAoTU1YLCBTU0UyLCBORU9OKSB0byBhY2NlbGVyYXRlIGJhc2Vs
aW5lIEpQRUcgY29tcHJlc3Npb24gYW5kIGRlY29tcHJlc3Npb24iCiBIT01FUEFHRSA9ICJodHRw
Oi8vbGlianBlZy10dXJiby5vcmcvIgogCiBMSUNFTlNFID0gIklKRyAmIEJTRC0zLUNsYXVzZSAm
IFpsaWIiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT0yYThlMGQ4
MjI2YTEwMmYwN2FiNjNlZDdmZDZjZTE1NSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0UubWQ7bWQ1PTAyM2MyZTg5NDIwMjA1MDJkNmVhNzA5ZTJhNTQ1M2Y3IgogCiBERVBFTkRT
OmFwcGVuZDp4ODYtNjQ6Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5hdGl2ZSIKIERFUEVORFM6YXBw
ZW5kOng4NjpjbGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogCiBTUkNfVVJJID0gIiR7R0lU
SFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMjI0Mjk1MDc3MTRhZTE0N2IzYWNhY2QyOTllODIwOTlmY2U1ZDlmNDU2ODgyZmMy
OGUyNTJlNDU3OWJhMmE3NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NTY0YzcyYjFkZmQxZDZm
ZTYyNzRjNWY5NWE4ZDk4OWI1OTg1NDU3NWQ0YmJlZTQ0YWRlN2JjMTdhYTliYzkzIgogCiBQRSA9
ICIxIgogCi0tIAoyLjQ3LjEKCg==

--===============2079755337658490276==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.0.1-3.1.0.patch"

RnJvbSBjOGNmZTBlZTE1NWJjMmJiOTdlYTdkYWRmOWRiYjY5MmI4YzA0ZTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDk6Mzc6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqcGVnLXR1cmJvOiB1cGdyYWRlIDMuMC4xIC0+IDMuMS4wCgotLS0KIC4uLi10dXJib18zLjAu
MS5iYiA9PiBsaWJqcGVnLXR1cmJvXzMuMS4wLmJifSB8IDkxICsrKysrKysrKysrKysrKysrKy0K
IDEgZmlsZSBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL3tsaWJqcGVnLXR1cmJvXzMuMC4xLmJiID0+IGxp
YmpwZWctdHVyYm9fMy4xLjAuYmJ9ICg0MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjAuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA0MiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjAuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMC5i
YgppbmRleCA1NmJhYjRkYWNhLi44ZTdjZGExNGJjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4xLjAuYmIKQEAgLTEsMTUgKzEsMTAyIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5tZAorIyArKysgTElDRU5TRS5tZAorIyBAQCAt
MSwzMCArMSwzMyBAQAorIyAgbGlianBlZy10dXJibyBMaWNlbnNlcworIyAgPT09PT09PT09PT09
PT09PT09PT09PQorIyAgCisjIC1saWJqcGVnLXR1cmJvIGlzIGNvdmVyZWQgYnkgdGhyZWUgY29t
cGF0aWJsZSBCU0Qtc3R5bGUgb3BlbiBzb3VyY2UgbGljZW5zZXM6CisjICtsaWJqcGVnLXR1cmJv
IGlzIGNvdmVyZWQgYnkgdHdvIGNvbXBhdGlibGUgQlNELXN0eWxlIG9wZW4gc291cmNlIGxpY2Vu
c2VzOgorIyAgCisjICAtIFRoZSBJSkcgKEluZGVwZW5kZW50IEpQRUcgR3JvdXApIExpY2Vuc2Us
IHdoaWNoIGlzIGxpc3RlZCBpbgorIyAgICBbUkVBRE1FLmlqZ10oUkVBRE1FLmlqZykKKyMgIAor
IyAtICBUaGlzIGxpY2Vuc2UgYXBwbGllcyB0byB0aGUgbGlianBlZyBBUEkgbGlicmFyeSBhbmQg
YXNzb2NpYXRlZCBwcm9ncmFtcworIyAtICAoYW55IGNvZGUgaW5oZXJpdGVkIGZyb20gbGlianBl
ZywgYW5kIGFueSBtb2RpZmljYXRpb25zIHRvIHRoYXQgY29kZS4pCisjICsgIFRoaXMgbGljZW5z
ZSBhcHBsaWVzIHRvIHRoZSBsaWJqcGVnIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVkIHByb2dy
YW1zLAorIyArICBpbmNsdWRpbmcgYW55IGNvZGUgaW5oZXJpdGVkIGZyb20gbGlianBlZyBhbmQg
YW55IG1vZGlmaWNhdGlvbnMgdG8gdGhhdAorIyArICBjb2RlLiAgTm90ZSB0aGF0IHRoZSBsaWJq
cGVnLXR1cmJvIFNJTUQgc291cmNlIGNvZGUgYmVhcnMgdGhlCisjICsgIFt6bGliIExpY2Vuc2Vd
KGh0dHBzOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvWmxpYiksIGJ1dCBpbiB0aGUgY29udGV4
dCBvZgorIyArICB0aGUgb3ZlcmFsbCBsaWJqcGVnIEFQSSBsaWJyYXJ5LCB0aGUgdGVybXMgb2Yg
dGhlIHpsaWIgTGljZW5zZSBhcmUgc3Vic3VtZWQKKyMgKyAgYnkgdGhlIHRlcm1zIG9mIHRoZSBJ
SkcgTGljZW5zZS4KKyMgIAorIyAgLSBUaGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QgTGljZW5z
ZSwgd2hpY2ggaXMgbGlzdGVkIGJlbG93CisjICAKKyMgLSAgVGhpcyBsaWNlbnNlIGNvdmVycyB0
aGUgVHVyYm9KUEVHIEFQSSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVkIHByb2dyYW1zLCBhcworIyAt
ICB3ZWxsIGFzIHRoZSBidWlsZCBzeXN0ZW0uCisjIC0KKyMgLS0gVGhlIFt6bGliIExpY2Vuc2Vd
KGh0dHBzOi8vb3BlbnNvdXJjZS5vcmcvbGljZW5zZXMvWmxpYikKKyMgLQorIyAtICBUaGlzIGxp
Y2Vuc2UgaXMgYSBzdWJzZXQgb2YgdGhlIG90aGVyIHR3bywgYW5kIGl0IGNvdmVycyB0aGUgbGli
anBlZy10dXJibworIyAtICBTSU1EIGV4dGVuc2lvbnMuCisjICsgIFRoaXMgbGljZW5zZSBhcHBs
aWVzIHRvIHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJvZ3JhbXMs
IGFzCisjICsgIHdlbGwgYXMgdGhlIGJ1aWxkIHN5c3RlbS4gIE5vdGUgdGhhdCB0aGUgVHVyYm9K
UEVHIEFQSSBsaWJyYXJ5IHdyYXBzIHRoZQorIyArICBsaWJqcGVnIEFQSSBsaWJyYXJ5LCBzbyBp
biB0aGUgY29udGV4dCBvZiB0aGUgb3ZlcmFsbCBUdXJib0pQRUcgQVBJIGxpYnJhcnksCisjICsg
IGJvdGggdGhlIHRlcm1zIG9mIHRoZSBJSkcgTGljZW5zZSBhbmQgdGhlIHRlcm1zIG9mIHRoZSBN
b2RpZmllZCAoMy1jbGF1c2UpCisjICsgIEJTRCBMaWNlbnNlIGFwcGx5LgorIyAgCisjICAKKyMg
IENvbXBseWluZyB3aXRoIHRoZSBsaWJqcGVnLXR1cmJvIExpY2Vuc2VzCisjICA9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAgCisjICBUaGlzIHNlY3Rpb24gcHJv
dmlkZXMgYSByb2xsLXVwIG9mIHRoZSBsaWJqcGVnLXR1cmJvIGxpY2Vuc2luZyB0ZXJtcywgdG8g
dGhlCisjIC1iZXN0IG9mIG91ciB1bmRlcnN0YW5kaW5nLgorIyArYmVzdCBvZiBvdXIgdW5kZXJz
dGFuZGluZy4gIFRoaXMgaXMgbm90IGEgbGljZW5zZSBpbiBhbmQgb2YgaXRzZWxmLiAgSXQgaXMK
KyMgK2ludGVuZGVkIHNvbGVseSBmb3IgY2xhcmlmaWNhdGlvbi4KKyMgIAorIyAgMS4gIElmIHlv
dSBhcmUgZGlzdHJpYnV0aW5nIGEgbW9kaWZpZWQgdmVyc2lvbiBvZiB0aGUgbGlianBlZy10dXJi
byBzb3VyY2UsCisjICAgICAgdGhlbjoKKyMgQEAgLTM4LDcgKzQxLDcgQEAKKyMgICAgICAgICAg
LSBDbGF1c2VzIDEgYW5kIDMgb2YgdGhlIHpsaWIgTGljZW5zZQorIyAgCisjICAgICAgMi4gIFlv
dSBtdXN0IGFkZCB5b3VyIG93biBjb3B5cmlnaHQgbm90aWNlIHRvIHRoZSBoZWFkZXIgb2YgZWFj
aCBzb3VyY2UKKyMgLSAgICAgICAgZmlsZSB5b3UgbW9kaWZpZWQsIHNvIG90aGVycyBjYW4gdGVs
bCB0aGF0IHlvdSBtb2RpZmllZCB0aGF0IGZpbGUgKGlmCisjICsgICAgICAgIGZpbGUgeW91IG1v
ZGlmaWVkLCBzbyBvdGhlcnMgY2FuIHRlbGwgdGhhdCB5b3UgbW9kaWZpZWQgdGhhdCBmaWxlLiAg
KElmCisjICAgICAgICAgIHRoZXJlIGlzIG5vdCBhbiBleGlzdGluZyBjb3B5cmlnaHQgaGVhZGVy
IGluIHRoYXQgZmlsZSwgdGhlbiB5b3UgY2FuCisjICAgICAgICAgIHNpbXBseSBhZGQgYSBub3Rp
Y2Ugc3RhdGluZyB0aGF0IHlvdSBtb2RpZmllZCB0aGUgZmlsZS4pCisjICAKKyMgQEAgLTkxLDcg
Kzk0LDcgQEAKKyMgIFRoZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRCBMaWNlbnNlCisjICA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQorIyAgCisjIC1Db3B5cmlnaHQgKEMpMjAw
OS0yMDIzIEQuIFIuIENvbW1hbmRlci4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuPGJyPgorIyArQ29w
eXJpZ2h0IChDKTIwMDktMjAyNCBELiBSLiBDb21tYW5kZXIuICBBbGwgUmlnaHRzIFJlc2VydmVk
Ljxicj4KKyMgIENvcHlyaWdodCAoQykyMDE1IFZpa3RvciBTemF0aG3DoXJ5LiAgQWxsIFJpZ2h0
cyBSZXNlcnZlZC4KKyMgIAorIyAgUmVkaXN0cmlidXRpb24gYW5kIHVzZSBpbiBzb3VyY2UgYW5k
IGJpbmFyeSBmb3Jtcywgd2l0aCBvciB3aXRob3V0CisjIEBAIC0xMTksOCArMTIyLDggQEAKKyMg
IFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAgCisjICAKKyMgLVdoeSBUaHJlZSBMaWNl
bnNlcz8KKyMgLT09PT09PT09PT09PT09PT09PT0KKyMgK1doeSBUd28gTGljZW5zZXM/CisjICs9
PT09PT09PT09PT09PT09PQorIyAgCisjICBUaGUgemxpYiBMaWNlbnNlIGNvdWxkIGhhdmUgYmVl
biB1c2VkIGluc3RlYWQgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNECisjICBMaWNlbnNl
LCBhbmQgc2luY2UgdGhlIElKRyBMaWNlbnNlIGVmZmVjdGl2ZWx5IHN1YnN1bWVzIHRoZSBkaXN0
cmlidXRpb24KKyMgCisjCisKIFNVTU1BUlkgPSAiSGFyZHdhcmUgYWNjZWxlcmF0ZWQgSlBFRyBj
b21wcmVzc2lvbi9kZWNvbXByZXNzaW9uIGxpYnJhcnkiCiBERVNDUklQVElPTiA9ICJsaWJqcGVn
LXR1cmJvIGlzIGEgZGVyaXZhdGl2ZSBvZiBsaWJqcGVnIHRoYXQgdXNlcyBTSU1EIGluc3RydWN0
aW9ucyAoTU1YLCBTU0UyLCBORU9OKSB0byBhY2NlbGVyYXRlIGJhc2VsaW5lIEpQRUcgY29tcHJl
c3Npb24gYW5kIGRlY29tcHJlc3Npb24iCiBIT01FUEFHRSA9ICJodHRwOi8vbGlianBlZy10dXJi
by5vcmcvIgogCiBMSUNFTlNFID0gIklKRyAmIEJTRC0zLUNsYXVzZSAmIFpsaWIiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT0yYThlMGQ4MjI2YTEwMmYwN2FiNjNl
ZDdmZDZjZTE1NSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTAy
M2MyZTg5NDIwMjA1MDJkNmVhNzA5ZTJhNTQ1M2Y3IgogCiBERVBFTkRTOmFwcGVuZDp4ODYtNjQ6
Y2xhc3MtdGFyZ2V0ID0gIiBuYXNtLW5hdGl2ZSIKIERFUEVORFM6YXBwZW5kOng4NjpjbGFzcy10
YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9k
b3dubG9hZC8ke1BWfS8ke0JQfS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjI0Mjk1
MDc3MTRhZTE0N2IzYWNhY2QyOTllODIwOTlmY2U1ZDlmNDU2ODgyZmMyOGUyNTJlNDU3OWJhMmE3
NSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NTY0YzcyYjFkZmQxZDZmZTYyNzRjNWY5NWE4ZDk4
OWI1OTg1NDU3NWQ0YmJlZTQ0YWRlN2JjMTdhYTliYzkzIgogCiBQRSA9ICIxIgogCi0tIAoyLjQ3
LjEKCg==

--===============2079755337658490276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libjpeg-turbo/jpeg-tools: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/jpeg-tools: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/jpeg-tools: PKGSIZE changed from 283432 to 279096 (-2%)
packages/core2-64-poky-linux/libjpeg-turbo: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo: SRC_URI changed from "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.0.1/libjpeg-turbo-3.0.1.tar.gz" to "https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.1.0/libjpeg-turbo-3.1.0.tar.gz"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: FILELIST: removed "/usr/lib/.debug/libturbojpeg.so.0.3.0", added "/usr/lib/.debug/libturbojpeg.so.0.4.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5540768 to 5558880 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 191932 to 218290 (+14%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: FILELIST: removed "/usr/share/doc/libjpeg-turbo/tjexample.c", added "/usr/share/doc/libjpeg-turbo/tjtran.c /usr/share/doc/libjpeg-turbo/tjdecomp.c /usr/share/doc/libjpeg-turbo/tjcomp.c"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 401242 to 436430 (+9%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: FILELIST: directory renamed /usr/src/debug/libjpeg-turbo/3.0.1/simd -> /usr/src/debug/libjpeg-turbo/3.1.0/simd, directory renamed /usr/src/debug/libjpeg-turbo/3.0.1/simd/x86_64 -> /usr/src/debug/libjpeg-turbo/3.1.0/simd/x86_64, removed "/usr/src/debug/libjpeg-turbo/3.0.1/jdapistd.c /usr/src/debug/libjpeg-turbo/3.0.1/jcapistd.c /usr/src/debug/libjpeg-turbo/3.0.1/rdswitch.c /usr/src/debug/libjpeg-turbo/3.0.1/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcol565.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.0.1/rdtarga.c /usr/src/debug/libjpeg-turbo/3.0.1/wrtarga.c /usr/src/debug/libjpeg-turbo/3.0.1/jcomapi.c /usr/src/debug/libjpeg-turbo/3.0.1/jpeg_nbits_table.h /usr/src/debug/libjpeg-turbo/3.0.1/jutils.c /usr/src/debug/libjpeg-turbo/3.0.1/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.0.1/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.0.1/rdppm.c /usr/src/debug/libjpeg-turbo/3.0.1/jfdctflt.c /us
 r/src/debug/libjpeg-turbo/3.0.1/jidctflt.c /usr/src/debug/libjpeg-turbo/3.0.1/wrbmp.c /usr/src/debug/libjpeg-turbo/3.0.1/wrgif.c /usr/src/debug/libjpeg-turbo/3.0.1/wrppm.c /usr/src/debug/libjpeg-turbo/3.0.1/cjpeg.c /usr/src/debug/libjpeg-turbo/3.0.1/djpeg.c /usr/src/debug/libjpeg-turbo/3.0.1/jcicc.c /usr/src/debug/libjpeg-turbo/3.0.1/jdicc.c /usr/src/debug/libjpeg-turbo/3.0.1/jinclude.h /usr/src/debug/libjpeg-turbo/3.0.1/rdbmp.c /usr/src/debug/libjpeg-turbo/3.0.1/rdgif.c /usr/src/debug/libjpeg-turbo/3.0.1/jsimd.h /usr/src/debug/libjpeg-turbo/3.0.1/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmerge.c /usr/src/debug/libjpeg-turbo/3.0.1/tjutil.h /usr/src/debug/libjpeg-turbo/3.0.1/jdmerge.h /usr/src/debug/libjpeg-turbo/3.0.1/jcmarker.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmarker.c /usr/src/debug/libjpeg-turbo/3.0.1/tjutil.c /usr/src/debug/libjpeg-turbo/3.0.1/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.0.1/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.0.1/jidctfst.c /usr/src/debug/libjpe
 g-turbo/3.0.1/jclhuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jcphuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jdphuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.0.1/jerror.c /usr/src/debug/libjpeg-turbo/3.0.1/jerror.h /usr/src/debug/libjpeg-turbo/3.0.1/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.0.1/jctrans.c /usr/src/debug/libjpeg-turbo/3.0.1/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.0.1/jdtrans.c /usr/src/debug/libjpeg-turbo/3.0.1/cderror.h /usr/src/debug/libjpeg-turbo/3.0.1/jcmaster.h /usr/src/debug/libjpeg-turbo/3.0.1/jdmaster.h /usr/src/debug/libjpeg-turbo/3.0.1/jccolor.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcolor.c /usr/src/debug/libjpeg-turbo/3.0.1/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.0.1/jcmaster.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmaster.c /usr/src/debug/libjpeg-turbo/3.0.1/jquant1.c /usr/src/debug/libjpeg-turbo/3.0.1/jdinput.c /usr/src/debug/libjpeg-turbo/3.0.1/jidctred.c /usr/src/debug/libjpeg
 -turbo/3.0.1/jcparam.c /usr/src/debug/libjpeg-turbo/3.0.1/jmemsys.h /usr/src/debug/libjpeg-turbo/3.0.1/jdatadst.c /usr/src/debug/libjpeg-turbo/3.0.1/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.0.1/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.0.1/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.0.1/jaricom.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmainct.h /usr/src/debug/libjpeg-turbo/3.0.1/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.0.1/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.0.1/jccolext.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcolext.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.0.1/jcmainct.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmainct.c /usr/src/debug/libjpeg-turbo/3.0.1/jquant2.c /usr/src/debug/libjpeg-turbo/3.0.1/tjbench.c /usr/src/debug/libjpeg-turbo/3.0.1/jsimddct.h /usr/src/debug/libjpeg-turbo/3.0.1/jpegint.h /usr/src/debug/libjpeg-turbo/3.0.1/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.0.1/jdapimin.c /usr/src/debug/libjpeg-turbo/3.0.1/jcapimin.c /usr/src/debug
 /libjpeg-turbo/3.0.1/jlossls.h /usr/src/debug/libjpeg-turbo/3.0.1/jchuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jdhuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jfdctint.c /usr/src/debug/libjpeg-turbo/3.0.1/jidctint.c /usr/src/debug/libjpeg-turbo/3.0.1/jpeglib.h /usr/src/debug/libjpeg-turbo/3.0.1/jcarith.c /usr/src/debug/libjpeg-turbo/3.0.1/jdarith.c /usr/src/debug/libjpeg-turbo/3.0.1/jchuff.h /usr/src/debug/libjpeg-turbo/3.0.1/jdhuff.h /usr/src/debug/libjpeg-turbo/3.0.1/jdsample.h /usr/src/debug/libjpeg-turbo/3.0.1/jcsample.c /usr/src/debug/libjpeg-turbo/3.0.1/jdsample.c /usr/src/debug/libjpeg-turbo/3.0.1/cmyk.h /usr/src/debug/libjpeg-turbo/3.0.1/jcprepct.c /usr/src/debug/libjpeg-turbo/3.0.1/jdct.h /usr/src/debug/libjpeg-turbo/3.0.1/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.0.1/jcinit.c /usr/src/debug/libjpeg-turbo/3.0.1/jclossls.c /usr/src/debug/libjpeg-turbo/3.0.1/jdlossls.c /usr/src/debug/libjpeg-turbo/3.0.1/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.0.1/transupp.h /usr/src/debug/libjpe
 g-turbo/3.0.1/transupp.c /usr/src/debug/libjpeg-turbo/3.0.1/jpegtran.c /usr/src/debug/libjpeg-turbo/3.0.1/jdpostct.c /usr/src/debug/libjpeg-turbo/3.0.1/jccoefct.c /usr/src/debug/libjpeg-turbo/3.0.1/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.0.1/jddiffct.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcoefct.h", added "/usr/src/debug/libjpeg-turbo/3.1.0/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jccolor.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jfdctflt.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jsimddct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdarith.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jpeglib
 .h /usr/src/debug/libjpeg-turbo/3.1.0/src/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/cderror.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.1.0/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmaster.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jccoefct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmainct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmaster.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.1.0/src/wrgif.c /usr/src/debug/l
 ibjpeg-turbo/3.1.0/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdsample.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jclhuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcolext.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdapimin.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdapistd.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmainct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmarker.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmrg565.c /usr/src/debug/li
 bjpeg-turbo/3.1.0/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jquant2.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jidctflt.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jidctint.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.1.0/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.1.0/src/transupp.h /usr/src/debug/libjpeg-turbo/3.1.0/src/transupp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jerror.h /usr/src/debug/libjpeg-turbo/3.1.0/src/tjutil.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmerge.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jerror.c /usr/src/debug/libjpeg-turbo/3.1.0/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.
 1.0/src/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jutils.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jchuff.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jquant1.c /usr/src/debug/libjpeg-turbo/3.1.0/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.1.0/src/tjbench.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jpeg_nbits.h 
 /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcolor.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jpegtran.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdpostct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jddiffct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdbmp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.1.0/src/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdlhuff.c"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2337251 to 2120262 (-9%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 780345 to 653369 (-16%)
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.3.0", added "/usr/lib/libturbojpeg.so.0.4.0"
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 911677 to 788957 (-13%)
Changes to packages/core2-64-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.3.0 to libturbojpeg.so.0.4.0
  /usr/lib/libturbojpeg.so.0.3.0 moved to /usr/lib/libturbojpeg.so.0.4.0

--===============2079755337658490276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 191932 to 218290 (+14%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: FILELIST: removed "/usr/share/doc/libjpeg-turbo/tjexample.c", added "/usr/share/doc/libjpeg-turbo/tjcomp.c /usr/share/doc/libjpeg-turbo/tjdecomp.c /usr/share/doc/libjpeg-turbo/tjtran.c"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 780345 to 653369 (-16%)
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 911677 to 788957 (-13%)
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.3.0", added "/usr/lib/libturbojpeg.so.0.4.0"
Changes to packages/core2-64-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.3.0 to libturbojpeg.so.0.4.0
  /usr/lib/libturbojpeg.so.0.3.0 moved to /usr/lib/libturbojpeg.so.0.4.0

--===============2079755337658490276==--

