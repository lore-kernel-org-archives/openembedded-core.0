Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5333.1793687199635678658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VCmzDVAC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ky1QCkVL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1a0169acc-6f8d9173-8fb0-46e4-9b12-52aaa0690a0c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y6GY2T9qG25yGjXGH4UPS+IRbB60CyER3x+3V4f/YSQ=;
	b=VCmzDVACcrMsWLf+tAKwXesPro4eScsoNOm32E7dGQ4RM+RRjHRYauoEw1omsZhq
	DLFlhH6cbN+EJqxkkaEhcnfhFRyq9kUm3QAvH8hao2hmDXOcoyO9PVjjqJqsl3IbZR7
	HWnjzsELm+iCHFWIizdVmQ2GRPW3ixh5zUu2JSCA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687198;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y6GY2T9qG25yGjXGH4UPS+IRbB60CyER3x+3V4f/YSQ=;
	b=Ky1QCkVL2kXoB3AzlVY7JEkGzRfy+V3eVsWC2l3h9ykopCMgY1XIjyBeXDNLY4kZ
	TI/NIj7+O7i0l3Uc3izk2g3Hb3rNuj/Tw4RkOLLkhvyEqdNXjhtM0FPWXw/apP6Tx6Y
	RmaNa02pRQm3bEiUrAUp7E7iBO9Mva6eAHqA1BUE=
Content-Type: multipart/mixed; boundary="===============1329507511155142297=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] expat: upgrading to 2.10.0 SUCCEEDED
Message-ID: <010101a1a0169acc-6f8d9173-8fb0-46e4-9b12-52aaa0690a0c-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249232

