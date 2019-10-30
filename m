Return-Path: <umesh.kalappa0@gmail.com>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id E5B3F7F87C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 09:26:05 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id c11so1674749iom.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=2qFdqFYPvGZag5Y1lJ1pwUhCfDhY37zUAi0JJOtvUFI=;
	b=Z8ydwm6j336PDh8bsSucD8sopF9+QCEPPcjloGiGIRg/dH+s+dXGU9sEaMOujR1R4u
	KoI+xttOigtsHS+y4ZT00F2JU5Db2o6lUopQb9ZIvFpktXFA6UWX9RNZEdaQ6jaS4PjO
	ddJX3UXF2NUbH+xX1YJOdtJDGNmFSVm9TIhzR/4Bh1mVjREI/NO94+oFBeFB7viAG/xt
	52ts4VRQrMztiiIVW0aHOLEv4/x4inwi4+wUUUL94UXbwFY02FOxCUQEB2TPi7G5ztl3
	mICdMlK7r/HpFFkWxi2ehVTlwE8chQ3n9eCHkigDxnrE7lHHUXyai6rYcwgSNPFKQ2QJ
	SmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=2qFdqFYPvGZag5Y1lJ1pwUhCfDhY37zUAi0JJOtvUFI=;
	b=ad+hhhQKukC5NjGsy4d18Sp8LjCUsjdOMGEdRMC+P0s6ya760jf0vJ9VDbiQPpnYnE
	485o/Ea8G8fwJsJTXcF3KAfmjHXaqmdbPw3KIYyQkykrYMS6CS/ufmthOh+wvb4yJYok
	Ug7aLgs48dzjkKyZR2fxF9ehvEYqLJfsphAelRuwm1ZVwZACD7/zw4kLvu5ydTiJKl9b
	x1WOwIuZNByJpQXij5aZ/IgIfQcDS5Wqnk8vvJAjnlkVCE8VDoZMJH660EyddWhcVYIB
	enveoq+6SsuJWbrAS7BhjED3aCbXW4/+gPQ0PZmYEnvkII3UvFPOrYZ89n0Fv5r9rDeH
	AlmQ==
X-Gm-Message-State: APjAAAUQVIHTxjeIGr9Pjox1onrHkfXuDBUW4DyrpOcOGvjj7WUUkzB1
	vqWKy71kERKpYarNbh9IpjpFIxiZbhiWgdRALlc=
X-Google-Smtp-Source: APXvYqwMCzqJawVVql0kb2uJ9QG/Yo9tZKP/7Knr4NSlHLHsenHj4Qq0dPbfN7rNzXEzeAwn5NxXGADTAKcwFlctAHM=
X-Received: by 2002:a6b:6108:: with SMTP id v8mr5367139iob.200.1572427566769; 
	Wed, 30 Oct 2019 02:26:06 -0700 (PDT)
MIME-Version: 1.0
From: Umesh Kalappa <umesh.kalappa0@gmail.com>
Date: Wed, 30 Oct 2019 14:55:57 +0530
Message-ID: <CAGfacvQhR6zknbOetU2uBTzPwv8nBreyG1-9WcmhiEYzUMD10A@mail.gmail.com>
To: akuster808@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: https://sourceware.org/bugzilla/show_bug.cgi?id=23657
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
X-List-Received-Date: Wed, 30 Oct 2019 09:26:06 -0000
X-Groupsio-MsgNum: 130743
Content-Type: multipart/mixed; boundary="0000000000008d9b4605961d52ee"

--0000000000008d9b4605961d52ee
Content-Type: text/plain; charset="UTF-8"

Hi Kuster ,

Attached patch, fix the subjected issue (where we discard these weird
sections from the final object file) and verified the same in the
master.

Please let us know your comments/suggestions on the same.

Thank you
~Umesh

--0000000000008d9b4605961d52ee
Content-Type: application/octet-stream; name="0001-CVE-2019-1010180.patch"
Content-Disposition: attachment; filename="0001-CVE-2019-1010180.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k2d2pjwr0>
X-Attachment-Id: f_k2d2pjwr0

