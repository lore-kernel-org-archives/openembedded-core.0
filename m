Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 11AB5731BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:25:33 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v2so1105401ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+/EotyLOa5mkc9PMlWVUrfFfSS0QttFud52HuHVQWys=;
	b=DWTeEV4k34IoOQonOMQjZpXCZQQlig3TidWIB0fF64iZOCNQOEHMA+YqlCHA5Lpqpv
	motmF5yBvePIA5AeKw9sNbgJMlBYSRLcK10rMeLto0u3B5duuhq/jgJi0AmC00HLu4e7
	N5gpK6wFyrS5Rr9bgSl/Ziw/pWPdBjPkJKkG8KJGwBAmXCYbaLsd7tXFE4H/u58u2KrN
	XzjAmY+vmBW3+MaK6h046HlLfheEqOFEJI4b1jg+la+kDrG8zRnnHizSjw57B3omfTyV
	WFNvXr/ClrtixdOdXH0ONSQiZR5bCNFJmoXId5zbJfV1BWZhxiDkuiXpnfAg6hSHHE5I
	K7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+/EotyLOa5mkc9PMlWVUrfFfSS0QttFud52HuHVQWys=;
	b=GoKEZXQhrx03UoxMdH2vZXYXbGfOPe4HsYf4Gq6ircUHDMeBb4obnk3ca34+5DIcDx
	Cs9wzQB8SIKUkN2LfXPrTfVxswleJbT4xbEjZrbNDhmCO3NsGkQ7qee1HuUkvlIYPHBc
	q9CMEJbOpt2oU7szdnLta6NNgBfDn7bB/MNaHOomFaLDcwL2/5/WV5OSmeZCMtAjOMpD
	CNG8cAM1XRDsAzj1qYcHnKYgcz/N8aNAXsNnhQZ9gGVqY2hbk06QKXlNDvT7pcT+/ek0
	VF1wO80HQGY3y2INiqFkSGiVEFN/n6B/l8vGfyKID487nclNmVPmIKvnOJIb76FwNLxl
	urEg==
X-Gm-Message-State: AE9vXwOq+Fim3QFtKdVUjdsXLvTJ50adtRerk8jllCITRNbRjCbK/T8ThIwysQn+EL8Vdg==
X-Received: by 10.13.197.197 with SMTP id h188mr725268ywd.202.1473863133830;
	Wed, 14 Sep 2016 07:25:33 -0700 (PDT)
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com.
	[209.85.161.175]) by smtp.gmail.com with ESMTPSA id
	s126sm2538904yws.13.2016.09.14.07.25.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 07:25:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yw0-f175.google.com with SMTP id g192so22470166ywh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 07:25:32 -0700 (PDT)
X-Received: by 10.129.129.134 with SMTP id r128mr2993593ywf.179.1473863131986; 
	Wed, 14 Sep 2016 07:25:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Wed, 14 Sep 2016 07:25:31 -0700 (PDT)
In-Reply-To: <1473856229-907-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1473856229-907-1-git-send-email-fabio.berton@ossystems.com.br>
Date: Wed, 14 Sep 2016 11:25:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqJ3OwCsccW8Tgj19LDHt0TmZDOaugSJv3UhUSPY0TsGg@mail.gmail.com>
Message-ID: <CAP9ODKqJ3OwCsccW8Tgj19LDHt0TmZDOaugSJv3UhUSPY0TsGg@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] patchelf: Update to version 0.9
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
X-List-Received-Date: Wed, 14 Sep 2016 14:25:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2016 at 9:30 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>  * Remove patch maxsize.patch already applied upstream.
>
>  * Add patch Skip-empty-section-fixes-66.patch to prevent errors like:
>
>   /
>   |ERROR: go-cross-1.6.2-r0 do_populate_sysroot_setscene: '('patchelf-uni=
native',
>   |'--set-interpreter', '/home/user/src/prj/build/tmp/sysroots-uninative/
>   |x86_64-linux/lib/ld-linux-x86-64.so.2', '/home/user/src/prj/build/tmp/
>   |work/x86_64-linux/go-cross/1.6.2-r0/sstate-install-populate_sysroot/x8=
6_64-
>   |linux/usr/bin/aarch64-prj-linux/go')'
>   |failed with exit code 1 and the following output:
>   |cannot find section .rela.dyn
>   \
>
>   * Add patch handle-read-only-files.patch to fix error when building
>     eSKD, the following error appears on task do_testsdkext
>
>   /
>   |ERROR: db-native-6.0.30-r1 do_populate_sysroot_setscene: '('patchelf-u=
ninative',
>   |'--set-interpreter', 'src/fsl-community-bsp/build/tmp/work/qemuarm-pok=
y-linux-
>   |gnueabi/core-image-minimal/1.0-r0/testsdkext/tc/tmp/sysroots-uninative=
/
>   |x86_64-linux/lib/ld-linux-x86-64.so.2', 'src/fsl-community-bsp/build/t=
mp/work/
>   |qemuarm-poky-linux-gnueabi/core-image-minimal/1.0-r0/testsdkext/tc/tmp=
/work/
>   |x86_64-linux/db-native/6.0.30-r1/sstate-install-populate_sysroot/x86_6=
4-linux/
>   |usr/bin/db_tuner')' failed with exit code 1 and the following output:
>   |b'open: Permission denied\n
>   \
>
>   * Add patch Increase-maxSize-to-64MB.patch to fix error described
>   bellow, the same issue is discussed here:
>     - https://github.com/NixOS/patchelf/issues/47
>
>   /
>   |ERROR: qemu-native-2.5.0-r1 do_populate_sysroot_setscene: '('patchelf-=
uninative',
>   |'--set-interpreter', '../build/tmp/sysroots-uninative/x86_64-linux/lib=
/
>   |ld-linux-x86-64.so.2', '../build/tmp/work/x86_64-linux/qemu-native/2.5=
.0-r1/
>   |sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64')'
>   |failed with exit code 1 and the following output:
>   |warning: working around a Linux kernel bug by creating a hole of 36032=
512
>   |bytes in =E2=80=98../build/tmp/work/x86_64-linux/qemu-native/2.5.0-r1/
>   |sstate-install-populate_sysroot/x86_64-linux/usr/bin/qemu-mips64=E2=80=
=99
>   |maximum file size exceeded
>   \
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