--===============1329507511155142297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpleHBhdCogdG8gKjIuMTAuMCogaGFzIFN1Y2NlZWRlZC4KCk5leHQgc3RlcHM6CiAgICAt
IGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtZXhwYXQtdXBncmFkZS0yLjkuMC0yLjEwLjAu
cGF0Y2gKICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0gcGF0Y2hlcyBhbmQgc3Vt
bWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLAogICAgLSBjb21waWxlIGFuIGltYWdl
IHRoYXQgY29udGFpbnMgdGhlIHBhY2thZ2UKICAgIC0gcGVyZm9ybSBzb21lIGJhc2ljIHNhbml0
eSB0ZXN0cwogICAgLSBhbWVuZCB0aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0
IC1zIC0tcmVzZXQtYXV0aG9yIC0tYW1lbmQKICAgIC0gc2VuZCBpdCB0byB0aGUgYXBwcm9wcmlh
dGUgbWFpbGluZyBsaXN0CgpBbHRlcm5hdGl2ZWx5LCBpZiB5b3UgYmVsaWV2ZSB0aGUgcmVjaXBl
IHNob3VsZCBub3QgYmUgdXBncmFkZWQgYXQgdGhpcyB0aW1lLAp5b3UgY2FuIGZpbGwgUkVDSVBF
X05PX1VQREFURV9SRUFTT04gaW4gcmVzcGVjdGl2ZSByZWNpcGUgZmlsZSBzbyB0aGF0CmF1dG9t
YXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLgoKUGxlYXNlIHJldmll
dyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24gYW5kIGJ1aWxkL3Vw
ZGF0ZSBmYWlsdXJlcy4KQW55IHByb2JsZW0gcGxlYXNlIGZpbGUgYSBidWcgYXQgaHR0cHM6Ly9i
dWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL2VudGVyX2J1Zy5jZ2k/cHJvZHVjdD1BdXRvbWF0ZWQl
MjBVcGRhdGUlMjBIYW5kbGVyCgpSZWdhcmRzLApUaGUgVXBncmFkZSBIZWxwZXIKCi0tID44IC0t
CkZyb20gZjZjNWM1NzJjMWM4MzlkMDk3ZTdhZjIyOWQ5ZTcxMTdhNGY4MjI0ZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogVXBncmFkZSBIZWxwZXIgPGF1aEB5b2N0b3Byb2plY3Qub3Jn
PgpEYXRlOiBUdWUsIDMgTm92IDIwMjYgMDU6MzE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
eHBhdDogdXBncmFkZSAyLjkuMCAtPiAyLjEwLjAKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1U
eXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKClJlbGVhc2UgMi4xMC4wIE1vbiBOb3ZlbWJlciAyIDIwMjYKICAgICAgICBTZWN1cml0
eSBmaXhlczoKICAgICAgICAgICAjMTQzMSAgQ1ZFLTIwMjYtMTEzMzUxIC0tIEZpeCBkZW5pYWwg
b2Ygc2VydmljZSB3aXRoIHVzZSBvZgogICAgICAgICAgICAgICAgICAgIGBYTUxfUGFyc2VyUmVz
ZXRgCiAgIzE0MzMgIzE0MzYgLi4KICAjMTQzOCAjMTQzOSAuLgogICAgICAgICAgICMxNDQyICBD
VkUtMjAyNi0xMTU1MDYgLS0gRGV0ZWN0IGJpbGxpb24gbGF1Z2hzIGF0dGFja3MgcXVpY2tlcgog
ICAgICAgICAgICAgICAgICAgIGFuZCBtb3JlIG9mIGl0cyB2YXJpYXRpb25zLiBSZWxhdGVkIHBh
eWxvYWQgZnV6emVyIGF0OgogICAgICAgICAgICAgICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29t
L2hhbm5vYi9sb2xvbG9sCiAgICAgICAgICAgICAgICAgICAgUGxlYXNlIG5vdGUgdGhhdCBhIGxh
eWVyIG9mIGNvbXByZXNzaW9uIGFyb3VuZCBYTUwgY2FuCiAgICAgICAgICAgICAgICAgICAgc2ln
bmlmaWNhbnRseSByZWR1Y2UgdGhlIG1pbmltdW0gYXR0YWNrIHBheWxvYWQgc2l6ZS4KICAgICAg
ICAgICAgICAgICAgICBJbiBjYXNlIG9mIGJhY2twb3J0aW5nLCBwbGVhc2Ugbm90ZSBwdWxsIHJl
cXVlc3QgIzE0MzkKICAgICAgICAgICAgICAgICAgICBpbiBwYXJ0aWN1bGFyLgogICAgICAgICAg
ICMxNDQ0ICBDVkUtMjAyNi0xMTc2MTAgLS0gRml4IGluaXRpYWwgbm9uLWZpbmFsIGVtcHR5IHN1
YnBhcnNlcgogICAgICAgICAgICAgICAgICAgIHBhcnNlIGNhbGxzLiBXYXMgc2VnZmF1bHRpbmcg
cHJldmlvdXNseS4KICAgICAgICAgICAjMTQ1MCAgQ1ZFLTIwMjYtMTE4MzcwIC0tIFByb3RlY3Qg
YGF0dEluZGV4YCBhbmQgYG5QcmVmaXhlc2AgaW4KICAgICAgICAgICAgICAgICAgICBmdW5jdGlv
biBgc3RvcmVBdHRzYCBmcm9tIHNpZ25lZCBpbnRlZ2VyIG92ZXJmbG93CgogICAgICAgIEJ1ZyBm
aXhlczoKICAgICAgICAgICAjMTQ1MiAgbGliOiBJbml0aWFsaXplIGBtX3BhcnNpbmdTdGF0dXMu
ZmluYWxCdWZmZXJgIGluIGBwYXJzZXJJbml0YAogICAgICAgICAgICAgICAgICAgIHRvIGZpeCBj
YWxsaW5nIGBYTUxfR2V0UGFyc2luZ1N0YXR1c2AgcmlnaHQgYWZ0ZXIKICAgICAgICAgICAgICAg
ICAgICBwYXJzZXIgY3JlYXRpb24KICAgICAjMTQ1NyAjMTQ1OSAgbGliOiBJbXByb3ZlIGBYTUxf
UGFyc2VgIGZvciBgWE1MX0NPTlRFWFRfQllURVMgPT0gMGAKICAgICAgICAgICAgICAgICAgICBp
bmNsdWRpbmcgTlVMTCBwb2ludGVyIGFyaXRobWV0aWMgdW5kZWZpbmVkIGJlaGF2aW9yCiAgICAg
ICAgICAgICAgICAgICAgYW5kIHVuaW5pdGlhbGl6ZWQgdmFyaWFibGUgYWNjZXNzCiAgICAgICAg
ICAgIzE0NTggIGxpYjogVXNlIEM5OSBsZW5ndGggbW9kaWZpZXJzIGZvciBgcHRyZGlmZl90YCBh
bmQgYHNpemVfdGAKICAgICAgICAgICAgICAgICAgICB0byBmaXggc3VwcG9ydCBmb3IgQ0hFUkkt
UklTQy1WCiAgICAgICAgICAgIzE0NjEgIGxpYjogQ2hlY2sgYGlzQ2FsbGVkRnJvbUluc2lkZUhh
bmRsZXJgIGZpcnN0IGluIGBYTUxfUGFyc2VgCiAgICAgICAgICAgIzE0NjcgIGxpYjogQWRkIG1p
c3NpbmcgY2hlY2sgZm9yIGEgY2hhcmFjdGVyIGhhbmRsZXIgcmVzZXQKCiAgICAgICAgT3RoZXIg
Y2hhbmdlczoKICAgICAgICAgICAjMTQ0MSAgQXV0b3Rvb2xzOiBNb3ZlIGAtbG1gIGZyb20gTERG
TEFHUyB0byBMSUJBREQvTERBREQKICAgICAgICAgICAgICAgICAgICB0byBiZXR0ZXIgc3VwcG9y
dCBjb21waWxhdGlvbiB3aXRoIGAtV2wsLS1hcy1uZWVkZWRgCiAgICAgICAgICAgIzE0MTIgIENN
YWtlOiBTdXBwb3J0IHJlcGVhdGVkIGBmaW5kX3BhY2thZ2VgIGNhbGxzCiAgICAgICAgICAgIzE0
MTMgIGxpYjogQWRkcmVzcyB3YXJuaW5nIGBYTUxfR0UgaXMgbm90IGRlZmluZWQgWy1XZXJyb3I9
dW5kZWZdYAogICAgICAgICAgICMxNDE1ICBsaWI6IFN0b3AgZGVsYXlpbmcgYGNhbGxTdG9yZUVu
dGl0eVZhbHVlYCBlcnJvciBoYW5kbGluZwogICAgICAgICAgICMxNDE1ICBsaWI6IEFkZCBtaXNz
aW5nIGNhbGwgdG8gYHBvb2xEaXNjYXJkYAogICAgICAgICAgICMxNDM3ICBsaWI6IEFkZCBtaXNz
aW5nIGBOVUxMYCBjaGVjayBmb3IgYG1fc3RhcnREb2N0eXBlRGVjbEhhbmRsZXJgCiAgICAgICAg
ICAgIzE0MTcgIGxpYjogTWlncmF0ZSBgRU5USVRZLnRleHRMZW5gIGFuZCBgRU5USVRZLnByb2Nl
c3NlZGAgZnJvbQogICAgICAgICAgICAgICAgICAgICAgICAgYGludGAgdG8gYHNpemVfdGAKICAg
ICAgICAgICAjMTQ2MyAgbGliOiBGaXggaW50ZWdlciB0cnVuY2F0aW9uIGluIGBYbWxHZXRBdHRy
aWJ1dGVzYC9gZ2V0QXR0c2AKICAgICAgICAgICAjMTQyMCAgbGliOiBTb21lIG1vcmUgYFhNTF9C
b29sYCB0byBgYm9vbGAgbWlncmF0aW9uCiAgICAgIzE0NDkgIzE0NjAgIGxpYjogRG9jdW1lbnQg
dGhlIG1lbW9yeSByZXVzZSBibGFjayBtYWdpYyB0aGF0IGZ1bmN0aW9uCiAgICAgICAgICAgICAg
ICAgICAgYHN0b3JlQXR0c2AgaXMgZG9pbmcKICAgICAgICAgICAjMTQ1MyAgbGliOiBEb2N1bWVu
dCBmYWlsdXJlIHRvIHJlamVjdCBiYWQgcmVkZWZpbml0aW9ucyBvZgogICAgICAgICAgICAgICAg
ICAgIHByZWRlZmluZWQgZW50aXRpZXMKICAgICAgICAgICAjMTQzMiAgdGVzdHM6IFJlcGxhY2Ug
YFhNTF9TZXRIYXNoU2FsdGAgd2l0aAogICAgICAgICAgICAgICAgICAgIGBYTUxfU2V0SGFzaFNh
bHQxNkJ5dGVzYAogICAgICMxNDE2ICMxNDM1ICBWZXJzaW9uIGluZm8gYnVtcGVkIGZyb20gMTQ6
MDoxMyAobGliZXhwYXQqLnNvLjEuMTMuMCkKICAgICAgICAgICAgICAgICAgICB0byAxNDoxOjEz
IChsaWJleHBhdCouc28uMS4xMy4xKTsgc2VlIGh0dHBzOi8vdmVyYnVtcC5kZS8KICAgICAgICAg
ICAgICAgICAgICBmb3Igd2hhdCB0aGVzZSBudW1iZXJzIGRvCgogICAgICAgIEluZnJhc3RydWN0
dXJlOgogICAgICAgICAgICMxNDE0ICBDSTogU3RvcCB1c2luZyBhYm91dC10by1iZS1yZW1vdmVk
IGltYWdlICJtYWNvcy0xNCIKICAgICAjMTQxOCAjMTQzNCAgQ0k6IEJ1bXAgTWluR1cgQ2xhbmcg
ZnJvbSAyMy4xLjIgdG8gMjMuMS40CiAgICAgICAgICAgIzE0NDMgIENJOiBCdW1wIEZpbC1DIGZy
b20gMC42ODYgdG8gMC42ODcKICAgICAgICAgICAjMTQ1NiAgRHJvcCBhIGBsaWIveGNzaW5jLmNg
IGxlZnRvdmVyCgogICAgICAgIFNwZWNpYWwgdGhhbmtzIHRvOgogICAgICAgICAgICBBbGV4YW5k
ZXIgQmx1aG0KICAgICAgICAgICAgQmFydMWCb21pZWogRG1pdHJ1awogICAgICAgICAgICBCZXJr
YXkgRXJlbiDDnHLDvG4KICAgICAgICAgICAgQnJvb2tzIERhdmlzCiAgICAgICAgICAgIGJyc3Bv
b24KICAgICAgICAgICAgRnVuZGEgV2FuZwogICAgICAgICAgICBIYW5ubyBCw7ZjawogICAgICAg
ICAgICBNYXR0aGV3IEZlcm5hbmRlegogICAgICAgICAgICBNaW5reXVuZyBQYXJrCiAgICAgICAg
ICAgIE1pcmtvIFN3aWxsdXMKICAgICAgICAgICAgUHUgQ2hlbmcKICAgICAgICAgICAgU2NvdHQg
TW9vcmUKICAgICAgICAgICAgU2hhbmkgWW9zZWYKICAgICAgICAgICAgWGlzY28gRmF1bGkKICAg
ICAgICAgICAgICAgICBhbmQKICAgICAgICAgICAgQ2l0eSBvZiBNdW5pY2ggT3BlbiBTb3VyY2Ug
U2FiYmF0aWNhbAogICAgICAgICAgICBlY2hvLmFpCiAgICAgICAgICAgIFNpZW1lbnMKICAgICAg
ICAgICAgU3RyaWdhCiAgICAgICAgICAgIFZ1bG5DaGVjawoKICAgICAgICAgICAgU2llbWVucwog
ICAgICAgICAgICBTaWVtZW5zCiAgICAgICAgICAgICAgICAgYW5kCiAgICAgICAgICAgIFNpZW1l
bnMKICAgICAgICAgICAgU2llbWVucwogICAgICAgICAgICBTaWVtZW5zCiAgICAgICAgICAgIFNp
ZW1lbnMKICAgICAgICAgICAgICAgICBhbmQKICAgICAgICAgICAgU2llbWVucwotLS0KIG1ldGEv
cmVjaXBlcy1jb3JlL2V4cGF0L3tleHBhdF8yLjkuMC5iYiA9PiBleHBhdF8yLjEwLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQve2V4cGF0XzIuOS4wLmJiID0+IGV4cGF0XzIuMTAu
MC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8y
LjkuMC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIuMTAuMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8y
LjkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi4xMC4wLmJi
CmluZGV4IDliMzM3NjQ4MzkuLjViMjUyZjYxNDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL2V4cGF0L2V4cGF0XzIuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4
cGF0XzIuMTAuMC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC9SXyR7VkVSU0lPTl9UQUd9L2V4cGF0LSR7UFZ9LnRhci54eiAgXAogR0lU
SFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJleHBhdC9saWJleHBhdC9yZWxl
YXNlcy8iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvUl8oP1A8cHZlcj4u
KykiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZTYzNzE4NjJjYzMxOTk5YjM2OGMzYjg5YjQ5
OTk0ZjA2NzdlMWJhYjVmMWIyYjg1YWUzNzQxZjVkODAzMDUxIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImM2MjRiYTI5OThmYzY1ZGYxMTYzYTQ5NjQxZmYzZjlhYjczMTM4YjExNjQxZDkyYzg2YmVl
MGZiMDFiMWJjN2YiCiAKIEVYVFJBX09FQ01BS0U6Y2xhc3MtbmF0aXZlICs9ICItREVYUEFUX0JV
SUxEX0RPQ1M9T0ZGIgogCi0tIAoyLjQ3LjEKCg==