RnJvbSAxN2RkNjZmMTNhN2Y5MWFmMTdkNjM2Mjg4YTI1N2EyZmEwZWE4ZTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaW5heSBLdW1hciA8dmluYXkua3VtYXJAYmxhY2tmaWd0ZWNo
LmNvbT4KRGF0ZTogVHVlLCAyOSBPY3QgMjAxOSAxMjo1MzozNyArMDAwMApTdWJqZWN0OiBbUEFU
Q0hdIENWRS0yMDE5LTEwMTAxODAgZml4CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIv
Z2RiLTguMy4xLmluYyAgICAgICB8ICAxICsKIC4uLi9nZGIvZ2RiL0NWRS0yMDE5LTEwMTAxODAu
cGF0Y2ggICAgICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgMzUgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9nZGIvZ2RiL0NWRS0yMDE5LTEwMTAxODAucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi04LjMuMS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2RiL2dkYi04LjMuMS5pbmMKaW5kZXggMzlmMWM0OC4uYWVjOTEzZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItOC4zLjEuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nZGIvZ2RiLTguMy4xLmluYwpAQCAtMTYsNiArMTYsNyBAQCBTUkNfVVJJID0gIiR7
R05VX01JUlJPUn0vZ2RiL2dkYi0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAw
OS1DaGFuZ2Utb3JkZXItb2YtQ0ZMQUdTLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMTAt
cmVzb2x2ZS1yZXN0cmljdC1rZXl3b3JkLWNvbmZsaWN0LnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMTEtRml4LWludmFsaWQtc2lncHJvY21hc2stY2FsbC5wYXRjaCBcCisgICAgICAgICAg
IGZpbGU6Ly9DVkUtMjAxOS0xMDEwMTgwLnBhdGNoIFwKICAgICAgICAgICAgIgogU1JDX1VSSVtt
ZDVzdW1dID0gIjczYjZhNWQ4MTQxNjcyYzYyYmY4NTFjZDM0YzRhYTgzIgogU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjFlNTViNGQ3Y2RjYTdiMzRiZTEyZjRjZWFlNjUxNjIzYWE3M2IyZmQ2NDAxNTIz
MTNmOWY2NmE3MTQ5NzU3YzQiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Ri
L2dkYi9DVkUtMjAxOS0xMDEwMTgwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9n
ZGIvQ1ZFLTIwMTktMTAxMDE4MC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwLi42ZTUyMDI0Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dk
Yi9nZGIvQ1ZFLTIwMTktMTAxMDE4MC5wYXRjaApAQCAtMCwwICsxLDM0IEBACitkaWZmIC0tZ2l0
IGEvZ2RiL0NoYW5nZUxvZyBiL2dkYi9DaGFuZ2VMb2cKK2luZGV4IDk2MWEyZTIuLjFkZmIwY2Ig
MTAwNjQ0CistLS0gYS9nZGIvQ2hhbmdlTG9nCisrKysgYi9nZGIvQ2hhbmdlTG9nCitAQCAtMSwz
ICsxLDkgQEAKKysyMDE5LTEwLTE2ICBLZWl0aCBTZWl0eiAgPGtlaXRoc0ByZWRoYXQuY29tPgor
KworKwlQUiBnZGIvMjM1NjcKKysJKiBkd2FyZjJyZWFkLmMgKGR3YXJmMl9wZXJfb2JqZmlsZTo6
bG9jYXRlX3NlY3Rpb25zKTogRGlzY2FyZAorKwlzZWN0aW9ucyB3aG9zZSBzaXplIGlzIGdyZWF0
ZXIgdGhhbiB0aGUgZmlsZSBzaXplLgorKworIDIwMTktMDktMjAgIEpvZWwgQnJvYmVja2VyICA8
YnJvYmVja2VyQGFkYWNvcmUuY29tPgorIAorIAkqIHZlcnNpb24uaW46IFNldCBHREIgdmVyc2lv
biBudW1iZXIgdG8gOC4zLjEuCitkaWZmIC0tZ2l0IGEvZ2RiL2R3YXJmMnJlYWQuYyBiL2dkYi9k
d2FyZjJyZWFkLmMKK2luZGV4IDQyNTFlZDAuLmZhZmRiODkgMTAwNjQ0CistLS0gYS9nZGIvZHdh
cmYycmVhZC5jCisrKysgYi9nZGIvZHdhcmYycmVhZC5jCitAQCAtMjM3OCw2ICsyMzc4LDE1IEBA
IGR3YXJmMl9wZXJfb2JqZmlsZTo6bG9jYXRlX3NlY3Rpb25zIChiZmQgKmFiZmQsIGFzZWN0aW9u
ICpzZWN0cCwKKyAgIGlmICgoYWZsYWcgJiBTRUNfSEFTX0NPTlRFTlRTKSA9PSAwKQorICAgICB7
CisgICAgIH0KKysgIGVsc2UgaWYgKGVsZl9zZWN0aW9uX2RhdGEgKHNlY3RwKS0+dGhpc19oZHIu
c2hfc2l6ZQorKwkgICA+IGJmZF9nZXRfZmlsZV9zaXplIChhYmZkKSkKKysgICAgeworKyAgICAg
IGJmZF9zaXplX3R5cGUgc2l6ZSA9IGVsZl9zZWN0aW9uX2RhdGEgKHNlY3RwKS0+dGhpc19oZHIu
c2hfc2l6ZTsKKysgICAgICB3YXJuaW5nIChfKCJEaXNjYXJkaW5nIHNlY3Rpb24gJXMgd2hpY2gg
aGFzIGEgc2VjdGlvbiBzaXplICglcyIKKysJCSAiKSBsYXJnZXIgdGhhbiB0aGUgZmlsZSBzaXpl
IFtpbiBtb2R1bGUgJXNdIiksCisrCSAgICAgICBiZmRfc2VjdGlvbl9uYW1lIChhYmZkLCBzZWN0
cCksIHBoZXhfbnogKHNpemUsIHNpemVvZiAoc2l6ZSkpLAorKwkgICAgICAgYmZkX2dldF9maWxl
bmFtZSAoYWJmZCkpOworKyAgICB9CisgICBlbHNlIGlmIChzZWN0aW9uX2lzX3AgKHNlY3RwLT5u
YW1lLCAmbmFtZXMuaW5mbykpCisgICAgIHsKKyAgICAgICB0aGlzLT5pbmZvLnMuc2VjdGlvbiA9
IHNlY3RwOwotLSAKMi4xOC4xCgo=

--0000000000008d9b4605961d52ee--
