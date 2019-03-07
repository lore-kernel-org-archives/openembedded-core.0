Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD4587CD7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 14:45:55 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id s26so1032459qkm.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 06:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ljSK6ytDaaFa3dDZ8gwr6GRzZ/u9btGd0mhV5Adk5IQ=;
	b=L2EeUUOj7bbyS0Nz61MKmtjDHkH9mBdBq3eNigYO77zmW59jOZ3R6GhkuITlxbzupw
	28ubZ+DYxvZKjvjPj1c15Bf9/U/OdYF+9tEc6wHjcya+jwCy1fuk6JR89BEERz+aw3o/
	kuB8O3w9ahqn1ymOYksq0JIzpO+BUiEa3OsIlqjWAJCyFZEHWrbVy+OlVXfPPAHd4+VW
	Oz5NR2P5NdCpeFhoooW9TGllqL15V2vfEHKV/oa76ueSKNLryUYjdQEHW5VuN4ONEKzA
	OKYpt33dj/Ml+ODeJvDqSplHpaicOPvqtfPe3jGfeqANc1OzUs7VsEVkY1LIEpNX2UL7
	+01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ljSK6ytDaaFa3dDZ8gwr6GRzZ/u9btGd0mhV5Adk5IQ=;
	b=b3558SxzKg5Y0Z0AAYhPaCTSLKpjDiOdKfGimwJRdZa6/IccblVQGnK5AxMY3ai182
	YVvL3UUjAi67Jtw20MxL6Ixff2tzAI/+z1xBzGp6RYioFS934mIpi9ph+98cK6WqskJ5
	u2IczmThYKnCndSZlxjQ/TtwcJt+tcCADU2IxkzbTZukV49eAmTL2mJVwGnwWmcpl0t5
	3li9LOG8V+XmQHctd6E9/ejYbYIG5YRcJqlRM5NESVhQf6SilTez6cn0e0KWPiR+d8wI
	opAGVVCfxqFLN3ykQVy3sUnONiiwaBKZwpRG50ahc/zfxONF2SU4JIzPTKRoS5UTqArj
	MTRA==
X-Gm-Message-State: APjAAAVjquDrD5wXG9Kzjb5FZ11WwNKQKSkWTM4S5Ni0mkUNQadpnF/q
	BtYh42VrVcUQ1e0lvk/GrnOoq2cT5j5wcUJOcjY=
X-Google-Smtp-Source: APXvYqx9IheJ0eblbEWqI/NixMCMJE9IGLRQldsfvncD/Olbzy8gbuX4JmlbT9CL3D49/dqEkX6+O4cTD9aVyAY+lag=
X-Received: by 2002:a37:4c88:: with SMTP id
	z130mr10011823qka.206.1551969956366; 
	Thu, 07 Mar 2019 06:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20190307065138.54589-1-zhixiong.chi@windriver.com>
	<CAJTo0LbsGET5t6AyfgfQ2L=jR01g+uM8Ec0FA5L5nxpchGd49g@mail.gmail.com>
	<eadbbfcd-6dd6-929e-1fbc-8aee74b5961b@windriver.com>
	<8d5794a8bfe5ac118a77efbdb4b8f712d53116c6.camel@linuxfoundation.org>
	<CAJTo0LZCbH6XyQrWevL0g0f1OsCV3MmvcPme6Qf8VR17uUYVNA@mail.gmail.com>
In-Reply-To: <CAJTo0LZCbH6XyQrWevL0g0f1OsCV3MmvcPme6Qf8VR17uUYVNA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2019 06:45:30 -0800
Message-ID: <CAMKF1sqoUULB=P9e6XLnGfxHBYM_ma+9Yfyv-yKqqSKHgZ0-sA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core-image-minimal-initramfs: add libgcc into the initramfs image
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
X-List-Received-Date: Thu, 07 Mar 2019 14:45:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 7, 2019 at 4:39 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 7 Mar 2019 at 12:34, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The customer needs to depend on libgcc in their app, or their
> > initramfs, we're not adding random dependencies to the initramfs "just
> > in case".
>
> Part of the goal of my ELF parser rewrite was to make it easy to add
> libgcc dependencies on binaries that use pthread_cancel automatically.
>

your suggestion about letting needing package rdep on it right, but
adding a hardcoded dependency on libgcc is not. We have to consider
a case where where there are alternatives to libgcc which can provide
same functionality and is preferred.

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