--===============1329507511155142297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/expat/expat-bin: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-bin: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-dbg: PKGSIZE changed from 1907944 to 1965840 (+3%)
packages/x86-64-v3-poky-linux/expat/expat-dbg: FILELIST: removed "/usr/lib/.debug/libexpat.so.1.13.0", added "/usr/lib/.debug/libexpat.so.1.13.1"
packages/x86-64-v3-poky-linux/expat/expat-dbg: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-dev: PKGSIZE changed from 70270 to 70447 (+0%)
packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.9.0 -> /usr/lib/cmake/expat-2.10.0
packages/x86-64-v3-poky-linux/expat/expat-dev: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-doc: PKGSIZE changed from 131946 to 135863 (+3%)
packages/x86-64-v3-poky-linux/expat/expat-doc: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat-locale: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-locale: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat-ptest: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-ptest: PKGSIZE changed from 576448 to 588736 (+2%)
packages/x86-64-v3-poky-linux/expat/expat-ptest: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat-src: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-src: PKGSIZE changed from 1440924 to 1492849 (+4%)
packages/x86-64-v3-poky-linux/expat/expat-src: FILELIST: directory renamed /usr/src/debug/expat/2.9.0/xmlwf -> /usr/src/debug/expat/2.10.0/xmlwf, directory renamed /usr/src/debug/expat/2.9.0/tests/benchmark -> /usr/src/debug/expat/2.10.0/tests/benchmark, removed "/usr/src/debug/expat/2.9.0/lib/hash_table.h /usr/src/debug/expat/2.9.0/tests/chardata.c /usr/src/debug/expat/2.9.0/tests/ns_tests.c /usr/src/debug/expat/2.9.0/tests/runtests.c /usr/src/debug/expat/2.9.0/tests/handlers.c /usr/src/debug/expat/2.9.0/tests/handlers.h /usr/src/debug/expat/2.9.0/tests/ns_tests.h /usr/src/debug/expat/2.9.0/tests/chardata.h /usr/src/debug/expat/2.9.0/tests/dummy.h /usr/src/debug/expat/2.9.0/lib/random_arc4random.c /usr/src/debug/expat/2.9.0/lib/random_getrandom.c /usr/src/debug/expat/2.9.0/lib/xmlparse.c /usr/src/debug/expat/2.9.0/tests/dummy.c /usr/src/debug/expat/2.9.0/lib/xmltok_impl.h /usr/src/debug/expat/2.9.0/tests/nsalloc_tests.c /usr/src/debug/expat/2.9.0/tests/minicheck.c /usr/src/debug/exp
 at/2.9.0/tests/nsalloc_tests.h /usr/src/debug/expat/2.9.0/lib/xmltok_impl.c /usr/src/debug/expat/2.9.0/tests/minicheck.h /usr/src/debug/expat/2.9.0/lib/xmltok_ns.c /usr/src/debug/expat/2.9.0/tests/hash_tests.c /usr/src/debug/expat/2.9.0/lib/random_arc4random_buf.h /usr/src/debug/expat/2.9.0/lib/xmlrole.h /usr/src/debug/expat/2.9.0/lib/xcs.c /usr/src/debug/expat/2.9.0/lib/xmlrole.c /usr/src/debug/expat/2.9.0/lib/random_arc4random_buf.c /usr/src/debug/expat/2.9.0/lib/xcs.h /usr/src/debug/expat/2.9.0/lib/expat_external.h /usr/src/debug/expat/2.9.0/tests/common.c /usr/src/debug/expat/2.9.0/tests/alloc_tests.h /usr/src/debug/expat/2.9.0/tests/basic_tests.h /usr/src/debug/expat/2.9.0/tests/props_tests.h /usr/src/debug/expat/2.9.0/lib/internal.h /usr/src/debug/expat/2.9.0/tests/alloc_tests.c /usr/src/debug/expat/2.9.0/tests/basic_tests.c /usr/src/debug/expat/2.9.0/tests/common.h /usr/src/debug/expat/2.9.0/tests/props_tests.c /usr/src/debug/expat/2.9.0/lib/random_getentropy.c /usr/src/debug
 /expat/2.9.0/tests/memcheck.h /usr/src/debug/expat/2.9.0/lib/xmltok.h /usr/src/debug/expat/2.9.0/tests/acc_tests.c /usr/src/debug/expat/2.9.0/tests/xcs_tests.c /usr/src/debug/expat/2.9.0/lib/nametab.h /usr/src/debug/expat/2.9.0/lib/xmltok.c /usr/src/debug/expat/2.9.0/tests/acc_tests.h /usr/src/debug/expat/2.9.0/tests/memcheck.c /usr/src/debug/expat/2.9.0/tests/hash_tests.h /usr/src/debug/expat/2.9.0/tests/misc_tests.h /usr/src/debug/expat/2.9.0/tests/structdata.c /usr/src/debug/expat/2.9.0/lib/expat.h /usr/src/debug/expat/2.9.0/tests/xcs_tests.h /usr/src/debug/expat/2.9.0/tests/structdata.h /usr/src/debug/expat/2.9.0/tests/misc_tests.c /usr/src/debug/expat/2.9.0/lib/siphash.h", added "/usr/src/debug/expat/2.10.0/tests/memcheck.h /usr/src/debug/expat/2.10.0/tests/memcheck.c /usr/src/debug/expat/2.10.0/lib/xcs.h /usr/src/debug/expat/2.10.0/lib/expat_external.h /usr/src/debug/expat/2.10.0/tests/common.h /usr/src/debug/expat/2.10.0/tests/common.c /usr/src/debug/expat/2.10.0/lib/xcs.c /u
 sr/src/debug/expat/2.10.0/tests/chardata.h /usr/src/debug/expat/2.10.0/lib/xmltok_impl.h /usr/src/debug/expat/2.10.0/lib/xmltok.h /usr/src/debug/expat/2.10.0/tests/minicheck.c /usr/src/debug/expat/2.10.0/lib/xmltok_impl.c /usr/src/debug/expat/2.10.0/tests/minicheck.h /usr/src/debug/expat/2.10.0/tests/chardata.c /usr/src/debug/expat/2.10.0/lib/internal.h /usr/src/debug/expat/2.10.0/lib/xmltok.c /usr/src/debug/expat/2.10.0/lib/random_arc4random_buf.c /usr/src/debug/expat/2.10.0/tests/hash_tests.c /usr/src/debug/expat/2.10.0/tests/misc_tests.c /usr/src/debug/expat/2.10.0/lib/nametab.h /usr/src/debug/expat/2.10.0/lib/random_arc4random_buf.h /usr/src/debug/expat/2.10.0/tests/hash_tests.h /usr/src/debug/expat/2.10.0/tests/misc_tests.h /usr/src/debug/expat/2.10.0/tests/structdata.h /usr/src/debug/expat/2.10.0/tests/entities_tests.h /usr/src/debug/expat/2.10.0/tests/structdata.c /usr/src/debug/expat/2.10.0/lib/hash_table.h /usr/src/debug/expat/2.10.0/lib/random_getentropy.c /usr/src/debug/e
 xpat/2.10.0/tests/entities_tests.c /usr/src/debug/expat/2.10.0/lib/entities.h /usr/src/debug/expat/2.10.0/lib/expat.h /usr/src/debug/expat/2.10.0/tests/dummy.c /usr/src/debug/expat/2.10.0/lib/xmltok_ns.c /usr/src/debug/expat/2.10.0/lib/random_arc4random.c /usr/src/debug/expat/2.10.0/lib/siphash.h /usr/src/debug/expat/2.10.0/tests/dummy.h /usr/src/debug/expat/2.10.0/tests/props_tests.h /usr/src/debug/expat/2.10.0/tests/alloc_tests.h /usr/src/debug/expat/2.10.0/tests/ns_tests.h /usr/src/debug/expat/2.10.0/tests/acc_tests.c /usr/src/debug/expat/2.10.0/tests/xcs_tests.c /usr/src/debug/expat/2.10.0/tests/handlers.c /usr/src/debug/expat/2.10.0/tests/nsalloc_tests.h /usr/src/debug/expat/2.10.0/tests/ns_tests.c /usr/src/debug/expat/2.10.0/tests/runtests.c /usr/src/debug/expat/2.10.0/tests/handlers.h /usr/src/debug/expat/2.10.0/tests/nsalloc_tests.c /usr/src/debug/expat/2.10.0/tests/acc_tests.h /usr/src/debug/expat/2.10.0/tests/xcs_tests.h /usr/src/debug/expat/2.10.0/lib/xmlrole.c /usr/src/d
 ebug/expat/2.10.0/lib/random_getrandom.c /usr/src/debug/expat/2.10.0/tests/alloc_tests.c /usr/src/debug/expat/2.10.0/tests/basic_tests.c /usr/src/debug/expat/2.10.0/lib/xmlrole.h /usr/src/debug/expat/2.10.0/tests/props_tests.c /usr/src/debug/expat/2.10.0/lib/xmlparse.c /usr/src/debug/expat/2.10.0/tests/basic_tests.h"
