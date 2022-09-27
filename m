Return-Path: <robert_henz@jabil.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0537C32771
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 01:31:00 +0000 (UTC)
Subject: Re: PR to fix WantedBy parsing of systemctl
To: openembedded-core@lists.openembedded.org
From: "Robert Henz" <robert_henz@jabil.com>
X-Originating-Location: Versailles, Kentucky, US (217.180.201.84)
X-Originating-Platform: Linux Firefox 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 Sep 2022 18:30:56 -0700
References: 
 <CA+chaQfvo9FLBja8sgZiR_oCR5_e0nds-HzLjRt89b_gLF7UzA@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfvo9FLBja8sgZiR_oCR5_e0nds-HzLjRt89b_gLF7UzA@mail.gmail.com>
Message-ID: <1246.1664242256581127666@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="opPWwonVhrQKIWbb1hEn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 01:31:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171081

--opPWwonVhrQKIWbb1hEn
Content-Type: multipart/alternative; boundary="V45B5ZlyVpz1EpF6FXVA"

--V45B5ZlyVpz1EpF6FXVA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have confirmed your patch worked for me. Perhaps the documentation should=
 also be updated to indicate that remotes need to be cloned/added using the=
 https protocol?

I still can't send the resulting two files via git send-email (the final st=
ep), as I would have to do a significant amount of configuration in my _per=
sonal_ gmail account in order to use git send-email to send the final patch=
. I will attach the resulting two files here and perhaps that will be suffi=
cient for someone to begin reviewing my actual PR.

Thanks,
Bob

--V45B5ZlyVpz1EpF6FXVA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I have confirmed your patch worked for me. Perhaps the documentation sho=
uld also be updated to indicate that remotes need to be cloned/added using =
the https protocol?<br /><br />I still can't send the resulting two files v=
ia git send-email (the final step), as I would have to do a significant amo=
unt of configuration in my _personal_ gmail account in order to use git sen=
d-email to send the final patch. I will attach the resulting two files here=
 and perhaps that will be sufficient for someone to begin reviewing my actu=
al PR.<br /><br />Thanks,<br />Bob</p>

--V45B5ZlyVpz1EpF6FXVA--

--opPWwonVhrQKIWbb1hEn
Content-Type: text/x-patch; name="0000-cover-letter.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0000-cover-letter.patch"

RnJvbSBiNjM3YTQ2ZjU4YjVhZGM3ZGNjNzZiZGVmOTBhN2JlOGM4NDYyZGY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8Y292ZXIuMTY2NDI0MDA4MS5naXQucm9iZXJ0X2hl
bnpAamFiaWwuY29tPgpGcm9tOiBCb2IgSGVueiA8cm9iZXJ0X2hlbnpAamFiaWwuY29tPgpEYXRl
OiBNb24sIDI2IFNlcCAyMDIyIDIwOjU0OjQxIC0wNDAwClN1YmplY3Q6IFtQQVRDSCAwLzFdIEZp
eCBXYW50ZWRCeSBwcm9jZXNzaW5nCgpBbiBlbXB0eSBzdHJpbmcgYXNzaWdubWVudCB0byBXYW50
ZWRCeSBzaG91bGQgY2xlYXIgYWxsIHByaW9yIFdhbnRlZEJ5CnNldHRpbmdzLiBUaGlzIG1hdGNo
ZXMgYmVoYXZpb3Igb2YgdGhlIGN1cnJlbnQgc3lzdGVtZCBpbXBsZW1lbnRhdGlvbi4KV2hlbiB1
c2luZyBzeXN0ZW1kIGRyb3AtaW4gZmlsZXMgKGluc3RlYWQgb2YgcGF0Y2hpbmcgcHVibGlzaGVk
Ci5zZXJ2aWNlIGZpbGVzKSB0aGlzIGNoYW5nZSBiZWNvbWVzIGVzcGVjaWFsbHkgaW1wb3J0YW50
LgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2OGIwN2JiN2YwZjAxOTI1Zjlk
YTFjYjk2NjIzOWVlNDlkNWM4NGUzOgoKICBsdHRuZy10b29sczogRGlzYWJsZSBvbiBxZW11cmlz
Y3YzMiAoMjAyMi0wOS0yNiAxNTowODozMiArMDEwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKICBodHRwczovL2dpdGh1Yi5jb20vQmFkZ2VyVGVjaG5vbG9naWVz
L29wZW5lbWJlZGRlZC1jb3JlIGZpeC13YW50ZWRieS1jbGVhcmluZwogIGh0dHBzOi8vZ2l0aHVi
LmNvbS9CYWRnZXJUZWNobm9sb2dpZXMvb3BlbmVtYmVkZGVkLWNvcmUvdHJlZS9maXgtd2FudGVk
YnktY2xlYXJpbmcKCkJvYiBIZW56ICgxKToKICBGaXggV2FudGVkQnkgcHJvY2Vzc2luZwoKIG1l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0ZW1jdGwvc3lzdGVtY3RsIHwgMTEg
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgotLSAKMi4yNS4x
Cgo=

--opPWwonVhrQKIWbb1hEn
Content-Type: text/x-patch; name="0001-Fix-WantedBy-processing.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-Fix-WantedBy-processing.patch"

