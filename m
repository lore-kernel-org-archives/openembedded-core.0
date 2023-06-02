Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333E5C88C85
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7626.1685693431759111594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DNkLmXCJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101887b288e27-688a1747-0a59-4a9f-8681-4efda7234d47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eDgsT2qo+PSm9K8ZezJbzdYeJzJ3BU4K17BB75EcERE=;
	b=DNkLmXCJOV4OsHir9qqy7xb+TCY+mHS+pIQNep5kwuXZzmSsuaPJjYNwRhphkqtp
	v5yYDCMX8zMGHvMGeRgNYJTFQsSV8Aakn9+4OlXEGoxT/rSwmBsrlr0QIkuK+N8FRtq
	XBT1mhxdX3TyTFb/TSWyBQmeOzFbu/RImfqD2gOw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693435;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eDgsT2qo+PSm9K8ZezJbzdYeJzJ3BU4K17BB75EcERE=;
	b=Aw93gMa4PfEufFedO6wOxIFJhVgOFiZFGnvctuQ3siWzKYUpccnp5CRHrwsBNOfi
	ypgZ3vreVIu7EhcI73ppX0oefJaqTWnewgJxEFrdLg+SnIMOkCMGRpY8bnVz8zVHT8f
	CypRA+tWusaVwprXo5F43OWlW7h/ClJwg1IjO7Hk=
Content-Type: multipart/mixed; boundary="===============0786312061074778848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] alsa-utils: upgrading to 1.2.9 FAILED
Message-ID: <010101887b288e27-688a1747-0a59-4a9f-8681-4efda7234d47-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182264

--===============0786312061074778848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *alsa-utils* to *1.2.9* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-alsa-utils-upgrade-1.2.8-1.2.9.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0786312061074778848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-alsa-utils-upgrade-1.2.8-1.2.9.patch"