packages/x86-64-v3-poky-linux/expat/expat-src: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat-staticdev: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat/expat: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.13.0", added "/usr/lib/libexpat.so.1.13.1"
packages/x86-64-v3-poky-linux/expat/expat: PV changed from "2.9.0" to "2.10.0"
packages/x86-64-v3-poky-linux/expat: PKGV changed from 2.9.0 [default] to 2.10.0 [default]
packages/x86-64-v3-poky-linux/expat: SRC_URI changed from "https://github.com/libexpat/libexpat/releases//download/R_2_9_0/expat-2.9.0.tar.xz file://run-ptest" to "https://github.com/libexpat/libexpat/releases//download/R_2_10_0/expat-2.10.0.tar.xz file://run-ptest"
packages/x86-64-v3-poky-linux/expat: PV changed from "2.9.0" to "2.10.0"
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.0 to libexpat.so.1.13.1
  /usr/lib/libexpat.so.1.13.0 moved to /usr/lib/libexpat.so.1.13.1
  /usr/lib/cmake/expat-2.10.0 was added
  /usr/lib/cmake/expat-2.10.0/expat.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config-version.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-noconfig.cmake was added
  /usr/lib/cmake/expat-2.9.0 was removed
  /usr/lib/cmake/expat-2.9.0/expat.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config-version.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-noconfig.cmake was removed
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.0 to libexpat.so.1.13.1
  /usr/lib/libexpat.so.1.13.0 moved to /usr/lib/libexpat.so.1.13.1
  /usr/lib/cmake/expat-2.10.0 was added
  /usr/lib/cmake/expat-2.10.0/expat.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config-version.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-noconfig.cmake was added
  /usr/lib/cmake/expat-2.9.0 was removed
  /usr/lib/cmake/expat-2.9.0/expat.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config-version.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-noconfig.cmake was removed

