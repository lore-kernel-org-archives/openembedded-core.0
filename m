Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 573CD7D290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:44:09 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id a21so11516979ljh.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 20:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3DgavHHQm6zQ2BwbH+Ut7/EbQNPz4pSS0hLKCOdjmso=;
	b=ZKw589AcMKGJROD9wHB2PBgXPY+Hf/zKlzfDDkGfKFZ6avStheVjPnJhhDxWRDK9PS
	5+WhEx/aBeAeuK5If8t+I2UiL/bMava8IY8avd/eegVP9k+HoZflManjVNvXsHY6m175
	aVcWzPPzm/Xhc2mQ5xx/ZhwdtrSnDgC8Wj0QrlPeLFMx+QfDGSl2gNeEaE61Nmtqq77A
	+f4yCKxeT3cGMjQYwXx0O4ZXLruLlUEUfB1UsPKN+AhvfqW0V/0JXOj5i8+XeVU75MdJ
	nqbfjx1G5/yXTOo5mpDfNxAV/m6AHSW2Y/H9xrST4a25Bn5Bamav6yk7/uREYoUcuOQb
	VwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3DgavHHQm6zQ2BwbH+Ut7/EbQNPz4pSS0hLKCOdjmso=;
	b=jeo3vRlKHzR84/SZNAcGTgyDZDulfey2QnQX4uG2ynNjj4Axt/iJOv900ejwRzukdn
	KWRoaa2p84uXXJ3JYzEW7M+3rA8KQ/FVgEvMnrSIiYEBnyukEcyoVzXxaMk7nTMorYwF
	7FMbI2YhIwXRf5WT/9Mj5FnoW3eKTi675c1Rpcwj5a2yOzl0GXhUCTAbxL282c+kyxD4
	RKOWIeME4UI1iAS7cUG4qCSCyT16hkUk1eryBJOqqT/kSnneyk24aXlC1JZkCWZspNCc
	lT5NQ7R8ijUv7IyOWIL0e6fxTcpbLolshOXiAkVbAUK5/TYmBIE378zgglS2oB/wcuDc
	3gxg==
X-Gm-Message-State: APjAAAXFzSFi3zbSt+RAc15piWtdK/+xUOIA1CH5JKuFqlSI7IgqsOkA
	PufeK72MO0h8z6yNn99chLiUjXlZnMyjy1ayfFunKPuL
X-Google-Smtp-Source: APXvYqzfltCo6mx99Gw6KCfaqEfXFzFU5XudIcBw65i7GZuu245ANcB6v2VhqOAPTPRj65tPVey92Qn14hZlUj1lebo=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr11913632ljj.78.1560829449594; 
	Mon, 17 Jun 2019 20:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190617220122.13994-1-alistair.francis@wdc.com>
	<20190617220122.13994-3-alistair.francis@wdc.com>
In-Reply-To: <20190617220122.13994-3-alistair.francis@wdc.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Jun 2019 23:43:58 -0400
Message-ID: <CADkTA4OoLhubvA8ZCWVYeLVtiABtk+PC4Zm0h0HEFLzMzEimng@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] linux-yocto: Mark qemuriscv64 as compatible
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
X-List-Received-Date: Tue, 18 Jun 2019 03:44:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 17, 2019 at 6:04 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index 8aec315084..a79d0b962d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -41,7 +41,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>  KERNEL_DEVICETREE_qemuarmv5 = "versatile-pb.dtb"
>
> -COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"

What KBRANCH / SRCREV would this be building ? Unless it is something
that I'm building and booting, we shouldn't put it in the core recipe
as compatible until the SRCREV and KBRANCH are defined.

Bruce


>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

