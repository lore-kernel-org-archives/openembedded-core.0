Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348FEC3ABC3
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:56 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1807.1746113633665499880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=apie68gV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F8gQRspV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101968c7b9b5f-2c99f7e5-84ad-41e9-8fe0-b9db308e77db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jMUxx3x20bAA9l+Hcs6rTwRyjnIHn4YTp/laZOHonCs=;
	b=apie68gVWb6yZkz2FLJ2vBkeVOM5AeMAJnPpyQRV1ErP9odCyokzHIcXYp/Fblic
	Jzm0/kgu4rX0GalNAi56oIc9AUnmw5AQaSdFOrMfCBqDKwsiHNikTeRJ4aJJ6ZxfJg3
	Ymct4c6jpU7RqZS9Y62Xev2uB23OHk0qdAmdUWxc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jMUxx3x20bAA9l+Hcs6rTwRyjnIHn4YTp/laZOHonCs=;
	b=F8gQRspVhzaHLbIRDBl9lt37uUseJR4R2OwHwXGVxrmm0xhsGz4YOUlvdCskMbqV
	tsDPmmhCnbYZFpRQDSyONkXS/XSa+v6gp/i957oN1VUxWMoXRW0SP7yEhPdaSMyRa1C
	XTsiQvQzf1RF5NI97yA/ia10e48NLEhA3q2PSMKs=
Content-Type: multipart/mixed; boundary="===============7312297660423368464=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 3.1.0 SUCCEEDED
Message-ID: <010101968c7b9b5f-2c99f7e5-84ad-41e9-8fe0-b9db308e77db-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215865