--===============1329507511155142297==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-expat-upgrade-2.9.0-2.10.0.patch"

RnJvbSBmNmM1YzU3MmMxYzgzOWQwOTdlN2FmMjI5ZDllNzExN2E0ZjgyMjRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNTozMTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV4
cGF0OiB1cGdyYWRlIDIuOS4wIC0+IDIuMTAuMApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAoKUmVsZWFzZSAyLjEwLjAgTW9uIE5vdmVtYmVyIDIgMjAyNgogICAgICAgIFNlY3VyaXR5
IGZpeGVzOgogICAgICAgICAgICMxNDMxICBDVkUtMjAyNi0xMTMzNTEgLS0gRml4IGRlbmlhbCBv
ZiBzZXJ2aWNlIHdpdGggdXNlIG9mCiAgICAgICAgICAgICAgICAgICAgYFhNTF9QYXJzZXJSZXNl
dGAKICAjMTQzMyAjMTQzNiAuLgogICMxNDM4ICMxNDM5IC4uCiAgICAgICAgICAgIzE0NDIgIENW
RS0yMDI2LTExNTUwNiAtLSBEZXRlY3QgYmlsbGlvbiBsYXVnaHMgYXR0YWNrcyBxdWlja2VyCiAg
ICAgICAgICAgICAgICAgICAgYW5kIG1vcmUgb2YgaXRzIHZhcmlhdGlvbnMuIFJlbGF0ZWQgcGF5
bG9hZCBmdXp6ZXIgYXQ6CiAgICAgICAgICAgICAgICAgICAgICBodHRwczovL2dpdGh1Yi5jb20v
aGFubm9iL2xvbG9sb2wKICAgICAgICAgICAgICAgICAgICBQbGVhc2Ugbm90ZSB0aGF0IGEgbGF5
ZXIgb2YgY29tcHJlc3Npb24gYXJvdW5kIFhNTCBjYW4KICAgICAgICAgICAgICAgICAgICBzaWdu
aWZpY2FudGx5IHJlZHVjZSB0aGUgbWluaW11bSBhdHRhY2sgcGF5bG9hZCBzaXplLgogICAgICAg
ICAgICAgICAgICAgIEluIGNhc2Ugb2YgYmFja3BvcnRpbmcsIHBsZWFzZSBub3RlIHB1bGwgcmVx
dWVzdCAjMTQzOQogICAgICAgICAgICAgICAgICAgIGluIHBhcnRpY3VsYXIuCiAgICAgICAgICAg
IzE0NDQgIENWRS0yMDI2LTExNzYxMCAtLSBGaXggaW5pdGlhbCBub24tZmluYWwgZW1wdHkgc3Vi
cGFyc2VyCiAgICAgICAgICAgICAgICAgICAgcGFyc2UgY2FsbHMuIFdhcyBzZWdmYXVsdGluZyBw
cmV2aW91c2x5LgogICAgICAgICAgICMxNDUwICBDVkUtMjAyNi0xMTgzNzAgLS0gUHJvdGVjdCBg
YXR0SW5kZXhgIGFuZCBgblByZWZpeGVzYCBpbgogICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9u
IGBzdG9yZUF0dHNgIGZyb20gc2lnbmVkIGludGVnZXIgb3ZlcmZsb3cKCiAgICAgICAgQnVnIGZp
eGVzOgogICAgICAgICAgICMxNDUyICBsaWI6IEluaXRpYWxpemUgYG1fcGFyc2luZ1N0YXR1cy5m
aW5hbEJ1ZmZlcmAgaW4gYHBhcnNlckluaXRgCiAgICAgICAgICAgICAgICAgICAgdG8gZml4IGNh
bGxpbmcgYFhNTF9HZXRQYXJzaW5nU3RhdHVzYCByaWdodCBhZnRlcgogICAgICAgICAgICAgICAg
ICAgIHBhcnNlciBjcmVhdGlvbgogICAgICMxNDU3ICMxNDU5ICBsaWI6IEltcHJvdmUgYFhNTF9Q
YXJzZWAgZm9yIGBYTUxfQ09OVEVYVF9CWVRFUyA9PSAwYAogICAgICAgICAgICAgICAgICAgIGlu
Y2x1ZGluZyBOVUxMIHBvaW50ZXIgYXJpdGhtZXRpYyB1bmRlZmluZWQgYmVoYXZpb3IKICAgICAg
ICAgICAgICAgICAgICBhbmQgdW5pbml0aWFsaXplZCB2YXJpYWJsZSBhY2Nlc3MKICAgICAgICAg
ICAjMTQ1OCAgbGliOiBVc2UgQzk5IGxlbmd0aCBtb2RpZmllcnMgZm9yIGBwdHJkaWZmX3RgIGFu
ZCBgc2l6ZV90YAogICAgICAgICAgICAgICAgICAgIHRvIGZpeCBzdXBwb3J0IGZvciBDSEVSSS1S
SVNDLVYKICAgICAgICAgICAjMTQ2MSAgbGliOiBDaGVjayBgaXNDYWxsZWRGcm9tSW5zaWRlSGFu
ZGxlcmAgZmlyc3QgaW4gYFhNTF9QYXJzZWAKICAgICAgICAgICAjMTQ2NyAgbGliOiBBZGQgbWlz
c2luZyBjaGVjayBmb3IgYSBjaGFyYWN0ZXIgaGFuZGxlciByZXNldAoKICAgICAgICBPdGhlciBj
aGFuZ2VzOgogICAgICAgICAgICMxNDQxICBBdXRvdG9vbHM6IE1vdmUgYC1sbWAgZnJvbSBMREZM
QUdTIHRvIExJQkFERC9MREFERAogICAgICAgICAgICAgICAgICAgIHRvIGJldHRlciBzdXBwb3J0
IGNvbXBpbGF0aW9uIHdpdGggYC1XbCwtLWFzLW5lZWRlZGAKICAgICAgICAgICAjMTQxMiAgQ01h
a2U6IFN1cHBvcnQgcmVwZWF0ZWQgYGZpbmRfcGFja2FnZWAgY2FsbHMKICAgICAgICAgICAjMTQx
MyAgbGliOiBBZGRyZXNzIHdhcm5pbmcgYFhNTF9HRSBpcyBub3QgZGVmaW5lZCBbLVdlcnJvcj11
bmRlZl1gCiAgICAgICAgICAgIzE0MTUgIGxpYjogU3RvcCBkZWxheWluZyBgY2FsbFN0b3JlRW50
aXR5VmFsdWVgIGVycm9yIGhhbmRsaW5nCiAgICAgICAgICAgIzE0MTUgIGxpYjogQWRkIG1pc3Np
bmcgY2FsbCB0byBgcG9vbERpc2NhcmRgCiAgICAgICAgICAgIzE0MzcgIGxpYjogQWRkIG1pc3Np
bmcgYE5VTExgIGNoZWNrIGZvciBgbV9zdGFydERvY3R5cGVEZWNsSGFuZGxlcmAKICAgICAgICAg
ICAjMTQxNyAgbGliOiBNaWdyYXRlIGBFTlRJVFkudGV4dExlbmAgYW5kIGBFTlRJVFkucHJvY2Vz
c2VkYCBmcm9tCiAgICAgICAgICAgICAgICAgICAgICAgICBgaW50YCB0byBgc2l6ZV90YAogICAg
ICAgICAgICMxNDYzICBsaWI6IEZpeCBpbnRlZ2VyIHRydW5jYXRpb24gaW4gYFhtbEdldEF0dHJp
YnV0ZXNgL2BnZXRBdHRzYAogICAgICAgICAgICMxNDIwICBsaWI6IFNvbWUgbW9yZSBgWE1MX0Jv
b2xgIHRvIGBib29sYCBtaWdyYXRpb24KICAgICAjMTQ0OSAjMTQ2MCAgbGliOiBEb2N1bWVudCB0
aGUgbWVtb3J5IHJldXNlIGJsYWNrIG1hZ2ljIHRoYXQgZnVuY3Rpb24KICAgICAgICAgICAgICAg
ICAgICBgc3RvcmVBdHRzYCBpcyBkb2luZwogICAgICAgICAgICMxNDUzICBsaWI6IERvY3VtZW50
IGZhaWx1cmUgdG8gcmVqZWN0IGJhZCByZWRlZmluaXRpb25zIG9mCiAgICAgICAgICAgICAgICAg
ICAgcHJlZGVmaW5lZCBlbnRpdGllcwogICAgICAgICAgICMxNDMyICB0ZXN0czogUmVwbGFjZSBg
WE1MX1NldEhhc2hTYWx0YCB3aXRoCiAgICAgICAgICAgICAgICAgICAgYFhNTF9TZXRIYXNoU2Fs
dDE2Qnl0ZXNgCiAgICAgIzE0MTYgIzE0MzUgIFZlcnNpb24gaW5mbyBidW1wZWQgZnJvbSAxNDow
OjEzIChsaWJleHBhdCouc28uMS4xMy4wKQogICAgICAgICAgICAgICAgICAgIHRvIDE0OjE6MTMg
KGxpYmV4cGF0Ki5zby4xLjEzLjEpOyBzZWUgaHR0cHM6Ly92ZXJidW1wLmRlLwogICAgICAgICAg
ICAgICAgICAgIGZvciB3aGF0IHRoZXNlIG51bWJlcnMgZG8KCiAgICAgICAgSW5mcmFzdHJ1Y3R1
cmU6CiAgICAgICAgICAgIzE0MTQgIENJOiBTdG9wIHVzaW5nIGFib3V0LXRvLWJlLXJlbW92ZWQg
aW1hZ2UgIm1hY29zLTE0IgogICAgICMxNDE4ICMxNDM0ICBDSTogQnVtcCBNaW5HVyBDbGFuZyBm
cm9tIDIzLjEuMiB0byAyMy4xLjQKICAgICAgICAgICAjMTQ0MyAgQ0k6IEJ1bXAgRmlsLUMgZnJv
bSAwLjY4NiB0byAwLjY4NwogICAgICAgICAgICMxNDU2ICBEcm9wIGEgYGxpYi94Y3NpbmMuY2Ag
bGVmdG92ZXIKCiAgICAgICAgU3BlY2lhbCB0aGFua3MgdG86CiAgICAgICAgICAgIEFsZXhhbmRl
ciBCbHVobQogICAgICAgICAgICBCYXJ0xYJvbWllaiBEbWl0cnVrCiAgICAgICAgICAgIEJlcmth
eSBFcmVuIMOccsO8bgogICAgICAgICAgICBCcm9va3MgRGF2aXMKICAgICAgICAgICAgYnJzcG9v
bgogICAgICAgICAgICBGdW5kYSBXYW5nCiAgICAgICAgICAgIEhhbm5vIELDtmNrCiAgICAgICAg
ICAgIE1hdHRoZXcgRmVybmFuZGV6CiAgICAgICAgICAgIE1pbmt5dW5nIFBhcmsKICAgICAgICAg
ICAgTWlya28gU3dpbGx1cwogICAgICAgICAgICBQdSBDaGVuZwogICAgICAgICAgICBTY290dCBN
b29yZQogICAgICAgICAgICBTaGFuaSBZb3NlZgogICAgICAgICAgICBYaXNjbyBGYXVsaQogICAg
ICAgICAgICAgICAgIGFuZAogICAgICAgICAgICBDaXR5IG9mIE11bmljaCBPcGVuIFNvdXJjZSBT
YWJiYXRpY2FsCiAgICAgICAgICAgIGVjaG8uYWkKICAgICAgICAgICAgU2llbWVucwogICAgICAg
ICAgICBTdHJpZ2EKICAgICAgICAgICAgVnVsbkNoZWNrCgogICAgICAgICAgICBTaWVtZW5zCiAg
ICAgICAgICAgIFNpZW1lbnMKICAgICAgICAgICAgICAgICBhbmQKICAgICAgICAgICAgU2llbWVu
cwogICAgICAgICAgICBTaWVtZW5zCiAgICAgICAgICAgIFNpZW1lbnMKICAgICAgICAgICAgU2ll
bWVucwogICAgICAgICAgICAgICAgIGFuZAogICAgICAgICAgICBTaWVtZW5zCi0tLQogbWV0YS9y
ZWNpcGVzLWNvcmUvZXhwYXQve2V4cGF0XzIuOS4wLmJiID0+IGV4cGF0XzIuMTAuMC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC97ZXhwYXRfMi45LjAuYmIgPT4gZXhwYXRfMi4xMC4w
LmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIu
OS4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhwYXRfMi4xMC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL2V4cGF0L2V4cGF0XzIu
OS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdF8yLjEwLjAuYmIK
aW5kZXggOWIzMzc2NDgzOS4uNWIyNTJmNjE0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvZXhwYXQvZXhwYXRfMi45LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZXhwYXQvZXhw
YXRfMi4xMC4wLmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9V
Ukl9L2Rvd25sb2FkL1JfJHtWRVJTSU9OX1RBR30vZXhwYXQtJHtQVn0udGFyLnh6ICBcCiBHSVRI
VUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3JlbGVh
c2VzLyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInJlbGVhc2VzL3RhZy9SXyg/UDxwdmVyPi4r
KSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFlNjM3MTg2MmNjMzE5OTliMzY4YzNiODliNDk5
OTRmMDY3N2UxYmFiNWYxYjJiODVhZTM3NDFmNWQ4MDMwNTEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYzYyNGJhMjk5OGZjNjVkZjExNjNhNDk2NDFmZjNmOWFiNzMxMzhiMTE2NDFkOTJjODZiZWUw
ZmIwMWIxYmM3ZiIKIAogRVhUUkFfT0VDTUFLRTpjbGFzcy1uYXRpdmUgKz0gIi1ERVhQQVRfQlVJ
TERfRE9DUz1PRkYiCiAKLS0gCjIuNDcuMQoK

