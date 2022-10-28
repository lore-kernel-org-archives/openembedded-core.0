Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DC5ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 01:40:43 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.1602.1666921235739903010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 18:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e2jyQikF;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id d26so9605758eje.10
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 18:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wT5IwI7C9AMpYxj1Qt3rzq6hjOzLW0Ur9A+DxSByq0k=;
        b=e2jyQikFc42e7p4gMvnAGyuf7xleaDaG1aVGPHXtIPni4I10eY1UVojere9EP3CvpE
         SiEnRW+LAUkBuaNNz1cw1MWYUL9q9szDywPdh2LNi15SH+AVLm4KP3YVf2JAT2WMWjc4
         RE/OMSQMV1vVnmEn1YQMlmAs8vd1QnVVUbVlZDzyRWyQM0gz2nXxfhZk/HsH0JkC1Epl
         os/3FFNBD7aFF3f2z2LqEDk35WyL3M3vG+KUS4y1YSOAOJqgPFKPkRAaNQpgqVuiwK9x
         pWF3iH+IJvCkK0CphRURJ0Rzc/BbmDX1SkznwXjbVC8Em3AJTyTU6p93O+1gS8j4rR9E
         tDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wT5IwI7C9AMpYxj1Qt3rzq6hjOzLW0Ur9A+DxSByq0k=;
        b=Zz3V+TPE7bSuM00RTdyUh2RuKc6Bhl+uazQAST6OGE/InwI4aB57y1SRqO2MKXJ7x/
         psvgQvRH6RjrrXxdp+Ki+rt15NHztejNxLaiOI7bnCCSIXYid0F5O6YY1ZEspYbp2iJE
         0BFFjDWpmKTlP/8VVvoJbnOnXSwCMWQM/cB+L8zddPe7klqvqAzrBJxb+CdLrc5buGRk
         bgUs2Gyr3cDgjA2gwyt+zCY3Fd3EMPYr4eb3Iefrwh/VzFdMEuK5kFYz/eQO5wTgfCYB
         D4fQZdIGAWgfKJml63EOubj0fGqxHJ3acPurvLll33waDK6zysITB0YQ4rrYbVlBKQoF
         DUdg==
X-Gm-Message-State: ACrzQf3QJOTAky0YBWAFw4FPvq8WP1BTQ2NVpfmkB0KZkDu4w1ONg48a
	4eLslMyfuTiZmg0Dpe+yl5XI3fuVwl+yizl6nak=
X-Google-Smtp-Source: AMsMyM5vxXJD89AclJaDZy7WM17ahoJkRDWk5/rSVC63nCL9cMrRzG+2jfJ2JwJ69zFD2XxnwoQMPFanW5Lm6GSKXkY=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr44802804ejc.203.1666921233708; Thu, 27
 Oct 2022 18:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221027202728.397273-1-joe.slater@windriver.com>
In-Reply-To: <20221027202728.397273-1-joe.slater@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 27 Oct 2022 18:40:22 -0700
Message-ID: <CANx9H-Bm7ZLkfp5UcMc6v7SFSr8X9sr5=FsCFJ96M+yvNM2pBg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] python: fix CVE-2022-37454
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="00000000000000fe3a05ec0e5829"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 01:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172231

--00000000000000fe3a05ec0e5829
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 1:27 PM Joe Slater <joe.slater@windriver.com> wrote:

> Import a patch from github.com/cpython/cpython.git


Reference:
https://github.com/python/cpython/issues/98517

I'd (MUCH) rather see us upgrade 'master' to 3.11 with Alex's patch, for
many other reasons (including toml).
https://lore.kernel.org/openembedded-core/20221027201611.3644334-23-alex@linutronix.de/T/#u

Per https://github.com/python/cpython/issues/98517
"CVE-2022-37454
<https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-37454> affects
Python versions prior to 3.11. The fix discussed in XKCP's advisory
<https://github.com/XKCP/XKCP/security/advisories/GHSA-6w4m-2xhg-2658> can
be adapted to these versions. The discoverer's writeup
<https://mouha.be/sha-3-buffer-overflow/> contains code that might be
turned into regression tests.

