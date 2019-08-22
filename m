Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0B00F7F26C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 16:43:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z1so6038792wru.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=TCOlGhP+A3HZy5WI8Azq7QtxYMVDksIwyVHpPToUNDE=;
	b=QalPnK3pR43lhKwcIcGOccG19BjRwgtNxbOtWdZq073YQ9UvBbt0lxrBOJJDah07j4
	99pVeaAswpK5yQug2rDugS3H893wM9lhFwYEfTIlGsQzr787XX/cYT+xpZoaFp+qUlnL
	ew+qou7ga7QjxfbGR73bKhcyQVsBshkn/IgCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TCOlGhP+A3HZy5WI8Azq7QtxYMVDksIwyVHpPToUNDE=;
	b=XOD8fX73sLMjXnrtVjotRvXAIy8Vfg4FxJB7z/occGRGNKK/uI7aeABgD9ZOh1O/9m
	1DkWI95FrE4sT36P6fhaAW8sigke2VW1Uf4VkbdN3sOy1guMEthrbbFKQCNetCs1VB1N
	BiVHs972vF+r8kZQth94i158TW1cWiohj3A+i0tZD/FZoXKm8YEWDWotZ0A7d1NmM76r
	jJWHBTwByGYUKaTnPJFZdegaiXhQ+ZqoC8SqCCgO66kV8X5WXc/4qWpyfBVEbb2iJJ08
	iJlSuYvlRaxffr9Vm0jORHLvU/XoGEnyGO7NIfZ8LQc4K5oRF1kPsA8IOQhExk45gdQm
	gyKQ==
X-Gm-Message-State: APjAAAVTdaRsBqtzVja241RLNjpnGwmw3Jqdd927BUqBaKrwkT5yhqOI
	KIFR/TEFFCn/6xx58A7xd/67YA==
X-Google-Smtp-Source: APXvYqxcb+3gnNkO3JUmHehX+VvU6RnTU2cI+a1YEKD+m4bm2u0hn1YJ0RQN9JdAme1pY6Co0muFPQ==
X-Received: by 2002:a05:6000:110f:: with SMTP id
	z15mr45763218wrw.162.1566492202676; 
	Thu, 22 Aug 2019 09:43:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l14sm111834wrn.42.2019.08.22.09.43.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 09:43:22 -0700 (PDT)
Message-ID: <4d3bb50cec66d5cfaedbdbc3145fd2112fc1934a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mazliana.mohamad@intel.com, openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2019 17:43:21 +0100
In-Reply-To: <1566469695-583-1-git-send-email-mazliana.mohamad@intel.com>
References: <1566469695-583-1-git-send-email-mazliana.mohamad@intel.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] oeqa/kerneldevelopment: Able to apply a single patch to the Linux kernel source
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
X-List-Received-Date: Thu, 22 Aug 2019 16:43:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-22 at 18:28 +0800, mazliana.mohamad@intel.com wrote:
> From: Mazliana <mazliana.mohamad@intel.com>
> 
> Purpose of kernel development is basically to customize our
> own recipes kernel by reused existing recipes.
>  
> This is an initiative of automating manual kernel development
> test cases. Applying a single patch to the Linux kernel source
> is one of the manual test cases of kernel development.
> 
> Objective of this test is as a developer we can make changes of
> a file in kernel source and able to apply a single patch to
> the kernel source.
>  
> ref:https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases

Thanks for this patch, it looks reasonable but needs a few further
small cleanups, comments below.

> Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/kerneldevelopment.py | 66 +++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/kerneldevelopment.py
> 
> diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
> new file mode 100644
> index 0000000..cde1ba2
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
> @@ -0,0 +1,66 @@
> +import os
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, runCmd, get_bb_var
> +from oeqa.utils.git import GitRepo, GitError
> +
> +class KernelDev(OESelftestTestCase):
> +
> +    @classmethod
> +    def setUpClass(cls):
> +        super(KernelDev, cls).setUpClass()
> +        # Create the recipe directory structure inside the created layer
> +        cls.layername = 'meta-kerneltest'
> +        runCmd('bitbake-layers create-layer %s' % cls.layername)
> +        runCmd('mkdir -p %s/recipes-kernel/linux/linux-yocto' % cls.layername)
> +        cls.recipes_linuxyocto_dir = os.path.join\

Please put a space before the \

> +            (cls.builddir, cls.layername, 'recipes-kernel', 'linux', 'linux-yocto')
> +        cls.recipeskernel_dir = os.path.dirname(cls.recipes_linuxyocto_dir)
> +        runCmd('bitbake-layers add-layer %s' % cls.layername)
> +
> +    @classmethod
> +    def tearDownClass(cls):
> +        runCmd('bitbake-layers remove-layer %s' % cls.layername, ignore_status=True)
> +        runCmd('rm -rf %s' % cls.layername)
> +        super(KernelDev, cls).tearDownClass()
> +
> +    def setUp(self):
> +        super(KernelDev, self).setUp()
> +        self.set_machine_config('MACHINE = "%s"\n' % 'qemux86-64')

Why not just

self.set_machine_config('MACHINE = "qemux86-64"\n')

?

> +
> +    def test_apply_patches(self):
> +        """
> +        Summary:     Able to apply a single patch to the Linux kernel source
> +        Expected:    The README file should exist and the patch changes should be
> +                     displayed at the end of the file.
> +        Product:     Kernel Development
> +        Author:      Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> +        AutomatedBy: Mazliana Mohamad <mazliana.mohamad@intel.com>
> +        """
> +        runCmd('bitbake virtual/kernel -c patch')
> +        kernel_source = get_bb_var('STAGING_KERNEL_DIR')
> +        readme = os.path.join(kernel_source, 'README')
> +
> +        # This test step adds modified file 'README' to git and creates a
> +        # patch file '0001-KERNEL_DEV_TEST_CASE.patch' at the same location as file
> +        patch_content = 'This is a test to apply a patch to the kernel'
> +        runCmd('echo %s >> %s' % (patch_content, readme))

How about:

with open(readme, "a+") as f:
    f.write(patch_content)

> +        repo = GitRepo('%s' % kernel_source, is_topdir=True)
> +        repo.run_cmd('add %s' % readme)
> +        repo.run_cmd(['commit', '-m', 'KERNEL_DEV_TEST_CASE'])
> +        repo.run_cmd(['format-patch', '-1'])
> +        patch_name = '0001-KERNEL_DEV_TEST_CASE.patch'
> +        patchpath = os.path.join(kernel_source, patch_name)
> +        runCmd('mv %s %s' % (patchpath, self.recipes_linuxyocto_dir))
> +        runCmd('rm %s ' % readme)
> +        self.assertFalse(os.path.exists(readme))
> +
> +        recipe_append = os.path.join(self.recipeskernel_dir, 'linux-yocto_%.bbappend')
> +        with open(recipe_append, 'w+') as fh:
> +            fh.write('SRC_URI += "file://%s"\n' % patch_name)
> +            fh.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"')
> +
> +        runCmd('bitbake virtual/kernel -c cleansstate')


Tests *must* not use cleansstate. Please just use clean here.

> +        runCmd('bitbake virtual/kernel -c patch')
> +        self.assertTrue(os.path.exists(readme))
> +        result = runCmd('tail -n 1 %s' % readme)
> +        self.assertEqual(result.output, patch_content)

Cheers,

Richard



