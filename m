Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id DD5A77E091
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 20:25:16 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id l20so14095404ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jRdPdT9eWJ9+vmzQetpScxRSJgYteIEzaDE7BSC8lHk=;
	b=Z5raf6KKXSouyAKnOih8FBOKrwUiAR+9RfjwWNXVRfVpL+qwNzcerjJCfZ1ftKa6QM
	XkfSYa5B1B29KNH6RFIJ+pJmuUBhXb+a1DxatKuWu8Sbi7vOpYO553nFdektkvXlGfmM
	uhKItWgc9HhiIP9WuRf9gZGhN3pmZ4TIIqY8V5ikEhvdwwP+iVI1gfEPeRWoHbfoF4CR
	KL1TH1egC0SVWhKSIwGVq8BVoqckvLLocN0cDiYN+BhB3RCr60yPg79yVINXgANgkPMJ
	Psjg++uFZxsiEaQ7MLg9KWX7rut0HW+3uWWgIYthxK7+scvZ9pTS5GeUPZcmH7HFh9iC
	esww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jRdPdT9eWJ9+vmzQetpScxRSJgYteIEzaDE7BSC8lHk=;
	b=TfB/Z/ckCITSNqBu9eyqOpWOL/Ex7OvcP39488qWIPqWSx6Gfl+seZt+y1Gz6fxOT+
	r/cX1xXFoCZkpsrtUoDruI0IMIjE9ol6/r/ehkGnfVqDV+wVJRsDefnxNkRJ4iIJofxS
	rAN7aRku571UzypA920hEsA6Vg7yvZF04qZZLeUBogqjFULEUR1HXxImiDNugpuhG1H0
	2S84mc76J63dWMYVdRuDVvJo8zBXZwwK421zBjaogZZCv40z6JVGNX/yTed66owvXdim
	MlyF1LrAjAx9P/KNMFw9hccuM0/DaKKYo1BSduMxmL6LqB1Q90ToWp9oA+IYC4Y86/Qz
	gzJg==
X-Gm-Message-State: APjAAAWozjLTFEV0jY1HrpKgPteLY9lK/xPIESYKHftogVKD7Ruu3HSN
	e1UG9CX+zGzCBWexeWQiLbuATLK5CzImCGDFKE0w5Q==
X-Google-Smtp-Source: APXvYqzNUGe4kGq5l3XBzeo9AuvLMA3n8OC3DEHecZxdSV3Zd6yq3G08rk2ECWE2g/OWVr94gJFfkKMrfdsbUsWt7rc=
X-Received: by 2002:a2e:99cc:: with SMTP id l12mr922484ljj.5.1568060717091;
	Mon, 09 Sep 2019 13:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAP71WjxBhq4=rvMN5DWAamV5sE-nCenqFxLdPRYNA3st2Y0Z4Q@mail.gmail.com>
	<CADkTA4NXHjo=2daFtRbZAheunsNO-OCeVqZGQ=9ZW+1Fjqe1+Q@mail.gmail.com>
In-Reply-To: <CADkTA4NXHjo=2daFtRbZAheunsNO-OCeVqZGQ=9ZW+1Fjqe1+Q@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 9 Sep 2019 22:25:05 +0200
Message-ID: <CAP71WjwuAbAd=h3WdW=Ku8EaFPx1=z8P2jvbWA6yvAHsGuFPkw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: make-mod-scripts question
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
X-List-Received-Date: Mon, 09 Sep 2019 20:25:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,

things are getting worse , my initial problem was only the visible
piece of the iceberg ;)