RnJvbSBjOGU3NTUzYzQxNjQ3OTg4NmYzZmRkNzYzMDI0NGFiNmFjNjUxMDVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMzoyMTo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFs
c2EtdXRpbHM6IHVwZ3JhZGUgMS4yLjggLT4gMS4yLjkKCi0tLQogLi4ubGF5LWF4ZmVyLVJlcGxh
Y2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoIHwgMjcyIC0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
bHNhLXV0aWxzXzEuMi44LmJiID0+IGFsc2EtdXRpbHNfMS4yLjkuYmJ9IHwgICA2ICstCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjc2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlscy8wMDAxLWFw
bGF5LWF4ZmVyLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvYWxzYS97YWxzYS11dGlsc18xLjIuOC5iYiA9PiBhbHNhLXV0aWxz
XzEuMi45LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fs
c2EvYWxzYS11dGlscy8wMDAxLWFwbGF5LWF4ZmVyLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzLzAwMDEtYXBs
YXktYXhmZXItUmVwbGFjZS1vZmY2NF90LXdpdGgtb2ZmX3QucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDM1NmM1OTY0YWUuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVz
LW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzLzAwMDEtYXBsYXktYXhmZXItUmVwbGFjZS1vZmY2
NF90LXdpdGgtb2ZmX3QucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyNzIgKzAsMCBAQAotRnJv
bSAwMzU1M2NjYzYyODRhNDM3NTc2MzQ5YjVhM2MyZWQwZDdkNDI2NWUxIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFRo
dSwgMTUgRGVjIDIwMjIgMTQ6MDQ6MTAgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSF0gYXBsYXksYXhm
ZXI6IFJlcGxhY2Ugb2ZmNjRfdCB3aXRoIG9mZl90Ci0KLUFsc28gcmVwbGFjZSBsc2VlazY0IHdp
dGggbHNlZWsuCi0KLV9GSUxFX09GRlNFVF9CSVRTPTY0IGlzIHBhc3NlZCB0byBuZWVkZWQgcGxh
dGZvcm1zIHNpbmNlIGNvbmZpZ3VyZSB1c2VzCi1BQ19TWVNfTEFSR0VGSUxFIG1hY3JvLiBUaGVy
ZWZvcmUgb2ZmX3QgaXMgYWxyZWFkeSA2NC1iaXQgYW5kIGxzZWVrIGlzCi1zYW1lIGFzIGxzZWVr
NjQuCi0KLUFkZGl0aW9uYWxseSB0aGlzIGZpeGVzIGJ1aWxzIHdpdGggbGF0ZXN0IG11c2wgd2hl
cmUgdGhlc2UgbGZzNjQKLWZ1bmN0aW9ucyBhcmUgbW92ZWQgb3V0IGZyb20gX0dOVV9TT1VSQ0Ug
YW5kIHVuZGVyIF9MQVJHRUZJTEU2NF9TT1VSQ0UKLW1hY3JvIGFsb25lLiBUaGlzIG1ha2VzIHRo
ZSBidWlsZHMgZmFpbCBvbiAzMi1iaXQgcGxhdGZvcm1zIGV2ZW4gdGhvdWdoCi1kZWZhdWx0IG9m
Zl90IG9uIG11c2wgaXMgNjQtYml0IGFsd2F5cy4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0
ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9hbHNhLXByb2plY3QvYWxzYS11dGlscy9wdWxsLzE4M10K
LVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBhcGxh
eS9hcGxheS5jICAgICAgICAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tCi0gYXhmZXIvY29udGFpbmVyLXZvYy5jICAgICAgIHwgIDIgKy0KLSBheGZlci9j
b250YWluZXIuYyAgICAgICAgICAgfCAgNiArKy0tLQotIGF4ZmVyL2NvbnRhaW5lci5oICAgICAg
ICAgICB8ICAyICstCi0gYXhmZXIvdGVzdC9jb250YWluZXItdGVzdC5jIHwgIDQgKystLQotIGF4
ZmVyL3Rlc3QvbWFwcGVyLXRlc3QuYyAgICB8ICAyICstCi0gNiBmaWxlcyBjaGFuZ2VkLCAzMCBp
bnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2FwbGF5L2FwbGF5
LmMgYi9hcGxheS9hcGxheS5jCi1pbmRleCA2Y2U3MTkxLi5iZDkzYmUzIDEwMDY0NAotLS0tIGEv
YXBsYXkvYXBsYXkuYwotKysrIGIvYXBsYXkvYXBsYXkuYwotQEAgLTE0MSw3ICsxNDEsNyBAQCBz
dGF0aWMgbG9uZyB0ZXJtX2NfbGZsYWcgPSAtMTsKLSBzdGF0aWMgaW50IGR1bXBfaHdfcGFyYW1z
ID0gMDsKLSAKLSBzdGF0aWMgaW50IGZkID0gLTE7Ci0tc3RhdGljIG9mZjY0X3QgcGJyZWNfY291
bnQgPSBMTE9OR19NQVgsIGZkY291bnQ7Ci0rc3RhdGljIG9mZl90IHBicmVjX2NvdW50ID0gTExP
TkdfTUFYLCBmZGNvdW50OwotIHN0YXRpYyBpbnQgdm9jbWFqb3IsIHZvY21pbm9yOwotIAotIHN0
YXRpYyBjaGFyICpwaWRmaWxlX25hbWUgPSBOVUxMOwotQEAgLTIzNTYsNyArMjM1Niw3IEBAIHN0
YXRpYyB2b2lkIHZvY19wbGF5KGludCBmZCwgaW50IG9mcywgY2hhciAqbmFtZSkKLSAJdV9jaGFy
ICpkYXRhLCAqYnVmOwotIAljaGFyIHdhc19leHRlbmRlZCA9IDAsIG91dHB1dCA9IDA7Ci0gCXVf
c2hvcnQgKnNwLCByZXBlYXQgPSAwOwotLQlvZmY2NF90IGZpbGVwb3MgPSAwOwotKwlvZmZfdCBm
aWxlcG9zID0gMDsKLSAKLSAjZGVmaW5lIENPVU5UKHgpCW5leHRibG9jayAtPSB4OyBpbl9idWZm
ZXIgLT0geDsgZGF0YSArPSB4Ci0gI2RlZmluZSBDT1VOVDEoeCkJaW5fYnVmZmVyIC09IHg7IGRh
dGEgKz0geAotQEAgLTI0OTAsNyArMjQ5MCw3IEBAIHN0YXRpYyB2b2lkIHZvY19wbGF5KGludCBm
ZCwgaW50IG9mcywgY2hhciAqbmFtZSkKLSAJCQkJZF9wcmludGYoIlJlcGVhdCBsb29wICVkIHRp
bWVzXG4iLCByZXBlYXQpOwotICNlbmRpZgotIAkJCQlpZiAoZmlsZXBvcyA+PSAwKSB7CS8qIGlm
IDwgMCwgb25lIHNlZWsgZmFpbHMsIHdoeSB0ZXN0IGFub3RoZXIgKi8KLS0JCQkJCWlmICgoZmls
ZXBvcyA9IGxzZWVrNjQoZmQsIDAsIDEpKSA8IDApIHsKLSsJCQkJCWlmICgoZmlsZXBvcyA9IGxz
ZWVrKGZkLCAwLCAxKSkgPCAwKSB7Ci0gCQkJCQkJZXJyb3IoXygiY2FuJ3QgcGxheSBsb29wczsg
JXMgaXNuJ3Qgc2Vla2FibGVcbiIpLCBuYW1lKTsKLSAJCQkJCQlyZXBlYXQgPSAwOwotIAkJCQkJ
fSBlbHNlIHsKLUBAIC0yNTEyLDcgKzI1MTIsNyBAQCBzdGF0aWMgdm9pZCB2b2NfcGxheShpbnQg
ZmQsIGludCBvZnMsIGNoYXIgKm5hbWUpCi0gCQkJCQllbHNlCi0gCQkJCQkJZF9wcmludGYoIk5l
dmVyZW5kaW5nIGxvb3BcbiIpOwotICNlbmRpZgotLQkJCQkJbHNlZWs2NChmZCwgZmlsZXBvcywg
MCk7Ci0rCQkJCQlsc2VlayhmZCwgZmlsZXBvcywgMCk7Ci0gCQkJCQlpbl9idWZmZXIgPSAwOwkv
KiBjbGVhciB0aGUgYnVmZmVyICovCi0gCQkJCQlnb3RvIEZpbGxfdGhlX2J1ZmZlcjsKLSAJCQkJ
fQotQEAgLTI1NzgsOSArMjU3OCw5IEBAIHN0YXRpYyB2b2lkIGluaXRfcmF3X2RhdGEodm9pZCkK
LSB9Ci0gCi0gLyogY2FsY3VsYXRlIHRoZSBkYXRhIGNvdW50IHRvIHJlYWQgZnJvbS90byBkc3Ag
Ki8KLS1zdGF0aWMgb2ZmNjRfdCBjYWxjX2NvdW50KHZvaWQpCi0rc3RhdGljIG9mZl90IGNhbGNf
Y291bnQodm9pZCkKLSB7Ci0tCW9mZjY0X3QgY291bnQ7Ci0rCW9mZl90IGNvdW50OwotIAotIAlp
ZiAodGltZWxpbWl0ID09IDApCi0gCQlpZiAoc2FtcGxlc2xpbWl0ID09IDApCi1AQCAtMjU4OSw3
ICsyNTg5LDcgQEAgc3RhdGljIG9mZjY0X3QgY2FsY19jb3VudCh2b2lkKQotIAkJCWNvdW50ID0g
c25kX3BjbV9mb3JtYXRfc2l6ZShod3BhcmFtcy5mb3JtYXQsIHNhbXBsZXNsaW1pdCAqIGh3cGFy
YW1zLmNoYW5uZWxzKTsKLSAJZWxzZSB7Ci0gCQljb3VudCA9IHNuZF9wY21fZm9ybWF0X3NpemUo
aHdwYXJhbXMuZm9ybWF0LCBod3BhcmFtcy5yYXRlICogaHdwYXJhbXMuY2hhbm5lbHMpOwotLQkJ
Y291bnQgKj0gKG9mZjY0X3QpdGltZWxpbWl0OwotKwkJY291bnQgKj0gKG9mZl90KXRpbWVsaW1p
dDsKLSAJfQotIAlyZXR1cm4gY291bnQgPCBwYnJlY19jb3VudCA/IGNvdW50IDogcGJyZWNfY291
bnQ7Ci0gfQotQEAgLTI3NTAsNyArMjc1MCw3IEBAIHN0YXRpYyB2b2lkIGJlZ2luX2F1KGludCBm
ZCwgc2l6ZV90IGNudCkKLSAvKiBjbG9zaW5nIC5WT0MgKi8KLSBzdGF0aWMgdm9pZCBlbmRfdm9j
KGludCBmZCkKLSB7Ci0tCW9mZjY0X3QgbGVuZ3RoX3NlZWs7Ci0rCW9mZl90IGxlbmd0aF9zZWVr
OwotIAlWb2NCbG9ja1R5cGUgYnQ7Ci0gCXNpemVfdCBjbnQ7Ci0gCWNoYXIgZHVtbXkgPSAwOwkJ
LyogV3JpdGUgYSBUZXJtaW5hdG9yICovCi1AQCAtMjc3MCwxNSArMjc3MCwxNSBAQCBzdGF0aWMg
dm9pZCBlbmRfdm9jKGludCBmZCkKLSAJYnQuZGF0YWxlbiA9ICh1X2NoYXIpIChjbnQgJiAweEZG
KTsKLSAJYnQuZGF0YWxlbl9tID0gKHVfY2hhcikgKChjbnQgJiAweEZGMDApID4+IDgpOwotIAli
dC5kYXRhbGVuX2ggPSAodV9jaGFyKSAoKGNudCAmIDB4RkYwMDAwKSA+PiAxNik7Ci0tCWlmIChs
c2VlazY0KGZkLCBsZW5ndGhfc2VlaywgU0VFS19TRVQpID09IGxlbmd0aF9zZWVrKQotKwlpZiAo
bHNlZWsoZmQsIGxlbmd0aF9zZWVrLCBTRUVLX1NFVCkgPT0gbGVuZ3RoX3NlZWspCi0gCQl4d3Jp
dGUoZmQsICZidCwgc2l6ZW9mKFZvY0Jsb2NrVHlwZSkpOwotIH0KLSAKLSBzdGF0aWMgdm9pZCBl
bmRfd2F2ZShpbnQgZmQpCi0gewkJCQkvKiBvbmx5IGNsb3NlIG91dHB1dCAqLwotIAlXYXZlQ2h1
bmtIZWFkZXIgY2Q7Ci0tCW9mZjY0X3QgbGVuZ3RoX3NlZWs7Ci0tCW9mZjY0X3QgZmlsZWxlbjsK
LSsJb2ZmX3QgbGVuZ3RoX3NlZWs7Ci0rCW9mZl90IGZpbGVsZW47Ci0gCXVfaW50IHJpZmZsZW47
Ci0gCQotIAlsZW5ndGhfc2VlayA9IHNpemVvZihXYXZlSGVhZGVyKSArCi1AQCAtMjc4OCwyMCAr
Mjc4OCwyMCBAQCBzdGF0aWMgdm9pZCBlbmRfd2F2ZShpbnQgZmQpCi0gCWNkLmxlbmd0aCA9IGZk
Y291bnQgPiAweDdmZmZmZmZmID8gTEVfSU5UKDB4N2ZmZmZmZmYpIDogTEVfSU5UKGZkY291bnQp
OwotIAlmaWxlbGVuID0gZmRjb3VudCArIDIqc2l6ZW9mKFdhdmVDaHVua0hlYWRlcikgKyBzaXpl
b2YoV2F2ZUZtdEJvZHkpICsgNDsKLSAJcmlmZmxlbiA9IGZpbGVsZW4gPiAweDdmZmZmZmZmID8g
TEVfSU5UKDB4N2ZmZmZmZmYpIDogTEVfSU5UKGZpbGVsZW4pOwotLQlpZiAobHNlZWs2NChmZCwg
NCwgU0VFS19TRVQpID09IDQpCi0rCWlmIChsc2VlayhmZCwgNCwgU0VFS19TRVQpID09IDQpCi0g
CQl4d3JpdGUoZmQsICZyaWZmbGVuLCA0KTsKLS0JaWYgKGxzZWVrNjQoZmQsIGxlbmd0aF9zZWVr
LCBTRUVLX1NFVCkgPT0gbGVuZ3RoX3NlZWspCi0rCWlmIChsc2VlayhmZCwgbGVuZ3RoX3NlZWss
IFNFRUtfU0VUKSA9PSBsZW5ndGhfc2VlaykKLSAJCXh3cml0ZShmZCwgJmNkLCBzaXplb2YoV2F2
ZUNodW5rSGVhZGVyKSk7Ci0gfQotIAotIHN0YXRpYyB2b2lkIGVuZF9hdShpbnQgZmQpCi0gewkJ
CQkvKiBvbmx5IGNsb3NlIG91dHB1dCAqLwotIAlBdUhlYWRlciBhaDsKLS0Jb2ZmNjRfdCBsZW5n
dGhfc2VlazsKLSsJb2ZmX3QgbGVuZ3RoX3NlZWs7Ci0gCQotIAlsZW5ndGhfc2VlayA9IChjaGFy
ICopJmFoLmRhdGFfc2l6ZSAtIChjaGFyICopJmFoOwotIAlhaC5kYXRhX3NpemUgPSBmZGNvdW50
ID4gMHhmZmZmZmZmZiA/IDB4ZmZmZmZmZmYgOiBCRV9JTlQoZmRjb3VudCk7Ci0tCWlmIChsc2Vl
azY0KGZkLCBsZW5ndGhfc2VlaywgU0VFS19TRVQpID09IGxlbmd0aF9zZWVrKQotKwlpZiAobHNl
ZWsoZmQsIGxlbmd0aF9zZWVrLCBTRUVLX1NFVCkgPT0gbGVuZ3RoX3NlZWspCi0gCQl4d3JpdGUo
ZmQsICZhaC5kYXRhX3NpemUsIHNpemVvZihhaC5kYXRhX3NpemUpKTsKLSB9Ci0gCi1AQCAtMjgy
OCwxMSArMjgyOCwxMSBAQCBzdGF0aWMgdm9pZCBoZWFkZXIoaW50IHJ0eXBlLCBjaGFyICpuYW1l
KQotIAotIC8qIHBsYXlpbmcgcmF3IGRhdGEgKi8KLSAKLS1zdGF0aWMgdm9pZCBwbGF5YmFja19n
byhpbnQgZmQsIHNpemVfdCBsb2FkZWQsIG9mZjY0X3QgY291bnQsIGludCBydHlwZSwgY2hhciAq
bmFtZSkKLStzdGF0aWMgdm9pZCBwbGF5YmFja19nbyhpbnQgZmQsIHNpemVfdCBsb2FkZWQsIG9m
Zl90IGNvdW50LCBpbnQgcnR5cGUsIGNoYXIgKm5hbWUpCi0gewotIAlpbnQgbCwgcjsKLS0Jb2Zm
NjRfdCB3cml0dGVuID0gMDsKLS0Jb2ZmNjRfdCBjOwotKwlvZmZfdCB3cml0dGVuID0gMDsKLSsJ
b2ZmX3QgYzsKLSAKLSAJaGVhZGVyKHJ0eXBlLCBuYW1lKTsKLSAJc2V0X3BhcmFtcygpOwotQEAg
LTMyMDIsNyArMzIwMiw3IEBAIHN0YXRpYyB2b2lkIGNhcHR1cmUoY2hhciAqb3JpZ19uYW1lKQot
IAlpbnQgZmlsZWNvdW50PTA7CS8qIG51bWJlciBvZiBmaWxlcyB3cml0dGVuICovCi0gCWNoYXIg
Km5hbWUgPSBvcmlnX25hbWU7CS8qIGN1cnJlbnQgZmlsZW5hbWUgKi8KLSAJY2hhciBuYW1lYnVm
W1BBVEhfTUFYKzJdOwotLQlvZmY2NF90IGNvdW50LCByZXN0OwkJLyogbnVtYmVyIG9mIGJ5dGVz
IHRvIGNhcHR1cmUgKi8KLSsJb2ZmX3QgY291bnQsIHJlc3Q7CQkvKiBudW1iZXIgb2YgYnl0ZXMg
dG8gY2FwdHVyZSAqLwotIAlzdHJ1Y3Qgc3RhdCBzdGF0YnVmOwotIAotIAkvKiBnZXQgbnVtYmVy
IG9mIGJ5dGVzIHRvIGNhcHR1cmUgKi8KLUBAIC0zMjczLDcgKzMyNzMsNyBAQCBzdGF0aWMgdm9p
ZCBjYXB0dXJlKGNoYXIgKm9yaWdfbmFtZSkKLSAJCS8qIGNhcHR1cmUgKi8KLSAJCWZkY291bnQg
PSAwOwotIAkJd2hpbGUgKHJlc3QgPiAwICYmIHJlY3ljbGVfY2FwdHVyZV9maWxlID09IDAgJiYg
IWluX2Fib3J0aW5nKSB7Ci0tCQkJc2l6ZV90IGMgPSAocmVzdCA8PSAob2ZmNjRfdCljaHVua19i
eXRlcykgPwotKwkJCXNpemVfdCBjID0gKHJlc3QgPD0gKG9mZl90KWNodW5rX2J5dGVzKSA/Ci0g
CQkJCShzaXplX3QpcmVzdCA6IGNodW5rX2J5dGVzOwotIAkJCXNpemVfdCBmID0gYyAqIDggLyBi
aXRzX3Blcl9mcmFtZTsKLSAJCQlzaXplX3QgcmVhZCA9IHBjbV9yZWFkKGF1ZGlvYnVmLCBmKTsK
LUBAIC0zMzE0LDcgKzMzMTQsNyBAQCBzdGF0aWMgdm9pZCBjYXB0dXJlKGNoYXIgKm9yaWdfbmFt
ZSkKLSAJfSB3aGlsZSAoKGZpbGVfdHlwZSA9PSBGT1JNQVRfUkFXICYmICF0aW1lbGltaXQgJiYg
IXNhbXBsZXNsaW1pdCkgfHwgY291bnQgPiAwKTsKLSB9Ci0gCi0tc3RhdGljIHZvaWQgcGxheWJh
Y2t2X2dvKGludCogZmRzLCB1bnNpZ25lZCBpbnQgY2hhbm5lbHMsIHNpemVfdCBsb2FkZWQsIG9m
ZjY0X3QgY291bnQsIGludCBydHlwZSwgY2hhciAqKm5hbWVzKQotK3N0YXRpYyB2b2lkIHBsYXli
YWNrdl9nbyhpbnQqIGZkcywgdW5zaWduZWQgaW50IGNoYW5uZWxzLCBzaXplX3QgbG9hZGVkLCBv
ZmZfdCBjb3VudCwgaW50IHJ0eXBlLCBjaGFyICoqbmFtZXMpCi0gewotIAlpbnQgcjsKLSAJc2l6
ZV90IHZzaXplOwotQEAgLTMzNjgsNyArMzM2OCw3IEBAIHN0YXRpYyB2b2lkIHBsYXliYWNrdl9n
byhpbnQqIGZkcywgdW5zaWduZWQgaW50IGNoYW5uZWxzLCBzaXplX3QgbG9hZGVkLCBvZmY2NF90
Ci0gCX0KLSB9Ci0gCi0tc3RhdGljIHZvaWQgY2FwdHVyZXZfZ28oaW50KiBmZHMsIHVuc2lnbmVk
IGludCBjaGFubmVscywgb2ZmNjRfdCBjb3VudCwgaW50IHJ0eXBlLCBjaGFyICoqbmFtZXMpCi0r
c3RhdGljIHZvaWQgY2FwdHVyZXZfZ28oaW50KiBmZHMsIHVuc2lnbmVkIGludCBjaGFubmVscywg
b2ZmX3QgY291bnQsIGludCBydHlwZSwgY2hhciAqKm5hbWVzKQotIHsKLSAJc2l6ZV90IGM7Ci0g
CXNzaXplX3QgcjsKLWRpZmYgLS1naXQgYS9heGZlci9jb250YWluZXItdm9jLmMgYi9heGZlci9j
b250YWluZXItdm9jLmMKLWluZGV4IGVjMGNmZmYuLjU5NDEwMDMgMTAwNjQ0Ci0tLS0gYS9heGZl
ci9jb250YWluZXItdm9jLmMKLSsrKyBiL2F4ZmVyL2NvbnRhaW5lci12b2MuYwotQEAgLTc3NSw3
ICs3NzUsNyBAQCBzdGF0aWMgaW50IHdyaXRlX2Jsb2NrX3Rlcm1pbmF0b3Ioc3RydWN0IGNvbnRh
aW5lcl9jb250ZXh0ICpjbnRyKQotIHN0YXRpYyBpbnQgd3JpdGVfZGF0YV9zaXplKHN0cnVjdCBj
b250YWluZXJfY29udGV4dCAqY250ciwgdWludDY0X3QgYnl0ZV9jb3VudCkKLSB7Ci0gCXN0cnVj
dCBidWlsZGVyX3N0YXRlICpzdGF0ZSA9IGNudHItPnByaXZhdGVfZGF0YTsKLS0Jb2ZmNjRfdCBv
ZmZzZXQ7Ci0rCW9mZl90IG9mZnNldDsKLSAJdWludDhfdCBzaXplX2ZpZWxkWzNdOwotIAlpbnQg
ZXJyOwotIAotZGlmZiAtLWdpdCBhL2F4ZmVyL2NvbnRhaW5lci5jIGIvYXhmZXIvY29udGFpbmVy
LmMKLWluZGV4IDhjODhkNWMuLjM3OWI3MmYgMTAwNjQ0Ci0tLS0gYS9heGZlci9jb250YWluZXIu
YwotKysrIGIvYXhmZXIvY29udGFpbmVyLmMKLUBAIC0xMTMsMTEgKzExMywxMSBAQCBlbnVtIGNv
bnRhaW5lcl9mb3JtYXQgY29udGFpbmVyX2Zvcm1hdF9mcm9tX3BhdGgoY29uc3QgY2hhciAqcGF0
aCkKLSAJcmV0dXJuIENPTlRBSU5FUl9GT1JNQVRfUkFXOwotIH0KLSAKLS1pbnQgY29udGFpbmVy
X3NlZWtfb2Zmc2V0KHN0cnVjdCBjb250YWluZXJfY29udGV4dCAqY250ciwgb2ZmNjRfdCBvZmZz
ZXQpCi0raW50IGNvbnRhaW5lcl9zZWVrX29mZnNldChzdHJ1Y3QgY29udGFpbmVyX2NvbnRleHQg
KmNudHIsIG9mZl90IG9mZnNldCkKLSB7Ci0tCW9mZjY0X3QgcG9zOwotKwlvZmZfdCBwb3M7Ci0g
Ci0tCXBvcyA9IGxzZWVrNjQoY250ci0+ZmQsIG9mZnNldCwgU0VFS19TRVQpOwotKwlwb3MgPSBs
c2VlayhjbnRyLT5mZCwgb2Zmc2V0LCBTRUVLX1NFVCk7Ci0gCWlmIChwb3MgPCAwKQotIAkJcmV0
dXJuIC1lcnJubzsKLSAJaWYgKHBvcyAhPSBvZmZzZXQpCi1kaWZmIC0tZ2l0IGEvYXhmZXIvY29u
dGFpbmVyLmggYi9heGZlci9jb250YWluZXIuaAotaW5kZXggNzEwMTdhNi4uZjZjZTY4OSAxMDA2
NDQKLS0tLSBhL2F4ZmVyL2NvbnRhaW5lci5oCi0rKysgYi9heGZlci9jb250YWluZXIuaAotQEAg
LTEwNyw3ICsxMDcsNyBAQCBpbnQgY29udGFpbmVyX3JlY3Vyc2l2ZV9yZWFkKHN0cnVjdCBjb250
YWluZXJfY29udGV4dCAqY250ciwgdm9pZCAqYnVmLAotIAkJCSAgICAgdW5zaWduZWQgaW50IGJ5
dGVfY291bnQpOwotIGludCBjb250YWluZXJfcmVjdXJzaXZlX3dyaXRlKHN0cnVjdCBjb250YWlu
ZXJfY29udGV4dCAqY250ciwgdm9pZCAqYnVmLAotIAkJCSAgICAgIHVuc2lnbmVkIGludCBieXRl
X2NvdW50KTsKLS1pbnQgY29udGFpbmVyX3NlZWtfb2Zmc2V0KHN0cnVjdCBjb250YWluZXJfY29u
dGV4dCAqY250ciwgb2ZmNjRfdCBvZmZzZXQpOwotK2ludCBjb250YWluZXJfc2Vla19vZmZzZXQo
c3RydWN0IGNvbnRhaW5lcl9jb250ZXh0ICpjbnRyLCBvZmZfdCBvZmZzZXQpOwotIAotIGV4dGVy
biBjb25zdCBzdHJ1Y3QgY29udGFpbmVyX3BhcnNlciBjb250YWluZXJfcGFyc2VyX3JpZmZfd2F2
ZTsKLSBleHRlcm4gY29uc3Qgc3RydWN0IGNvbnRhaW5lcl9idWlsZGVyIGNvbnRhaW5lcl9idWls
ZGVyX3JpZmZfd2F2ZTsKLWRpZmYgLS1naXQgYS9heGZlci90ZXN0L2NvbnRhaW5lci10ZXN0LmMg
Yi9heGZlci90ZXN0L2NvbnRhaW5lci10ZXN0LmMKLWluZGV4IGU1YjYyZGQuLjQ1YjZjNmEgMTAw
NjQ0Ci0tLS0gYS9heGZlci90ZXN0L2NvbnRhaW5lci10ZXN0LmMKLSsrKyBiL2F4ZmVyL3Rlc3Qv
Y29udGFpbmVyLXRlc3QuYwotQEAgLTE1Myw3ICsxNTMsNyBAQCBzdGF0aWMgaW50IGNhbGxiYWNr
KHN0cnVjdCB0ZXN0X2dlbmVyYXRvciAqZ2VuLCBzbmRfcGNtX2FjY2Vzc190IGFjY2VzcywKLSAK
LSAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZW50cmllcyk7ICsraSkgewotIAkJaW50IGZk
OwotLQkJb2ZmNjRfdCBwb3M7Ci0rCQlvZmZfdCBwb3M7Ci0gCi0gCQlmcmFtZXNfcGVyX3NlY29u
ZCA9IGVudHJpZXNbaV07Ci0gCi1AQCAtMTcyLDcgKzE3Miw3IEBAIHN0YXRpYyBpbnQgY2FsbGJh
Y2soc3RydWN0IHRlc3RfZ2VuZXJhdG9yICpnZW4sIHNuZF9wY21fYWNjZXNzX3QgYWNjZXNzLAot
IAkJCSAgICAgZnJhbWVzX3Blcl9zZWNvbmQsIGZyYW1lX2J1ZmZlciwgZnJhbWVfY291bnQsCi0g
CQkJICAgICB0cmlhbC0+dmVyYm9zZSk7Ci0gCi0tCQlwb3MgPSBsc2VlazY0KGZkLCAwLCBTRUVL
X1NFVCk7Ci0rCQlwb3MgPSBsc2VlayhmZCwgMCwgU0VFS19TRVQpOwotIAkJaWYgKHBvcyA8IDAp
IHsKLSAJCQllcnIgPSAtZXJybm87Ci0gCQkJYnJlYWs7Ci1kaWZmIC0tZ2l0IGEvYXhmZXIvdGVz
dC9tYXBwZXItdGVzdC5jIGIvYXhmZXIvdGVzdC9tYXBwZXItdGVzdC5jCi1pbmRleCA0Nzc4NzFk
Li42YTM4OWU5IDEwMDY0NAotLS0tIGEvYXhmZXIvdGVzdC9tYXBwZXItdGVzdC5jCi0rKysgYi9h
eGZlci90ZXN0L21hcHBlci10ZXN0LmMKLUBAIC0yNTcsNyArMjU3LDcgQEAgc3RhdGljIGludCB0
ZXN0X21hcHBlcihzdHJ1Y3QgbWFwcGVyX3RyaWFsICp0cmlhbCwgc25kX3BjbV9hY2Nlc3NfdCBh
Y2Nlc3MsCi0gCQlnb3RvIGVuZDsKLSAKLSAJZm9yIChpID0gMDsgaSA8IGNudHJfY291bnQ7ICsr
aSkgewotLQkJb2ZmNjRfdCBwb3MgPSBsc2VlazY0KGNudHJfZmRzW2ldLCAwLCBTRUVLX1NFVCk7
Ci0rCQlvZmZfdCBwb3MgPSBsc2VlayhjbnRyX2Zkc1tpXSwgMCwgU0VFS19TRVQpOwotIAkJaWYg
KHBvcyAhPSAwKSB7Ci0gCQkJZXJyID0gLUVJTzsKLSAJCQlnb3RvIGVuZDsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuOC5iYiBiL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGlsc18xLjIuOS5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRp
bHNfMS4yLjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11
dGlsc18xLjIuOS5iYgppbmRleCA0NmQzOWIwZGU4Li5lOWZkMzgyYTE4IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRpbHNfMS4yLjguYmIKKysrIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLXV0aWxzXzEuMi45LmJiCkBAIC0yNCwxMCAr
MjQsOCBAQCBQQUNLQUdFQ09ORklHW3VkZXZdID0gIi0td2l0aC11ZGV2LXJ1bGVzLWRpcj1gcGtn
LWNvbmZpZyAtLXZhcmlhYmxlPXVkZXZkaXIgdWRldgogUEFDS0FHRUNPTkZJR1ttYW5wYWdlc10g
PSAiLS1lbmFibGUteG1sdG8sIC0tZGlzYWJsZS14bWx0bywgeG1sdG8tbmF0aXZlIGRvY2Jvb2st
eG1sLWR0ZDQtbmF0aXZlIGRvY2Jvb2steHNsLXN0eWxlc2hlZXRzLW5hdGl2ZSIKIAogIyBhbHNh
LXV0aWxzIHNwZWNpZmllZCBpbiBTUkNfVVJJIGR1ZSB0byBhbHNhLXV0aWxzLXNjcmlwdHMgcmVj
aXBlCi1TUkNfVVJJID0gImh0dHBzOi8vd3d3LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHViL3V0
aWxzL2Fsc2EtdXRpbHMtJHtQVn0udGFyLmJ6MiBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWFw
bGF5LWF4ZmVyLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoIFwKLSAgICAgICAgICAg
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUxNDBmYTYwNGMzNTFmMzZiZDcyMTY3Yzg4NjBjNjlk
ODFiOTY0YWU2YWI1Mzk5MmQ2NDM0ZGRlMzhlOTMzM2MiCitTUkNfVVJJID0gImh0dHBzOi8vd3d3
LmFsc2EtcHJvamVjdC5vcmcvZmlsZXMvcHViL3V0aWxzL2Fsc2EtdXRpbHMtJHtQVn0udGFyLmJ6
MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNzYyM2Q0NTI1NTk1ZjkyZTExY2UyNWVlOWE5N2Yy
MDQwYTE0YzZlNGRjZDAyN2FhOTZlMDZjYmNlNzgxN2JkIgogCiAjIE9uIGJ1aWxkIG1hY2hpbmVz
IHdpdGggcHl0aG9uLWRvY3V0aWxzIChub3QgcHl0aG9uMy1kb2N1dGlscyAhISkgaW5zdGFsbGVk
CiAjIHJzdDJtYW4gKG5vdCByc3QybWFuLnB5KSBpcyBkZXRlY3RlZCBhbmQgY29tcGlsZSBmYWls
cyB3aXRoCi0tIAoyLjM5LjIKCg==

