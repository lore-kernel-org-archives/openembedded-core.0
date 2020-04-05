Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.19646.1586101487097629148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 08:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LNmH4HBA;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id k21so12001030ljh.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8bykkEUvwDtluYtDzndX5ZI5lX6ifFc11G4mUWK3pc0=;
        b=LNmH4HBAJXqb4zXmFFnO8vHVzZdaslM1SwGIJu3lc5jyQfSgCtTUxPTLzc5Lxu5Wp5
         8PTQBbWalhjHxOrWDkx6j6UWWaetOp0nnB7DsnAUwmeNvY5gaOVFqi/AQzli667yA89n
         3LfoSull89mOCYFtxUFhWSzt37psBdJ2vHeuvxCL3f8NRMwTmlgUZ2DAnyxdHnWxO48Y
         Uoj05ERoVIQZOK1psHCEMrbHDTmcWEuqCc5q8HpHzpER944cW3jQ7KaALwYKlc8N6q51
         G3XMdaNHzzo/l0HfS7vSE9pJ2n7t+5m6Jk29lUFTskX5eGtTK6FJbm9po63HqvvYvjX7
         IM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8bykkEUvwDtluYtDzndX5ZI5lX6ifFc11G4mUWK3pc0=;
        b=EwX2STD1eUwvtTMEZ3QE3ntKC2UOT0QGq4OVHs91j2/YJr9gghLur5/KlPKTYye123
         0HAl2yXBaZCWx2h5tjGlPp/3cmj5dItBTt9QqZLvhfs2P2Ail1R9DGRjkkG6GTw5RJLR
         Yzg400dQflm9jUjXn0P1FcwADkiyCdauldlCVP+jj5/i+IgXiVcDWElqKqB6AAEqCJiZ
         G5nnN2sRoVEBhfj1sojk/gIBLLpUN86BC63kD7XPszTRRg6Wa8qyjG7utKaXhPIVSnGM
         SfREcjxeOljihxb84Mbx9FXfXbcofenGOXqzrYFMkb3z2d63zn0wuL1FXAHYGKOtoIrM
         r21Q==
X-Gm-Message-State: AGi0Puavw69A1wh5h/PRevI7MyAhEjAd1xNkBxQXuxTGSRY49U+YRfGS
	OcEGQrZIHI42vccjyGQojDU0y2et5M/WxtT00ms=
X-Google-Smtp-Source: APiQypJ7JXBfo97kgKvtS0xiUkcOZ0FES+BPcWvO9O8feSdUyxWCh7ukW8J/tj+DXng7ZZoB1Q8uh9LX6FNfmw4H48U=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr9551823ljn.125.1586101485206;
 Sun, 05 Apr 2020 08:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
 <1602DB74B6717A3F.2403@lists.openembedded.org> <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
 <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
 <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com> <db5856cec86de82a4feddf1cf739ce7eb37c6932.camel@linuxfoundation.org>
In-Reply-To: <db5856cec86de82a4feddf1cf739ce7eb37c6932.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sun, 5 Apr 2020 17:44:28 +0200
Message-ID: <CAPybu_1ULyzXSJzYAHGRh7FeM9i0PX7g0N-v=XqeFPKJ8k0hzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com, 
	Paul Barker <pbarker@konsulko.com>
X-Groupsio-MsgNum: 137036
Content-Type: multipart/mixed; boundary="0000000000009a98d805a28d07ab"

--0000000000009a98d805a28d07ab
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Thanks for testing it out. Seems that I am either not very clever or I
should not work on Sundays (or both), v1, and v2 where exactly the
same. I am terribly sorry to spam you.

I know it is abusing your patience, but can you try again. I would
love to try it on my setup , but I cannot replicate the bug.

As we speak I am running oe-selftest    --run-tests wic.Wic on poky/fedora-30...

Thanks, and sorry again.

On Sun, Apr 5, 2020 at 5:29 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-04-05 at 14:01 +0200, Ricardo Ribalda Delgado wrote:
> > Ups, wrong version
> >
> > This is the one, sorry.
>
> It didn't build unfortunately:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/837
>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

--0000000000009a98d805a28d07ab
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="v2-0001-pseudo-During-DB-fix-remove-files-that-do-not-exi.patch"
Content-Disposition: attachment; 
	filename="v2-0001-pseudo-During-DB-fix-remove-files-that-do-not-exi.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8n7r5cw0>