RnJvbSBiNjM3YTQ2ZjU4YjVhZGM3ZGNjNzZiZGVmOTBhN2JlOGM4NDYyZGY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpNZXNzYWdlLUlkOiA8YjYzN2E0NmY1OGI1YWRjN2RjYzc2YmRlZjkwYTdi
ZThjODQ2MmRmOC4xNjY0MjQwMDgxLmdpdC5yb2JlcnRfaGVuekBqYWJpbC5jb20+CkluLVJlcGx5
LVRvOiA8Y292ZXIuMTY2NDI0MDA4MS5naXQucm9iZXJ0X2hlbnpAamFiaWwuY29tPgpSZWZlcmVu
Y2VzOiA8Y292ZXIuMTY2NDI0MDA4MS5naXQucm9iZXJ0X2hlbnpAamFiaWwuY29tPgpGcm9tOiBC
b2IgSGVueiA8cm9iZXJ0X2hlbnpAamFiaWwuY29tPgpEYXRlOiBNb24sIDE5IFNlcCAyMDIyIDIy
OjAyOjU4IC0wNDAwClN1YmplY3Q6IFtQQVRDSCAxLzFdIEZpeCBXYW50ZWRCeSBwcm9jZXNzaW5n
CgpBbiBlbXB0eSBzdHJpbmcgYXNzaWdubWVudCB0byBXYW50ZWRCeSBzaG91bGQgY2xlYXIgYWxs
IHByaW9yIFdhbnRlZEJ5CnNldHRpbmdzLiBUaGlzIG1hdGNoZXMgYmVoYXZpb3Igb2YgdGhlIGN1
cnJlbnQgc3lzdGVtZCBpbXBsZW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEJvYiBIZW56IDxy
b2JlcnRfaGVuekBqYWJpbC5jb20+Ci0tLQogbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0
ZW1kLXN5c3RlbWN0bC9zeXN0ZW1jdGwgfCAxMSArKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1k
L3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0bCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZC1zeXN0ZW1jdGwvc3lzdGVtY3RsCmluZGV4IDZkMTk2NjZkODIuLmNkZGFlNzVhMDYg
MTAwNzU1Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0ZW1jdGwv
c3lzdGVtY3RsCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1zeXN0ZW1j
dGwvc3lzdGVtY3RsCkBAIC0yNiw2ICsyNiw5IEBAIGxvY2F0aW9ucyA9IGxpc3QoKQogCiBjbGFz
cyBTeXN0ZW1kRmlsZSgpOgogICAgICIiIkNsYXNzIHJlcHJlc2VudGluZyBhIHNpbmdsZSBzeXN0
ZW1kIGNvbmZpZ3VyYXRpb24gZmlsZSIiIgorCisgICAgX2NsZWFyYWJsZV9rZXlzID0gWydXYW50
ZWRCeSddCisKICAgICBkZWYgX19pbml0X18oc2VsZiwgcm9vdCwgcGF0aCwgaW5zdGFuY2VfdW5p
dF9uYW1lKToKICAgICAgICAgc2VsZi5zZWN0aW9ucyA9IGRpY3QoKQogICAgICAgICBzZWxmLl9w
YXJzZShyb290LCBwYXRoKQpAQCAtODAsNiArODMsMTQgQEAgY2xhc3MgU3lzdGVtZEZpbGUoKToK
ICAgICAgICAgICAgICAgICB2ID0gbS5ncm91cCgndmFsdWUnKQogICAgICAgICAgICAgICAgIGlm
IGsgbm90IGluIHNlY3Rpb246CiAgICAgICAgICAgICAgICAgICAgIHNlY3Rpb25ba10gPSBsaXN0
KCkKKworICAgICAgICAgICAgICAgICMgSWYgd2UgY29tZSBhY3Jvc3MgYSAia2V5PSIgbGluZSBm
b3IgYSAiY2xlYXJhYmxlIGtleSIsIHRoZW4KKyAgICAgICAgICAgICAgICAjIGZvcmdldCBhbGwg
cHJlY2VkaW5nIGFzc2lnbm1lbnRzLiBUaGlzIHdvcmtzIGJlY2F1c2Ugd2UgYXJlCisgICAgICAg
ICAgICAgICAgIyBwcm9jZXNzaW5nIGZpbGVzIGluIGNvcnJlY3QgcGFyc2Ugb3JkZXIuCisgICAg
ICAgICAgICAgICAgaWYgayBpbiBzZWxmLl9jbGVhcmFibGVfa2V5cyBhbmQgbm90IHY6CisgICAg
ICAgICAgICAgICAgICAgIGRlbCBzZWN0aW9uW2tdCisgICAgICAgICAgICAgICAgICAgIGNvbnRp
bnVlCisKICAgICAgICAgICAgICAgICBzZWN0aW9uW2tdLmV4dGVuZCh2LnNwbGl0KCkpCiAKICAg
ICBkZWYgZ2V0KHNlbGYsIHNlY3Rpb24sIHByb3ApOgotLSAKMi4yNS4xCgo=

--opPWwonVhrQKIWbb1hEn--