--===============7312297660423368464==
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
bHBlcgoKLS0gPjggLS0KRnJvbSA3NDk2OTQ0ZjZjNmQ3ZDk1ZjdjMzNhMzM4NWQ2YTVmNzliNjQz
ZDRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlv
Y3RvcHJvamVjdC5vcmc+CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMjoyMzowMyArMDAwMApTdWJq
ZWN0OiBbUEFUQ0hdIGxpYmpwZWctdHVyYm86IHVwZ3JhZGUgMy4wLjEgLT4gMy4xLjAKCi0tLQog
Li4uLXR1cmJvXzMuMC4xLmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjAuYmJ9IHwgOTEgKysrKysr
KysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcve2xpYmpwZWctdHVyYm9f
My4wLjEuYmIgPT4gbGlianBlZy10dXJib18zLjEuMC5iYn0gKDQyJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDQyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1
cmJvXzMuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVn
LXR1cmJvXzMuMS4wLmJiCmluZGV4IGExZDdkNTdmYjUuLjQyODJjYmU4NjggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4wLjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMC5iYgpAQCAtMSwx
NSArMSwxMDIgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJl
ZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQ
bGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0
aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTon
IHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0
ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisjICsrKyBMSUNF
TlNFLm1kCisjIEBAIC0xLDMwICsxLDMzIEBACisjICBsaWJqcGVnLXR1cmJvIExpY2Vuc2VzCisj
ICA9PT09PT09PT09PT09PT09PT09PT09CisjICAKKyMgLWxpYmpwZWctdHVyYm8gaXMgY292ZXJl
ZCBieSB0aHJlZSBjb21wYXRpYmxlIEJTRC1zdHlsZSBvcGVuIHNvdXJjZSBsaWNlbnNlczoKKyMg
K2xpYmpwZWctdHVyYm8gaXMgY292ZXJlZCBieSB0d28gY29tcGF0aWJsZSBCU0Qtc3R5bGUgb3Bl
biBzb3VyY2UgbGljZW5zZXM6CisjICAKKyMgIC0gVGhlIElKRyAoSW5kZXBlbmRlbnQgSlBFRyBH
cm91cCkgTGljZW5zZSwgd2hpY2ggaXMgbGlzdGVkIGluCisjICAgIFtSRUFETUUuaWpnXShSRUFE
TUUuaWpnKQorIyAgCisjIC0gIFRoaXMgbGljZW5zZSBhcHBsaWVzIHRvIHRoZSBsaWJqcGVnIEFQ
SSBsaWJyYXJ5IGFuZCBhc3NvY2lhdGVkIHByb2dyYW1zCisjIC0gIChhbnkgY29kZSBpbmhlcml0
ZWQgZnJvbSBsaWJqcGVnLCBhbmQgYW55IG1vZGlmaWNhdGlvbnMgdG8gdGhhdCBjb2RlLikKKyMg
KyAgVGhpcyBsaWNlbnNlIGFwcGxpZXMgdG8gdGhlIGxpYmpwZWcgQVBJIGxpYnJhcnkgYW5kIGFz
c29jaWF0ZWQgcHJvZ3JhbXMsCisjICsgIGluY2x1ZGluZyBhbnkgY29kZSBpbmhlcml0ZWQgZnJv
bSBsaWJqcGVnIGFuZCBhbnkgbW9kaWZpY2F0aW9ucyB0byB0aGF0CisjICsgIGNvZGUuICBOb3Rl
IHRoYXQgdGhlIGxpYmpwZWctdHVyYm8gU0lNRCBzb3VyY2UgY29kZSBiZWFycyB0aGUKKyMgKyAg
W3psaWIgTGljZW5zZV0oaHR0cHM6Ly9vcGVuc291cmNlLm9yZy9saWNlbnNlcy9abGliKSwgYnV0
IGluIHRoZSBjb250ZXh0IG9mCisjICsgIHRoZSBvdmVyYWxsIGxpYmpwZWcgQVBJIGxpYnJhcnks
IHRoZSB0ZXJtcyBvZiB0aGUgemxpYiBMaWNlbnNlIGFyZSBzdWJzdW1lZAorIyArICBieSB0aGUg
dGVybXMgb2YgdGhlIElKRyBMaWNlbnNlLgorIyAgCisjICAtIFRoZSBNb2RpZmllZCAoMy1jbGF1
c2UpIEJTRCBMaWNlbnNlLCB3aGljaCBpcyBsaXN0ZWQgYmVsb3cKKyMgIAorIyAtICBUaGlzIGxp
Y2Vuc2UgY292ZXJzIHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJv
Z3JhbXMsIGFzCisjIC0gIHdlbGwgYXMgdGhlIGJ1aWxkIHN5c3RlbS4KKyMgLQorIyAtLSBUaGUg
W3psaWIgTGljZW5zZV0oaHR0cHM6Ly9vcGVuc291cmNlLm9yZy9saWNlbnNlcy9abGliKQorIyAt
CisjIC0gIFRoaXMgbGljZW5zZSBpcyBhIHN1YnNldCBvZiB0aGUgb3RoZXIgdHdvLCBhbmQgaXQg
Y292ZXJzIHRoZSBsaWJqcGVnLXR1cmJvCisjIC0gIFNJTUQgZXh0ZW5zaW9ucy4KKyMgKyAgVGhp
cyBsaWNlbnNlIGFwcGxpZXMgdG8gdGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSBhbmQgYXNzb2Np
YXRlZCBwcm9ncmFtcywgYXMKKyMgKyAgd2VsbCBhcyB0aGUgYnVpbGQgc3lzdGVtLiAgTm90ZSB0
aGF0IHRoZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgd3JhcHMgdGhlCisjICsgIGxpYmpwZWcgQVBJ
IGxpYnJhcnksIHNvIGluIHRoZSBjb250ZXh0IG9mIHRoZSBvdmVyYWxsIFR1cmJvSlBFRyBBUEkg
bGlicmFyeSwKKyMgKyAgYm90aCB0aGUgdGVybXMgb2YgdGhlIElKRyBMaWNlbnNlIGFuZCB0aGUg
dGVybXMgb2YgdGhlIE1vZGlmaWVkICgzLWNsYXVzZSkKKyMgKyAgQlNEIExpY2Vuc2UgYXBwbHku
CisjICAKKyMgIAorIyAgQ29tcGx5aW5nIHdpdGggdGhlIGxpYmpwZWctdHVyYm8gTGljZW5zZXMK
KyMgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjICAKKyMgIFRo
aXMgc2VjdGlvbiBwcm92aWRlcyBhIHJvbGwtdXAgb2YgdGhlIGxpYmpwZWctdHVyYm8gbGljZW5z
aW5nIHRlcm1zLCB0byB0aGUKKyMgLWJlc3Qgb2Ygb3VyIHVuZGVyc3RhbmRpbmcuCisjICtiZXN0
IG9mIG91ciB1bmRlcnN0YW5kaW5nLiAgVGhpcyBpcyBub3QgYSBsaWNlbnNlIGluIGFuZCBvZiBp
dHNlbGYuICBJdCBpcworIyAraW50ZW5kZWQgc29sZWx5IGZvciBjbGFyaWZpY2F0aW9uLgorIyAg
CisjICAxLiAgSWYgeW91IGFyZSBkaXN0cmlidXRpbmcgYSBtb2RpZmllZCB2ZXJzaW9uIG9mIHRo
ZSBsaWJqcGVnLXR1cmJvIHNvdXJjZSwKKyMgICAgICB0aGVuOgorIyBAQCAtMzgsNyArNDEsNyBA
QAorIyAgICAgICAgICAtIENsYXVzZXMgMSBhbmQgMyBvZiB0aGUgemxpYiBMaWNlbnNlCisjICAK
KyMgICAgICAyLiAgWW91IG11c3QgYWRkIHlvdXIgb3duIGNvcHlyaWdodCBub3RpY2UgdG8gdGhl
IGhlYWRlciBvZiBlYWNoIHNvdXJjZQorIyAtICAgICAgICBmaWxlIHlvdSBtb2RpZmllZCwgc28g
b3RoZXJzIGNhbiB0ZWxsIHRoYXQgeW91IG1vZGlmaWVkIHRoYXQgZmlsZSAoaWYKKyMgKyAgICAg
ICAgZmlsZSB5b3UgbW9kaWZpZWQsIHNvIG90aGVycyBjYW4gdGVsbCB0aGF0IHlvdSBtb2RpZmll
ZCB0aGF0IGZpbGUuICAoSWYKKyMgICAgICAgICAgdGhlcmUgaXMgbm90IGFuIGV4aXN0aW5nIGNv
cHlyaWdodCBoZWFkZXIgaW4gdGhhdCBmaWxlLCB0aGVuIHlvdSBjYW4KKyMgICAgICAgICAgc2lt
cGx5IGFkZCBhIG5vdGljZSBzdGF0aW5nIHRoYXQgeW91IG1vZGlmaWVkIHRoZSBmaWxlLikKKyMg
IAorIyBAQCAtOTEsNyArOTQsNyBAQAorIyAgVGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNEIExp
Y2Vuc2UKKyMgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjICAKKyMgLUNv
cHlyaWdodCAoQykyMDA5LTIwMjMgRC4gUi4gQ29tbWFuZGVyLiAgQWxsIFJpZ2h0cyBSZXNlcnZl
ZC48YnI+CisjICtDb3B5cmlnaHQgKEMpMjAwOS0yMDI0IEQuIFIuIENvbW1hbmRlci4gIEFsbCBS
aWdodHMgUmVzZXJ2ZWQuPGJyPgorIyAgQ29weXJpZ2h0IChDKTIwMTUgVmlrdG9yIFN6YXRobcOh
cnkuICBBbGwgUmlnaHRzIFJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNl
IGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgQEAgLTExOSw4
ICsxMjIsOCBAQAorIyAgUE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjICAKKyMgIAorIyAt
V2h5IFRocmVlIExpY2Vuc2VzPworIyAtPT09PT09PT09PT09PT09PT09PQorIyArV2h5IFR3byBM
aWNlbnNlcz8KKyMgKz09PT09PT09PT09PT09PT09CisjICAKKyMgIFRoZSB6bGliIExpY2Vuc2Ug
Y291bGQgaGF2ZSBiZWVuIHVzZWQgaW5zdGVhZCBvZiB0aGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBC
U0QKKyMgIExpY2Vuc2UsIGFuZCBzaW5jZSB0aGUgSUpHIExpY2Vuc2UgZWZmZWN0aXZlbHkgc3Vi
c3VtZXMgdGhlIGRpc3RyaWJ1dGlvbgorIyAKKyMKKwogU1VNTUFSWSA9ICJIYXJkd2FyZSBhY2Nl
bGVyYXRlZCBKUEVHIGNvbXByZXNzaW9uL2RlY29tcHJlc3Npb24gbGlicmFyeSIKIERFU0NSSVBU
SU9OID0gImxpYmpwZWctdHVyYm8gaXMgYSBkZXJpdmF0aXZlIG9mIGxpYmpwZWcgdGhhdCB1c2Vz
IFNJTUQgaW5zdHJ1Y3Rpb25zIChNTVgsIFNTRTIsIE5FT04pIHRvIGFjY2VsZXJhdGUgYmFzZWxp
bmUgSlBFRyBjb21wcmVzc2lvbiBhbmQgZGVjb21wcmVzc2lvbiIKIEhPTUVQQUdFID0gImh0dHA6
Ly9saWJqcGVnLXR1cmJvLm9yZy8iCiAKIExJQ0VOU0UgPSAiSUpHICYgQlNELTMtQ2xhdXNlICYg
WmxpYiIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTJhOGUwZDgy
MjZhMTAyZjA3YWI2M2VkN2ZkNmNlMTU1IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRS5tZDttZDU9MDIzYzJlODk0MjAyMDUwMmQ2ZWE3MDllMmE1NDUzZjciCiAKIERFUEVORFM6
YXBwZW5kOng4Ni02NDpjbGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogREVQRU5EUzphcHBl
bmQ6eDg2OmNsYXNzLXRhcmdldCA9ICIgbmFzbS1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiJHtHSVRI
VUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIyMjQyOTUwNzcxNGFlMTQ3YjNhY2FjZDI5OWU4MjA5OWZjZTVkOWY0NTY4ODJmYzI4
ZTI1MmU0NTc5YmEyYTc1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1NjRjNzJiMWRmZDFkNmZl
NjI3NGM1Zjk1YThkOTg5YjU5ODU0NTc1ZDRiYmVlNDRhZGU3YmMxN2FhOWJjOTMiCiAKIFBFID0g
IjEiCiAKLS0gCjIuNDcuMQoK