Python 3.11 and later switched to using tiny_sha3 in GH-32060
<https://github.com/python/cpython/pull/32060>, so they should not be
affected."

For kirkstone and langdale, we should upgrade to an appropriate dot release
which includes the fix, although this would apply for 3.10.
https://github.com/python/cpython/pull/98519

For 'dunfell' we may need to wait for
https://github.com/python/cpython/pull/98527



>
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../python/python3/cve-2022-37454.patch       | 108 ++++++++++++++++++
>  .../recipes-devtools/python/python3_3.10.6.bb |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3/cve-2022-37454.patch
>
> diff --git a/meta/recipes-devtools/python/python3/cve-2022-37454.patch
> b/meta/recipes-devtools/python/python3/cve-2022-37454.patch
> new file mode 100644
> index 0000000000..c019151a64
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/cve-2022-37454.patch
> @@ -0,0 +1,108 @@
> +From 1f66b714c5f2fef80ec5389456ac31756dbfff0e Mon Sep 17 00:00:00 2001
> +From: Theo Buehler <botovq@users.noreply.github.com>
> +Date: Fri, 21 Oct 2022 21:26:01 +0200
> +Subject: [PATCH] gh-98517: Fix buffer overflows in _sha3 module (#98519)
> +
> +This is a port of the applicable part of XKCP's fix [1] for
> +CVE-2022-37454 and avoids the segmentation fault and the infinite
> +loop in the test cases published in [2].
> +
> +[1]:
> https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a
> +[2]: https://mouha.be/sha-3-buffer-overflow/
> +
> +Regression test added by: Gregory P. Smith [Google LLC] <greg@krypto.org>
> +---
> +
> +Patch applied without modification.
> +
> +CVE: CVE-2022-37454
> +
> +Upstream-Status: Backport [github.com/cpython/cpython.git 0e4e058602d...]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + Lib/test/test_hashlib.py                          |  9 +++++++++
> + .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |  1 +
> + Modules/_sha3/kcp/KeccakSponge.inc                | 15 ++++++++-------
> + 3 files changed, 18 insertions(+), 7 deletions(-)
> + create mode 100644
> Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
> +
> +diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py
> +index ea31f8b..65330e1 100644
> +--- a/Lib/test/test_hashlib.py
> ++++ b/Lib/test/test_hashlib.py
> +@@ -491,6 +491,15 @@ class HashLibTestCase(unittest.TestCase):
> +     def test_case_md5_uintmax(self, size):
> +         self.check('md5', b'A'*size, '28138d306ff1b8281f1a9067e1a1a2b3')
> +
> ++    @unittest.skipIf(sys.maxsize < _4G - 1, 'test cannot run on 32-bit
> systems')
> ++    @bigmemtest(size=_4G - 1, memuse=1, dry_run=False)
> ++    def test_sha3_update_overflow(self, size):
> ++        """Regression test for gh-98517 CVE-2022-37454."""
> ++        h = hashlib.sha3_224()
> ++        h.update(b'\x01')
> ++        h.update(b'\x01'*0xffff_ffff)
> ++        self.assertEqual(h.hexdigest(),
> '80762e8ce6700f114fec0f621fd97c4b9c00147fa052215294cceeed')
> ++
> +     # use the three examples from Federal Information Processing
> Standards
> +     # Publication 180-1, Secure Hash Standard,  1995 April 17
> +     # http://www.itl.nist.gov/div897/pubs/fip180-1.htm
> +diff --git
> a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
> b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
> +new file mode 100644
> +index 0000000..2d23a6a
> +--- /dev/null
> ++++
> b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
> +@@ -0,0 +1 @@
> ++Port XKCP's fix for the buffer overflows in SHA-3 (CVE-2022-37454).
> +diff --git a/Modules/_sha3/kcp/KeccakSponge.inc
> b/Modules/_sha3/kcp/KeccakSponge.inc
> +index e10739d..cf92e4d 100644
> +--- a/Modules/_sha3/kcp/KeccakSponge.inc
> ++++ b/Modules/_sha3/kcp/KeccakSponge.inc
> +@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const
> unsigned char *data, size_t dat
> +     i = 0;
> +     curData = data;
> +     while(i < dataByteLen) {
> +-        if ((instance->byteIOIndex == 0) && (dataByteLen >= (i +
> rateInBytes))) {
> ++        if ((instance->byteIOIndex == 0) && (dataByteLen-i >=
> rateInBytes)) {
> + #ifdef SnP_FastLoop_Absorb
> +             /* processing full blocks first */
> +
> +@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const
> unsigned char *data, size_t dat
> +         }
> +         else {
> +             /* normal lane: using the message queue */
> +-
> +-            partialBlock = (unsigned int)(dataByteLen - i);
> +-            if (partialBlock+instance->byteIOIndex > rateInBytes)
> ++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
> +                 partialBlock = rateInBytes-instance->byteIOIndex;
> ++            else
> ++                partialBlock = (unsigned int)(dataByteLen - i);
> +             #ifdef KeccakReference
> +             displayBytes(1, "Block to be absorbed (part)", curData,
> partialBlock);
> +             #endif
> +@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned
> char *data, size_t dataByte
> +     i = 0;
> +     curData = data;
> +     while(i < dataByteLen) {
> +-        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen >= (i
> + rateInBytes))) {
> ++        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen-i >=
> rateInBytes)) {
> +             for(j=dataByteLen-i; j>=rateInBytes; j-=rateInBytes) {
> +                 SnP_Permute(instance->state);
> +                 SnP_ExtractBytes(instance->state, curData, 0,
> rateInBytes);
> +@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned
> char *data, size_t dataByte
> +                 SnP_Permute(instance->state);
> +                 instance->byteIOIndex = 0;
> +             }
> +-            partialBlock = (unsigned int)(dataByteLen - i);
> +-            if (partialBlock+instance->byteIOIndex > rateInBytes)
> ++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
> +                 partialBlock = rateInBytes-instance->byteIOIndex;
> ++            else
> ++                partialBlock = (unsigned int)(dataByteLen - i);
> +             i += partialBlock;
> +
> +             SnP_ExtractBytes(instance->state, curData,
> instance->byteIOIndex, partialBlock);
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb
> b/meta/recipes-devtools/python/python3_3.10.6.bb
> index 1f8b60a7a5..116d9ea670 100644
> --- a/meta/recipes-devtools/python/python3_3.10.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.6.bb
> @@ -36,6 +36,7 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://deterministic_imports.patch \
>             file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>             file://0001-Mitigate-the-race-condition-in-testSockName.patch \
> +           file://cve-2022-37454.patch \
>             "
>
>  SRC_URI:append:class-native = " \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172228):
> https://lists.openembedded.org/g/openembedded-core/message/172228
> Mute This Topic: https://lists.openembedded.org/mt/94613155/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000000fe3a05ec0e5829
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 1:27 PM Joe S=
later &lt;<a href=3D"mailto:joe.slater@windriver.com">joe.slater@windriver.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Import a patch from <a href=3D"http://github.com/cpython/cpython.git" re=
l=3D"noreferrer" target=3D"_blank">github.com/cpython/cpython.git</a></bloc=
kquote><div><br></div><div>Reference:</div><div><a href=3D"https://github.c=
om/python/cpython/issues/98517">https://github.com/python/cpython/issues/98=
517</a><br></div><div><br></div><div>I&#39;d (MUCH) rather see us upgrade &=
#39;master&#39; to 3.11 with Alex&#39;s patch, for many other reasons (incl=
uding toml).</div><div><a href=3D"https://lore.kernel.org/openembedded-core=
/20221027201611.3644334-23-alex@linutronix.de/T/#u">https://lore.kernel.org=
/openembedded-core/20221027201611.3644334-23-alex@linutronix.de/T/#u</a><br=
></div><div><br></div><div>Per=C2=A0<a href=3D"https://github.com/python/cp=
ython/issues/98517">https://github.com/python/cpython/issues/98517</a></div=
><div>&quot;<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE=
-2022-37454" rel=3D"nofollow" style=3D"font-family:-apple-system,&quot;syst=
em-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Col=
or Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;background-color:t=
ransparent;box-sizing:border-box;text-decoration-line:none">CVE-2022-37454<=
/a><span style=3D"color:rgb(36,41,47);font-family:-apple-system,&quot;syste=
m-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Colo=
r Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">=C2=A0</span><span=
 style=3D"color:rgb(36,41,47);font-family:-apple-system,&quot;system-ui&quo=
t;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">affects Python versions pr=
ior to 3.11. The fix discussed in</span><span style=3D"color:rgb(36,41,47);=
font-family:-apple-system,&quot;system-ui&quot;,&quot;Segoe UI&quot;,Helvet=
ica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quo=
t;;font-size:14px">=C2=A0</span><a href=3D"https://github.com/XKCP/XKCP/sec=
urity/advisories/GHSA-6w4m-2xhg-2658" style=3D"font-family:-apple-system,&q=
uot;system-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px;background=
-color:transparent;box-sizing:border-box;text-decoration-line:none">XKCP&#3=
9;s advisory</a><span style=3D"color:rgb(36,41,47);font-family:-apple-syste=
m,&quot;system-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&qu=
ot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">=C2=
=A0</span><span style=3D"color:rgb(36,41,47);font-family:-apple-system,&quo=
t;system-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">can be adap=
ted to these versions. The</span><span style=3D"color:rgb(36,41,47);font-fa=
mily:-apple-system,&quot;system-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Ari=
al,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font=
-size:14px">=C2=A0</span><a href=3D"https://mouha.be/sha-3-buffer-overflow/=
" rel=3D"nofollow" style=3D"font-family:-apple-system,&quot;system-ui&quot;=
,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&qu=
ot;,&quot;Segoe UI Emoji&quot;;font-size:14px;background-color:transparent;=
box-sizing:border-box;text-decoration-line:none">discoverer&#39;s writeup</=
a><span style=3D"color:rgb(36,41,47);font-family:-apple-system,&quot;system=
-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color=
 Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-size:14px">=C2=A0</span><span =
style=3D"color:rgb(36,41,47);font-family:-apple-system,&quot;system-ui&quot=
;,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&q=
uot;,&quot;Segoe UI Emoji&quot;;font-size:14px">contains code that might be=
 turned into regression tests.</span></div><p dir=3D"auto" style=3D"box-siz=
ing:border-box;margin-top:0px;margin-bottom:16px;color:rgb(36,41,47);font-f=
amily:-apple-system,&quot;system-ui&quot;,&quot;Segoe UI&quot;,Helvetica,Ar=
ial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;fon=
t-size:14px">Python 3.11 and later switched to using tiny_sha3 in=C2=A0<a c=
lass=3D"gmail-issue-link gmail-js-issue-link" href=3D"https://github.com/py=
thon/cpython/pull/32060" style=3D"box-sizing:border-box;background-color:tr=
ansparent;text-decoration-line:none">GH-32060</a>, so they should not be af=
fected.&quot;</p><div><br></div><div>For kirkstone and langdale, we should =
upgrade to an appropriate dot release which includes the fix, although this=
 would apply for 3.10.</div><div><a href=3D"https://github.com/python/cpyth=
on/pull/98519">https://github.com/python/cpython/pull/98519</a><br></div><d=
iv><br></div><div>For &#39;dunfell&#39; we may need to wait for</div><div><=
a href=3D"https://github.com/python/cpython/pull/98527">https://github.com/=
python/cpython/pull/98527</a><br></div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" t=
arget=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python/python3/cve-2022-37454.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
08 ++++++++++++++++++<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3_3.10.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A02 files changed, 109 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/cve-2022-3745=
4.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/cve-2022-37454.patch b/me=
ta/recipes-devtools/python/python3/cve-2022-37454.patch<br>
new file mode 100644<br>
index 0000000000..c019151a64<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/cve-2022-37454.patch<br>
@@ -0,0 +1,108 @@<br>
+From 1f66b714c5f2fef80ec5389456ac31756dbfff0e Mon Sep 17 00:00:00 2001<br>
+From: Theo Buehler &lt;<a href=3D"mailto:botovq@users.noreply.github.com" =
target=3D"_blank">botovq@users.noreply.github.com</a>&gt;<br>
+Date: Fri, 21 Oct 2022 21:26:01 +0200<br>
+Subject: [PATCH] gh-98517: Fix buffer overflows in _sha3 module (#98519)<b=
r>
+<br>
+This is a port of the applicable part of XKCP&#39;s fix [1] for<br>
+CVE-2022-37454 and avoids the segmentation fault and the infinite<br>
+loop in the test cases published in [2].<br>
+<br>
+[1]: <a href=3D"https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc3=
8364248975e08e340a" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a</a><br>
+[2]: <a href=3D"https://mouha.be/sha-3-buffer-overflow/" rel=3D"noreferrer=
" target=3D"_blank">https://mouha.be/sha-3-buffer-overflow/</a><br>
+<br>
+Regression test added by: Gregory P. Smith [Google LLC] &lt;<a href=3D"mai=
lto:greg@krypto.org" target=3D"_blank">greg@krypto.org</a>&gt;<br>
+---<br>
+<br>
+Patch applied without modification.<br>
+<br>
+CVE: CVE-2022-37454<br>
+<br>
+Upstream-Status: Backport [<a href=3D"http://github.com/cpython/cpython.gi=
t" rel=3D"noreferrer" target=3D"_blank">github.com/cpython/cpython.git</a> =
0e4e058602d...]<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
+---<br>
+ Lib/test/test_hashlib.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++++++++<br>
+ .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |=C2=A0 1 +<br>
+ Modules/_sha3/kcp/KeccakSponge.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 15 ++++++++-------<br>
+ 3 files changed, 18 insertions(+), 7 deletions(-)<br>
+ create mode 100644 Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue=
-98517.SXXGfV.rst<br>
+<br>
+diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py<br>
+index ea31f8b..65330e1 100644<br>
+--- a/Lib/test/test_hashlib.py<br>
++++ b/Lib/test/test_hashlib.py<br>
+@@ -491,6 +491,15 @@ class HashLibTestCase(unittest.TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0def test_case_md5_uintmax(self, size):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.check(&#39;md5&#39;, b&#39;A&#39;*s=
ize, &#39;28138d306ff1b8281f1a9067e1a1a2b3&#39;)<br>
+ <br>
++=C2=A0 =C2=A0 @unittest.skipIf(sys.maxsize &lt; _4G - 1, &#39;test cannot=
 run on 32-bit systems&#39;)<br>
++=C2=A0 =C2=A0 @bigmemtest(size=3D_4G - 1, memuse=3D1, dry_run=3DFalse)<br=
>
++=C2=A0 =C2=A0 def test_sha3_update_overflow(self, size):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Regression test for gh-9851=
7 CVE-2022-37454.&quot;&quot;&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 h =3D hashlib.sha3_224()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 h.update(b&#39;\x01&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 h.update(b&#39;\x01&#39;*0xffff_ffff)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(h.hexdigest(), &#39;80762e8c=
e6700f114fec0f621fd97c4b9c00147fa052215294cceeed&#39;)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0# use the three examples from Federal Information Proc=
essing Standards<br>
+=C2=A0 =C2=A0 =C2=A0# Publication 180-1, Secure Hash Standard,=C2=A0 1995 =
April 17<br>
+=C2=A0 =C2=A0 =C2=A0# <a href=3D"http://www.itl.nist.gov/div897/pubs/fip18=
0-1.htm" rel=3D"noreferrer" target=3D"_blank">http://www.itl.nist.gov/div89=
7/pubs/fip180-1.htm</a><br>
+diff --git a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.=
SXXGfV.rst b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.S=
XXGfV.rst<br>
+new file mode 100644<br>
+index 0000000..2d23a6a<br>
+--- /dev/null<br>
++++ b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.=
rst<br>
+@@ -0,0 +1 @@<br>
++Port XKCP&#39;s fix for the buffer overflows in SHA-3 (CVE-2022-37454).<b=
r>
+diff --git a/Modules/_sha3/kcp/KeccakSponge.inc b/Modules/_sha3/kcp/Keccak=
Sponge.inc<br>
+index e10739d..cf92e4d 100644<br>
+--- a/Modules/_sha3/kcp/KeccakSponge.inc<br>
++++ b/Modules/_sha3/kcp/KeccakSponge.inc<br>
+@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const unsig=
ned char *data, size_t dat<br>
+=C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0curData =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0while(i &lt; dataByteLen) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((instance-&gt;byteIOIndex =3D=3D 0) &amp;=
&amp; (dataByteLen &gt;=3D (i + rateInBytes))) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((instance-&gt;byteIOIndex =3D=3D 0) &amp;=
&amp; (dataByteLen-i &gt;=3D rateInBytes)) {<br>
+ #ifdef SnP_FastLoop_Absorb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* processing full blocks =
first */<br>
+ <br>
+@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const uns=
igned char *data, size_t dat<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* normal lane: using the =
message queue */<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partialBlock =3D (unsigned int)=
(dataByteLen - i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (partialBlock+instance-&gt;b=
yteIOIndex &gt; rateInBytes)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dataByteLen-i &gt; rateInBy=
tes-instance-&gt;byteIOIndex)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partialBlock=
 =3D rateInBytes-instance-&gt;byteIOIndex;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partialBlock =3D =
(unsigned int)(dataByteLen - i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#ifdef KeccakReference<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0displayBytes(1, &quot;Bloc=
k to be absorbed (part)&quot;, curData, partialBlock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
+@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned c=
har *data, size_t dataByte<br>
+=C2=A0 =C2=A0 =C2=A0i =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0curData =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0while(i &lt; dataByteLen) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((instance-&gt;byteIOIndex =3D=3D rateInBy=
tes) &amp;&amp; (dataByteLen &gt;=3D (i + rateInBytes))) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((instance-&gt;byteIOIndex =3D=3D rateInBy=
tes) &amp;&amp; (dataByteLen-i &gt;=3D rateInBytes)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for(j=3DdataByteLen-i; j&g=
t;=3DrateInBytes; j-=3DrateInBytes) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SnP_Permute(=
instance-&gt;state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SnP_ExtractB=
ytes(instance-&gt;state, curData, 0, rateInBytes);<br>
+@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned =
char *data, size_t dataByte<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SnP_Permute(=
instance-&gt;state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instance-&gt=
;byteIOIndex =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partialBlock =3D (unsigned int)=
(dataByteLen - i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (partialBlock+instance-&gt;b=
yteIOIndex &gt; rateInBytes)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dataByteLen-i &gt; rateInBy=
tes-instance-&gt;byteIOIndex)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partialBlock=
 =3D rateInBytes-instance-&gt;byteIOIndex;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partialBlock =3D =
(unsigned int)(dataByteLen - i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i +=3D partialBlock;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SnP_ExtractBytes(instance-=
&gt;state, curData, instance-&gt;byteIOIndex, partialBlock);<br>
+-- <br>
+2.32.0<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a> b/meta/recip=
es-devtools/python/<a href=3D"http://python3_3.10.6.bb" rel=3D"noreferrer" =
target=3D"_blank">python3_3.10.6.bb</a><br>
index 1f8b60a7a5..116d9ea670 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.10.6.bb</a><br>
@@ -36,6 +36,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/py=
thon/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://deterministic_imports.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Avoid-shebang-overflo=
w-on-python-config.py.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Mitigate-the-race-con=
dition-in-testSockName.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cve-2022-37454.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-native =3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172228): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172228" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172228</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94613155/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94613155/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000000fe3a05ec0e5829--

