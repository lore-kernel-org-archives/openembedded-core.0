Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.15982.1586088132432266606
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 05:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ij0sxoPk;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id s13so9439160lfb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 05:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=108+XFaaz6L2rSrgKMApep30HcMIcrC4COSL27/G+Go=;
        b=ij0sxoPkuVkLc5R4wdryHtfQtWjBC9sLU001aqlFtjvi7wl+6zD30nHd9Ebok6aU7f
         Au1UlfeUE0YRyZ4rWkGPufk/W0gK+jhOIdY4LZGqePXRI63JN+4uv4y1dAhEimMdZtUn
         1oNom042EmCSbQ7anOBxArecD3J4IxBpIqSGjEDhbx8SvyMhGZStB0DyjhCYCZK+WP6L
         LCgsfOdgGOYxvWCeN0ZkWZWRhtpZHUXYbEG112EmOhO7pDAWKW/vUxJ9pgQsObfdJfzj
         sR74J9vfMVhUkqjDZ/lvN7d04lglIoF9IYsk4f8QBEiNfOTEzoHKnu3Z07yzlP4+uxsM
         sFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=108+XFaaz6L2rSrgKMApep30HcMIcrC4COSL27/G+Go=;
        b=qtnjIgusS+bwzABnGJnCOtg3L/9H/ou63ANyaCHyu2Uhty7Vtyxfgbd/vgaNdME+AT
         x60kZ5T1dCGYyRMw6qDvwakbm+POwAKgFNaFoHqm8wsN0jLCtAdLqjBXqjcVMVwSKVVj
         Q6TZrwA7NxDVMiWc138C2Qd6Uvvg+gRRbcjGDAFciPFyBK7OnqC9V5wW9r34FwgJbKh+
         fv5QPYgHSmSxcasHA2sqa/GvmqZoXm7c7BnV16J1c8s/rECfzfJKa8Zqmk+7djgwtRah
         fo6esUYBjT8TJStx4P5drd6iHRZOS4WiCmtYRqlq9wyIuddWJ47+ewIZFXkwv5LxAzkA
         zzTg==
X-Gm-Message-State: AGi0PuaWAIKLqSLCqSn2/rHnmoZiFSRExyMTrhKjefONBeagM4OZ7GCy
	tFNN+bOBuh0LXpcxX/4mnFcSF3Mq2coXq7v8VpA=
X-Google-Smtp-Source: APiQypJ7U9cJG5UpiGKHehaCr7cqgelzueRB9AFp921kJmTV7mCuoqjXjqjFGvXs8jQdeOyqLPaMotfLs0jQRcYY728=
X-Received: by 2002:ac2:483a:: with SMTP id 26mr2861371lft.5.1586088130406;
 Sun, 05 Apr 2020 05:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
 <1602DB74B6717A3F.2403@lists.openembedded.org> <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org> <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
In-Reply-To: <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sun, 5 Apr 2020 14:01:53 +0200
Message-ID: <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com, 
	Paul Barker <pbarker@konsulko.com>
X-Groupsio-MsgNum: 137033
Content-Type: multipart/mixed; boundary="0000000000009892db05a289eb81"

--0000000000009892db05a289eb81
Content-Type: text/plain; charset="UTF-8"

Ups, wrong version

This is the one, sorry.