X-Attachment-Id: f_k8n7r5cw0

RnJvbSA5YzJiZDk1NTNlODFmZDE2YTllM2FhZDJmMjBiN2E4NjkxOGRlNGJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNhcmRvIFJpYmFsZGEgRGVsZ2FkbyA8cmljYXJkb0ByaWJh
bGRhLmNvbT4KRGF0ZTogU3VuLCA1IEFwciAyMDIwIDEzOjQ3OjEyICswMjAwClN1YmplY3Q6IFtQ
QVRDSCB2Ml0gcHNldWRvOiBEdXJpbmcgREIgZml4LCByZW1vdmUgZmlsZXMgdGhhdCBkbyBub3Qg
ZXhpc3QKCklmIGEgZmlsZSBkb2VzIG5vdCBleGlzdCwgZWl0aGVyIGJlY2F1c2UgaXQgaGFzIGJl
ZW4gcmVtb3ZlZCBvdXRzaWRlCmJpdGJha2UsIG9yIGJlY2F1c2Ugb25seSBzb21lIG9mIHRoZSBm
aWxlcyBoYXZlIGJlZW4gbW92ZWQgdG8gYQpkaWZmZXJlbnQgbG9jYXRpb24sIGRlbGV0ZSBpdCBm
cm9tIHRoZSBwc2V1ZG8tZGIgaXMgdGhlIHVzZXIgZGVjaWRlcyB0bwpmaXggdGhlIGRhdGFiYXNl
LgoKU2lnbmVkLW9mZi1ieTogUmljYXJkbyBSaWJhbGRhIERlbGdhZG8gPHJpY2FyZG9AcmliYWxk
YS5jb20+Ci0tLQogLi4uaXh1cC1yZW1vdmUtZmlsZXMtdGhhdC1kby1ub3QtZXhpc3QtLnBhdGNo
IHwgNDggKysrKysrKysrKysrKysrKysrKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9w
c2V1ZG9fZ2l0LmJiICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9maWxlcy8w
MDAxLXBzZXVkby1Pbi1hLURCLWZpeHVwLXJlbW92ZS1maWxlcy10aGF0LWRvLW5vdC1leGlzdC0u
cGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzLzAw
MDEtcHNldWRvLU9uLWEtREItZml4dXAtcmVtb3ZlLWZpbGVzLXRoYXQtZG8tbm90LWV4aXN0LS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvMDAwMS1wc2V1ZG8tT24t
YS1EQi1maXh1cC1yZW1vdmUtZmlsZXMtdGhhdC1kby1ub3QtZXhpc3QtLnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjI2ZWZiMGExMTMKLS0tIC9kZXYvbnVsbAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzLzAwMDEtcHNldWRvLU9uLWEt
REItZml4dXAtcmVtb3ZlLWZpbGVzLXRoYXQtZG8tbm90LWV4aXN0LS5wYXRjaApAQCAtMCwwICsx
LDQ4IEBACitGcm9tIGIwOTAyZTM2MTA4YjQ5ZTZiYzg4ZDZiMjUxY2MyZjhjZmZjZDVhMTMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNhcmRvIFJpYmFsZGEgPHJpY2FyZG9Acmli
YWxkYS5jb20+CitEYXRlOiBTdW4sIDUgQXByIDIwMjAgMTE6NDA6MzAgKzAwMDAKK1N1YmplY3Q6
IFtQQVRDSF0gcHNldWRvOiBPbiBhIERCIGZpeHVwIHJlbW92ZSBmaWxlcyB0aGF0IGRvIG5vdCBl
eGlzdCBhbnltb3JlCisKK0lmIHRoZSB1c2VyIGRlY2lkZXMgdG8gZml4IGEgZGF0YWJhc2UsIHJl
bW92ZSB0aGUgZmlsZXMgdGhhdCBkbyBub3QKK2V4aXN0IGFueW1vcmUuCitJZiBvbmx5IERCIHRl
c3QgaXMgc2VsZWN0ZWQgZG8gbm90IGNoYW5nZSB0aGUgYmVoYXZpb3VyIChyZXR1cm4gZXJyb3Ip
LgorCitTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIFJpYmFsZGEgPHJpY2FyZG9AcmliYWxkYS5jb20+
CistLS0KKyBwc2V1ZG8uYyB8IDEzICsrKysrKysrKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3BzZXVkby5jIGIv
cHNldWRvLmMKK2luZGV4IDBmNTg1MGUuLjk4ZTViMGMgMTAwNjQ0CistLS0gYS9wc2V1ZG8uYwor
KysrIGIvcHNldWRvLmMKK0BAIC0xMDg3LDkgKzEwODcsMTUgQEAgcHNldWRvX2RiX2NoZWNrKGlu
dCBmaXgpIHsKKyAJCQlpbnQgZml4dXBfbmVlZGVkID0gMDsKKyAJCQlwc2V1ZG9fZGVidWcoUERC
R0ZfREIsICJDaGVja2luZyA8JXM+XG4iLCBtLT5wYXRoKTsKKyAJCQlpZiAobHN0YXQobS0+cGF0
aCwgJmJ1ZikpIHsKKy0JCQkJZXJyb3JzID0gRVhJVF9GQUlMVVJFOworLQkJCQlwc2V1ZG9fZGlh
ZygiY2FuJ3Qgc3RhdCA8JXM+XG4iLCBtLT5wYXRoKTsKKy0JCQkJY29udGludWU7CisrCQkJCWlm
ICghZml4KSB7CisrCQkJCQlwc2V1ZG9fZGlhZygiY2FuJ3Qgc3RhdCA8JXM+XG4iLCBtLT5wYXRo
KTsKKysJCQkJCWVycm9ycyA9IEVYSVRfRkFJTFVSRTsKKysJCQkJCWNvbnRpbnVlOworKwkJCQl9
IGVsc2UgeworKwkJCQkJcHNldWRvX2RlYnVnKFBEQkdGX0RCLCAiY2FuJ3Qgc3RhdCA8JXM+XG4i
LCBtLT5wYXRoKTsKKysJCQkJCWZpeHVwX25lZWRlZCA9IDI7CisrCQkJCQlnb3RvIGRvX2ZpeHVw
OworKwkJCQl9CisgCQkJfQorIAkJCS8qIGNhbid0IGNoZWNrIGZvciBkZXZpY2UgdHlwZSBtaXNt
YXRjaGVzLCB1aWQvZ2lkLCBvcgorIAkJCSAqIHBlcm1pc3Npb25zLCBiZWNhdXNlIHRob3NlIGFy
ZSB0aGUgdmVyeSB0aGluZ3Mgd2UKK0BAIC0xMTI1LDYgKzExMzEsNyBAQCBwc2V1ZG9fZGJfY2hl
Y2soaW50IGZpeCkgeworIAkJCQkJU19JU0RJUihtLT5tb2RlKSk7CisgCQkJCWZpeHVwX25lZWRl
ZCA9IDI7CisgCQkJfQorKwkJCWRvX2ZpeHVwOgorIAkJCWlmIChmaXh1cF9uZWVkZWQpIHsKKyAJ
CQkJLyogaW4gZml4dXAgbW9kZSwgZWl0aGVyIGRlbGV0ZSAobWlzbWF0Y2hlcykgb3IKKyAJCQkJ
ICogY29ycmVjdCAoZGV2L2lubykuCistLSAKKzIuMjEuMQorCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHNldWRvL3BzZXVkb19naXQuYmIKaW5kZXggODllNDNjNTk5Ni4uYTMwNDljNWU2YyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgpAQCAtMTEsNiArMTEs
NyBAQCBTUkNfVVJJID0gImdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3BzZXVkbyBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXJlYWxwYXRoLmMtUmVtb3ZlLXRyYWlsaW5nLXNsYXNoZXMucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwNi14YXR0ci1hZGp1c3QtZm9yLWF0dHItMi40LjQ4
LXJlbGVhc2UucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vc2VjY29tcC5wYXRjaCBcCisgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLXBzZXVkby1Pbi1hLURCLWZpeHVwLXJlbW92ZS1maWxlcy10aGF0
LWRvLW5vdC1leGlzdC0ucGF0Y2ggXAogICAgICAgICAgICAiCiAKIFNSQ1JFViA9ICIwNjAwNThi
YjI5ZjcwYjI0NGU2ODViM2M3MDRlYjA2NDFiNzM2ZjczIgotLSAKMi4yNS4xCgo=

--0000000000009a98d805a28d07ab--