--===============1329507511155142297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/expat/expat-dev: FILELIST: directory renamed /usr/lib/cmake/expat-2.9.0 -> /usr/lib/cmake/expat-2.10.0
packages/x86-64-v3-poky-linux/expat/expat: FILELIST: removed "/usr/lib/libexpat.so.1.13.0", added "/usr/lib/libexpat.so.1.13.1"
Changes to packages/x86-64-v3-poky-linux/expat (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.0 to libexpat.so.1.13.1
  /usr/lib/libexpat.so.1.13.0 moved to /usr/lib/libexpat.so.1.13.1
  /usr/lib/cmake/expat-2.10.0 was added
  /usr/lib/cmake/expat-2.10.0/expat.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config-version.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-noconfig.cmake was added
  /usr/lib/cmake/expat-2.9.0 was removed
  /usr/lib/cmake/expat-2.9.0/expat.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config-version.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-noconfig.cmake was removed
Changes to packages/x86_64-linux/expat-native (sysroot):
  /usr/lib/libexpat.so.1 changed symlink target from libexpat.so.1.13.0 to libexpat.so.1.13.1
  /usr/lib/libexpat.so.1.13.0 moved to /usr/lib/libexpat.so.1.13.1
  /usr/lib/cmake/expat-2.10.0 was added
  /usr/lib/cmake/expat-2.10.0/expat.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-config-version.cmake was added
  /usr/lib/cmake/expat-2.10.0/expat-noconfig.cmake was added
  /usr/lib/cmake/expat-2.9.0 was removed
  /usr/lib/cmake/expat-2.9.0/expat.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-config-version.cmake was removed
  /usr/lib/cmake/expat-2.9.0/expat-noconfig.cmake was removed

--===============1329507511155142297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="expat-changelog.txt"

UmVsZWFzZSAyLjEwLjAgTW9uIE5vdmVtYmVyIDIgMjAyNgogICAgICAgIFNlY3VyaXR5IGZpeGVz
OgogICAgICAgICAgICMxNDMxICBDVkUtMjAyNi0xMTMzNTEgLS0gRml4IGRlbmlhbCBvZiBzZXJ2
aWNlIHdpdGggdXNlIG9mCiAgICAgICAgICAgICAgICAgICAgYFhNTF9QYXJzZXJSZXNldGAKICAj
MTQzMyAjMTQzNiAuLgogICMxNDM4ICMxNDM5IC4uCiAgICAgICAgICAgIzE0NDIgIENWRS0yMDI2
LTExNTUwNiAtLSBEZXRlY3QgYmlsbGlvbiBsYXVnaHMgYXR0YWNrcyBxdWlja2VyCiAgICAgICAg
ICAgICAgICAgICAgYW5kIG1vcmUgb2YgaXRzIHZhcmlhdGlvbnMuIFJlbGF0ZWQgcGF5bG9hZCBm
dXp6ZXIgYXQ6CiAgICAgICAgICAgICAgICAgICAgICBodHRwczovL2dpdGh1Yi5jb20vaGFubm9i
L2xvbG9sb2wKICAgICAgICAgICAgICAgICAgICBQbGVhc2Ugbm90ZSB0aGF0IGEgbGF5ZXIgb2Yg
Y29tcHJlc3Npb24gYXJvdW5kIFhNTCBjYW4KICAgICAgICAgICAgICAgICAgICBzaWduaWZpY2Fu
dGx5IHJlZHVjZSB0aGUgbWluaW11bSBhdHRhY2sgcGF5bG9hZCBzaXplLgogICAgICAgICAgICAg
ICAgICAgIEluIGNhc2Ugb2YgYmFja3BvcnRpbmcsIHBsZWFzZSBub3RlIHB1bGwgcmVxdWVzdCAj
MTQzOQogICAgICAgICAgICAgICAgICAgIGluIHBhcnRpY3VsYXIuCiAgICAgICAgICAgIzE0NDQg
IENWRS0yMDI2LTExNzYxMCAtLSBGaXggaW5pdGlhbCBub24tZmluYWwgZW1wdHkgc3VicGFyc2Vy
CiAgICAgICAgICAgICAgICAgICAgcGFyc2UgY2FsbHMuIFdhcyBzZWdmYXVsdGluZyBwcmV2aW91
c2x5LgogICAgICAgICAgICMxNDUwICBDVkUtMjAyNi0xMTgzNzAgLS0gUHJvdGVjdCBgYXR0SW5k
ZXhgIGFuZCBgblByZWZpeGVzYCBpbgogICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uIGBzdG9y
ZUF0dHNgIGZyb20gc2lnbmVkIGludGVnZXIgb3ZlcmZsb3cKCiAgICAgICAgQnVnIGZpeGVzOgog
ICAgICAgICAgICMxNDUyICBsaWI6IEluaXRpYWxpemUgYG1fcGFyc2luZ1N0YXR1cy5maW5hbEJ1
ZmZlcmAgaW4gYHBhcnNlckluaXRgCiAgICAgICAgICAgICAgICAgICAgdG8gZml4IGNhbGxpbmcg
YFhNTF9HZXRQYXJzaW5nU3RhdHVzYCByaWdodCBhZnRlcgogICAgICAgICAgICAgICAgICAgIHBh
cnNlciBjcmVhdGlvbgogICAgICMxNDU3ICMxNDU5ICBsaWI6IEltcHJvdmUgYFhNTF9QYXJzZWAg
Zm9yIGBYTUxfQ09OVEVYVF9CWVRFUyA9PSAwYAogICAgICAgICAgICAgICAgICAgIGluY2x1ZGlu
ZyBOVUxMIHBvaW50ZXIgYXJpdGhtZXRpYyB1bmRlZmluZWQgYmVoYXZpb3IKICAgICAgICAgICAg
ICAgICAgICBhbmQgdW5pbml0aWFsaXplZCB2YXJpYWJsZSBhY2Nlc3MKICAgICAgICAgICAjMTQ1
OCAgbGliOiBVc2UgQzk5IGxlbmd0aCBtb2RpZmllcnMgZm9yIGBwdHJkaWZmX3RgIGFuZCBgc2l6
ZV90YAogICAgICAgICAgICAgICAgICAgIHRvIGZpeCBzdXBwb3J0IGZvciBDSEVSSS1SSVNDLVYK
ICAgICAgICAgICAjMTQ2MSAgbGliOiBDaGVjayBgaXNDYWxsZWRGcm9tSW5zaWRlSGFuZGxlcmAg
Zmlyc3QgaW4gYFhNTF9QYXJzZWAKICAgICAgICAgICAjMTQ2NyAgbGliOiBBZGQgbWlzc2luZyBj
aGVjayBmb3IgYSBjaGFyYWN0ZXIgaGFuZGxlciByZXNldAoKICAgICAgICBPdGhlciBjaGFuZ2Vz
OgogICAgICAgICAgICMxNDQxICBBdXRvdG9vbHM6IE1vdmUgYC1sbWAgZnJvbSBMREZMQUdTIHRv
IExJQkFERC9MREFERAogICAgICAgICAgICAgICAgICAgIHRvIGJldHRlciBzdXBwb3J0IGNvbXBp
bGF0aW9uIHdpdGggYC1XbCwtLWFzLW5lZWRlZGAKICAgICAgICAgICAjMTQxMiAgQ01ha2U6IFN1
cHBvcnQgcmVwZWF0ZWQgYGZpbmRfcGFja2FnZWAgY2FsbHMKICAgICAgICAgICAjMTQxMyAgbGli
OiBBZGRyZXNzIHdhcm5pbmcgYFhNTF9HRSBpcyBub3QgZGVmaW5lZCBbLVdlcnJvcj11bmRlZl1g
CiAgICAgICAgICAgIzE0MTUgIGxpYjogU3RvcCBkZWxheWluZyBgY2FsbFN0b3JlRW50aXR5VmFs
dWVgIGVycm9yIGhhbmRsaW5nCiAgICAgICAgICAgIzE0MTUgIGxpYjogQWRkIG1pc3NpbmcgY2Fs
bCB0byBgcG9vbERpc2NhcmRgCiAgICAgICAgICAgIzE0MzcgIGxpYjogQWRkIG1pc3NpbmcgYE5V
TExgIGNoZWNrIGZvciBgbV9zdGFydERvY3R5cGVEZWNsSGFuZGxlcmAKICAgICAgICAgICAjMTQx
NyAgbGliOiBNaWdyYXRlIGBFTlRJVFkudGV4dExlbmAgYW5kIGBFTlRJVFkucHJvY2Vzc2VkYCBm
cm9tCiAgICAgICAgICAgICAgICAgICAgICAgICBgaW50YCB0byBgc2l6ZV90YAogICAgICAgICAg
ICMxNDYzICBsaWI6IEZpeCBpbnRlZ2VyIHRydW5jYXRpb24gaW4gYFhtbEdldEF0dHJpYnV0ZXNg
L2BnZXRBdHRzYAogICAgICAgICAgICMxNDIwICBsaWI6IFNvbWUgbW9yZSBgWE1MX0Jvb2xgIHRv
IGBib29sYCBtaWdyYXRpb24KICAgICAjMTQ0OSAjMTQ2MCAgbGliOiBEb2N1bWVudCB0aGUgbWVt
b3J5IHJldXNlIGJsYWNrIG1hZ2ljIHRoYXQgZnVuY3Rpb24KICAgICAgICAgICAgICAgICAgICBg
c3RvcmVBdHRzYCBpcyBkb2luZwogICAgICAgICAgICMxNDUzICBsaWI6IERvY3VtZW50IGZhaWx1
cmUgdG8gcmVqZWN0IGJhZCByZWRlZmluaXRpb25zIG9mCiAgICAgICAgICAgICAgICAgICAgcHJl
ZGVmaW5lZCBlbnRpdGllcwogICAgICAgICAgICMxNDMyICB0ZXN0czogUmVwbGFjZSBgWE1MX1Nl
dEhhc2hTYWx0YCB3aXRoCiAgICAgICAgICAgICAgICAgICAgYFhNTF9TZXRIYXNoU2FsdDE2Qnl0
ZXNgCiAgICAgIzE0MTYgIzE0MzUgIFZlcnNpb24gaW5mbyBidW1wZWQgZnJvbSAxNDowOjEzIChs
aWJleHBhdCouc28uMS4xMy4wKQogICAgICAgICAgICAgICAgICAgIHRvIDE0OjE6MTMgKGxpYmV4
cGF0Ki5zby4xLjEzLjEpOyBzZWUgaHR0cHM6Ly92ZXJidW1wLmRlLwogICAgICAgICAgICAgICAg
ICAgIGZvciB3aGF0IHRoZXNlIG51bWJlcnMgZG8KCiAgICAgICAgSW5mcmFzdHJ1Y3R1cmU6CiAg
ICAgICAgICAgIzE0MTQgIENJOiBTdG9wIHVzaW5nIGFib3V0LXRvLWJlLXJlbW92ZWQgaW1hZ2Ug
Im1hY29zLTE0IgogICAgICMxNDE4ICMxNDM0ICBDSTogQnVtcCBNaW5HVyBDbGFuZyBmcm9tIDIz
LjEuMiB0byAyMy4xLjQKICAgICAgICAgICAjMTQ0MyAgQ0k6IEJ1bXAgRmlsLUMgZnJvbSAwLjY4
NiB0byAwLjY4NwogICAgICAgICAgICMxNDU2ICBEcm9wIGEgYGxpYi94Y3NpbmMuY2AgbGVmdG92
ZXIKCiAgICAgICAgU3BlY2lhbCB0aGFua3MgdG86CiAgICAgICAgICAgIEFsZXhhbmRlciBCbHVo
bQogICAgICAgICAgICBCYXJ0xYJvbWllaiBEbWl0cnVrCiAgICAgICAgICAgIEJlcmtheSBFcmVu
IMOccsO8bgogICAgICAgICAgICBCcm9va3MgRGF2aXMKICAgICAgICAgICAgYnJzcG9vbgogICAg
ICAgICAgICBGdW5kYSBXYW5nCiAgICAgICAgICAgIEhhbm5vIELDtmNrCiAgICAgICAgICAgIE1h
dHRoZXcgRmVybmFuZGV6CiAgICAgICAgICAgIE1pbmt5dW5nIFBhcmsKICAgICAgICAgICAgTWly
a28gU3dpbGx1cwogICAgICAgICAgICBQdSBDaGVuZwogICAgICAgICAgICBTY290dCBNb29yZQog
ICAgICAgICAgICBTaGFuaSBZb3NlZgogICAgICAgICAgICBYaXNjbyBGYXVsaQogICAgICAgICAg
ICAgICAgIGFuZAogICAgICAgICAgICBDaXR5IG9mIE11bmljaCBPcGVuIFNvdXJjZSBTYWJiYXRp
Y2FsCiAgICAgICAgICAgIGVjaG8uYWkKICAgICAgICAgICAgU2llbWVucwogICAgICAgICAgICBT
dHJpZ2EKICAgICAgICAgICAgVnVsbkNoZWNrCgogICAgICAgICAgICBTaWVtZW5zCiAgICAgICAg
ICAgIFNpZW1lbnMKICAgICAgICAgICAgICAgICBhbmQKICAgICAgICAgICAgU2llbWVucwogICAg
ICAgICAgICBTaWVtZW5zCiAgICAgICAgICAgIFNpZW1lbnMKICAgICAgICAgICAgU2llbWVucwog
ICAgICAgICAgICAgICAgIGFuZAogICAgICAgICAgICBTaWVtZW5zCg==

--===============1329507511155142297==--
