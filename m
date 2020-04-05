Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.15881.1586087602069817287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 04:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VzSYXOmk;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id r17so5886367lff.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 04:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gxBr7r0hOkWMIf1mW+AHYvYSp/R7+CYLWKF9eERY8nw=;
        b=VzSYXOmk+XU5/G3E02BmZ9+u4QgbBG8DNZb2mt9DXhhsSDdVEvJV+y3YLQs1HlPx5e
         fZb6k1sXnM7eBXljZsyuxTgcXaJiOPU2WXnLdU0UEdwXoWQlxFU8B9jlr/KTANbkgveI
         yholuXoN+oVC/dymQy0/+NuS64t9h8Zkk/lXIS0QVS0RYdMQiXIdvaWGd/FlBDJ8KIZt
         lbitA7Tfl2bg2bvt3KZN/VJ4Xc5QQ47yZGmU1QgZjfdScYp9gByK6a4lsyhNfuI3C/LI
         oadVX36pJJHSSPnba3czOLzWmavWJmSTiImA8NECkH5cUm137n3NcsxGOe1jY4io8lpS
         STQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gxBr7r0hOkWMIf1mW+AHYvYSp/R7+CYLWKF9eERY8nw=;
        b=mOF49uGagB/o2gjqLi+8mz93YX/HoShIvUfvRUO/9O6h8e7BG+SnhTkq2IX6Vif779
         Ysde6Ylt83NU+eF1ewUZCtS+ESb7KVVy3pDZSfMq6PJjrwpauQt6u/xIdcnOSodpNinS
         gVtDvb5QLchW5cGW7YowFW/vWH0Mz37JibEPvHtXuazCA/gPuKA/YiGRQ5JGs/f//fkV
         dzdnNWvO8Ih03HSsbVadPbRjyhTdeG1gmpWNH6XdqyT+5myYDAgVhkg/mq214ugxQ526
         u7HvT+kpN3ymMGYbCrgtCPJ2pEacrS46sQAEsrpNXsmzdlwsL4eEqIIqjz8HpWSkcsfR
         OaXw==
X-Gm-Message-State: AGi0Pub/XACIB+HrEj07MwAqRPPam8sJdvlgO4Bha/rsoPC8bhTQ5iEF
	xZxEcFmIkV3o6jMm+BfzgCVniDk88SuTwStsSEA=
X-Google-Smtp-Source: APiQypJuty94mMBYwO091YjwvjzibLFLceKCT4wQjzsSUGNXH1gYdV1Mq9mT/r8Sp4QMHA7Mz7+zWJE7bIuiTkgEbg8=
X-Received: by 2002:ac2:545b:: with SMTP id d27mr10131567lfn.187.1586087599996;
 Sun, 05 Apr 2020 04:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200304144936.2559106-1-ricardo@ribalda.com> <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
 <1602DB74B6717A3F.2403@lists.openembedded.org> <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
In-Reply-To: <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sun, 5 Apr 2020 13:53:02 +0200
Message-ID: <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, jpewhacker@gmail.com, 
	Paul Barker <pbarker@konsulko.com>
X-Groupsio-MsgNum: 137032
Content-Type: multipart/mixed; boundary="000000000000fbb6b005a289cbee"

--000000000000fbb6b005a289cbee
Content-Type: text/plain; charset="UTF-8"

Hi Richard


On Sun, Apr 5, 2020 at 1:04 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2020-04-05 at 11:56 +0200, Ricardo Ribalda Delgado wrote:
> > Hi Richard
> >
> > I have tried with master  (0c91fcba446418ad1f71d3df9aa3b186bbd353c7)
> > +
> > my two patches.
> > Then I have used crops/poky:fedora-30
> >
> > and: oe-selftest  --run-tests wic.Wic.test_exclude_path oe-selftest
> > --run-tests wic.Wic.test_include_path wic.Wic.test_exclude_path
> >
> > With an OK result :(
>
> I worried this may be the case. There definitely is something wrong and
> I could replicate it a third time too.
>
> My guess is that there are perhaps files in /tmp/ which are logged in
> the pseudo database but don't exist when the second rootfs is created.
> Since the files no longer exist, the database integrity check fails.

That is definitely a good hypothesis. Since you can replicate the bug,
can you try to add also the attached patch to your tree and re-run the
test.

What it does, is to remove a file from the database if it has
vanished, during the bitbake move.

If it works I can add it to the beginning of my series, or even trying
to upstream it to pseudo.

Best regards

>
> Why that only occurs on Fedora case on the autobuilder, I don't know,
> I'm just hypothesising right now...
>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

--000000000000fbb6b005a289cbee
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-pseudo-During-DB-fix-remove-files-that-do-not-exist.patch"
Content-Disposition: attachment; 
	filename="0001-pseudo-During-DB-fix-remove-files-that-do-not-exist.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8mzjevq0>
X-Attachment-Id: f_k8mzjevq0

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

--000000000000fbb6b005a289cbee--