--===============0786312061074778848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2ff64f84607fa6da7e9165c63d6475cf9e1cbb44"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 147 Local 139 Mirrors 0 Missed 8 Current 305 (94% match, 98% complete)
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1346 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_fetch)
NOTE: recipe alsa-utils-1.2.9-r0: task do_fetch: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_fetch: Succeeded
NOTE: Running task 1625 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_unpack)
NOTE: Running task 1626 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-utils-1.2.9-r0: task do_unpack: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 1627 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_patch)
NOTE: recipe alsa-utils-1.2.9-r0: task do_patch: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-utils-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 1628 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1629 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_populate_lic)
NOTE: recipe alsa-utils-1.2.9-r0: task do_populate_lic: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_populate_lic: Succeeded
NOTE: recipe alsa-utils-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1630 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_configure)
NOTE: recipe alsa-utils-1.2.9-r0: task do_configure: Started
NOTE: recipe alsa-utils-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 1631 of 1639 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_compile)
NOTE: recipe alsa-utils-1.2.9-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| Making all in include
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| make  all-am
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| Updating version.h
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/include'
| Making all in alsactl
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| Making all in init
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl/init'
| make[2]: Nothing to be done for 'all'.
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl/init'
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-alsactl.o `test -f 'alsactl.c' || echo '../../alsa-utils-1.2.9/alsactl/'`alsactl.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-state.o `test -f 'state.c' || echo '../../alsa-utils-1.2.9/alsactl/'`state.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-lock.o `test -f 'lock.c' || echo '../../alsa-utils-1.2.9/alsactl/'`lock.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-utils.o `test -f 'utils.c' || echo '../../alsa-utils-1.2.9/alsactl/'`utils.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-init_parse.o `test -f 'init_parse.c' || echo '../../alsa-utils-1.2.9/alsactl/'`init_parse.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-init_ucm.o `test -f 'init_ucm.c' || echo '../../alsa-utils-1.2.9/alsactl/'`init_ucm.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-daemon.o `test -f 'daemon.c' || echo '../../alsa-utils-1.2.9/alsactl/'`daemon.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-monitor.o `test -f 'monitor.c' || echo '../../alsa-utils-1.2.9/alsactl/'`monitor.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-clean.o `test -f 'clean.c' || echo '../../alsa-utils-1.2.9/alsactl/'`clean.c
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.9/alsactl -I../include    -D_GNU_SOURCE -D__USE_GNU -DSYS_ASOUNDRC=\"/var/lib/alsa/asound.state\" -DSYS_LOCKPATH=\"/var/lock\" -DSYS_LOCKFILE=\"asound.state.lock\" -DSYS_PIDFILE=\"/var/run/alsactl.pid\" -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/alsa-utils-1.2.9=/usr/src/debug/alsa-utils/1.2.9-r0  -fmacro-prefix-map=/home/pokybuild/yocto-wor
 ker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build=/usr/src/debug/alsa-utils/1.2.9-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/recipe-sysroot-native=  -c -o alsactl-info.o `test -f 'info.c' || echo '../../alsa-utils-1.2.9/alsactl/'`info.c
| sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' < ../../alsa-utils-1.2.9/alsactl/alsa-state.service.in > alsa-state.service || rm alsa-state.service
| sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' < ../../alsa-utils-1.2.9/alsactl/alsa-restore.service.in > alsa-restore.service || rm alsa-restore.service
| sed -r -e 's,@sbindir\@,/usr/sbin,g' -e 's,@mydatadir\@,/usr/share/alsa,g' -e 's,@daemonswitch\@,/etc/alsa/state-daemon.conf,g' -e 's,@asoundrcfile\@,/var/lib/alsa/asound.state,g' < ../../alsa-utils-1.2.9/alsactl/90-alsa-restore.rules.in > 90-alsa-restore.rules || rm 90-alsa-restore.rules
| ../../alsa-utils-1.2.9/alsactl/alsactl.c:33:10: fatal error: os_compat.h: No such file or directory
|    33 | #include "os_compat.h"
|       |          ^~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [Makefile:615: alsactl-alsactl.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| ../../alsa-utils-1.2.9/alsactl/lock.c:34:10: fatal error: os_compat.h: No such file or directory
|    34 | #include "os_compat.h"
|       |          ^~~~~~~~~~~~~
| compilation terminated.
| make[2]: *** [Makefile:643: alsactl-lock.o] Error 1
| ../../alsa-utils-1.2.9/alsactl/utils.c: In function 'initfailed':
| ../../alsa-utils-1.2.9/alsactl/utils.c:94:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    94 |         (void)write(fp, str, strlen(str));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:95:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    95 |         (void)write(fp, ":", 1);
|       |               ^~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:96:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    96 |         (void)write(fp, reason, strlen(reason));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:97:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    97 |         (void)write(fp, ":", 1);
|       |               ^~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:98:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    98 |         (void)write(fp, sexitcode, strlen(sexitcode));
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../alsa-utils-1.2.9/alsactl/utils.c:99:15: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
|    99 |         (void)write(fp, "\n", 1);
|       |               ^~~~~~~~~~~~~~~~~~
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/build/alsactl'
| make[1]: *** [Makefile:891: all-recursive] Error 1
| make: *** [Makefile:457: all-recursive] Error 1
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531, line 183
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531, line 167
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531, line 162
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531, line 157
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531, line 152
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531, line 196
NOTE: recipe alsa-utils-1.2.9-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1631 tasks of which 1623 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: alsa-utils-1.2.9-r0 do_compile: oe_runmake failed
ERROR: alsa-utils-1.2.9-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/run.do_compile.1257531', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/alsa-utils/1.2.9-r0/temp/log.do_compile.1257531
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb:do_compile) failed with exit code '1'

--===============0786312061074778848==--