--===============7312297660423368464==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjpeg-turbo-upgrade-3.0.1-3.1.0.patch"

RnJvbSA3NDk2OTQ0ZjZjNmQ3ZDk1ZjdjMzNhMzM4NWQ2YTVmNzliNjQzZDRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxMjoyMzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmpwZWctdHVyYm86IHVwZ3JhZGUgMy4wLjEgLT4gMy4xLjAKCi0tLQogLi4uLXR1cmJvXzMuMC4x
LmJiID0+IGxpYmpwZWctdHVyYm9fMy4xLjAuYmJ9IHwgOTEgKysrKysrKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2pwZWcve2xpYmpwZWctdHVyYm9fMy4wLjEuYmIgPT4gbGli
anBlZy10dXJib18zLjEuMC5iYn0gKDQyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2pwZWcvbGlianBlZy10dXJib18zLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDQyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMC4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvanBlZy9saWJqcGVnLXR1cmJvXzMuMS4wLmJi
CmluZGV4IGExZDdkNTdmYjUuLjQyODJjYmU4NjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9qcGVnL2xpYmpwZWctdHVyYm9fMy4wLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2pwZWcvbGlianBlZy10dXJib18zLjEuMC5iYgpAQCAtMSwxNSArMSwxMDIgQEAKKyMg
RklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAn
ZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRo
ZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgor
IyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1w
bGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhl
IGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisjICsrKyBMSUNFTlNFLm1kCisjIEBAIC0x
LDMwICsxLDMzIEBACisjICBsaWJqcGVnLXR1cmJvIExpY2Vuc2VzCisjICA9PT09PT09PT09PT09
PT09PT09PT09CisjICAKKyMgLWxpYmpwZWctdHVyYm8gaXMgY292ZXJlZCBieSB0aHJlZSBjb21w
YXRpYmxlIEJTRC1zdHlsZSBvcGVuIHNvdXJjZSBsaWNlbnNlczoKKyMgK2xpYmpwZWctdHVyYm8g
aXMgY292ZXJlZCBieSB0d28gY29tcGF0aWJsZSBCU0Qtc3R5bGUgb3BlbiBzb3VyY2UgbGljZW5z
ZXM6CisjICAKKyMgIC0gVGhlIElKRyAoSW5kZXBlbmRlbnQgSlBFRyBHcm91cCkgTGljZW5zZSwg
d2hpY2ggaXMgbGlzdGVkIGluCisjICAgIFtSRUFETUUuaWpnXShSRUFETUUuaWpnKQorIyAgCisj
IC0gIFRoaXMgbGljZW5zZSBhcHBsaWVzIHRvIHRoZSBsaWJqcGVnIEFQSSBsaWJyYXJ5IGFuZCBh
c3NvY2lhdGVkIHByb2dyYW1zCisjIC0gIChhbnkgY29kZSBpbmhlcml0ZWQgZnJvbSBsaWJqcGVn
LCBhbmQgYW55IG1vZGlmaWNhdGlvbnMgdG8gdGhhdCBjb2RlLikKKyMgKyAgVGhpcyBsaWNlbnNl
IGFwcGxpZXMgdG8gdGhlIGxpYmpwZWcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJvZ3Jh
bXMsCisjICsgIGluY2x1ZGluZyBhbnkgY29kZSBpbmhlcml0ZWQgZnJvbSBsaWJqcGVnIGFuZCBh
bnkgbW9kaWZpY2F0aW9ucyB0byB0aGF0CisjICsgIGNvZGUuICBOb3RlIHRoYXQgdGhlIGxpYmpw
ZWctdHVyYm8gU0lNRCBzb3VyY2UgY29kZSBiZWFycyB0aGUKKyMgKyAgW3psaWIgTGljZW5zZV0o
aHR0cHM6Ly9vcGVuc291cmNlLm9yZy9saWNlbnNlcy9abGliKSwgYnV0IGluIHRoZSBjb250ZXh0
IG9mCisjICsgIHRoZSBvdmVyYWxsIGxpYmpwZWcgQVBJIGxpYnJhcnksIHRoZSB0ZXJtcyBvZiB0
aGUgemxpYiBMaWNlbnNlIGFyZSBzdWJzdW1lZAorIyArICBieSB0aGUgdGVybXMgb2YgdGhlIElK
RyBMaWNlbnNlLgorIyAgCisjICAtIFRoZSBNb2RpZmllZCAoMy1jbGF1c2UpIEJTRCBMaWNlbnNl
LCB3aGljaCBpcyBsaXN0ZWQgYmVsb3cKKyMgIAorIyAtICBUaGlzIGxpY2Vuc2UgY292ZXJzIHRo
ZSBUdXJib0pQRUcgQVBJIGxpYnJhcnkgYW5kIGFzc29jaWF0ZWQgcHJvZ3JhbXMsIGFzCisjIC0g
IHdlbGwgYXMgdGhlIGJ1aWxkIHN5c3RlbS4KKyMgLQorIyAtLSBUaGUgW3psaWIgTGljZW5zZV0o
aHR0cHM6Ly9vcGVuc291cmNlLm9yZy9saWNlbnNlcy9abGliKQorIyAtCisjIC0gIFRoaXMgbGlj
ZW5zZSBpcyBhIHN1YnNldCBvZiB0aGUgb3RoZXIgdHdvLCBhbmQgaXQgY292ZXJzIHRoZSBsaWJq
cGVnLXR1cmJvCisjIC0gIFNJTUQgZXh0ZW5zaW9ucy4KKyMgKyAgVGhpcyBsaWNlbnNlIGFwcGxp
ZXMgdG8gdGhlIFR1cmJvSlBFRyBBUEkgbGlicmFyeSBhbmQgYXNzb2NpYXRlZCBwcm9ncmFtcywg
YXMKKyMgKyAgd2VsbCBhcyB0aGUgYnVpbGQgc3lzdGVtLiAgTm90ZSB0aGF0IHRoZSBUdXJib0pQ
RUcgQVBJIGxpYnJhcnkgd3JhcHMgdGhlCisjICsgIGxpYmpwZWcgQVBJIGxpYnJhcnksIHNvIGlu
IHRoZSBjb250ZXh0IG9mIHRoZSBvdmVyYWxsIFR1cmJvSlBFRyBBUEkgbGlicmFyeSwKKyMgKyAg
Ym90aCB0aGUgdGVybXMgb2YgdGhlIElKRyBMaWNlbnNlIGFuZCB0aGUgdGVybXMgb2YgdGhlIE1v
ZGlmaWVkICgzLWNsYXVzZSkKKyMgKyAgQlNEIExpY2Vuc2UgYXBwbHkuCisjICAKKyMgIAorIyAg
Q29tcGx5aW5nIHdpdGggdGhlIGxpYmpwZWctdHVyYm8gTGljZW5zZXMKKyMgID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjICAKKyMgIFRoaXMgc2VjdGlvbiBwcm92
aWRlcyBhIHJvbGwtdXAgb2YgdGhlIGxpYmpwZWctdHVyYm8gbGljZW5zaW5nIHRlcm1zLCB0byB0
aGUKKyMgLWJlc3Qgb2Ygb3VyIHVuZGVyc3RhbmRpbmcuCisjICtiZXN0IG9mIG91ciB1bmRlcnN0
YW5kaW5nLiAgVGhpcyBpcyBub3QgYSBsaWNlbnNlIGluIGFuZCBvZiBpdHNlbGYuICBJdCBpcwor
IyAraW50ZW5kZWQgc29sZWx5IGZvciBjbGFyaWZpY2F0aW9uLgorIyAgCisjICAxLiAgSWYgeW91
IGFyZSBkaXN0cmlidXRpbmcgYSBtb2RpZmllZCB2ZXJzaW9uIG9mIHRoZSBsaWJqcGVnLXR1cmJv
IHNvdXJjZSwKKyMgICAgICB0aGVuOgorIyBAQCAtMzgsNyArNDEsNyBAQAorIyAgICAgICAgICAt
IENsYXVzZXMgMSBhbmQgMyBvZiB0aGUgemxpYiBMaWNlbnNlCisjICAKKyMgICAgICAyLiAgWW91
IG11c3QgYWRkIHlvdXIgb3duIGNvcHlyaWdodCBub3RpY2UgdG8gdGhlIGhlYWRlciBvZiBlYWNo
IHNvdXJjZQorIyAtICAgICAgICBmaWxlIHlvdSBtb2RpZmllZCwgc28gb3RoZXJzIGNhbiB0ZWxs
IHRoYXQgeW91IG1vZGlmaWVkIHRoYXQgZmlsZSAoaWYKKyMgKyAgICAgICAgZmlsZSB5b3UgbW9k
aWZpZWQsIHNvIG90aGVycyBjYW4gdGVsbCB0aGF0IHlvdSBtb2RpZmllZCB0aGF0IGZpbGUuICAo
SWYKKyMgICAgICAgICAgdGhlcmUgaXMgbm90IGFuIGV4aXN0aW5nIGNvcHlyaWdodCBoZWFkZXIg
aW4gdGhhdCBmaWxlLCB0aGVuIHlvdSBjYW4KKyMgICAgICAgICAgc2ltcGx5IGFkZCBhIG5vdGlj
ZSBzdGF0aW5nIHRoYXQgeW91IG1vZGlmaWVkIHRoZSBmaWxlLikKKyMgIAorIyBAQCAtOTEsNyAr
OTQsNyBAQAorIyAgVGhlIE1vZGlmaWVkICgzLWNsYXVzZSkgQlNEIExpY2Vuc2UKKyMgID09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CisjICAKKyMgLUNvcHlyaWdodCAoQykyMDA5
LTIwMjMgRC4gUi4gQ29tbWFuZGVyLiAgQWxsIFJpZ2h0cyBSZXNlcnZlZC48YnI+CisjICtDb3B5
cmlnaHQgKEMpMjAwOS0yMDI0IEQuIFIuIENvbW1hbmRlci4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQu
PGJyPgorIyAgQ29weXJpZ2h0IChDKTIwMTUgVmlrdG9yIFN6YXRobcOhcnkuICBBbGwgUmlnaHRz
IFJlc2VydmVkLgorIyAgCisjICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQg
YmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgQEAgLTExOSw4ICsxMjIsOCBAQAorIyAg
UE9TU0lCSUxJVFkgT0YgU1VDSCBEQU1BR0UuCisjICAKKyMgIAorIyAtV2h5IFRocmVlIExpY2Vu
c2VzPworIyAtPT09PT09PT09PT09PT09PT09PQorIyArV2h5IFR3byBMaWNlbnNlcz8KKyMgKz09
PT09PT09PT09PT09PT09CisjICAKKyMgIFRoZSB6bGliIExpY2Vuc2UgY291bGQgaGF2ZSBiZWVu
IHVzZWQgaW5zdGVhZCBvZiB0aGUgTW9kaWZpZWQgKDMtY2xhdXNlKSBCU0QKKyMgIExpY2Vuc2Us
IGFuZCBzaW5jZSB0aGUgSUpHIExpY2Vuc2UgZWZmZWN0aXZlbHkgc3Vic3VtZXMgdGhlIGRpc3Ry
aWJ1dGlvbgorIyAKKyMKKwogU1VNTUFSWSA9ICJIYXJkd2FyZSBhY2NlbGVyYXRlZCBKUEVHIGNv
bXByZXNzaW9uL2RlY29tcHJlc3Npb24gbGlicmFyeSIKIERFU0NSSVBUSU9OID0gImxpYmpwZWct
dHVyYm8gaXMgYSBkZXJpdmF0aXZlIG9mIGxpYmpwZWcgdGhhdCB1c2VzIFNJTUQgaW5zdHJ1Y3Rp
b25zIChNTVgsIFNTRTIsIE5FT04pIHRvIGFjY2VsZXJhdGUgYmFzZWxpbmUgSlBFRyBjb21wcmVz
c2lvbiBhbmQgZGVjb21wcmVzc2lvbiIKIEhPTUVQQUdFID0gImh0dHA6Ly9saWJqcGVnLXR1cmJv
Lm9yZy8iCiAKIExJQ0VOU0UgPSAiSUpHICYgQlNELTMtQ2xhdXNlICYgWmxpYiIKLUxJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTJhOGUwZDgyMjZhMTAyZjA3YWI2M2Vk
N2ZkNmNlMTU1IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9MDIz
YzJlODk0MjAyMDUwMmQ2ZWE3MDllMmE1NDUzZjciCiAKIERFUEVORFM6YXBwZW5kOng4Ni02NDpj
bGFzcy10YXJnZXQgPSAiIG5hc20tbmF0aXZlIgogREVQRU5EUzphcHBlbmQ6eDg2OmNsYXNzLXRh
cmdldCA9ICIgbmFzbS1uYXRpdmUiCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rv
d25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMjQyOTUw
NzcxNGFlMTQ3YjNhY2FjZDI5OWU4MjA5OWZjZTVkOWY0NTY4ODJmYzI4ZTI1MmU0NTc5YmEyYTc1
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk1NjRjNzJiMWRmZDFkNmZlNjI3NGM1Zjk1YThkOTg5
YjU5ODU0NTc1ZDRiYmVlNDRhZGU3YmMxN2FhOWJjOTMiCiAKIFBFID0gIjEiCiAKLS0gCjIuNDcu
MQoK

