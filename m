Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901FAC88E42
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 06:54:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33714.1789109661330022164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 23:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Sgx63ZDe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XcImId4Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a08f3eebc1-dca7901a-5b4c-45be-82f6-facc954b45d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789109660;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w5Kf4y55gs8JYq7AjyXbyfJoK2mKHtKT6y5/Cha0B0w=;
	b=Sgx63ZDeDdhSWDdBJUWzCCotHNSrJpHGN8b37WvXYNcZV8EQ/pUH90dDHmI2H4BB
	ytNBXgK8d9Tf653k5mJuLgWxmOHCh/diskmk/xMGyHSWTp7HRtR3/jWjqAIeR3YnmuH
	c64ljsx85USHNkl9x58sJdeAyknlQFV+MaK2LYNI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789109660;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w5Kf4y55gs8JYq7AjyXbyfJoK2mKHtKT6y5/Cha0B0w=;
	b=XcImId4Qa0sTqPjnbDlU/uX0zSZGTKRasfh3TxhfjmECSlcEwsJbdsl2cXyzyrMB
	XkRsuewcpp0jLjSriiL6rVKkRLUHvDZczQQ2eQIgdgNJz8BxvXkAK7nMEJSQBeoIGby
	7VK7QMee7Wyciv1qTlfqCIF6emAzbSg5z0bimo8A=
Content-Type: multipart/mixed; boundary="===============4702380008103129788=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.22.5 SUCCEEDED
Message-ID: <010101a08f3eebc1-dca7901a-5b4c-45be-82f6-facc954b45d7-000000@us-west-2.amazonses.com>
Date: Fri, 11 Sep 2026 06:54:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 06:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245612