On Sun, Apr 5, 2020 at 1:53 PM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Hi Richard
>
>
> On Sun, Apr 5, 2020 at 1:04 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sun, 2020-04-05 at 11:56 +0200, Ricardo Ribalda Delgado wrote:
> > > Hi Richard
> > >
> > > I have tried with master  (0c91fcba446418ad1f71d3df9aa3b186bbd353c7)
> > > +
> > > my two patches.
> > > Then I have used crops/poky:fedora-30
> > >
> > > and: oe-selftest  --run-tests wic.Wic.test_exclude_path oe-selftest
> > > --run-tests wic.Wic.test_include_path wic.Wic.test_exclude_path
> > >
> > > With an OK result :(
> >
> > I worried this may be the case. There definitely is something wrong and
> > I could replicate it a third time too.
> >
> > My guess is that there are perhaps files in /tmp/ which are logged in
> > the pseudo database but don't exist when the second rootfs is created.
> > Since the files no longer exist, the database integrity check fails.
>
> That is definitely a good hypothesis. Since you can replicate the bug,
> can you try to add also the attached patch to your tree and re-run the
> test.
>
> What it does, is to remove a file from the database if it has
> vanished, during the bitbake move.
>
> If it works I can add it to the beginning of my series, or even trying
> to upstream it to pseudo.
>
> Best regards
>
> >
> > Why that only occurs on Fedora case on the autobuilder, I don't know,
> > I'm just hypothesising right now...
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

--0000000000009892db05a289eb81
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-pseudo-During-DB-fix-remove-files-that-do-not-exist.patch"
Content-Disposition: attachment; 
	filename="0001-pseudo-During-DB-fix-remove-files-that-do-not-exist.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8mzwelq0>
X-Attachment-Id: f_k8mzwelq0

RnJvbSBiYmRkZWM1MjdkOTA1NmUxZmVkYTBkMjFlZGQ4ZGRiOWQ2NDYyM2IyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSaWNhcmRvIFJpYmFsZGEgRGVsZ2FkbyA8cmljYXJkb0ByaWJh
bGRhLmNvbT4KRGF0ZTogU3VuLCA1IEFwciAyMDIwIDEzOjQ3OjEyICswMjAwClN1YmplY3Q6IFtQ
QVRDSF0gcHNldWRvOiBEdXJpbmcgREIgZml4LCByZW1vdmUgZmlsZXMgdGhhdCBkbyBub3QgZXhp
c3QKCklmIGEgZmlsZSBkb2VzIG5vdCBleGlzdCwgZWl0aGVyIGJlY2F1c2UgaXQgaGFzIGJlZW4g
cmVtb3ZlZCBvdXRzaWRlCmJpdGJha2UsIG9yIGJlY2F1c2Ugb25seSBzb21lIG9mIHRoZSBmaWxl
cyBoYXZlIGJlZW4gbW92ZWQgdG8gYQpkaWZmZXJlbnQgbG9jYXRpb24sIGRlbGV0ZSBpdCBmcm9t
IHRoZSBwc2V1ZG8tZGIgaXMgdGhlIHVzZXIgZGVjaWRlcyB0bwpmaXggdGhlIGRhdGFiYXNlLgoK
U2lnbmVkLW9mZi1ieTogUmljYXJkbyBSaWJhbGRhIERlbGdhZG8gPHJpY2FyZG9AcmliYWxkYS5j
b20+Ci0tLQogLi4uaXh1cC1yZW1vdmUtZmlsZXMtdGhhdC1kby1ub3QtZXhpc3QtLnBhdGNoIHwg
NDggKysrKysrKysrKysrKysrKysrKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9wc2V1
ZG9fZ2l0LmJiICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9maWxlcy8wMDAx
LXBzZXVkby1Pbi1hLURCLWZpeHVwLXJlbW92ZS1maWxlcy10aGF0LWRvLW5vdC1leGlzdC0ucGF0
Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzLzAwMDEt
cHNldWRvLU9uLWEtREItZml4dXAtcmVtb3ZlLWZpbGVzLXRoYXQtZG8tbm90LWV4aXN0LS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvMDAwMS1wc2V1ZG8tT24tYS1E
Qi1maXh1cC1yZW1vdmUtZmlsZXMtdGhhdC1kby1ub3QtZXhpc3QtLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjhhZWMxYzk1NTEKLS0tIC9kZXYvbnVsbAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL2ZpbGVzLzAwMDEtcHNldWRvLU9uLWEtREIt
Zml4dXAtcmVtb3ZlLWZpbGVzLXRoYXQtZG8tbm90LWV4aXN0LS5wYXRjaApAQCAtMCwwICsxLDQ4
IEBACitGcm9tIGIwOTAyZTM2MTA4YjQ5ZTZiYzg4ZDZiMjUxY2MyZjhjZmZjZDVhMTMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNhcmRvIFJpYmFsZGEgPHJpY2FyZG9AcmliYWxk
YS5jb20+CitEYXRlOiBTdW4sIDUgQXByIDIwMjAgMTE6NDA6MzAgKzAwMDAKK1N1YmplY3Q6IFtQ
QVRDSF0gcHNldWRvOiBPbiBhIERCIGZpeHVwIHJlbW92ZSBmaWxlcyB0aGF0IGRvIG5vdCBleGlz
dCBhbnltb3JlCisKK0lmIHRoZSB1c2VyIGRlY2lkZXMgdG8gZml4IGEgZGF0YWJhc2UsIHJlbW92
ZSB0aGUgZmlsZXMgdGhhdCBkbyBub3QKK2V4aXN0IGFueW1vcmUuCitJZiBvbmx5IERCIHRlc3Qg
aXMgc2VsZWN0ZWQgZG8gbm90IGNoYW5nZSB0aGUgYmVoYXZpb3VyIChyZXR1cm4gZXJyb3IpLgor
CitTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIFJpYmFsZGEgPHJpY2FyZG9AcmliYWxkYS5jb20+Cist
LS0KKyBwc2V1ZG8uYyB8IDEzICsrKysrKysrKystLS0KKyAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3BzZXVkby5jIGIvcHNl
dWRvLmMKK2luZGV4IDBmNTg1MGUuLjk4ZTViMGMgMTAwNjQ0CistLS0gYS9wc2V1ZG8uYworKysr
IGIvcHNldWRvLmMKK0BAIC0xMDg3LDkgKzEwODcsMTUgQEAgcHNldWRvX2RiX2NoZWNrKGludCBm
aXgpIHsKKyAJCQlpbnQgZml4dXBfbmVlZGVkID0gMDsKKyAJCQlwc2V1ZG9fZGVidWcoUERCR0Zf
REIsICJDaGVja2luZyA8JXM+XG4iLCBtLT5wYXRoKTsKKyAJCQlpZiAobHN0YXQobS0+cGF0aCwg
JmJ1ZikpIHsKKy0JCQkJZXJyb3JzID0gRVhJVF9GQUlMVVJFOworLQkJCQlwc2V1ZG9fZGlhZygi
Y2FuJ3Qgc3RhdCA8JXM+XG4iLCBtLT5wYXRoKTsKKy0JCQkJY29udGludWU7CisrCQkJCWlmICgh
Zml4KSB7CisrCQkJCQlwc2V1ZG9fZGlhZygiY2FuJ3Qgc3RhdCA8JXM+XG4iLCBtLT5wYXRoKTsK
KysJCQkJCWVycm9ycyA9IEVYSVRfRkFJTFVSRTsKKysJCQkJCWNvbnRpbnVlOworKwkJCQl9IGVs
c2UgeworKwkJCQkJcHNldWRvX2RlYnVnKCJjYW4ndCBzdGF0IDwlcz5cbiIsIG0tPnBhdGgpOwor
KwkJCQkJZml4dXBfbmVlZGVkID0gMjsKKysJCQkJCWdvdG8gZG9fZml4dXA7CisrCQkJCX0KKyAJ
CQl9CisgCQkJLyogY2FuJ3QgY2hlY2sgZm9yIGRldmljZSB0eXBlIG1pc21hdGNoZXMsIHVpZC9n
aWQsIG9yCisgCQkJICogcGVybWlzc2lvbnMsIGJlY2F1c2UgdGhvc2UgYXJlIHRoZSB2ZXJ5IHRo
aW5ncyB3ZQorQEAgLTExMjUsNiArMTEzMSw3IEBAIHBzZXVkb19kYl9jaGVjayhpbnQgZml4KSB7
CisgCQkJCQlTX0lTRElSKG0tPm1vZGUpKTsKKyAJCQkJZml4dXBfbmVlZGVkID0gMjsKKyAJCQl9
CisrCQkJZG9fZml4dXA6CisgCQkJaWYgKGZpeHVwX25lZWRlZCkgeworIAkJCQkvKiBpbiBmaXh1
cCBtb2RlLCBlaXRoZXIgZGVsZXRlIChtaXNtYXRjaGVzKSBvcgorIAkJCQkgKiBjb3JyZWN0IChk
ZXYvaW5vKS4KKy0tIAorMi4yMS4xCisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wc2V1ZG8vcHNldWRvX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNl
dWRvX2dpdC5iYgppbmRleCA4OWU0M2M1OTk2Li5hMzA0OWM1ZTZjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3BzZXVkby9wc2V1ZG9fZ2l0LmJiCkBAIC0xMSw2ICsxMSw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcHNldWRvIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtcmVhbHBhdGguYy1SZW1vdmUtdHJhaWxpbmctc2xhc2hlcy5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDA2LXhhdHRyLWFkanVzdC1mb3ItYXR0ci0yLjQuNDgtcmVsZWFzZS5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly9zZWNjb21wLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTov
LzAwMDEtcHNldWRvLU9uLWEtREItZml4dXAtcmVtb3ZlLWZpbGVzLXRoYXQtZG8tbm90LWV4aXN0
LS5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDUkVWID0gIjA2MDA1OGJiMjlmNzBiMjQ0ZTY4
NWIzYzcwNGViMDY0MWI3MzZmNzMiCi0tIAoyLjI1LjEKCg==

--0000000000009892db05a289eb81--