--===============7312297660423368464==
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
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: FILELIST: removed "/usr/lib/.debug/libturbojpeg.so.0.3.0", added "/usr/lib/.debug/libturbojpeg.so.0.4.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dbg: PKGSIZE changed from 5540240 to 5558352 (+0%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-dev: PKGSIZE changed from 191932 to 218290 (+14%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: FILELIST: removed "/usr/share/doc/libjpeg-turbo/tjexample.c", added "/usr/share/doc/libjpeg-turbo/tjcomp.c /usr/share/doc/libjpeg-turbo/tjtran.c /usr/share/doc/libjpeg-turbo/tjdecomp.c"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-doc: PKGSIZE changed from 401242 to 436430 (+9%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-locale: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: FILELIST: directory renamed /usr/src/debug/libjpeg-turbo/3.0.1/simd -> /usr/src/debug/libjpeg-turbo/3.1.0/simd, directory renamed /usr/src/debug/libjpeg-turbo/3.0.1/simd/x86_64 -> /usr/src/debug/libjpeg-turbo/3.1.0/simd/x86_64, removed "/usr/src/debug/libjpeg-turbo/3.0.1/jpeg_nbits_table.h /usr/src/debug/libjpeg-turbo/3.0.1/jdinput.c /usr/src/debug/libjpeg-turbo/3.0.1/jcomapi.c /usr/src/debug/libjpeg-turbo/3.0.1/jsimd.h /usr/src/debug/libjpeg-turbo/3.0.1/jdapistd.c /usr/src/debug/libjpeg-turbo/3.0.1/jcapistd.c /usr/src/debug/libjpeg-turbo/3.0.1/jinclude.h /usr/src/debug/libjpeg-turbo/3.0.1/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.0.1/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.0.1/jquant1.c /usr/src/debug/libjpeg-turbo/3.0.1/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.0.1/jchuff.h /usr/src/debug/libjpeg-turbo/3.0.1/jdhuff.h /usr/src/debug/libjpeg-turbo/3.0.1/jchuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jdhuff.c /usr/src/
 debug/libjpeg-turbo/3.0.1/jdpostct.c /usr/src/debug/libjpeg-turbo/3.0.1/jcmaster.h /usr/src/debug/libjpeg-turbo/3.0.1/jdmaster.h /usr/src/debug/libjpeg-turbo/3.0.1/jfdctint.c /usr/src/debug/libjpeg-turbo/3.0.1/jidctint.c /usr/src/debug/libjpeg-turbo/3.0.1/jcmaster.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmaster.c /usr/src/debug/libjpeg-turbo/3.0.1/cderror.h /usr/src/debug/libjpeg-turbo/3.0.1/jccolor.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcolor.c /usr/src/debug/libjpeg-turbo/3.0.1/jstdhuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jcsample.c /usr/src/debug/libjpeg-turbo/3.0.1/jdsample.c /usr/src/debug/libjpeg-turbo/3.0.1/jaricom.c /usr/src/debug/libjpeg-turbo/3.0.1/jdsample.h /usr/src/debug/libjpeg-turbo/3.0.1/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.0.1/jdmerge.h /usr/src/debug/libjpeg-turbo/3.0.1/jfdctflt.c /usr/src/debug/libjpeg-turbo/3.0.1/jidctflt.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmerge.c /usr/src/debug/libjpeg-turbo/3.0.1/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.0.1/rdtarga.
 c /usr/src/debug/libjpeg-turbo/3.0.1/wrtarga.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.0.1/jutils.c /usr/src/debug/libjpeg-turbo/3.0.1/jccoefct.c /usr/src/debug/libjpeg-turbo/3.0.1/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.0.1/jddiffct.c /usr/src/debug/libjpeg-turbo/3.0.1/jlossls.h /usr/src/debug/libjpeg-turbo/3.0.1/transupp.c /usr/src/debug/libjpeg-turbo/3.0.1/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcol565.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmrg565.c /usr/src/debug/libjpeg-turbo/3.0.1/transupp.h /usr/src/debug/libjpeg-turbo/3.0.1/jpeglib.h /usr/src/debug/libjpeg-turbo/3.0.1/jcapimin.c /usr/src/debug/libjpeg-turbo/3.0.1/jdapimin.c /usr/src/debug/libjpeg-turbo/3.0.1/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.0.1/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.0.1/jdatadst.c /usr/src/debug/libjpeg-turbo/3.0.1/jpegint.h /usr/src/debug/libjpeg-turbo/3.0.1/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.0.1/
 turbojpeg.h /usr/src/debug/libjpeg-turbo/3.0.1/jcparam.c /usr/src/debug/libjpeg-turbo/3.0.1/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.0.1/jidctred.c /usr/src/debug/libjpeg-turbo/3.0.1/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.0.1/jmemsys.h /usr/src/debug/libjpeg-turbo/3.0.1/jcmarker.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmarker.c /usr/src/debug/libjpeg-turbo/3.0.1/jctrans.c /usr/src/debug/libjpeg-turbo/3.0.1/jdtrans.c /usr/src/debug/libjpeg-turbo/3.0.1/tjbench.c /usr/src/debug/libjpeg-turbo/3.0.1/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.0.1/jidctfst.c /usr/src/debug/libjpeg-turbo/3.0.1/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.0.1/tjutil.c /usr/src/debug/libjpeg-turbo/3.0.1/jcmainct.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmainct.c /usr/src/debug/libjpeg-turbo/3.0.1/tjutil.h /usr/src/debug/libjpeg-turbo/3.0.1/jdmainct.h /usr/src/debug/libjpeg-turbo/3.0.1/jerror.h /usr/src/debug/libjpeg-turbo/3.0.1/jerror.c /usr/src/debug/libjpeg-turbo/3.0.1/jcinit.c /usr/src/debug/libjpeg-turbo/3.0.
 1/jclhuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jcphuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jdphuff.c /usr/src/debug/libjpeg-turbo/3.0.1/jcarith.c /usr/src/debug/libjpeg-turbo/3.0.1/jdarith.c /usr/src/debug/libjpeg-turbo/3.0.1/cmyk.h /usr/src/debug/libjpeg-turbo/3.0.1/jdct.h /usr/src/debug/libjpeg-turbo/3.0.1/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.0.1/jquant2.c /usr/src/debug/libjpeg-turbo/3.0.1/jclossls.c /usr/src/debug/libjpeg-turbo/3.0.1/jcprepct.c /usr/src/debug/libjpeg-turbo/3.0.1/jdlossls.c /usr/src/debug/libjpeg-turbo/3.0.1/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.0.1/jccolext.c /usr/src/debug/libjpeg-turbo/3.0.1/jdcolext.c /usr/src/debug/libjpeg-turbo/3.0.1/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.0.1/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.0.1/rdswitch.c /usr/src/debug/libjpeg-turbo/3.0.1/jsimddct.h /usr/src/debug/libjpeg-turbo/3.0.1/wrgif.c /usr/src/debug/libjpeg-turbo/3.0.1/wrppm.c /usr/src/debug/libjpeg-turbo/3.0.1/cjpeg.c 
 /usr/src/debug/libjpeg-turbo/3.0.1/djpeg.c /usr/src/debug/libjpeg-turbo/3.0.1/jcicc.c /usr/src/debug/libjpeg-turbo/3.0.1/jdicc.c /usr/src/debug/libjpeg-turbo/3.0.1/rdbmp.c /usr/src/debug/libjpeg-turbo/3.0.1/rdgif.c /usr/src/debug/libjpeg-turbo/3.0.1/rdppm.c /usr/src/debug/libjpeg-turbo/3.0.1/wrbmp.c /usr/src/debug/libjpeg-turbo/3.0.1/jpegtran.c", added "/usr/src/debug/libjpeg-turbo/3.1.0/src/jsimddct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdarith.c /usr/src/debug/libjpeg-turbo/3.1.0/src/turbojpeg.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jfdctint.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jfdctfst.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jfdctflt.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdbmp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcapistd.c /usr/src/debug/libjpeg-turbo/3.1.0/src/turbojpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcapimin.c /usr/src/debug/libjpeg-turbo/3.1.0/src/transupp.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jquant1.c /usr/src/debug/libjpeg-turbo/3.1.0/src/trans
 upp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcoefct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcol565.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcparam.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcolext.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatadst.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcicc.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cjpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatadst-tj.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatasrc-tj.c /usr/src/debug/libjpeg-turbo/3.1.0/src/djpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdatasrc.c /usr/src/debug/libjpeg-turbo/3.1.0/src/tjbench.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jlossls.h /usr/src/debug/libjpeg-turbo/3.1.0/src/wrgif.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcphuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdtarga.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdinput.c /usr/src/debug/libjpeg-turbo/3.1.0/src/wrtarga.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcolor.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdpostct.c /usr/
 src/debug/libjpeg-turbo/3.1.0/src/jdlossls.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cmyk.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jddctmgr.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jddiffct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmerge.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmerge.h /usr/src/debug/libjpeg-turbo/3.1.0/src/turbojpeg-mp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdgif.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jaricom.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdtrans.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jpegtran.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jcdiffct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcdctmgr.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcprepct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jclossls.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jmemsys.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jpegint.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jstdhuff.c /usr/src/debug/
 libjpeg-turbo/3.1.0/src/wrppm.c /usr/src/debug/libjpeg-turbo/3.1.0/src/wrbmp.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jpeglib.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jcarith.c /usr/src/debug/libjpeg-turbo/3.1.0/src/wrjpgcom.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cderror.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jpeg_nbits.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdicc.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jmorecfg.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdlhuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdppm.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jmemnobs.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jccolext.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jutils.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcinit.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cdjpeg.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jquant2.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jinclude.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jclhuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/cdjpeg.h /usr/src/debug/libjpeg-turbo/3.1.0/s
 rc/jidctflt.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jidctfst.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jidctint.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jidctred.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jsimd.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jcomapi.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdphuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdhuff.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jmemmgr.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdcoefct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmainct.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmaster.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdsample.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jdhuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdcolmap.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmarker.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmaster.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmainct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdsample.c /usr/src/debug/libjpeg-turbo/3.1.0/src/rdswitch.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmr
 g565.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdmrgext.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdapimin.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jdapistd.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jerror.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jchuff.h /usr/src/debug/libjpeg-turbo/3.1.0/src/tjutil.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jerror.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jchuff.c /usr/src/debug/libjpeg-turbo/3.1.0/src/tjutil.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jccolor.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jctrans.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmainct.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmarker.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmaster.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcsample.c /usr/src/debug/libjpeg-turbo/3.1.0/src/jcmaster.h /usr/src/debug/libjpeg-turbo/3.1.0/src/jccoefct.c"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-src: PKGSIZE changed from 2337251 to 2120262 (-9%)
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo-staticdev: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libjpeg-turbo: PKGSIZE changed from 780345 to 653369 (-16%)
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PKGV changed from 3.0.1 [default] to 3.1.0 [default]
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PV changed from "3.0.1" to "3.1.0"
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: FILELIST: removed "/usr/lib/libturbojpeg.so.0.3.0", added "/usr/lib/libturbojpeg.so.0.4.0"
packages/core2-64-poky-linux/libjpeg-turbo/libturbojpeg: PKGSIZE changed from 911677 to 788957 (-13%)
Changes to packages/core2-64-poky-linux/libjpeg-turbo (sysroot):
  /usr/lib/libturbojpeg.so.0 changed symlink target from libturbojpeg.so.0.3.0 to libturbojpeg.so.0.4.0
  /usr/lib/libturbojpeg.so.0.3.0 moved to /usr/lib/libturbojpeg.so.0.4.0

--===============7312297660423368464==
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

--===============7312297660423368464==--

