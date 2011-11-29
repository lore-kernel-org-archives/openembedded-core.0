Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVNof-0003Op-7o
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 14:33:47 +0100
Received: by yenl4 with SMTP id l4so1896834yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 05:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=dTv8Wu7KATfV1rcrQFwOQsy4FpC0UNW8CMK0NKC2mPY=;
	b=biqBfsX/SweB74RAI6d8FHNHmiYqmmeEzYC/+02XIjlRXwQOp0EL7sPb46x1FuDTMS
	bNOIXF16c3VOevoKqMteVtQQAYjSxFIm2FjXTR/Idr4VDN4whkyboAaG1kGJmoRwhUPJ
	Ogc+qjNKce1b394O0sRsOZzGgp4oHFVBsWHhc=
MIME-Version: 1.0
Received: by 10.236.191.5 with SMTP id f5mr70122746yhn.122.1322572921721; Tue,
	29 Nov 2011 05:22:01 -0800 (PST)
Received: by 10.146.97.36 with HTTP; Tue, 29 Nov 2011 05:22:01 -0800 (PST)
In-Reply-To: <6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
	<6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
Date: Tue, 29 Nov 2011 14:22:01 +0100
Message-ID: <CA+chaQe0kyPrt8Ni7M_eozP9TnU6zqO1KSgFbWhshdhQomT6yw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] binutils: upgrade from 2.21.1a to 2.22
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 13:33:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 1:36 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> And rebase the patches to the newer source code
>
> This patch is upstream hence deleting it from the recipe.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0binutils/110-arm-eabi-conf.patch
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

Could you please update FILES+${PN}-debug to fix this QA?

Thanks

WARNING: For recipe binutils, the following files/directories were
installed but not shipped in any package:
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/strip
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/objcopy
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/objdump
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ld
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/nm
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/as
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ranlib
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ld.bfd
WARNING:   /usr/arm-oe-linux-gnueabi/bin/.debug/ar

Cheers,


