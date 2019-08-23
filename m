Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id A31657F2FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 12:10:15 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id i18so5686776pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=56muA9xnNyEyYHbepgPiraz7WKtxLvK8YgVgUC2Uwio=;
	b=AIDHHK3V7oAelC4JLUcWN5ru970tvfjMJio6akZJGkXn/9+15RZwmZ73WrbFQxTVaX
	Q0UXv9U/z7UDrpQWonbtncvNJu4oMFD6o/BmohYXEKi8WTn3q5YZTvNuAhkj8rmszrZy
	acAVc3YO1DxQr+39cnufftkaAiXruXy7doczMluun8Gzw7i0S3fS831E9I+kYcsEItke
	x9e69V4FO42uNGf0Znhj2NFCHInDnbvLpai3DMrabxhC5Y4vxeiFOg6vcfi0vcxyLab8
	0qPoPlPG6lwVAsgpZqjCa+RtL+xXk6LjuXniRdDWQ+goKoNSwODo0+sdHHT8yRNy02YI
	mmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=56muA9xnNyEyYHbepgPiraz7WKtxLvK8YgVgUC2Uwio=;
	b=d57LJxUGebDNTcSMyt3fF9HLv6gBIKKgvLCu4/qX49tIFhd3xk51as5uetCtHHehKb
	kz+6jL2OSuG2Ie4AstpvuwWzMqHGO+3l9vjEcWZzA1RTdKbW3gXS3yj0JfAVQjS1ZrJo
	Kg2rOPoCzLlyqR3E4EIjbv3bgd+KVpeMeyndz0sPcGhbJBTIM9uSQKIBXGe9MJa7DVlA
	ym3eQV7nGh5vGHc4EaC625olhezbyyZYITK2O9aCf/UK+OSe/Cy6jvJSZG0BvQwSjUFE
	jnaJQzKs7pPQ1DTolfjQcZA5P+/QpnK6qCT03HgrRe9HCdpxVdlVp3nCog3wH57w2dIJ
	BXoQ==
X-Gm-Message-State: APjAAAWceU2ZvZFTcUkk/GntzJh1eamSQ0LfwW4UrQyavmtiWlOQ/ssh
	nBA9tF1gP/HrUJvegbqg5zyAzwow
X-Google-Smtp-Source: APXvYqzJxd1Zq7wWK/jlo2ODqJ+tpXrFT9jK7l9VvC2lirD/6dcbB+u7uo8Ufm3WYY9zPlhkuNlREw==
X-Received: by 2002:aa7:91cc:: with SMTP id z12mr4924510pfa.76.1566562216318; 
	Fri, 23 Aug 2019 05:10:16 -0700 (PDT)
Received: from [172.20.6.109] ([12.235.222.84])
	by smtp.gmail.com with ESMTPSA id
	e26sm2649557pfd.14.2019.08.23.05.10.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Aug 2019 05:10:15 -0700 (PDT)
To: mazliana.mohamad@intel.com, openembedded-core@lists.openembedded.org
References: <1566527358-49642-1-git-send-email-mazliana.mohamad@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <95f19318-907d-059a-ce22-b833bffbd429@gmail.com>
Date: Fri, 23 Aug 2019 05:10:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566527358-49642-1-git-send-email-mazliana.mohamad@intel.com>
Subject: Re: [PATCH v3] oeqa/kerneldevelopment: Able to apply a single patch to the Linux kernel source
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
X-List-Received-Date: Fri, 23 Aug 2019 12:10:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/22/19 7:29 PM, mazliana.mohamad@intel.com wrote:
> From: Mazliana <mazliana.mohamad@intel.com>
>
> Purpose of kernel development is basically to customize our
> own recipes kernel by reused existing recipes.
>  
> This is an initiative of automating manual kernel development
> test cases. Applying a single patch to the Linux kernel source
> is one of the manual test cases of kernel development.
Doesn't this allow us to remove
"kernel-dev.kernel-dev.Kernel_dev_Applying_patches" from the
manual/kernel-dev.json?

- armin
>
> Objective of this test is as a developer we can make changes of
> a file in kernel source and able to apply a single patch to
> the kernel source.
>  
> ref:https://wiki.yoctoproject.org/wiki/Kernel_Development_Test_Cases
>
> Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/kerneldevelopment.py | 67 +++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/kerneldevelopment.py
>
> diff --git a/meta/lib/oeqa/selftest/cases/kerneldevelopment.py b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
> new file mode 100644
> index 0000000..a61876e
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/kerneldevelopment.py
> @@ -0,0 +1,67 @@
> +import os
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, get_bb_var
> +from oeqa.utils.git import GitRepo
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
> +        cls.recipes_linuxyocto_dir = os.path.join \
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
> +        self.set_machine_config('MACHINE = "qemux86-64"\n')
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
> +        with open(readme, 'a+') as f:
> +            f.write(patch_content)
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
> +        runCmd('bitbake virtual/kernel -c clean')
> +        runCmd('bitbake virtual/kernel -c patch')
> +        self.assertTrue(os.path.exists(readme))
> +        result = runCmd('tail -n 1 %s' % readme)
> +        self.assertEqual(result.output, patch_content)


