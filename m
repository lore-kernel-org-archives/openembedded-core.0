Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 96F2478250
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:46:56 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id c24so5104983wra.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 09:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wmvoDhO6cpnnA6BicrpmIYL1efQu0zC/MsZMI2bz9bw=;
	b=n58Q9NM0aQWzG6thbw9cdDoBA3aZ9F0b+v2vv9PUiDNIBzV6xJfmaHy896aqCE2Ypn
	n6mBOVGdK2S/vW+qe2c3gcz/eI9tUR5W3TPCHPYb1sqJ7YiR5j8+CE72HJ4ZFwVsaLQ3
	5tjw0G4sz0IUSydd9P0FBt2XIr11bN2FC6J9+51zkr+4FKGNKxmC+gtgM0gVT/N2V1XF
	03T1LURQLB7UUhGx4Zf/UAlvaLfzJf7GCYqXsf8zmG3du7fbZGJVe1T+f8cb9LcgsuWh
	CrMvclogSZvR1tEpbooF0Vt3h/Rq0OhG1r5NOLJ+fSHU4IzGUEqAMXulY2Sy2Uc1TCuq
	0EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wmvoDhO6cpnnA6BicrpmIYL1efQu0zC/MsZMI2bz9bw=;
	b=g/VXTZP8BUV+F8GsbGncs4xVCM3Dqvi8kz6i2BEnXV4i0+fnUpHekKWdXCO0JLRbS2
	zvlVUfpHcgvMC2mUgCLqR1Nie4dFWdU/COZQyVlL4+gsGm7I8uq1KYBDZOdDM14xhLZ5
	bkQMRJBozVcokFy2vM5ijCOXjJftzaZ5DZX/4GnkmCR8JBLQlCsmUEnURMnHIyMJr8yT
	u5HFWYz8Wg88VQBCIbbtjXRFCrDSEq/c/miq1gIt/rqBAeNUs2ZnAeKG3tkDRzBKqnrU
	/QBD66evkkK0n+U5GwWlipKfrCDyX3fEdjuyXdEmMKq435F8qQeiG1Eiazz1Qcpfp0V+
	OGTA==
X-Gm-Message-State: AIVw110xvZkXxde4c+axMMsFqsdcRUD2O28Asfp+wY9AAGLZfsei26lb
	QgroO7SBptsBYo96y/yqzrCR8LZUZQ==
X-Received: by 10.223.151.82 with SMTP id r76mr4631460wrb.6.1500482817342;
	Wed, 19 Jul 2017 09:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 19 Jul 2017 09:46:56 -0700 (PDT)
In-Reply-To: <80eaf75bf2474828501d52875bf724f28cdecb64.1500470150.git.alexander.kanavin@linux.intel.com>
References: <cover.1500470150.git.alexander.kanavin@linux.intel.com>
	<80eaf75bf2474828501d52875bf724f28cdecb64.1500470150.git.alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 19 Jul 2017 09:46:56 -0700
Message-ID: <CAJ86T=VpVNn+K21qdJ+zAYtMCaH+0R8EOSEwNz1ZaTzMYSa+4g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] openssh: depend on openssl 1.0
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
X-List-Received-Date: Wed, 19 Jul 2017 16:46:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 19, 2017 at 6:19 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> The proposed openssl 1.1 patches are here:
> https://github.com/openssh/openssh-portable/pull/48
>
> Openssl maintainers are not in a hurry to get 1.1 support in;

Openssh maintainers?

> if it doesn't show up within reasonable time, we can take a patch
> from Fedora:
> http://lists.mindrot.org/pipermail/openssh-unix-dev/2016-November/035454.html
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_7.5p1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> index 7bd313bb4e8..3b8fd7d1cc5 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> @@ -8,7 +8,8 @@ SECTION = "console/network"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
>
> -DEPENDS = "zlib openssl"
> +# openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
> +DEPENDS = "zlib openssl10"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>  SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