On Thu, Sep 5, 2019 at 5:42 PM Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
>
> On Thu, Sep 5, 2019 at 10:43 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
> >
> > hi,
> >
> > I was looking into a build issue today, related to signing an external
> > kernel module. My build failed when calling the kernel utility
> > sign-file, the error was that libcrypto.so was not found.
> >
> > Looking a bit more into that, I realized that make-mod-scripts will
> > built some kernel utilities, including scripts/sign-file which link
> > against libcrypto, however we 'copy' sign-file into
> > STAGING_KERNEL_BUILDDIR.
>
> Indeed, the build and redirected output dir will get the binaries, but
> not the libraries. Either static linking of a smarter install of the
> binaries would be a good idea.
>
> >
> > Later on, when my own recipe uses sign-file from
> > STAGING_KERNEL_BUILDDIR, it still requires the libcrypto.so file which
> > is in the make-mod-scripts per recipe sysroot. So basically my recipe
> > needs a binary from STAGING_KERNEL_BUILDDIR and a shared library from
> > another recipe sysroot. That looks wrong to me.
> >
> > My problem is fixed by adding a dependency on make-mod-scripts, it
> > still feels wrong to reply on another recipe sysroot , doesn't it go
> > against the whole idea of per recipe sysroot?
>
> Agreed.
>
> I'm wondering make-mod-scripts should both create a package and
> install into the staged kernel build dir.
>
> That way if you had a dependency on make-mod-scripts, you'd use both
> the binary and the library from the recipe sysroot, but we'd also get
> that shared copy for the needs in the shared kernel build directory.
> Obviously the shared kernel build artifacts are a special case, and
> I'm not even sure if what I'm thinking is even possible .. or is worse
> than the symptom you are describing.
>
> Just thinking out loud. Hopefully someone with more knowledge on the
> packaging/internal/sstate internals will see this and have more
> details.

you are correct, and i hope we can fix that. However what I have now
realized is that building external modules with modules signing
enabled seems to be broken.

The kernel generates the keys pair and certificate when it's built and
the public key is embedded in the kernel image. The keys are put in
STAGING_KERNEL_DIR, where module_do_compile() expects it. And it works
just fine, until you delete TMPDIR, and build again. For example if
you have a change in your module recipe, and build again. Because it's
an external module, it has:
do_configure[depends] +=3D "make-mod-scripts:do_compile"

and make-mod-scripts has the following depends:
do_configure[depends] +=3D "virtual/kernel:do_shared_workdir
openssl-native:do_populate_sysroot"
do_compile[depends] +=3D "virtual/kernel:do_compile_kernelmodules"

So the kernel will effectively be rebuilt , and a new pair of keys is
generated and placed in STAGING_KERNEL_DIR. Then the external module
is recompiled and signed with the *new* key. However since the kernel
recipe didn't change the kernel do_deploy() is not run, and artifacts
are used from the sstate-cache. So we eventually end up with
vmlinuz/Image built with the *old* key and the new kernel module
signed with the *new* key.

Here is a log of what happens in my build env that demonstrates this
sequence of task:

NOTE: recipe linux-msm-4.9-r5: task do_deploy_setscene: Started
NOTE: recipe linux-msm-4.9-r5: task do_populate_lic_setscene: Started
NOTE: recipe linux-msm-4.9-r5: task do_populate_lic_setscene: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_package_write_ipk_setscene: Started
NOTE: recipe linux-msm-4.9-r5: task do_package_write_ipk_setscene: Succeede=
d
NOTE: recipe linux-msm-4.9-r5: task do_deploy_setscene: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_package_qa_setscene: Started
NOTE: recipe linux-msm-4.9-r5: task do_package_qa_setscene: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_packagedata_setscene: Started
NOTE: recipe linux-msm-4.9-r5: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-msm-4.9-r5: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_packagedata_setscene: Succeeded

NOTE: recipe linux-msm-4.9-r5: task do_fetch: Started


                [3/9744]
