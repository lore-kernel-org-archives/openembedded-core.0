Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFA2C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 14:28:26 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.23152.1671460102127401196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 06:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HcX4BY/a;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id qk9so21902236ejc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 06:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sw8HkCGGytRmyTs3PuGEGO4C+e24RH/Wv5ot6ggF6dA=;
        b=HcX4BY/aG+9LogEmI6l54/G7UaJJ2P/KMNtCvE72w7aOU7Pq/MoNE2mA70X4Y1kxDv
         iF73gFQT76uTr/a3UhwikrS9tXtNDLIfrDN14JR/q2i8h3/XVR7YjgUq2wecfCxMl43l
         D6YZcyxhlyEgP/SxEZ5SDqLnf865u3YwOxpFh27jCJ0rm6bOx0o3I8M5PLY9A1gO1ws7
         +0E4OzrJAnd/ACwh0IwYJ3hXaJoJrUwny24AqKLYNk8oNjO8zvGSAisIzmGV4dVORa59
         94050J/g95xIaGKf8J9CtlKVQgbA8h6gNBJlvyN+6Ep6gaV9UBFfuroX7eoQXo5db/I2
         Lprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw8HkCGGytRmyTs3PuGEGO4C+e24RH/Wv5ot6ggF6dA=;
        b=NYbLSmVml5fcMRVbZ8Ue/RXvEGCqdDUfpZdpVynLzzeA66uuOJDpVl5vQOqVVw2O6F
         6VJtsE6eJsAY6BzCiEstqnLAfsfcUrIpwyJ8ne3lIknzbDwSODKbC72xpf5856zDrCE/
         RXcp23AhLeecUIpznndP3hvVNLCfuMGVwtrEMLEmm0tTL+g2DxuefASO5HqCCvJt84ch
         82dB5y0q30D9yQdkUZPD2Zz4FPBI0v3nGDK/dOYFaGaRzh05Oi47A6MrsLcR6qDP3l7L
         4MxYAa1PllQHtXrhGHyWlICWGg+ONmphfR4bKt4Ycmh118+5hccQcqOtpG2ER22RDGYK
         H8mg==
X-Gm-Message-State: AFqh2koOwRTHYvE6f+XxOvavlq/rlH3zBwv3uA2GQkun49Gr5scUEHSs
	xFLP95b1AgQJKX5A4xK35eOTzqXv5na6JBYQF1W0Df2z
X-Google-Smtp-Source: AMrXdXtYPBnKdUWxOZTyBbZi7UqPEQ8gZ+c+ADAnh23FoLp+DuJinagR8cvu500GBT90FDqhU+iNmFgCwI2QZGRis/s=
X-Received: by 2002:a17:906:5806:b0:814:356f:91a8 with SMTP id
 m6-20020a170906580600b00814356f91a8mr303413ejq.74.1671460097963; Mon, 19 Dec
 2022 06:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20221219141840.26358-1-alex.kiernan@gmail.com>
In-Reply-To: <20221219141840.26358-1-alex.kiernan@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 19 Dec 2022 14:28:03 +0000
Message-ID: <CAO5Uq5T20q0wVhM0wQrOMu-GcoAaKFTOGCMxDxCOLXoUS+sLxQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] oeqa/runtime/rust: Add basic compile/run test
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 14:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174815

On Mon, Dec 19, 2022 at 2:19 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  meta/lib/oeqa/files/test.rs         |  2 ++
>  meta/lib/oeqa/runtime/cases/rust.py | 24 ++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/lib/oeqa/files/test.rs
>
> diff --git a/meta/lib/oeqa/files/test.rs b/meta/lib/oeqa/files/test.rs
> new file mode 100644
> index 000000000000..f79c691f0853
> --- /dev/null
> +++ b/meta/lib/oeqa/files/test.rs
> @@ -0,0 +1,2 @@
> +fn main() {
> +}
> diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
> index 55b280d61d8a..186bb0d79e15 100644
> --- a/meta/lib/oeqa/runtime/cases/rust.py
> +++ b/meta/lib/oeqa/runtime/cases/rust.py
> @@ -8,6 +8,30 @@ from oeqa.runtime.case import OERuntimeTestCase
>  from oeqa.core.decorator.depends import OETestDepends
>  from oeqa.runtime.decorator.package import OEHasPackage
>
> +class RustCompileTest(OERuntimeTestCase):
> +
> +    @classmethod
> +    def setUp(cls):
> +        dst = '/tmp/'
> +        src = os.path.join(cls.tc.files_dir, 'test.rs')
> +        cls.tc.target.copyTo(src, dst)
> +
> +    @classmethod
> +    def tearDown(cls):
> +        files = '/tmp/test.rs /tmp/test'
> +        cls.tc.target.run('rm %s' % files)
> +
> +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> +    @OEHasPackage(['rust'])
> +    def test_rust_compile(self):
> +        status, output = self.target.run('rustc /tmp/test.rs -o /tmp/test')
> +        msg = 'rust compile failed, output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)
> +
> +        status, output = self.target.run('/tmp/test')
> +        msg = 'running compiled file failed, output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)
> +
>  class RustHelloworldTest(OERuntimeTestCase):
>      @OETestDepends(['ssh.SSHTest.test_ssh'])
>      @OEHasPackage(['rust-hello-world'])

One thing I wasn't clear on with this, is how I ensure that rust is
actually installed on the test image during CI, so this test runs?

-- 
Alex Kiernan

