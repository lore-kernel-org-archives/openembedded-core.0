Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5F1C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:01:49 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10322.1700150502007477075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kCplWet7;
 spf=pass (domain: mvista.com, ip: 209.85.208.171, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c83ffcdbe3so12100071fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700150500; x=1700755300; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FRBapmxvXuO9fipudngO59d1k/DId5MqI+aAA4CuEI=;
        b=kCplWet76CPkpHRHZI/iGsIn4sMJ6afugf28NrbGnJohnKjg5JcLkPc+nwmOYnafEB
         ljtI4x4ZQcHfXVBtVgzR3Y/9g89Lts3gr9J8vO9FAvdaGOFL+QQxc1KAoNAEdBjoZI5c
         oLja0kS3mVI4vjgzuool23Mo/IR03hSd5XAD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700150500; x=1700755300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FRBapmxvXuO9fipudngO59d1k/DId5MqI+aAA4CuEI=;
        b=mPpvtHv+nFfYH2Z80rOliusCA8zq7zG76bsKsXRsbb/z+lq6uZo0uMtQFz9DY3yBhl
         D+NqSw4cA07yu630/5MggQc2xYJRbd9DHwflEXKNnLAJ3J8xlD64uFjTklcmPcCUWsDv
         LYNY4N30J47VYKKgB9V4CqaUmMdr7EHodAIvSqdT5dSDVskjJBXAamaogEvLmEFmD06E
         Y4XioNNmJQSJAKwNS189vr2yiR3xQoU0CYaU38NGEZcOoDFusKp9tNRU8V+m3bYvenKp
         74WQ7+RXp0DnGNltMgH091s83D7FQRL13RjdNAs35u7Y/eLM6Li8kO1qUGliHeN6supj
         i7aw==
X-Gm-Message-State: AOJu0YyEV+NX7iFGH+I1ugY1piGTKGaGzqp7VSCAa4Bg1627Z7QlBk1O
	aSG7mSms5pr6nQeI83QKwtIR7/aOfn5X7z/nr1zCog==
X-Google-Smtp-Source: AGHT+IHwCuTUwzCtLQRmcyfD+MHVgK1nL38q1Vjadofp08CEAFqtdZQ5H6njeYOjLj46+jtW+Ie3jPsaw7dH1O3El2o=
X-Received: by 2002:a2e:b4a8:0:b0:2c5:247d:581 with SMTP id
 q8-20020a2eb4a8000000b002c5247d0581mr6164548ljm.22.1700150499812; Thu, 16 Nov
 2023 08:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20231116040549.11447-1-vanusuri@mvista.com> <93710C32-2A78-417E-970F-E4B010262326@arm.com>
 <57008fe2-36a9-4a7e-909b-4cab0a86f351@mvista.com>
In-Reply-To: <57008fe2-36a9-4a7e-909b-4cab0a86f351@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 16 Nov 2023 21:31:26 +0530
Message-ID: <CANQUz1_qynUTH-3KOq11e+CO+xUGoZbxpu1qLRGEee4ddCK4cQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] avahi: Fix for multiple CVE's
To: jpuhlman@mvista.com, Ross Burton <Ross.Burton@arm.com>, 
	"Gupta, Meenali" <Meenali.Gupta@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009b38f5060a47228b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190800

--0000000000009b38f5060a47228b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

As discussed with Meenali, I agreed she was going to do this work.
She has already submitted patches for multiple branches ( master,
mickledore and kirkstone ).

For CVE-2023-38469, we need to include 2 commits to fix the CVE. Meenali
will send the v2 patch for CVE-2023-38469 which will include 2 patches for
all the branches.

Thank you Meenali for your timely response.

Thanks & Regards,
Vijay

On Thu, Nov 16, 2023 at 7:56=E2=80=AFPM Jeremy Puhlman via lists.openembedd=
ed.org
<jpuhlman=3Dmvista.com@lists.openembedded.org> wrote:

>
>
> On 11/16/2023 3:22 AM, Ross Burton wrote:
> > Hi Vijay and Meenali,
> >
> > Hopefully this will show everyone - especially WR and Montavista - that
> we need to communicate better when working on CVEs.  In the short term at
> least, Marta proposed a wiki page which can be updated via a tool and whe=
n
> someone is working on an issue that can be marked to avoid duplication of
> effort.  Would that be acceptable to both of your companies?
>
> Yeah, I think something like that would be great on our end, provided
> its automated and the data can be extracted, so it can be consolidated
> in internal CVE tracking that we are currently required to.
>
> >
> > I=E2=80=99ve not checked that the fixes are identical, but apparently I=
 need to