NOTE: recipe linux-msm-4.9-r5: task do_fetch: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-msm-4.9-r5: task do_unpack: Started
NOTE: recipe qcacld-hl-git-r0: task do_fetch: Started
NOTE: recipe qcacld-hl-git-r0: task do_fetch: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_unpack: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_patch: Started
NOTE: recipe linux-msm-4.9-r5: task do_patch: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_configure: Started
NOTE: recipe linux-msm-4.9-r5: task do_configure: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_compile: Started
NOTE: recipe linux-msm-4.9-r5: task do_compile: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_shared_workdir: Started
NOTE: recipe linux-msm-4.9-r5: task do_shared_workdir: Succeeded
NOTE: recipe linux-msm-4.9-r5: task do_compile_kernelmodules: Started
NOTE: recipe linux-msm-4.9-r5: task do_compile_kernelmodules: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_prepare_recipe_sysroot: Star=
ted
NOTE: recipe qti-console-image-1.0-r0: task do_prepare_recipe_sysroot: Succ=
eeded
NOTE: recipe qti-console-image-1.0-r0: task do_make_bootimg: Started
NOTE: recipe qti-console-image-1.0-r0: task do_make_bootimg: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe qcacld-hl-git-r0: task do_unpack: Started
NOTE: recipe qcacld-hl-git-r0: task do_unpack: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_patch: Started
NOTE: recipe qcacld-hl-git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_patch: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_populate_lic: Started
NOTE: recipe qcacld-hl-git-r0: task do_configure: Started
NOTE: recipe qcacld-hl-git-r0: task do_configure: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_populate_lic: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_compile: Started
NOTE: recipe qcacld-hl-git-r0: task do_compile: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_install: Started
NOTE: recipe qcacld-hl-git-r0: task do_install: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_populate_sysroot: Started
NOTE: recipe qcacld-hl-git-r0: task do_package: Started
NOTE: recipe qcacld-hl-git-r0: task do_populate_sysroot: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_package: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_packagedata: Started
NOTE: recipe qcacld-hl-git-r0: task do_packagedata: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_package_write_ipk: Started
NOTE: recipe qcacld-hl-git-r0: task do_package_qa: Started
NOTE: recipe qcacld-hl-git-r0: task do_package_qa: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe qcacld-hl-git-r0: task do_rm_work: Started
NOTE: recipe qcacld-hl-git-r0: task do_rm_work: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_rootfs: Started
NOTE: recipe qti-console-image-1.0-r0: task do_rootfs: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_makesystem: Started
NOTE: recipe qti-console-image-1.0-r0: task do_image_qa: Started
NOTE: recipe qti-console-image-1.0-r0: task do_makesystem: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_image_qa: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_image: Started
NOTE: recipe qti-console-image-1.0-r0: task do_image: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_image_ext4: Started
NOTE: recipe qti-console-image-1.0-r0: task do_image_ext4: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_image_complete: Started
NOTE: recipe qti-console-image-1.0-r0: task do_image_complete: Succeeded
NOTE: recipe qti-console-image-1.0-r0: task do_populate_lic_deploy: Started
NOTE: recipe qti-console-image-1.0-r0: task do_populate_lic_deploy: Succeed=
ed
NOTE: recipe qti-console-image-1.0-r0: task do_rm_work: Started
NOTE: recipe qti-console-image-1.0-r0: task do_rm_work: Succeeded

where linux-msm is the kernel recipe (inherit kernel), qcacld-hl a
kernel module (which inherit module), and qti-console-image a simple
console image.

If this reasoning is correct that means that kernel signing + external
module is broken. Note that I am working out of Thud for now, i am
sending this email for now to get some feedback, and will try to
reproduce without all our custom layers and with master.

Should we deploy the keys/certificates in the kernel recipe instead of
adding them in STAGING_KERNEL_DIR? Would that be enough?

>
> Bruce
>
> >
> > Here is the sign-file in the kernel shared workdir:
> >
> > $ find tmp-glibc -name sign-file
> > tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifacts/script=
s/sign-file
> >
> > And here we can see the dependency against make-mod-scripts sysroot:
> > $ ldd tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifacts/=
scripts/sign-file
> >         linux-vdso.so.1 =3D>  (0x00007fff8299d000)
> >         libcrypto.so.1.1 =3D>
> > /local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/open_=
q_212a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-nati=
ve/usr/lib/libcrypto.so.1.1
> > (0x00007fcb2247d000)
> >         libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fcb220b3=
000)
> >         libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fcb21e=
af000)
> >         libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
> > (0x00007fcb21c92000)
> >         /lib64/ld-linux-x86-64.so.2 (0x00007fcb2293c000)
> >
> > or like that:
> > $ strings tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifa=
cts/scripts/sign-file
> > | grep tmp-glib
> > /local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/open_=
q_212a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-nati=
ve/usr/lib:/local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/wor=
k/open_q_212a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysro=
ot-native/lib
> >
> > cheers
> > nico
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