--===============4702380008103129788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpndGs0KiB0byAqNC4yMi41KiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBzdGVwczoKICAgIC0g
YXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1ndGs0LXVwZ3JhZGUtNC4yMi40LTQuMjIuNS5w
YXRjaAogICAgLSBjaGVjayB0aGUgY2hhbmdlcyB0byB1cHN0cmVhbSBwYXRjaGVzIGFuZCBzdW1t
YXJpemUgdGhlbSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsCiAgICAtIGNvbXBpbGUgYW4gaW1hZ2Ug
dGhhdCBjb250YWlucyB0aGUgcGFja2FnZQogICAgLSBwZXJmb3JtIHNvbWUgYmFzaWMgc2FuaXR5
IHRlc3RzCiAgICAtIGFtZW5kIHRoZSBwYXRjaCBhbmQgc2lnbiBpdCBvZmY6IGdpdCBjb21taXQg
LXMgLS1yZXNldC1hdXRob3IgLS1hbWVuZAogICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0
ZSBtYWlsaW5nIGxpc3QKCkFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUg
c2hvdWxkIG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsCnlvdSBjYW4gZmlsbCBSRUNJUEVf
Tk9fVVBEQVRFX1JFQVNPTiBpbiByZXNwZWN0aXZlIHJlY2lwZSBmaWxlIHNvIHRoYXQKYXV0b21h
dGljIHVwZ3JhZGVzIHdvdWxkIG5vIGxvbmdlciBiZSBhdHRlbXB0ZWQuCgpQbGVhc2UgcmV2aWV3
IHRoZSBhdHRhY2hlZCBmaWxlcyBmb3IgZnVydGhlciBpbmZvcm1hdGlvbiBhbmQgYnVpbGQvdXBk
YXRlIGZhaWx1cmVzLgpBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBodHRwczovL2J1
Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvZW50ZXJfYnVnLmNnaT9wcm9kdWN0PUF1dG9tYXRlZCUy
MFVwZGF0ZSUyMEhhbmRsZXIKClJlZ2FyZHMsClRoZSBVcGdyYWRlIEhlbHBlcgoKLS0gPjggLS0K
RnJvbSA5YTk5YmRkNzA3NTlhZmEyMDIyNWI0ZmE2NTkyYTQ3NzJkYzg2MGJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTEgU2VwIDIwMjYgMDY6NDY6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjIuNCAtPiA0LjIyLjUKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKClNvdXJjZTogTkVXUwoKT3ZlcnZpZXcgb2YgQ2hhbmdlcyBpbiA0LjIyLjUsIDA5LTA5
IDIwMjYKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCiogQnVncyBm
aXhlZDoKICAtICM4MDk4IENyYXNoZXMgd2l0aCBTSUdTRUdWIGluIGBnZGtfd2F5bGFuZF90b3Bs
ZXZlbF9yZW1vdmVfZnJvbV9zZXNzaW9uKClgCiAgICAoUGhpbGlwIFdpdGhuYWxsKQogIC0gIzgy
MjIgZ3RrIDQuMjIuNCBmYWlscyB0byBidWlsZCBvbiAzMi1iaXQgYXJtIChvcmVvNjM5KQogIC0g
IzgzMDQgQ3NzIHRleHQtZGVjb3JhdGlvbiBydWxlIHJlcXVpcmVzIGEgcmVzaXplIHRvIHRha2Ug
ZWZmZWN0IChyZWdyZXNzaW9uKQogICAgKE1hdHRoaWFzIENsYXNlbikKICAtICE5NTM4IHdpbmRv
dzogRml4dXAgcG9pbnRlciBmb2N1cyB3aGVuIHVubWFwcGluZyBhIHBvcG92ZXIgKEFsZXNzYW5k
cm8KICAgIEFzdG9uZSkKICAtICE5ODg2IFVwZGF0ZSBTbG92YWsgdHJhbnNsYXRpb24KICAtICE5
ODkzIFVwZGF0ZSBQZXJzaWFuIHRyYW5zbGF0aW9uCiAgLSAhOTkwNSBbNC4yMl0gZ3B1OiBUcmln
Z2VyIGNhY2hlIEdDIGZyb20gZG1hYnVmIGRvd25sb2FkaW5nIGNvZGUgKEJlbmphbWluCiAgICBP
dHRlKQogIC0gITk5MTIgVXBkYXRlIExpdGh1YW5pYW4gdHJhbnNsYXRpb24KICAtICE5OTg5IGdz
a3Z1bGthbmltYWdlOiBmaXggYnVpbGRpbmcgb24gMzItYml0IChvcmVvNjM5KQogIC0gITEwMDEx
IFVwZGF0ZSBCYXNxdWUgdHJhbnNsYXRpb24KICAtICExMDA3MyBVcGRhdGUgQmVsYXJ1c2lhbiB0
cmFuc2xhdGlvbgogIC0gITEwMDc4IFVwZGF0ZSBQb2xpc2ggdHJhbnNsYXRpb24KICAtICExMDA4
MCBSZXZlcnQgImZpbGVjaG9vc2VydXRpbHM6IFN0b3AgdXNpbmcgcGl4YnVmcyIgKEp1bGlhbiBP
cnRoKQogIC0gITEwMDgxIFVwZGF0ZSBQb2xpc2ggdHJhbnNsYXRpb24KICAtICExMDA4NiBGaXgg
dGhlIGJ1aWxkIHdpdGggcGFuZ28gbWFpbiAoTWF0dGhpYXMgQ2xhc2VuKQogIC0gITEwMDkwIGds
OiBBY3R1YWxseSByZXBvcnQgcGFydGlhbCBkYW1hZ2UgKEJlbmphbWluIE90dGUpCiAgLSAhMTAw
OTIgZ2w6IEFjdHVhbGx5IHJlcG9ydCBwYXJ0aWFsIGRhbWFnZSAoQmVuamFtaW4gT3R0ZSkKICAt
ICExMDEwMSBndGthcHBsaWNhdGlvbi13YXlsYW5kOiBBZGQgYSBtaXNzaW5nIE5VTEwgY2hlY2sg
d2hlbiBmb3JnZXR0aW5nIGEKICAgIHdpbmRvdyAoUGhpbGlwIFdpdGhuYWxsKQogIC0gITEwMTI5
IGNzczogRml4IGludmFsaWRhdGlvbiBmb3IgdGV4dCBkZWNvcmF0aW9ucyAoTWF0dGhpYXMgQ2xh
c2VuKQogIC0gITEwMTM1IFVwZGF0ZSBGcmVuY2ggdHJhbnNsYXRpb24KICAtICExMDEzNiBVcGRh
dGUgRnJlbmNoIHRyYW5zbGF0aW9uCiAgLSAhMTAxNjYgd2F5bGFuZDogRml4IG11bm1hcCgpIG9m
IHRoZSB3cm9uZyBwb2ludGVyIGluIHRoZSBkbWFidWYgZm9ybWF0IHRhYmxlCiAgICAoQmVuamFt
aW4gT3R0ZSkKICAtICExMDMwNSB3YXlsYW5kOiBGaXggbXVubWFwKCkgb2YgdGhlIHdyb25nIHBv
aW50ZXIgaW4gdGhlIGRtYWJ1ZiBmb3JtYXQgdGFibGUKICAgIChCZW5qYW1pbiBPdHRlKQogIC0g
ITEwMzI2IDQuMjI6IEZpeCBDSSAoQmVuamFtaW4gT3R0ZSkKICAtICExMDMyNyBhbmRyb2lkOiBG
aXggb3RoZXIgWE1MIGZpbGUsIHRvbyAoQmVuamFtaW4gT3R0ZSkKICAtICExMDM0NiBtZW1vcnlj
b252ZXJ0OiBQYXNzIHRoZSBjb3JyZWN0IHBvaW50ZXIgYWRkcmVzcyAoQmVuamFtaW4gT3R0ZSkK
ICAtICExMDM0NyBtZW1vcnljb252ZXJ0OiBQYXNzIHRoZSBjb3JyZWN0IHBvaW50ZXIgYWRkcmVz
cyAoQmVuamFtaW4gT3R0ZSkKICAtICExMDM1NSBjaTogQWxsb3cgbWFjb3MtYXJtNjQgdG8gZmFp
bCAoTWF0dGhpYXMgQ2xhc2VuKQoKKiBUcmFuc2xhdGlvbiB1cGRhdGVzOgogIC0gQmFzcXVlIChB
c2llciBTYXJhdHN1YSBHYXJtZW5kaWEpCiAgLSBCZWxhcnVzaWFuIChWYXNpbCBQdXBraW4pCiAg
LSBGcmVuY2ggKEd1aWxsYXVtZSBCZXJuYXJkKQogIC0gTGl0aHVhbmlhbiAoQXVyaW1hcyBBdXJp
bWFzIMSMZXJuaXVzKQogIC0gUGVyc2lhbiAoRGFuaWFsIEJlaHphZGkpCiAgLSBQb2xpc2ggKFZp
Y3RvcmlhIE5pZWR6aWVsc2thKQogIC0gU2xvdmFrIChKb3NlIFJpaGEpCi0tLQogbWV0YS9yZWNp
cGVzLWdub21lL2d0aysve2d0azRfNC4yMi40LmJiID0+IGd0azRfNC4yMi41LmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL3tndGs0XzQuMjIuNC5iYiA9PiBndGs0XzQuMjIuNS5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuNC5i
YiBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi41LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuNS5iYgppbmRleCAx
ZDJlNGJmOWI4Li41ZDczODVkMjlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky9ndGs0XzQuMjIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIu
NS5iYgpAQCAtMzMsNyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTov
L3Rlc3RzL3Rlc3RndGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQx
OWQyOWZiMiBcCiAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjUxYmQ5ZjYwYzdk
MjNhNjY1YTU1NmM3MzY0YzIxZmIyZTRlMjgyNTY2YjNlN2UwOTI0NTVlOGY5MTAzMzA4OTMiCitT
UkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI3ZmQ3MjVkZWIyY2IzZjhkYzIxOGFkODYyYzUw
NTZmZjg1NDhmNDlkM2IwZTQwODE3OTZlNDQ0YzIyZDE5Njg2IgogCiBTID0gIiR7VU5QQUNLRElS
fS8ke0dOT01FQk59LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============4702380008103129788==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.22.4-4.22.5.patch"

