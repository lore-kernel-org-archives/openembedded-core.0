Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811D3C4167B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 14:32:46 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.23238.1671460360234111733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 06:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M/uLVvzX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id h10so8831600wrx.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 06:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoSLLWBeBSJnqWiukcBg+/oTT5y1DLkWGxDpe384o08=;
        b=M/uLVvzXDU7KUUAphN3haOMH5eAb5CU3eEIaLL4SQMCclAkAafpDVFw+9uJrxXUtZz
         yMJzaYTK0rzeOqtvGW9kTscrqiy4FLR0VGW/l316TwMaDcuiBRL5OJrF9MzK3KrMHYWm
         OqCHnVyyhI0DOFjerM/vpF2FTSP1sfKfgkc+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OoSLLWBeBSJnqWiukcBg+/oTT5y1DLkWGxDpe384o08=;
        b=cAYoHdu3f4YPPR9Zd9zi4pUIyTXvZW2h1m6NBJBugV7+avCvSMyx+dJmsmCZTxypwP
         +X5ApiiERwiUDSxcarKRjBX0tf1GT7oQzISIcsQl7IYrFRwx6ROT2JCdtWqSeT4gbYmg
         MzxQQ5hJNUTZFDiQ4NUbpATNluui/wXpHPt8IZj8n+1Nsx/I1XpBNXgoMvlWEKxD3ICS
         w7psAu06W2vO0Nhx3A8OVqq1JeD7lR/nDSggdMzkTSWQ2s/CqN51xXqDIUQ7ruK2vzQg
         STsNX0XV/wySCN7EaztYdY8aXlTfGgG+vYmgz6YApPC4GHYzfWubJnTNVUqvaqC0YwmZ
         xZsw==
X-Gm-Message-State: ANoB5pnTAZSa3bBukfJAOXo2uPWrdszZrYkjJEBsHgo4XJPw5H2wLoLv
	rCBQqn0udmaQFL9sg0xgPMo73g==
X-Google-Smtp-Source: AA0mqf78ztf49NRAYODJeMH2rcyYAiivqTu9ukAKadLi4MYAqpMy4+faDkAaSe2IERFkJdN8t+IwSg==
X-Received: by 2002:adf:dd51:0:b0:242:17a6:8bad with SMTP id u17-20020adfdd51000000b0024217a68badmr26515456wrm.60.1671460358354;
        Mon, 19 Dec 2022 06:32:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac4f:7328:1210:6c79? ([2001:8b0:aba:5f3c:ac4f:7328:1210:6c79])
        by smtp.gmail.com with ESMTPSA id az29-20020adfe19d000000b0024246991121sm10122572wrb.116.2022.12.19.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 06:32:38 -0800 (PST)
Message-ID: <edd6881dda3b935165f95093da2cbafcd42fc2e8.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] oeqa/runtime/rust: Add basic compile/run test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2022 14:32:37 +0000
In-Reply-To: <CAO5Uq5T20q0wVhM0wQrOMu-GcoAaKFTOGCMxDxCOLXoUS+sLxQ@mail.gmail.com>
References: <20221219141840.26358-1-alex.kiernan@gmail.com>
	 <CAO5Uq5T20q0wVhM0wQrOMu-GcoAaKFTOGCMxDxCOLXoUS+sLxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 14:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174816

On Mon, 2022-12-19 at 14:28 +0000, Alex Kiernan wrote:
> On Mon, Dec 19, 2022 at 2:19 PM Alex Kiernan <alex.kiernan@gmail.com> wro=
te:
> >=20
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  meta/lib/oeqa/files/test.rs         |  2 ++
> >  meta/lib/oeqa/runtime/cases/rust.py | 24 ++++++++++++++++++++++++
> >  2 files changed, 26 insertions(+)
> >  create mode 100644 meta/lib/oeqa/files/test.rs
> >=20
> > diff --git a/meta/lib/oeqa/files/test.rs b/meta/lib/oeqa/files/test.rs
> > new file mode 100644
> > index 000000000000..f79c691f0853
> > --- /dev/null
> > +++ b/meta/lib/oeqa/files/test.rs
> > @@ -0,0 +1,2 @@
> > +fn main() {
> > +}
> > diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtim=
e/cases/rust.py
> > index 55b280d61d8a..186bb0d79e15 100644
> > --- a/meta/lib/oeqa/runtime/cases/rust.py
> > +++ b/meta/lib/oeqa/runtime/cases/rust.py
> > @@ -8,6 +8,30 @@ from oeqa.runtime.case import OERuntimeTestCase
> >  from oeqa.core.decorator.depends import OETestDepends
> >  from oeqa.runtime.decorator.package import OEHasPackage
> >=20
> > +class RustCompileTest(OERuntimeTestCase):
> > +
> > +    @classmethod
> > +    def setUp(cls):
> > +        dst =3D '/tmp/'
> > +        src =3D os.path.join(cls.tc.files_dir, 'test.rs')
> > +        cls.tc.target.copyTo(src, dst)
> > +
> > +    @classmethod
> > +    def tearDown(cls):
> > +        files =3D '/tmp/test.rs /tmp/test'
> > +        cls.tc.target.run('rm %s' % files)
> > +
> > +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> > +    @OEHasPackage(['rust'])
> > +    def test_rust_compile(self):
> > +        status, output =3D self.target.run('rustc /tmp/test.rs -o /tmp=
/test')
> > +        msg =3D 'rust compile failed, output: %s' % output
> > +        self.assertEqual(status, 0, msg=3Dmsg)
> > +
> > +        status, output =3D self.target.run('/tmp/test')
> > +        msg =3D 'running compiled file failed, output: %s' % output
> > +        self.assertEqual(status, 0, msg=3Dmsg)
> > +
> >  class RustHelloworldTest(OERuntimeTestCase):
> >      @OETestDepends(['ssh.SSHTest.test_ssh'])
> >      @OEHasPackage(['rust-hello-world'])
>=20
> One thing I wasn't clear on with this, is how I ensure that rust is
> actually installed on the test image during CI, so this test runs?

Isn't that what you're doing with:

@OEHasPackage(['rust'])

?

Cheers,

Richard


