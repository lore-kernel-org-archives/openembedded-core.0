Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 92625786B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 16:06:17 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id e98-v6so11416651itd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WXhFLG2ARB86XImooI2/J2WsEMANY89Kyxg6dwBULzE=;
	b=ljrCWMQR3FG7KRmpShArEtTvCgWPuLvxElwIC2iUNoQXxd973O948wfLzfcyHMQJ7/
	37D9rGYhWyehYAYed+9ukXKiBaNnCkir24iAWBSljPys/eA9ejSUhT2BipgK33VydknA
	9ta2PxVsr+FLJHRK2EMFDNZd+uULrcNTfAXgwBdw782JriSAYhFWyVJawSGPOrFz9eQw
	2+nrK2t12K7Kq1eZsjNcoOLVpgUGss6BRGDaAdJf4pQlmAWekNZ1/cBkXpRLiWozwgEd
	Tu+oENWjX1n0FWvO8G2h6RPOCj0k8Dz3d2BikeQrWbU9MtVyoxfy/sHRcuOjYVBU8GP5
	FvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WXhFLG2ARB86XImooI2/J2WsEMANY89Kyxg6dwBULzE=;
	b=QS1vYP22rkEi/XxD2O8/F+vhev1yihA3neJt4cBRkz1/wKFCFoLWsGLwy9O8YT5aoo
	h0oxLfWD8uR5sHqXduGBCv7dSTXf0QRRueRwdC4zZBZ7iTyc0hyERV3IMmosFH2ssNuS
	FT8XSKKyLwYLaprFwFN6ZMZ9WO/AJcfn7Wn+zpN0FlKlUR64vypJVHLgifX3cTvoWxAI
	tKFlzoGfvZIhwTSnoLt/fR3cOe0rRaBBtIzhG4pLROsj/wE+AM/zy7ZnG1BWfKuE9zS5
	ddmNM0ERigj9AmVp9PlsWCsARgONw0/TPNNYEhLcgNOmV2+ALxEJYJc7VWVNIdJiSZtD
	70nQ==
X-Gm-Message-State: AElRT7GUedcJN1PH0iUXpIgYznn8QUMQv8AwJvHOLaNx35xnnICmv3Xg
	jkVryGA68/v00U/m0mY90ZNHdS7mKIvVVsOmxp3rBQ==
X-Google-Smtp-Source: AIpwx49/eldGzjvi1QTzYILPaIn2nj8zfATk509fJMij1YN/tmDBkm0fVx1aFQGJZddsidG70XuYtQYk+fuiAOhkfk8=
X-Received: by 2002:a24:2f49:: with SMTP id
	j70-v6mr7051050itj.127.1522080378476; 
	Mon, 26 Mar 2018 09:06:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 09:05:58 -0700 (PDT)
In-Reply-To: <1521741206-5138-2-git-send-email-kamensky@cisco.com>
References: <1521741206-5138-1-git-send-email-kamensky@cisco.com>
	<1521741206-5138-2-git-send-email-kamensky@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 17:05:58 +0100
Message-ID: <CAJTo0LY=rKUZ-D+0iFdx=n9+YeVLFXuCE_sBvxfL7_GxbxFUfA@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/runtime/stap.py: add runtime test for systemtap
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
X-List-Received-Date: Mon, 26 Mar 2018 16:06:17 -0000
Content-Type: text/plain; charset="UTF-8"

On the autobuilder:

| NOTE: FAIL [15.139s]: test_stap (stap.StapTest)
| NOTE: ----------------------------------------------------------------------
| NOTE: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/stap.py",
line 33, in test_stap
|     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
| AssertionError: 1 != 0 : stap --disable-cache /tmp/hello.stp
| ERROR: module version mismatch (#1 SMP PREEMPT Mon Mar 26 14:41:21
UTC 2018 vs #1 SMP PREEMPT Mon Mar 26 14:03:27 GMT 2018), release
4.14.24-yocto-standard
| WARNING: /usr/bin/staprun exited with status: 1
| Pass 5: run failed.  [man error::pass5]

Is this systemtap-uprobes not being rebuilt when it should?

Ross

On 22 March 2018 at 17:53, Victor Kamensky <kamensky@cisco.com> wrote:
> Add runtime test for stap to test basic SystemTap
> operations: can compile very basic module and run on
> target device.
>
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> ---
>  meta/lib/oeqa/runtime/cases/stap.py   | 33 +++++++++++++++++++++++++++++++++
>  meta/lib/oeqa/runtime/files/hello.stp |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/lib/oeqa/runtime/cases/stap.py
>  create mode 100644 meta/lib/oeqa/runtime/files/hello.stp
>
> diff --git a/meta/lib/oeqa/runtime/cases/stap.py b/meta/lib/oeqa/runtime/cases/stap.py
> new file mode 100644
> index 0000000..005da71
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/cases/stap.py
> @@ -0,0 +1,33 @@
> +import os
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.depends import OETestDepends
> +from oeqa.core.decorator.oeid import OETestID
> +from oeqa.core.decorator.data import skipIfNotFeature
> +
> +class StapTest(OERuntimeTestCase):
> +
> +    @classmethod
> +    def setUpClass(cls):
> +        src = os.path.join(cls.tc.runtime_files_dir, 'hello.stp')
> +        dst = '/tmp/hello.stp'
> +        cls.tc.target.copyTo(src, dst)
> +
> +    @classmethod
> +    def tearDownClass(cls):
> +        files = '/tmp/hello.stp'
> +        cls.tc.target.run('rm %s' % files)
> +
> +    @OETestID(1652)
> +    @skipIfNotFeature('tools-profile',
> +                      'Test requires tools-profile to be in IMAGE_FEATURES')
> +    @OETestDepends(['kernelmodule.KernelModuleTest.test_kernel_module'])
> +    def test_stap(self):
> +        cmds = [
> +            'cd /usr/src/kernel && make scripts',
> +            'cd /lib/modules/* && (if [ ! -L build ]; then ln -s /usr/src/kernel build; fi)',
> +            'stap --disable-cache /tmp/hello.stp'
> +            ]
> +        for cmd in cmds:
> +            status, output = self.target.run(cmd, 900)
> +            self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
> diff --git a/meta/lib/oeqa/runtime/files/hello.stp b/meta/lib/oeqa/runtime/files/hello.stp
> new file mode 100644
> index 0000000..3677147
> --- /dev/null
> +++ b/meta/lib/oeqa/runtime/files/hello.stp
> @@ -0,0 +1 @@
> +probe oneshot { println("hello world") }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

