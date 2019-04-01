Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAD6606B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 10:17:49 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id v8so17035779itf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HhrxK723S4ObpEPs30MwrUTchH0fNrZFznMGkFDYKKs=;
	b=ejzOW7y9EB9fmln+oG/Tp2jaBASX0MHbgLKSKEeXnV54DyPPgted3v6X3GeSgzpLnO
	ngAsLXWmBhuew2snMx9HPDsZX82ScpmzK+Ki3kt24blbxlMkC0g1AXoRvc2VAERk3e2W
	GoQlY223BsCwZobJpn85Ll7nYfIZkJpJjbEv6YCWI27hhOSn3bXQy0o1SVmUEbdKwWru
	6DOANY/l606x784Sk2a3c5EypI5HnoBuNZrvJdfWLVWE9UgAtk/SsogiNRTpkWVxDgM1
	FqTucn2ep/Goj1vebt66+jX2fJrBRWgrIWcdt8Z3izs2igzO0NzN4eZ+mdhFtwTT9vku
	Jdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HhrxK723S4ObpEPs30MwrUTchH0fNrZFznMGkFDYKKs=;
	b=of4O7uGM7RCIdicNXdUZieH9btYPsxh/l5Y33rXqhd4GSCrFz5M54cL4RknOfJ9J3V
	pcTMrBu+3MZn/JV+kA/67+dMHlbTM4E0SlZfFyAtZ9oBXJI9wHQ8ISrpdV+REIhYS6Q2
	P7U/hbQjH21PwOgIysl4iUfi6CYYxamqFD7h8ivJXCrXm/9mwTmP6831JaP828qgkSPQ
	DNhdeo9LSXaZGA/s5+TL/iL4y2eUwLTKG/HsjHGF6ZyzrCI/+etKRbEBr/iIQXHLJOw+
	5YkAZ/sHI58f4ktX81eBlJvEiuH+Cj0IIyhtdNYHakC8WRhxcgLzsnVqiN9ma1TxRHgd
	j5yQ==
X-Gm-Message-State: APjAAAWfprDeCitDHHjNG+LkeWRRPGjb3gZG4dhOKhkmLJRmAsPRQy3E
	u87Uo5hph5wNIE5kVzYkh//w5SYh00xhA6WJ5A2tTQ==
X-Google-Smtp-Source: APXvYqyNYnGT0IyF7kqzS6EqxzhmhffUsgv/Ivn7PJNNHlVT07XWDfyYK3W4R3WeU3RJTpUfxest2ptEciAVUYVSIeI=
X-Received: by 2002:a24:52c5:: with SMTP id
	d188mr15282217itb.130.1554113870378; 
	Mon, 01 Apr 2019 03:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <1554111881-66088-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1554111881-66088-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Apr 2019 10:17:39 +0000
Message-ID: <CAJTo0LZ=1YBJQ69jTYVDnz+LFBX9eN3V6LfnK46fxTJUb=nH0g@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] llvm: fix link error for powerpc
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
X-List-Received-Date: Mon, 01 Apr 2019 10:17:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Apr 2019 at 10:45, <changqing.li@windriver.com> wrote:
> +CXXFLAGS_append_class-target = " -mlongcall"

If this is ppc-specific shouldn't it have a ppc override?

Ross

