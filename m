Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEE7279F78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 22:33:16 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f188so31623904wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 14:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=bscMHiu/70iTqG9z7Rr/sFgt31x+AJUpZN3GDVswwTk=;
	b=O11bHEgA+WlyBNeGXbVMvDjbGPAXusv+dD6afVBe15bN8lKCkn3IDKEOb9qvd46qae
	GJjmoFLkaaIssG0FBxiimCcy96PoTgGiWs8OdaIcRne+FO1HRKzug6/QiFddHbsFFW9l
	wNldNfeAK+WVZ7xKealNavv0ymRDK2W7x7ico=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bscMHiu/70iTqG9z7Rr/sFgt31x+AJUpZN3GDVswwTk=;
	b=gUefl14EtDpVtjKmWX2uZPdiy+LPjNILpvELTVAQgpBKufmW5t6u4wUn/NY/8lf2z5
	cNGWKwMysco0f2wkfBJtbj6J+P4Is5Gr1NoW6C6c0zR8qXTtZUE1RENq2dwDS/pB6VZi
	ygA3AO4SPAnLjGNPozJnxL8mdnDUaRPI1dQ875ZptaiQomBXyYJBGCRcNRhPsQqEUQoL
	xGQTHdifPAp7Yw0tDWQsL32IldeX4KwNGE/Fn7F6dlFMQsYuYeqSH8GqZLTkY/8nwJwV
	jpBT1eq9buZk7mELe/v/B5rMCFROYfEM2gRzLBstD60dPImbJXbJhedIcVw51WvxRAdi
	U8Ng==
X-Gm-Message-State: AJcUukdtzaFDPtXCzpsb1xsSode2LMEGs5O24gUKtlBIW1161O3WsznI
	bA9OpNOfFSMtjpQ1QQMJ7YYh9Q==
X-Google-Smtp-Source: AFSGD/UjQsNh8tRBWMaFwNE1z0neNmoGxgb96ot+tBQ//yXPiV7wK+CoyvlW6tGoK9LyiUGnuKjU/Q==
X-Received: by 2002:a1c:4301:: with SMTP id q1mr38630295wma.44.1546554797560; 
	Thu, 03 Jan 2019 14:33:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d4sm53390840wrp.89.2019.01.03.14.33.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 Jan 2019 14:33:16 -0800 (PST)
Message-ID: <73fe35aa5d0da46e8d88d4ca5e4371654adcbb0f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 03 Jan 2019 22:33:16 +0000
In-Reply-To: <326e95f58fdba6db0602999725580a837eed549a.1546502650.git.liezhi.yang@windriver.com>
References: <cover.1546502650.git.liezhi.yang@windriver.com>
	<326e95f58fdba6db0602999725580a837eed549a.1546502650.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] oeqa: Fix for QEMU_USE_KVM
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
X-List-Received-Date: Thu, 03 Jan 2019 22:33:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-03 at 16:04 +0800, Robert Yang wrote:
> Fixed:
> MACHINE = "qemux86"
> QEMU_USE_KVM = "qemux86"
> IMAGE_CLASSES += "testimage"
> 
> $ oe-selftest -r runqemu.RunqemuTests.test_boot_rootfs
> 
> [snip]
>   File "/buildarea1/lyang1/poky/meta/lib/oe/types.py", line 122, in
> boolean
>     raise ValueError("Invalid boolean value '%s'" % value)
> ValueError: Invalid boolean value 'qemux86'
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/testimage.bbclass |  8 +-------
>  meta/lib/oe/types.py           | 18 ++++++++++++++++++
>  meta/lib/oeqa/targetcontrol.py |  8 +-------
>  3 files changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/meta/classes/testimage.bbclass
> b/meta/classes/testimage.bbclass
> index e8fa4a3..82aef9f 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -230,13 +230,7 @@ def testimage_main(d):
>      boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT"))
>  
>      # Get use_kvm
> -    qemu_use_kvm = d.getVar("QEMU_USE_KVM")
> -    if qemu_use_kvm and \
> -       (d.getVar('MACHINE') in qemu_use_kvm.split() or \
> -        oe.types.boolean(qemu_use_kvm) and 'x86' in machine):
> -        kvm = True
> -    else:
> -        kvm = False
> +    kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'),
> d.getVar('MACHINE'))
>  
>      slirp = False
>      if d.getVar("QEMU_USE_SLIRP"):
> diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
> index f401713..a153f2c 100644
> --- a/meta/lib/oe/types.py
> +++ b/meta/lib/oe/types.py
> @@ -156,3 +156,21 @@ def path(value, relativeto='', normalize='true',
> mustexist='false'):
>                  raise ValueError("{0}: {1}".format(value,
> os.strerror(errno.ENOENT)))
>  
>      return value
> +
> +def qemu_use_kvm(kvm, machine):
> +    """
> +    kvm can be:
> +    - bool: 0, yes, ...
> +    - MACHINEs: qemux86 qemux86-64 ...
> +    """
> +    use_kvm = False
> +    if kvm:
> +        kvm_boolean = False
> +        try:
> +            kvm_boolean = boolean(kvm)
> +        except ValueError:
> +            pass
> +        if (kvm_boolean and "x86" in machine) or (machine in
> kvm.split()):
> +            use_kvm = True
> +    return use_kvm
> +
> diff --git a/meta/lib/oeqa/targetcontrol.py
> b/meta/lib/oeqa/targetcontrol.py
> index 59a9c35..980d6a2 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -107,13 +107,7 @@ class QemuTarget(BaseTarget):
>          dump_target_cmds = d.getVar("testimage_dump_target")
>          dump_host_cmds = d.getVar("testimage_dump_host")
>          dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
> -        qemu_use_kvm = d.getVar("QEMU_USE_KVM")
> -        if qemu_use_kvm and \
> -           (oe.types.boolean(qemu_use_kvm) and "x86" in
> d.getVar("MACHINE") or \
> -            d.getVar("MACHINE") in qemu_use_kvm.split()):
> -            use_kvm = True
> -        else:
> -            use_kvm = False
> +        use_kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'),
> d.getVar('MACHINE'))
>  
>          # Log QemuRunner log output to a file
>          import oe.path


There have been a few patches related to this floating around. I'd like
to fix this once and for all but we don't have a patch which quite gets
this to where it needs to be.

I'd suggest we:

a) drop the approach of having MACHINE in the variable and simply have
it either set to enabled or disabled

b) only enable KVM if the target arch matches the host arch


For b) I'd like to cover the case where qemuarm64 is being run on an
aarch64 server.

This way we'd automatically enable KVM where the arch matches rather
than needing to code it for each MACHINE.

Does that make sense?

Cheers,

Richard