RnJvbSA5YTk5YmRkNzA3NTlhZmEyMDIyNWI0ZmE2NTkyYTQ3NzJkYzg2MGJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTEgU2VwIDIwMjYgMDY6NDY6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjIuNCAtPiA0LjIyLjUKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKClNvdXJjZTogTkVXUwoKT3ZlcnZpZXcgb2YgQ2hhbmdlcyBpbiA0LjIyLjUsIDA5LTA5
IDIwMjYKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KCiogQnVncyBm
aXhlZDoKICAtICM4MDk4IENyYXNoZXMgd2l0aCBTSUdTRUdWIGluIGBnZGtfd2F5bGFuZF90b3Bs
ZXZlbF9yZW1vdmVfZnJvbV9zZXNzaW9uKClgCiAgICAoUGhpbGlwIFdpdGhuYWxsKQogIC0gIzgy
MjIgZ3RrIDQuMjIuNCBmYWlscyB0byBidWlsZCBvbiAzMi1iaXQgYXJtIChvcmVvNjM5KQogIC0g
IzgzMDQgQ3NzIHRleHQtZGVjb3JhdGlvbiBydWxlIHJlcXVpcmVzIGEgcmVzaXplIHRvIHRha2Ug
ZWZmZWN0IChyZWdyZXNzaW9uKQogICAgKE1hdHRoaWFzIENsYXNlbikKICAtICE5NTM4IHdpbmRv
dzogRml4dXAgcG9pbnRlciBmb2N1cyB3aGVuIHVubWFwcGluZyBhIHBvcG92ZXIgKEFsZXNzYW5k
cm8KICAgIEFzdG9uZSkKICAtICE5ODg2IFVwZGF0ZSBTbG92YWsgdHJhbnNsYXRpb24KICAtICE5
ODkzIFVwZGF0ZSBQZXJzaWFuIHRyYW5zbGF0aW9uCiAgLSAhOTkwNSBbNC4yMl0gZ3B1OiBUcmln
Z2VyIGNhY2hlIEdDIGZyb20gZG1hYnVmIGRvd25sb2FkaW5nIGNvZGUgKEJlbmphbWluCiAgICBP
dHRlKQogIC0gITk5MTIgVXBkYXRlIExpdGh1YW5pYW4gdHJhbnNsYXRpb24KICAtICE5OTg5IGdz
a3Z1bGthbmltYWdlOiBmaXggYnVpbGRpbmcgb24gMzItYml0IChvcmVvNjM5KQogIC0gITEwMDEx
IFVwZGF0ZSBCYXNxdWUgdHJhbnNsYXRpb24KICAtICExMDA3MyBVcGRhdGUgQmVsYXJ1c2lhbiB0
cmFuc2xhdGlvbgogIC0gITEwMDc4IFVwZGF0ZSBQb2xpc2ggdHJhbnNsYXRpb24KICAtICExMDA4
MCBSZXZlcnQgImZpbGVjaG9vc2VydXRpbHM6IFN0b3AgdXNpbmcgcGl4YnVmcyIgKEp1bGlhbiBP
cnRoKQogIC0gITEwMDgxIFVwZGF0ZSBQb2xpc2ggdHJhbnNsYXRpb24KICAtICExMDA4NiBGaXgg
dGhlIGJ1aWxkIHdpdGggcGFuZ28gbWFpbiAoTWF0dGhpYXMgQ2xhc2VuKQogIC0gITEwMDkwIGds
OiBBY3R1YWxseSByZXBvcnQgcGFydGlhbCBkYW1hZ2UgKEJlbmphbWluIE90dGUpCiAgLSAhMTAw
OTIgZ2w6IEFjdHVhbGx5IHJlcG9ydCBwYXJ0aWFsIGRhbWFnZSAoQmVuamFtaW4gT3R0ZSkKICAt
ICExMDEwMSBndGthcHBsaWNhdGlvbi13YXlsYW5kOiBBZGQgYSBtaXNzaW5nIE5VTEwgY2hlY2sg
d2hlbiBmb3JnZXR0aW5nIGEKICAgIHdpbmRvdyAoUGhpbGlwIFdpdGhuYWxsKQogIC0gITEwMTI5
IGNzczogRml4IGludmFsaWRhdGlvbiBmb3IgdGV4dCBkZWNvcmF0aW9ucyAoTWF0dGhpYXMgQ2xh
c2VuKQogIC0gITEwMTM1IFVwZGF0ZSBGcmVuY2ggdHJhbnNsYXRpb24KICAtICExMDEzNiBVcGRh
dGUgRnJlbmNoIHRyYW5zbGF0aW9uCiAgLSAhMTAxNjYgd2F5bGFuZDogRml4IG11bm1hcCgpIG9m
IHRoZSB3cm9uZyBwb2ludGVyIGluIHRoZSBkbWFidWYgZm9ybWF0IHRhYmxlCiAgICAoQmVuamFt
aW4gT3R0ZSkKICAtICExMDMwNSB3YXlsYW5kOiBGaXggbXVubWFwKCkgb2YgdGhlIHdyb25nIHBv
aW50ZXIgaW4gdGhlIGRtYWJ1ZiBmb3JtYXQgdGFibGUKICAgIChCZW5qYW1pbiBPdHRlKQogIC0g
ITEwMzI2IDQuMjI6IEZpeCBDSSAoQmVuamFtaW4gT3R0ZSkKICAtICExMDMyNyBhbmRyb2lkOiBG
aXggb3RoZXIgWE1MIGZpbGUsIHRvbyAoQmVuamFtaW4gT3R0ZSkKICAtICExMDM0NiBtZW1vcnlj
b252ZXJ0OiBQYXNzIHRoZSBjb3JyZWN0IHBvaW50ZXIgYWRkcmVzcyAoQmVuamFtaW4gT3R0ZSkK
ICAtICExMDM0NyBtZW1vcnljb252ZXJ0OiBQYXNzIHRoZSBjb3JyZWN0IHBvaW50ZXIgYWRkcmVz
cyAoQmVuamFtaW4gT3R0ZSkKICAtICExMDM1NSBjaTogQWxsb3cgbWFjb3MtYXJtNjQgdG8gZmFp
bCAoTWF0dGhpYXMgQ2xhc2VuKQoKKiBUcmFuc2xhdGlvbiB1cGRhdGVzOgogIC0gQmFzcXVlIChB
c2llciBTYXJhdHN1YSBHYXJtZW5kaWEpCiAgLSBCZWxhcnVzaWFuIChWYXNpbCBQdXBraW4pCiAg
LSBGcmVuY2ggKEd1aWxsYXVtZSBCZXJuYXJkKQogIC0gTGl0aHVhbmlhbiAoQXVyaW1hcyBBdXJp
bWFzIMSMZXJuaXVzKQogIC0gUGVyc2lhbiAoRGFuaWFsIEJlaHphZGkpCiAgLSBQb2xpc2ggKFZp
Y3RvcmlhIE5pZWR6aWVsc2thKQogIC0gU2xvdmFrIChKb3NlIFJpaGEpCi0tLQogbWV0YS9yZWNp
cGVzLWdub21lL2d0aysve2d0azRfNC4yMi40LmJiID0+IGd0azRfNC4yMi41LmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL3tndGs0XzQuMjIuNC5iYiA9PiBndGs0XzQuMjIuNS5iYn0g
KDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuNC5i
YiBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi41LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMi40LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIuNS5iYgppbmRleCAx
ZDJlNGJmOWI4Li41ZDczODVkMjlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky9ndGs0XzQuMjIuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjIu
NS5iYgpAQCAtMzMsNyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTov
L3Rlc3RzL3Rlc3RndGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQx
OWQyOWZiMiBcCiAiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjUxYmQ5ZjYwYzdk
MjNhNjY1YTU1NmM3MzY0YzIxZmIyZTRlMjgyNTY2YjNlN2UwOTI0NTVlOGY5MTAzMzA4OTMiCitT
UkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI3ZmQ3MjVkZWIyY2IzZjhkYzIxOGFkODYyYzUw
NTZmZjg1NDhmNDlkM2IwZTQwODE3OTZlNDQ0YzIyZDE5Njg2IgogCiBTID0gIiR7VU5QQUNLRElS
fS8ke0dOT01FQk59LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============4702380008103129788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 88086640 to 88086160 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2200.4", added "/usr/lib/.debug/libgtk-4.so.1.2200.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGSIZE changed from 141138 to 147049 (+4%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 124023 to 124139 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGSIZE changed from 141515 to 143249 (+1%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGSIZE changed from 127848 to 127874 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGSIZE changed from 125627 to 125482 (-0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 52234835 to 52236206 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.22.4/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.22.5/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.22.4/gdk/x11 -> /usr/src/debug/gtk4/4.22.5/gdk/x11, directory renamed /usr/src/debug/gtk4/4.22.4/testsuite/reftests -> /usr/src/debug/gtk4/4.22.5/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/css -> /usr/src/debug/gtk4/4.22.5/gtk/css, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/roaring -> /usr/src/debug/gtk4/4.22.5/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/print/backends -> /usr/src/debug/gtk4/4.22.5/gtk/print/backends, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/timsort -> /usr/src/debug/gtk4/4.22.5/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.22.4/gdk/loaders -> /usr/src/debug/gtk4/4.22.5/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.22.4/gsk -> /usr/src/debug/gtk4/4.22.5/gsk, directory renamed /usr/src/debug/gtk4/4
 .22.4/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.22.5/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/a11y -> /usr/src/debug/gtk4/4.22.5/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/inspector -> /usr/src/debug/gtk4/4.22.5/gtk/inspector, directory renamed /usr/src/debug/gtk4/4.22.4/gsk/gpu -> /usr/src/debug/gtk4/4.22.5/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.22.4/gdk -> /usr/src/debug/gtk4/4.22.5/gdk, directory renamed /usr/src/debug/gtk4/4.22.4/gdk/wayland -> /usr/src/debug/gtk4/4.22.5/gdk/wayland, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/media -> /usr/src/debug/gtk4/4.22.5/gtk/media, directory renamed /usr/src/debug/gtk4/4.22.4/gtk -> /usr/src/debug/gtk4/4.22.5/gtk, directory renamed /usr/src/debug/gtk4/4.22.4/gdk/deprecated -> /usr/src/debug/gtk4/4.22.5/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/deprecated -> /usr/src/debug/gtk4/4.22.5/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.22.4/tools -> /usr/src/d
 ebug/gtk4/4.22.5/tools, directory renamed /usr/src/debug/gtk4/4.22.4/gtk/print -> /usr/src/debug/gtk4/4.22.5/gtk/print, directory renamed /usr/src/debug/gtk4/4.22.4/gsk/gl -> /usr/src/debug/gtk4/4.22.5/gsk/gl
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGSIZE changed from 20136231 to 20140327 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2200.4", added "/usr/lib/libgtk-4.so.1.2200.5"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.22.4 [default] to 4.22.5 [default]
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.22.4" to "4.22.5"
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.22/gtk-4.22.4.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.22/gtk-4.22.5.tar.xz;name=archive"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2200.4 to libgtk-4.so.1.2200.5
  /usr/lib/libgtk-4.so.1.2200.4 moved to /usr/lib/libgtk-4.so.1.2200.5

--===============4702380008103129788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="gtk4-changelog.txt"

Q2hhbmdlbG9nIGZvciBndGs0OiA0LjIyLjQgLT4gNC4yMi41ClNvdXJjZTogTkVXUwoKT3ZlcnZp
ZXcgb2YgQ2hhbmdlcyBpbiA0LjIyLjUsIDA5LTA5IDIwMjYKPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0KCiogQnVncyBmaXhlZDoKICAtICM4MDk4IENyYXNoZXMgd2l0
aCBTSUdTRUdWIGluIGBnZGtfd2F5bGFuZF90b3BsZXZlbF9yZW1vdmVfZnJvbV9zZXNzaW9uKClg
CiAgICAoUGhpbGlwIFdpdGhuYWxsKQogIC0gIzgyMjIgZ3RrIDQuMjIuNCBmYWlscyB0byBidWls
ZCBvbiAzMi1iaXQgYXJtIChvcmVvNjM5KQogIC0gIzgzMDQgQ3NzIHRleHQtZGVjb3JhdGlvbiBy
dWxlIHJlcXVpcmVzIGEgcmVzaXplIHRvIHRha2UgZWZmZWN0IChyZWdyZXNzaW9uKQogICAgKE1h
dHRoaWFzIENsYXNlbikKICAtICE5NTM4IHdpbmRvdzogRml4dXAgcG9pbnRlciBmb2N1cyB3aGVu
IHVubWFwcGluZyBhIHBvcG92ZXIgKEFsZXNzYW5kcm8KICAgIEFzdG9uZSkKICAtICE5ODg2IFVw
ZGF0ZSBTbG92YWsgdHJhbnNsYXRpb24KICAtICE5ODkzIFVwZGF0ZSBQZXJzaWFuIHRyYW5zbGF0
aW9uCiAgLSAhOTkwNSBbNC4yMl0gZ3B1OiBUcmlnZ2VyIGNhY2hlIEdDIGZyb20gZG1hYnVmIGRv
d25sb2FkaW5nIGNvZGUgKEJlbmphbWluCiAgICBPdHRlKQogIC0gITk5MTIgVXBkYXRlIExpdGh1
YW5pYW4gdHJhbnNsYXRpb24KICAtICE5OTg5IGdza3Z1bGthbmltYWdlOiBmaXggYnVpbGRpbmcg
b24gMzItYml0IChvcmVvNjM5KQogIC0gITEwMDExIFVwZGF0ZSBCYXNxdWUgdHJhbnNsYXRpb24K
ICAtICExMDA3MyBVcGRhdGUgQmVsYXJ1c2lhbiB0cmFuc2xhdGlvbgogIC0gITEwMDc4IFVwZGF0
ZSBQb2xpc2ggdHJhbnNsYXRpb24KICAtICExMDA4MCBSZXZlcnQgImZpbGVjaG9vc2VydXRpbHM6
IFN0b3AgdXNpbmcgcGl4YnVmcyIgKEp1bGlhbiBPcnRoKQogIC0gITEwMDgxIFVwZGF0ZSBQb2xp
c2ggdHJhbnNsYXRpb24KICAtICExMDA4NiBGaXggdGhlIGJ1aWxkIHdpdGggcGFuZ28gbWFpbiAo
TWF0dGhpYXMgQ2xhc2VuKQogIC0gITEwMDkwIGdsOiBBY3R1YWxseSByZXBvcnQgcGFydGlhbCBk
YW1hZ2UgKEJlbmphbWluIE90dGUpCiAgLSAhMTAwOTIgZ2w6IEFjdHVhbGx5IHJlcG9ydCBwYXJ0
aWFsIGRhbWFnZSAoQmVuamFtaW4gT3R0ZSkKICAtICExMDEwMSBndGthcHBsaWNhdGlvbi13YXls
YW5kOiBBZGQgYSBtaXNzaW5nIE5VTEwgY2hlY2sgd2hlbiBmb3JnZXR0aW5nIGEKICAgIHdpbmRv
dyAoUGhpbGlwIFdpdGhuYWxsKQogIC0gITEwMTI5IGNzczogRml4IGludmFsaWRhdGlvbiBmb3Ig
dGV4dCBkZWNvcmF0aW9ucyAoTWF0dGhpYXMgQ2xhc2VuKQogIC0gITEwMTM1IFVwZGF0ZSBGcmVu
Y2ggdHJhbnNsYXRpb24KICAtICExMDEzNiBVcGRhdGUgRnJlbmNoIHRyYW5zbGF0aW9uCiAgLSAh
MTAxNjYgd2F5bGFuZDogRml4IG11bm1hcCgpIG9mIHRoZSB3cm9uZyBwb2ludGVyIGluIHRoZSBk
bWFidWYgZm9ybWF0IHRhYmxlCiAgICAoQmVuamFtaW4gT3R0ZSkKICAtICExMDMwNSB3YXlsYW5k
OiBGaXggbXVubWFwKCkgb2YgdGhlIHdyb25nIHBvaW50ZXIgaW4gdGhlIGRtYWJ1ZiBmb3JtYXQg
dGFibGUKICAgIChCZW5qYW1pbiBPdHRlKQogIC0gITEwMzI2IDQuMjI6IEZpeCBDSSAoQmVuamFt
aW4gT3R0ZSkKICAtICExMDMyNyBhbmRyb2lkOiBGaXggb3RoZXIgWE1MIGZpbGUsIHRvbyAoQmVu
amFtaW4gT3R0ZSkKICAtICExMDM0NiBtZW1vcnljb252ZXJ0OiBQYXNzIHRoZSBjb3JyZWN0IHBv
aW50ZXIgYWRkcmVzcyAoQmVuamFtaW4gT3R0ZSkKICAtICExMDM0NyBtZW1vcnljb252ZXJ0OiBQ
YXNzIHRoZSBjb3JyZWN0IHBvaW50ZXIgYWRkcmVzcyAoQmVuamFtaW4gT3R0ZSkKICAtICExMDM1
NSBjaTogQWxsb3cgbWFjb3MtYXJtNjQgdG8gZmFpbCAoTWF0dGhpYXMgQ2xhc2VuKQoKKiBUcmFu
c2xhdGlvbiB1cGRhdGVzOgogIC0gQmFzcXVlIChBc2llciBTYXJhdHN1YSBHYXJtZW5kaWEpCiAg
LSBCZWxhcnVzaWFuIChWYXNpbCBQdXBraW4pCiAgLSBGcmVuY2ggKEd1aWxsYXVtZSBCZXJuYXJk
KQogIC0gTGl0aHVhbmlhbiAoQXVyaW1hcyBBdXJpbWFzIMSMZXJuaXVzKQogIC0gUGVyc2lhbiAo
RGFuaWFsIEJlaHphZGkpCiAgLSBQb2xpc2ggKFZpY3RvcmlhIE5pZWR6aWVsc2thKQogIC0gU2xv
dmFrIChKb3NlIFJpaGEpCg==

--===============4702380008103129788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2200.4", added "/usr/lib/libgtk-4.so.1.2200.5"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2200.4 to libgtk-4.so.1.2200.5
  /usr/lib/libgtk-4.so.1.2200.4 moved to /usr/lib/libgtk-4.so.1.2200.5

--===============4702380008103129788==--