> remind everyone that we take fixes in *master first* and then backport to
> the releases in order.
> There should also be an agree upon change decoration to indicate
> non-applicability/differently addressed in earlier releases.
>
> With 4 year LTS releases many issues are just not going to be applicable
> to master. Also there may well be very good reasons to fix a given set
> of CVEs in
> completely different ways, but making sure they are addressed in both is
> important. Setting aside this example, in almost all cases on master
> moving to the fixed version, is almost always the right answer, where as
> on say dunfell, moving to the new version may have too many knock on
> effects to make sense.
> In this instance, Khem has already indicated moving to the new release
> may make sense for both kirkstone and master.
>
> >
> > Luckily the avahi recipe is fairly untouched so this should be trivial.
> Can you both discuss and agree who is going to do this?
> Vijay can you work with Meenali to consolidate this patch.
> >
> > Ross
> >
> >> On 16 Nov 2023, at 04:05, Vijay Anusuri via lists.openembedded.org
> <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
> >>
> >> From: Vijay Anusuri <vanusuri@mvista.com>
> >>
> >> Patches to fix:
> >> CVE-2023-38469
> >> CVE-2023-38470
> >> CVE-2023-38471
> >> CVE-2023-38472
> >> CVE-2023-38473
> >>
> >> Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af=
6e3a1cf
> >> &
> >>
> https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa51=
6166237
> >> &
> >>
> https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b5=
5b5d66c
> >> &
> >>
> https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd8=
8d93b09
> >> &
> >>
> https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9=
c8dee40
> >> &
> >>
> https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f=
8646797
> ]
> >>
> >> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> ---
> >> meta/recipes-connectivity/avahi/avahi_0.8.bb  |   6 +
> >> .../avahi/files/CVE-2023-38469-1.patch        |  47 ++++++++
> >> .../avahi/files/CVE-2023-38469-2.patch        |  65 +++++++++++
> >> .../avahi/files/CVE-2023-38470.patch          |  56 +++++++++
> >> .../avahi/files/CVE-2023-38471.patch          |  72 ++++++++++++
> >> .../avahi/files/CVE-2023-38472.patch          |  47 ++++++++
> >> .../avahi/files/CVE-2023-38473.patch          | 108 ++++++++++++++++++
> >> 7 files changed, 401 insertions(+)
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> >> create mode 100644
> meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> >>
> >> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> >> index b5c966c102..772fb43939 100644
> >> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> >> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> >> @@ -26,6 +26,12 @@ SRC_URI =3D "
> https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}
> >>             file://0001-Fix-opening-etc-resolv.conf-error.patch \
> >>             file://handle-hup.patch \
> >>             file://local-ping.patch \
> >> +           file://CVE-2023-38469-1.patch \
> >> +           file://CVE-2023-38469-2.patch \
> >> +           file://CVE-2023-38470.patch \
> >> +           file://CVE-2023-38471.patch \
> >> +           file://CVE-2023-38472.patch \
> >> +           file://CVE-2023-38473.patch \
> >>             "
> >>
> >> UPSTREAM_CHECK_URI =3D "https://github.com/lathiat/avahi/releases/"
> >> diff --git
> a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> >> new file mode 100644
> >> index 0000000000..99c717daf3
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch
> >> @@ -0,0 +1,47 @@
> >> +From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 200=
1
> >> +From: Evgeny Vereshchagin <evvers@ya.ru>
> >> +Date: Mon, 23 Oct 2023 20:29:31 +0000
> >> +Subject: [PATCH] core: reject overly long TXT resource records
> >> +
> >> +Closes https://github.com/lathiat/avahi/issues/455
> >> +
> >> +CVE-2023-38469
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56deef1f464529af=
6e3a1cf
> ]
> >> +CVE: CVE-2023-38469
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-core/rr.c | 9 ++++++++-
> >> + 1 file changed, 8 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/avahi-core/rr.c b/avahi-core/rr.c
> >> +index 2bb89244..9c04ebbd 100644
> >> +--- a/avahi-core/rr.c
> >> ++++ b/avahi-core/rr.c
> >> +@@ -32,6 +32,7 @@
> >> + #include <avahi-common/malloc.h>
> >> + #include <avahi-common/defs.h>
> >> +
> >> ++#include "dns.h"
> >> + #include "rr.h"
> >> + #include "log.h"
> >> + #include "util.h"
> >> +@@ -689,11 +690,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
> >> +         case AVAHI_DNS_TYPE_TXT: {
> >> +
> >> +             AvahiStringList *strlst;
> >> ++            size_t used =3D 0;
> >> +
> >> +-            for (strlst =3D r->data.txt.string_list; strlst; strlst =
=3D
> strlst->next)
> >> ++            for (strlst =3D r->data.txt.string_list; strlst; strlst =
=3D
> strlst->next) {
> >> +                 if (strlst->size > 255 || strlst->size <=3D 0)
> >> +                     return 0;
> >> +
> >> ++                used +=3D 1+strlst->size;
> >> ++                if (used > AVAHI_DNS_RDATA_MAX)
> >> ++                    return 0;
> >> ++            }
> >> ++
> >> +             return 1;
> >> +         }
> >> +     }
> >> diff --git
> a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> >> new file mode 100644
> >> index 0000000000..b83a70e29b
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch
> >> @@ -0,0 +1,65 @@
> >> +From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00 200=
1
> >> +From: Evgeny Vereshchagin <evvers@ya.ru>
> >> +Date: Wed, 25 Oct 2023 18:15:42 +0000
> >> +Subject: [PATCH] tests: pass overly long TXT resource records
> >> +
> >> +to make sure they don't crash avahi any more.
> >> +
> >> +It reproduces https://github.com/lathiat/avahi/issues/455
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa51=
6166237
> ]
> >> +CVE: CVE-2023-38469
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-client/client-test.c | 14 ++++++++++++++
> >> + 1 file changed, 14 insertions(+)
> >> +
> >> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
> >> +index 7d04a6a..66e3574 100644
> >> +--- a/avahi-client/client-test.c
> >> ++++ b/avahi-client/client-test.c
> >> +@@ -22,6 +22,7 @@
> >> + #endif
> >> +
> >> + #include <stdio.h>
> >> ++#include <string.h>
> >> + #include <assert.h>
> >> +
> >> + #include <avahi-client/client.h>
> >> +@@ -33,6 +34,8 @@
> >> + #include <avahi-common/malloc.h>
> >> + #include <avahi-common/timeval.h>
> >> +
> >> ++#include <avahi-core/dns.h>
> >> ++
> >> + static const AvahiPoll *poll_api =3D NULL;
> >> + static AvahiSimplePoll *simple_poll =3D NULL;
> >> +
> >> +@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     uint32_t cookie;
> >> +     struct timeval tv;
> >> +     AvahiAddress a;
> >> ++    uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];
> >> ++    AvahiStringList *txt =3D NULL;
> >> ++    int r;
> >> +
> >> +     simple_poll =3D avahi_simple_poll_new();
> >> +     poll_api =3D avahi_simple_poll_get(simple_poll);
> >> +@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     printf("%s\n", avahi_strerror(avahi_entry_group_add_service
> (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site",
> "_http._tcp", NULL, NULL, 80, "foo=3Dbar", NULL)));
> >> +     printf("add_record: %d\n", avahi_entry_group_add_record (group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120,
> "\5booya", 6));
> >> +
> >> ++    memset(rdata, 1, sizeof(rdata));
> >> ++    r =3D avahi_string_list_parse(rdata, sizeof(rdata), &txt);
> >> ++    assert(r >=3D 0);
> >> ++    assert(avahi_string_list_serialize(txt, NULL, 0) =3D=3D
> sizeof(rdata));
> >> ++    error =3D avahi_entry_group_add_service_strlst(group,
> AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", "_qotd._tcp", NULL, NULL=
,
> 123, txt);
> >> ++    assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
> >> ++    avahi_string_list_free(txt);
> >> ++
> >> +     avahi_entry_group_commit (group);
> >> +
> >> +     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0,
> avahi_domain_browser_callback, (char*) "omghai3u");
> >> +--
> >> +2.25.1
> >> +
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
> >> new file mode 100644
> >> index 0000000000..1cbb00dcab
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
> >> @@ -0,0 +1,56 @@
> >> +From 94cb6489114636940ac683515417990b55b5d66c Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@red=
hat.com>
> >> +Date: Tue, 11 Apr 2023 15:29:59 +0200
> >> +Subject: [PATCH] Ensure each label is at least one byte long
> >> +
> >> +The only allowed exception is single dot, where it should return empt=
y
> >> +string.
> >> +
> >> +Fixes #454.
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b5=
5b5d66c
> ]
> >> +CVE: CVE-2023-38470
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-common/domain-test.c | 14 ++++++++++++++
> >> + avahi-common/domain.c      |  2 +-
> >> + 2 files changed, 15 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
> >> +index cf763eca6..3acc1c1e4 100644
> >> +--- a/avahi-common/domain-test.c
> >> ++++ b/avahi-common/domain-test.c
> >> +@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     printf("%s\n", s =3D avahi_normalize_name_strdup("fo\\\\o\\..f
> oo."));
> >> +     avahi_free(s);
> >> +
> >> ++    printf("%s\n", s =3D avahi_normalize_name_strdup("."));
> >> ++    avahi_free(s);
> >> ++
> >> ++    s =3D
> avahi_normalize_name_strdup(",.=3D.}.=3D.?-.}.=3D.?.?.}.}.?.?.?.z.?.?.}.}=
."
> >> ++    "}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.}.}=
.}"
> >> ++    ".?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=3D.?.?.}.}.?.?.?.zM=
.?`"
> >> ++    "?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}??.}.}.?.?."
> >> ++    "?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.?`?.}.}.}."
> >> ++    "??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=3D.?.?.}?"
> >> ++    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM."
> >> ++    "?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.?.r.=3D.?.}.=3D.?.?=
."
> >> ++    "}.?.?.?.}.=3D.?.?.}");
> >> ++    assert(s =3D=3D NULL);
> >> ++
> >> +     printf("%i\n", avahi_domain_equal("\\065aa
> bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
> >> +     printf("%i\n", avahi_domain_equal("A", "a"));
> >> +
> >> +diff --git a/avahi-common/domain.c b/avahi-common/domain.c
> >> +index 3b1ab6834..e66d2416c 100644
> >> +--- a/avahi-common/domain.c
> >> ++++ b/avahi-common/domain.c
> >> +@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char
> *ret_s, size_t size) {
> >> +         }
> >> +
> >> +         if (!empty) {
> >> +-            if (size < 1)
> >> ++            if (size < 2)
> >> +                 return NULL;
> >> +
> >> +             *(r++) =3D '.';
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
> >> new file mode 100644
> >> index 0000000000..8242646da1
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
> >> @@ -0,0 +1,72 @@
> >> +From 894f085f402e023a98cbb6f5a3d117bd88d93b09 Mon Sep 17 00:00:00 200=
1
> >> +From: Michal Sekletar <msekleta@redhat.com>
> >> +Date: Mon, 23 Oct 2023 13:38:35 +0200
> >> +Subject: [PATCH] core: extract host name using avahi_unescape_label()
> >> +
> >> +Previously we could create invalid escape sequence when we split the
> >> +string on dot. For example, from valid host name "foo\\.bar" we have
> >> +created invalid name "foo\\" and tried to set that as the host name
> >> +which crashed the daemon.
> >> +
> >> +Fixes #453
> >> +
> >> +CVE-2023-38471
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd8=
8d93b09
> ]
> >> +CVE: CVE-2023-38471
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-core/server.c | 27 +++++++++++++++++++++------
> >> + 1 file changed, 21 insertions(+), 6 deletions(-)
> >> +
> >> +diff --git a/avahi-core/server.c b/avahi-core/server.c
> >> +index c32637af8..f6a21bb77 100644
> >> +--- a/avahi-core/server.c
> >> ++++ b/avahi-core/server.c
> >> +@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
> >> + }
> >> +
> >> + int avahi_server_set_host_name(AvahiServer *s, const char *host_name=
)
> {
> >> +-    char *hn =3D NULL;
> >> ++    char label_escaped[AVAHI_LABEL_MAX*4+1];
> >> ++    char label[AVAHI_LABEL_MAX];
> >> ++    char *hn =3D NULL, *h;
> >> ++    size_t len;
> >> ++
> >> +     assert(s);
> >> +
> >> +     AVAHI_CHECK_VALIDITY(s, !host_name ||
> avahi_is_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);
> >> +@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s=
,
> const char *host_name) {
> >> +     else
> >> +         hn =3D avahi_normalize_name_strdup(host_name);
> >> +
> >> +-    hn[strcspn(hn, ".")] =3D 0;
> >> ++    h =3D hn;
> >> ++    if (!avahi_unescape_label((const char **)&hn, label,
> sizeof(label))) {
> >> ++        avahi_free(h);
> >> ++        return AVAHI_ERR_INVALID_HOST_NAME;
> >> ++    }
> >> ++
> >> ++    avahi_free(h);
> >> ++
> >> ++    h =3D label_escaped;
> >> ++    len =3D sizeof(label_escaped);
> >> ++    if (!avahi_escape_label(label, strlen(label), &h, &len))
> >> ++        return AVAHI_ERR_INVALID_HOST_NAME;
> >> +
> >> +-    if (avahi_domain_equal(s->host_name, hn) && s->state !=3D
> AVAHI_SERVER_COLLISION) {
> >> +-        avahi_free(hn);
> >> ++    if (avahi_domain_equal(s->host_name, label_escaped) && s->state
> !=3D AVAHI_SERVER_COLLISION)
> >> +         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
> >> +-    }
> >> +
> >> +     withdraw_host_rrs(s);
> >> +
> >> +     avahi_free(s->host_name);
> >> +-    s->host_name =3D hn;
> >> ++    s->host_name =3D avahi_strdup(label_escaped);
> >> ++    if (!s->host_name)
> >> ++        return AVAHI_ERR_NO_MEMORY;
> >> +
> >> +     update_fqdn(s);
> >> +
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> >> new file mode 100644
> >> index 0000000000..43b26c1132
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
> >> @@ -0,0 +1,47 @@
> >> +From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 200=
1
> >> +From: Michal Sekletar <msekleta@redhat.com>
> >> +Date: Thu, 19 Oct 2023 17:36:44 +0200
> >> +Subject: [PATCH] core: make sure there is rdata to process before
> parsing it
> >> +
> >> +Fixes #452
> >> +
> >> +CVE-2023-38472
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9=
c8dee40
> ]
> >> +CVE: CVE-2023-38472
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-client/client-test.c      | 3 +++
> >> + avahi-daemon/dbus-entry-group.c | 2 +-
> >> + 2 files changed, 4 insertions(+), 1 deletion(-)
> >> +
> >> +diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
> >> +index 66e3574..9a015d7 100644
> >> +--- a/avahi-client/client-test.c
> >> ++++ b/avahi-client/client-test.c
> >> +@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc,
> AVAHI_GCC_UNUSED char *argv[]) {
> >> +     assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);
> >> +     avahi_string_list_free(txt);
> >> +
> >> ++    error =3D avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
> >> ++    assert(error !=3D AVAHI_OK);
> >> ++
> >> +     avahi_entry_group_commit (group);
> >> +
> >> +     domain =3D avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC,
> AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0,
> avahi_domain_browser_callback, (char*) "omghai3u");
> >> +diff --git a/avahi-daemon/dbus-entry-group.c
> b/avahi-daemon/dbus-entry-group.c
> >> +index 4e879a5..aa23d4b 100644
> >> +--- a/avahi-daemon/dbus-entry-group.c
> >> ++++ b/avahi-daemon/dbus-entry-group.c
> >> +@@ -340,7 +340,7 @@ DBusHandlerResult
> avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
> >> +         if (!(r =3D avahi_record_new_full (name, clazz, type, ttl)))
> >> +             return avahi_dbus_respond_error(c, m,
> AVAHI_ERR_NO_MEMORY, NULL);
> >> +
> >> +-        if (avahi_rdata_parse (r, rdata, size) < 0) {
> >> ++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
> >> +             avahi_record_unref (r);
> >> +             return avahi_dbus_respond_error(c, m,
> AVAHI_ERR_INVALID_RDATA, NULL);
> >> +         }
> >> +--
> >> +2.25.1
> >> +
> >> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patc=
h
> b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> >> new file mode 100644
> >> index 0000000000..7b33d564f8
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
> >> @@ -0,0 +1,108 @@
> >> +From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17 00:00:00 200=
1
> >> +From: Michal Sekletar <msekleta@redhat.com>
> >> +Date: Wed, 11 Oct 2023 17:45:44 +0200
> >> +Subject: [PATCH] common: derive alternative host name from its
> unescaped
> >> + version
> >> +
> >> +Normalization of input makes sure we don't have to deal with special
> >> +cases like unescaped dot at the end of label.
> >> +
> >> +Fixes #451 #487
> >> +CVE-2023-38473
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f=
8646797
> ]
> >> +CVE: CVE-2023-38473
> >> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> +---
> >> + avahi-common/alternative-test.c |  3 +++
> >> + avahi-common/alternative.c      | 27 +++++++++++++++++++--------
> >> + 2 files changed, 22 insertions(+), 8 deletions(-)
> >> +
> >> +diff --git a/avahi-common/alternative-test.c
> b/avahi-common/alternative-test.c
> >> +index 9255435ec..681fc15b8 100644
> >> +--- a/avahi-common/alternative-test.c
> >> ++++ b/avahi-common/alternative-test.c
> >> +@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSE=
D
> char *argv[]) {
> >> +     const char* const test_strings[] =3D {
> >> +
>  "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
> >> +         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=C3=
=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC",
> >> ++        ").",
> >> ++        "\\.",
> >> ++
> "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\",
> >> +         "gurke",
> >> +         "-",
> >> +         " #",
> >> +diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
> >> +index b3d39f0ed..a094e6d76 100644
> >> +--- a/avahi-common/alternative.c
> >> ++++ b/avahi-common/alternative.c
> >> +@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
> >> + }
> >> +
> >> + char *avahi_alternative_host_name(const char *s) {
> >> ++    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
> >> ++    char *alt, *r, *ret;
> >> +     const char *e;
> >> +-    char *r;
> >> ++    size_t len;
> >> +
> >> +     assert(s);
> >> +
> >> +     if (!avahi_is_valid_host_name(s))
> >> +         return NULL;
> >> +
> >> +-    if ((e =3D strrchr(s, '-'))) {
> >> ++    if (!avahi_unescape_label(&s, label, sizeof(label)))
> >> ++        return NULL;
> >> ++
> >> ++    if ((e =3D strrchr(label, '-'))) {
> >> +         const char *p;
> >> +
> >> +         e++;
> >> +@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) =
{
> >> +
> >> +     if (e) {
> >> +         char *c, *m;
> >> +-        size_t l;
> >> +         int n;
> >> +
> >> +         n =3D atoi(e)+1;
> >> +         if (!(m =3D avahi_strdup_printf("%i", n)))
> >> +             return NULL;
> >> +
> >> +-        l =3D e-s-1;
> >> ++        len =3D e-label-1;
> >> +
> >> +-        if (l >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
> >> +-            l =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
> >> ++        if (len >=3D AVAHI_LABEL_MAX-1-strlen(m)-1)
> >> ++            len =3D AVAHI_LABEL_MAX-1-strlen(m)-1;
> >> +
> >> +-        if (!(c =3D avahi_strndup(s, l))) {
> >> ++        if (!(c =3D avahi_strndup(label, len))) {
> >> +             avahi_free(m);
> >> +             return NULL;
> >> +         }
> >> +@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) =
{
> >> +     } else {
> >> +         char *c;
> >> +
> >> +-        if (!(c =3D avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
> >> ++        if (!(c =3D avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
> >> +             return NULL;
> >> +
> >> +         drop_incomplete_utf8(c);
> >> +@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s)=
 {
> >> +         avahi_free(c);
> >> +     }
> >> +
> >> ++    alt =3D alternative;
> >> ++    len =3D sizeof(alternative);
> >> ++    ret =3D avahi_escape_label(r, strlen(r), &alt, &len);
> >> ++
> >> ++    avahi_free(r);
> >> ++    r =3D avahi_strdup(ret);
> >> ++
> >> +     assert(avahi_is_valid_host_name(r));
> >> +
> >> +     return r;
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> >
> >
>
> --
> Jeremy Puhlman
> jpuhlman@mvista.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190798):
> https://lists.openembedded.org/g/openembedded-core/message/190798
> Mute This Topic: https://lists.openembedded.org/mt/102621335/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009b38f5060a47228b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross,</div><div><br></div><div>As discussed with M=
eenali, I agreed she was going to do this work. <br>She has already submitt=
ed patches for multiple branches ( master, mickledore and kirkstone ). <br>=
</div><div><br></div><div>For CVE-2023-38469, we need to include 2 commits =
to fix the CVE. Meenali will send the v2 patch for CVE-2023-38469 which wil=
l include 2 patches for all the branches.<br></div><div><br></div><div>Than=
k you Meenali for your timely response.<br></div><div>=C2=A0<br></div><div>=
Thanks &amp; Regards,<br></div><div>Vijay<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 16, 2023 at =
7:56=E2=80=AFPM Jeremy Puhlman via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;jpuhlman=3D<a href=3D"mailto:mvista.com@li=
sts.openembedded.org">mvista.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/16/2023 3:22 AM, Ross Burton wrote:<br>
&gt; Hi Vijay and Meenali,<br>
&gt;<br>
&gt; Hopefully this will show everyone - especially WR and Montavista - tha=
t we need to communicate better when working on CVEs.=C2=A0 In the short te=
rm at least, Marta proposed a wiki page which can be updated via a tool and=
 when someone is working on an issue that can be marked to avoid duplicatio=
n of effort.=C2=A0 Would that be acceptable to both of your companies?<br>
<br>
Yeah, I think something like that would be great on our end, provided <br>
its automated and the data can be extracted, so it can be consolidated <br>
in internal CVE tracking that we are currently required to.<br>
<br>
&gt;<br>
&gt; I=E2=80=99ve not checked that the fixes are identical, but apparently =
I need to remind everyone that we take fixes in *master first* and then bac=
kport to the releases in order.<br>
There should also be an agree upon change decoration to indicate <br>
non-applicability/differently addressed in earlier releases.<br>
<br>
With 4 year LTS releases many issues are just not going to be applicable <b=
r>
to master. Also there may well be very good reasons to fix a given set <br>
of CVEs in<br>
completely different ways, but making sure they are addressed in both is <b=
r>
important. Setting aside this example, in almost all cases on master<br>
moving to the fixed version, is almost always the right answer, where as <b=
r>
on say dunfell, moving to the new version may have too many knock on <br>
effects to make sense.<br>
In this instance, Khem has already indicated moving to the new release <br>
may make sense for both kirkstone and master.<br>
<br>
&gt;<br>
&gt; Luckily the avahi recipe is fairly untouched so this should be trivial=
.=C2=A0 Can you both discuss and agree who is going to do this?<br>
Vijay can you work with Meenali to consolidate this patch.<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt;&gt; On 16 Nov 2023, at 04:05, Vijay Anusuri via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedded.org=
" target=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Patches to fix:<br>
&gt;&gt; CVE-2023-38469<br>
&gt;&gt; CVE-2023-38470<br>
&gt;&gt; CVE-2023-38471<br>
&gt;&gt; CVE-2023-38472<br>
&gt;&gt; CVE-2023-38473<br>
&gt;&gt;<br>
&gt;&gt; Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/a=
vahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb56=
deef1f464529af6e3a1cf</a><br>
&gt;&gt; &amp;<br>
&gt;&gt; <a href=3D"https://github.com/lathiat/avahi/commit/c6cab87df290448=
a63323c8ca759baa516166237" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/lathiat/avahi/commit/c6cab87df290448a63323c8ca759baa516166237</a><b=
r>
&gt;&gt; &amp;<br>
&gt;&gt; <a href=3D"https://github.com/lathiat/avahi/commit/94cb64891146369=
40ac683515417990b55b5d66c" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/lathiat/avahi/commit/94cb6489114636940ac683515417990b55b5d66c</a><b=
r>
&gt;&gt; &amp;<br>
&gt;&gt; <a href=3D"https://github.com/lathiat/avahi/commit/894f085f402e023=
a98cbb6f5a3d117bd88d93b09" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/lathiat/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09</a><b=
r>
&gt;&gt; &amp;<br>
&gt;&gt; <a href=3D"https://github.com/lathiat/avahi/commit/b024ae5749f4aeb=
a03478e6391687c3c9c8dee40" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/lathiat/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40</a><b=
r>
&gt;&gt; &amp;<br>
&gt;&gt; <a href=3D"https://github.com/lathiat/avahi/commit/b448c9f771bada1=
4ae8de175695a9729f8646797" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/lathiat/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797</a>]<=
br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista=
.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb" re=
l=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a>=C2=A0 |=C2=A0 =C2=A06 +=
<br>
&gt;&gt; .../avahi/files/CVE-2023-38469-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 47 ++++++++<br>
&gt;&gt; .../avahi/files/CVE-2023-38469-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 65 +++++++++++<br>
&gt;&gt; .../avahi/files/CVE-2023-38470.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 56 +++++++++<br>
&gt;&gt; .../avahi/files/CVE-2023-38471.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 72 ++++++++++++<br>
&gt;&gt; .../avahi/files/CVE-2023-38472.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 47 ++++++++<br>
&gt;&gt; .../avahi/files/CVE-2023-38473.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 108 ++++++++++++++++++<br>
&gt;&gt; 7 files changed, 401 insertions(+)<br>
&gt;&gt; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-=
38469-1.patch<br>
&gt;&gt; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-=
38469-2.patch<br>
&gt;&gt; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-=
38470.patch<br>
&gt;&gt; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-=
38471.patch<br>
&gt;&gt; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-=
38472.patch<br>
&gt;&gt; create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-=
38473.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/avahi/<a href=3D"http://ava=
hi_0.8.bb" rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a> b/meta/rec=
ipes-connectivity/avahi/<a href=3D"http://avahi_0.8.bb" rel=3D"noreferrer" =
target=3D"_blank">avahi_0.8.bb</a><br>
&gt;&gt; index b5c966c102..772fb43939 100644<br>
&gt;&gt; --- a/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.=
bb" rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
&gt;&gt; +++ b/meta/recipes-connectivity/avahi/<a href=3D"http://avahi_0.8.=
bb" rel=3D"noreferrer" target=3D"_blank">avahi_0.8.bb</a><br>
&gt;&gt; @@ -26,6 +26,12 @@ SRC_URI =3D &quot;<a href=3D"https://github.com=
/lathiat/avahi/releases/download/v$%7BPV%7D/avahi-$%7BPV%7D" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/lathiat/avahi/releases/download/v=
${PV}/avahi-${PV}</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-ope=
ning-etc-resolv.conf-error.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://handle-hup.p=
atch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://local-ping.p=
atch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38469-1.=
patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38469-2.=
patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38470.pa=
tch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38471.pa=
tch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38472.pa=
tch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-38473.pa=
tch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt; UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/lathiat=
/avahi/releases/" rel=3D"noreferrer" target=3D"_blank">https://github.com/l=
athiat/avahi/releases/</a>&quot;<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-=
1.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..99c717daf3<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-1.patch=
<br>
&gt;&gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; +From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" tar=
get=3D"_blank">evvers@ya.ru</a>&gt;<br>
&gt;&gt; +Date: Mon, 23 Oct 2023 20:29:31 +0000<br>
&gt;&gt; +Subject: [PATCH] core: reject overly long TXT resource records<br=
>
&gt;&gt; +<br>
&gt;&gt; +Closes <a href=3D"https://github.com/lathiat/avahi/issues/455" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/lathiat/avahi/issues/=
455</a><br>
&gt;&gt; +<br>
&gt;&gt; +CVE-2023-38469<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/=
avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lathiat/avahi/commit/a337a1ba7d15853fb5=
6deef1f464529af6e3a1cf</a>]<br>
&gt;&gt; +CVE: CVE-2023-38469<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + avahi-core/rr.c | 9 ++++++++-<br>
&gt;&gt; + 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/avahi-core/rr.c b/avahi-core/rr.c<br>
&gt;&gt; +index 2bb89244..9c04ebbd 100644<br>
&gt;&gt; +--- a/avahi-core/rr.c<br>
&gt;&gt; ++++ b/avahi-core/rr.c<br>
&gt;&gt; +@@ -32,6 +32,7 @@<br>
&gt;&gt; + #include &lt;avahi-common/malloc.h&gt;<br>
&gt;&gt; + #include &lt;avahi-common/defs.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; ++#include &quot;dns.h&quot;<br>
&gt;&gt; + #include &quot;rr.h&quot;<br>
&gt;&gt; + #include &quot;log.h&quot;<br>
&gt;&gt; + #include &quot;util.h&quot;<br>
&gt;&gt; +@@ -689,11 +690,17 @@ int avahi_record_is_valid(AvahiRecord *r) {=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case AVAHI_DNS_TYPE_TXT: {<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AvahiStringList *=
strlst;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t used =3D 0;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (strlst =3D r-&gt;=
data.txt.string_list; strlst; strlst =3D strlst-&gt;next)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (strlst =3D r-&gt;=
data.txt.string_list; strlst; strlst =3D strlst-&gt;next) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(strlst-&gt;size &gt; 255 || strlst-&gt;size &lt;=3D 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return 0;<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 used +=
=3D 1+strlst-&gt;size;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (used=
 &gt; AVAHI_DNS_RDATA_MAX)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return 0;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38469-=
2.patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..b83a70e29b<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38469-2.patch=
<br>
&gt;&gt; @@ -0,0 +1,65 @@<br>
&gt;&gt; +From c6cab87df290448a63323c8ca759baa516166237 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Evgeny Vereshchagin &lt;<a href=3D"mailto:evvers@ya.ru" tar=
get=3D"_blank">evvers@ya.ru</a>&gt;<br>
&gt;&gt; +Date: Wed, 25 Oct 2023 18:15:42 +0000<br>
&gt;&gt; +Subject: [PATCH] tests: pass overly long TXT resource records<br>
&gt;&gt; +<br>
&gt;&gt; +to make sure they don&#39;t crash avahi any more.<br>
&gt;&gt; +<br>
&gt;&gt; +It reproduces <a href=3D"https://github.com/lathiat/avahi/issues/=
455" rel=3D"noreferrer" target=3D"_blank">https://github.com/lathiat/avahi/=
issues/455</a><br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/=
avahi/commit/c6cab87df290448a63323c8ca759baa516166237" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lathiat/avahi/commit/c6cab87df290448a63=
323c8ca759baa516166237</a>]<br>
&gt;&gt; +CVE: CVE-2023-38469<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + avahi-client/client-test.c | 14 ++++++++++++++<br>
&gt;&gt; + 1 file changed, 14 insertions(+)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/avahi-client/client-test.c b/avahi-client/client-tes=
t.c<br>
&gt;&gt; +index 7d04a6a..66e3574 100644<br>
&gt;&gt; +--- a/avahi-client/client-test.c<br>
&gt;&gt; ++++ b/avahi-client/client-test.c<br>
&gt;&gt; +@@ -22,6 +22,7 @@<br>
&gt;&gt; + #endif<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;stdio.h&gt;<br>
&gt;&gt; ++#include &lt;string.h&gt;<br>
&gt;&gt; + #include &lt;assert.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; + #include &lt;avahi-client/client.h&gt;<br>
&gt;&gt; +@@ -33,6 +34,8 @@<br>
&gt;&gt; + #include &lt;avahi-common/malloc.h&gt;<br>
&gt;&gt; + #include &lt;avahi-common/timeval.h&gt;<br>
&gt;&gt; +<br>
&gt;&gt; ++#include &lt;avahi-core/dns.h&gt;<br>
&gt;&gt; ++<br>
&gt;&gt; + static const AvahiPoll *poll_api =3D NULL;<br>
&gt;&gt; + static AvahiSimplePoll *simple_poll =3D NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -222,6 +225,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GC=
C_UNUSED char *argv[]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0uint32_t cookie;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0struct timeval tv;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0AvahiAddress a;<br>
&gt;&gt; ++=C2=A0 =C2=A0 uint8_t rdata[AVAHI_DNS_RDATA_MAX+1];<br>
&gt;&gt; ++=C2=A0 =C2=A0 AvahiStringList *txt =3D NULL;<br>
&gt;&gt; ++=C2=A0 =C2=A0 int r;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0simple_poll =3D avahi_simple_poll_new();<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0poll_api =3D avahi_simple_poll_get(simple_pol=
l);<br>
&gt;&gt; +@@ -258,6 +264,14 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_G=
CC_UNUSED char *argv[]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%s\n&quot;, avahi_strerror(avahi=
_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &q=
uot;Lathiat&#39;s Site&quot;, &quot;_http._tcp&quot;, NULL, NULL, 80, &quot=
;foo=3Dbar&quot;, NULL)));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;add_record: %d\n&quot;, avahi_en=
try_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;=
TestX&quot;, 0x01, 0x10, 120, &quot;\5booya&quot;, 6));<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 memset(rdata, 1, sizeof(rdata));<br>
&gt;&gt; ++=C2=A0 =C2=A0 r =3D avahi_string_list_parse(rdata, sizeof(rdata)=
, &amp;txt);<br>
&gt;&gt; ++=C2=A0 =C2=A0 assert(r &gt;=3D 0);<br>
&gt;&gt; ++=C2=A0 =C2=A0 assert(avahi_string_list_serialize(txt, NULL, 0) =
=3D=3D sizeof(rdata));<br>
&gt;&gt; ++=C2=A0 =C2=A0 error =3D avahi_entry_group_add_service_strlst(gro=
up, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, &quot;_qotd.=
_tcp&quot;, NULL, NULL, 123, txt);<br>
&gt;&gt; ++=C2=A0 =C2=A0 assert(error =3D=3D AVAHI_ERR_INVALID_RECORD);<br>
&gt;&gt; ++=C2=A0 =C2=A0 avahi_string_list_free(txt);<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser_new (avahi, A=
VAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, a=
vahi_domain_browser_callback, (char*) &quot;omghai3u&quot;);<br>
&gt;&gt; +--<br>
&gt;&gt; +2.25.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38470.=
patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..1cbb00dcab<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch<b=
r>
&gt;&gt; @@ -0,0 +1,56 @@<br>
&gt;&gt; +From 94cb6489114636940ac683515417990b55b5d66c Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: =3D?UTF-8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D &lt;<a hr=
ef=3D"mailto:pemensik@redhat.com" target=3D"_blank">pemensik@redhat.com</a>=
&gt;<br>
&gt;&gt; +Date: Tue, 11 Apr 2023 15:29:59 +0200<br>
&gt;&gt; +Subject: [PATCH] Ensure each label is at least one byte long<br>
&gt;&gt; +<br>
&gt;&gt; +The only allowed exception is single dot, where it should return =
empty<br>
&gt;&gt; +string.<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes #454.<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/=
avahi/commit/94cb6489114636940ac683515417990b55b5d66c" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lathiat/avahi/commit/94cb6489114636940a=
c683515417990b55b5d66c</a>]<br>
&gt;&gt; +CVE: CVE-2023-38470<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + avahi-common/domain-test.c | 14 ++++++++++++++<br>
&gt;&gt; + avahi-common/domain.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt; + 2 files changed, 15 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/avahi-common/domain-test.c b/avahi-common/domain-tes=
t.c<br>
&gt;&gt; +index cf763eca6..3acc1c1e4 100644<br>
&gt;&gt; +--- a/avahi-common/domain-test.c<br>
&gt;&gt; ++++ b/avahi-common/domain-test.c<br>
&gt;&gt; +@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_=
UNUSED char *argv[]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%s\n&quot;, s =3D avahi_normaliz=
e_name_strdup(&quot;fo\\\\o\\..f oo.&quot;));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_free(s);<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 printf(&quot;%s\n&quot;, s =3D avahi_normalize_nam=
e_strdup(&quot;.&quot;));<br>
&gt;&gt; ++=C2=A0 =C2=A0 avahi_free(s);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 s =3D avahi_normalize_name_strdup(&quot;,.=3D.}.=
=3D.?-.}.=3D.?.?.}.}.?.?.?.z.?.?.}.}.&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=
=3D.?.?.}.}.?.?.}.}.}&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?.?.?.zM.=3D.=
=3D.?.?.}.}.?.?.?.zM.?`&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.?.?.?.}.=
=3D.?.?.}??.}.}.?.?.&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=3D.?.}}.}.?=
.?.?.zM.?`?.}.}.}.&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;??.?.zM.?`?.}.}.}.?.?.?.r.=3D.?.}.=3D.?.?.}.=
?.?.?.}.=3D.?.?.}?&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=3D.=3D.}.=
=3D.?.}}.}.?.?.?.zM.&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;?`?.}.}.}.?.?.?.r.=3D.=3D.?.?`.?.?}.}.}.?.?.=
?.r.=3D.?.}.=3D.?.?.&quot;<br>
&gt;&gt; ++=C2=A0 =C2=A0 &quot;}.?.?.?.}.=3D.?.?.}&quot;);<br>
&gt;&gt; ++=C2=A0 =C2=A0 assert(s =3D=3D NULL);<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%i\n&quot;, avahi_domain_equal(&=
quot;\\065aa bbb\\.\\046cc.cc\\\\.dee.fff.&quot;, &quot;Aaa BBB\\.\\.cc.cc\=
\\\.dee.fff&quot;));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0printf(&quot;%i\n&quot;, avahi_domain_equal(&=
quot;A&quot;, &quot;a&quot;));<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/avahi-common/domain.c b/avahi-common/domain.c<br>
&gt;&gt; +index 3b1ab6834..e66d2416c 100644<br>
&gt;&gt; +--- a/avahi-common/domain.c<br>
&gt;&gt; ++++ b/avahi-common/domain.c<br>
&gt;&gt; +@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, cha=
r *ret_s, size_t size) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!empty) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 2)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(r++) =3D &#39;.=
&#39;;<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38471.=
patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..8242646da1<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch<b=
r>
&gt;&gt; @@ -0,0 +1,72 @@<br>
&gt;&gt; +From 894f085f402e023a98cbb6f5a3d117bd88d93b09 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:msekleta@redhat.com" =
target=3D"_blank">msekleta@redhat.com</a>&gt;<br>
&gt;&gt; +Date: Mon, 23 Oct 2023 13:38:35 +0200<br>
&gt;&gt; +Subject: [PATCH] core: extract host name using avahi_unescape_lab=
el()<br>
&gt;&gt; +<br>
&gt;&gt; +Previously we could create invalid escape sequence when we split =
the<br>
&gt;&gt; +string on dot. For example, from valid host name &quot;foo\\.bar&=
quot; we have<br>
&gt;&gt; +created invalid name &quot;foo\\&quot; and tried to set that as t=
he host name<br>
&gt;&gt; +which crashed the daemon.<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes #453<br>
&gt;&gt; +<br>
&gt;&gt; +CVE-2023-38471<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/=
avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lathiat/avahi/commit/894f085f402e023a98=
cbb6f5a3d117bd88d93b09</a>]<br>
&gt;&gt; +CVE: CVE-2023-38471<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + avahi-core/server.c | 27 +++++++++++++++++++++------<br>
&gt;&gt; + 1 file changed, 21 insertions(+), 6 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/avahi-core/server.c b/avahi-core/server.c<br>
&gt;&gt; +index c32637af8..f6a21bb77 100644<br>
&gt;&gt; +--- a/avahi-core/server.c<br>
&gt;&gt; ++++ b/avahi-core/server.c<br>
&gt;&gt; +@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {<=
br>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + int avahi_server_set_host_name(AvahiServer *s, const char *host_=
name) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 char *hn =3D NULL;<br>
&gt;&gt; ++=C2=A0 =C2=A0 char label_escaped[AVAHI_LABEL_MAX*4+1];<br>
&gt;&gt; ++=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX];<br>
&gt;&gt; ++=C2=A0 =C2=A0 char *hn =3D NULL, *h;<br>
&gt;&gt; ++=C2=A0 =C2=A0 size_t len;<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0AVAHI_CHECK_VALIDITY(s, !host_name || avahi_i=
s_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);<br>
&gt;&gt; +@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServe=
r *s, const char *host_name) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hn =3D avahi_normalize_name_str=
dup(host_name);<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 hn[strcspn(hn, &quot;.&quot;)] =3D 0;<br>
&gt;&gt; ++=C2=A0 =C2=A0 h =3D hn;<br>
&gt;&gt; ++=C2=A0 =C2=A0 if (!avahi_unescape_label((const char **)&amp;hn, =
label, sizeof(label))) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(h);<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME;<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 }<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 avahi_free(h);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 h =3D label_escaped;<br>
&gt;&gt; ++=C2=A0 =C2=A0 len =3D sizeof(label_escaped);<br>
&gt;&gt; ++=C2=A0 =C2=A0 if (!avahi_escape_label(label, strlen(label), &amp=
;h, &amp;len))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_INVALID_HOST_NAME;<=
br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 if (avahi_domain_equal(s-&gt;host_name, hn) &amp;&=
amp; s-&gt;state !=3D AVAHI_SERVER_COLLISION) {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 avahi_free(hn);<br>
&gt;&gt; ++=C2=A0 =C2=A0 if (avahi_domain_equal(s-&gt;host_name, label_esca=
ped) &amp;&amp; s-&gt;state !=3D AVAHI_SERVER_COLLISION)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_server_set_errno(s=
, AVAHI_ERR_NO_CHANGE);<br>
&gt;&gt; +-=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0withdraw_host_rrs(s);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_free(s-&gt;host_name);<br>
&gt;&gt; +-=C2=A0 =C2=A0 s-&gt;host_name =3D hn;<br>
&gt;&gt; ++=C2=A0 =C2=A0 s-&gt;host_name =3D avahi_strdup(label_escaped);<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 if (!s-&gt;host_name)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return AVAHI_ERR_NO_MEMORY;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0update_fqdn(s);<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38472.=
patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..43b26c1132<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch<b=
r>
&gt;&gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; +From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:msekleta@redhat.com" =
target=3D"_blank">msekleta@redhat.com</a>&gt;<br>
&gt;&gt; +Date: Thu, 19 Oct 2023 17:36:44 +0200<br>
&gt;&gt; +Subject: [PATCH] core: make sure there is rdata to process before=
 parsing it<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes #452<br>
&gt;&gt; +<br>
&gt;&gt; +CVE-2023-38472<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/=
avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lathiat/avahi/commit/b024ae5749f4aeba03=
478e6391687c3c9c8dee40</a>]<br>
&gt;&gt; +CVE: CVE-2023-38472<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + avahi-client/client-test.c=C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;&gt; + avahi-daemon/dbus-entry-group.c | 2 +-<br>
&gt;&gt; + 2 files changed, 4 insertions(+), 1 deletion(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/avahi-client/client-test.c b/avahi-client/client-tes=
t.c<br>
&gt;&gt; +index 66e3574..9a015d7 100644<br>
&gt;&gt; +--- a/avahi-client/client-test.c<br>
&gt;&gt; ++++ b/avahi-client/client-test.c<br>
&gt;&gt; +@@ -272,6 +272,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GC=
C_UNUSED char *argv[]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(error =3D=3D AVAHI_ERR_INVALID_RECORD)=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_string_list_free(txt);<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 error =3D avahi_entry_group_add_record (group, AVA=
HI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, &quot;TestX&quot;, 0x01, 0x10, 120, &q=
uot;&quot;, 0);<br>
&gt;&gt; ++=C2=A0 =C2=A0 assert(error !=3D AVAHI_OK);<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0avahi_entry_group_commit (group);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0domain =3D avahi_domain_browser_new (avahi, A=
VAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, a=
vahi_domain_browser_callback, (char*) &quot;omghai3u&quot;);<br>
&gt;&gt; +diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-=
entry-group.c<br>
&gt;&gt; +index 4e879a5..aa23d4b 100644<br>
&gt;&gt; +--- a/avahi-daemon/dbus-entry-group.c<br>
&gt;&gt; ++++ b/avahi-daemon/dbus-entry-group.c<br>
&gt;&gt; +@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_=
impl(DBusConnection *c, DBusMessage<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(r =3D avahi_record_new_fu=
ll (name, clazz, type, ttl)))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_dbus=
_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (avahi_rdata_parse (r, rdata, siz=
e) &lt; 0) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rdata || avahi_rdata_parse (r, =
rdata, size) &lt; 0) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_record_unre=
f (r);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return avahi_dbus=
_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +--<br>
&gt;&gt; +2.25.1<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-connectivity/avahi/files/CVE-2023-38473.=
patch b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..7b33d564f8<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch<b=
r>
&gt;&gt; @@ -0,0 +1,108 @@<br>
&gt;&gt; +From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Michal Sekletar &lt;<a href=3D"mailto:msekleta@redhat.com" =
target=3D"_blank">msekleta@redhat.com</a>&gt;<br>
&gt;&gt; +Date: Wed, 11 Oct 2023 17:45:44 +0200<br>
&gt;&gt; +Subject: [PATCH] common: derive alternative host name from its un=
escaped<br>
&gt;&gt; + version<br>
&gt;&gt; +<br>
&gt;&gt; +Normalization of input makes sure we don&#39;t have to deal with =
special<br>
&gt;&gt; +cases like unescaped dot at the end of label.<br>
&gt;&gt; +<br>
&gt;&gt; +Fixes #451 #487<br>
&gt;&gt; +CVE-2023-38473<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/lathiat/=
avahi/commit/b448c9f771bada14ae8de175695a9729f8646797" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/lathiat/avahi/commit/b448c9f771bada14ae=
8de175695a9729f8646797</a>]<br>
&gt;&gt; +CVE: CVE-2023-38473<br>
&gt;&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + avahi-common/alternative-test.c |=C2=A0 3 +++<br>
&gt;&gt; + avahi-common/alternative.c=C2=A0 =C2=A0 =C2=A0 | 27 ++++++++++++=
+++++++--------<br>
&gt;&gt; + 2 files changed, 22 insertions(+), 8 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/avahi-common/alternative-test.c b/avahi-common/alter=
native-test.c<br>
&gt;&gt; +index 9255435ec..681fc15b8 100644<br>
&gt;&gt; +--- a/avahi-common/alternative-test.c<br>
&gt;&gt; ++++ b/avahi-common/alternative-test.c<br>
&gt;&gt; +@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_U=
NUSED char *argv[]) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0const char* const test_strings[] =3D {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;XXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;XXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXXXXXXXXX=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC=C3=BC&quot;,<b=
r>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;).&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\\.&quot;,<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;gurke&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;-&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot; #&quot;,<br>
&gt;&gt; +diff --git a/avahi-common/alternative.c b/avahi-common/alternativ=
e.c<br>
&gt;&gt; +index b3d39f0ed..a094e6d76 100644<br>
&gt;&gt; +--- a/avahi-common/alternative.c<br>
&gt;&gt; ++++ b/avahi-common/alternative.c<br>
&gt;&gt; +@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {<b=
r>
&gt;&gt; + }<br>
&gt;&gt; +<br>
&gt;&gt; + char *avahi_alternative_host_name(const char *s) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 char label[AVAHI_LABEL_MAX], alternative[AVAHI_LAB=
EL_MAX*4+1];<br>
&gt;&gt; ++=C2=A0 =C2=A0 char *alt, *r, *ret;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0const char *e;<br>
&gt;&gt; +-=C2=A0 =C2=A0 char *r;<br>
&gt;&gt; ++=C2=A0 =C2=A0 size_t len;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(s);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (!avahi_is_valid_host_name(s))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 if ((e =3D strrchr(s, &#39;-&#39;))) {<br>
&gt;&gt; ++=C2=A0 =C2=A0 if (!avahi_unescape_label(&amp;s, label, sizeof(la=
bel)))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 if ((e =3D strrchr(label, &#39;-&#39;))) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *p;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e++;<br>
&gt;&gt; +@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char =
*s) {<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if (e) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c, *m;<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t l;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int n;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D atoi(e)+1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(m =3D avahi_strdup_printf=
(&quot;%i&quot;, n)))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D e-s-1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D e-label-1;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (l &gt;=3D AVAHI_LABEL_MAX-1-strl=
en(m)-1)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D AVAHI_LABEL_MAX-=
1-strlen(m)-1;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt;=3D AVAHI_LABEL_MAX-1-st=
rlen(m)-1)<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D AVAHI_LABEL_MA=
X-1-strlen(m)-1;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(s, l))) {<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(label, len=
))) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(m);<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char =
*s) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *c;<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(s, AVAHI_L=
ABEL_MAX-1-2)))<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(c =3D avahi_strndup(label, AVA=
HI_LABEL_MAX-1-2)))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drop_incomplete_utf8(c);<br>
&gt;&gt; +@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char=
 *s) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0avahi_free(c);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; ++=C2=A0 =C2=A0 alt =3D alternative;<br>
&gt;&gt; ++=C2=A0 =C2=A0 len =3D sizeof(alternative);<br>
&gt;&gt; ++=C2=A0 =C2=A0 ret =3D avahi_escape_label(r, strlen(r), &amp;alt,=
 &amp;len);<br>
&gt;&gt; ++<br>
&gt;&gt; ++=C2=A0 =C2=A0 avahi_free(r);<br>
&gt;&gt; ++=C2=A0 =C2=A0 r =3D avahi_strdup(ret);<br>
&gt;&gt; ++<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert(avahi_is_valid_host_name(r));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0return r;<br>
&gt;&gt; -- <br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-- <br>
Jeremy Puhlman<br>
<a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blank">jpuhlman@mvista.co=
m</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190798): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190798" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190798</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102621335/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102621335/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009b38f5060a47228b--

