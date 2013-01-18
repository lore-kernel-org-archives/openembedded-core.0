Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tw9dJ-00009W-2z
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 11:57:24 +0100
Received: from mail-vc0-f198.google.com ([209.85.220.198])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Jan 2013 02:41:46 -0800
Received: by mail-vc0-f198.google.com with SMTP id m8so3277866vcd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 02:41:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=UtlgqUjq84uuPB/BB1VG1cDm33hIYa/gVWYSZcD72KQ=;
	b=elUiOuzuzzoRPHn33PmHnIzyKtWoy3yx/pnVwgl1w5QpFFuV0vj9NgBZSw6+iiAFN7
	oamJUBq62XQRyp9Omfam0tVj4pDp/7DI6oQ/WcFUQlEdF94mGzIUeC92p4C3T8eN2i6R
	FznAfLLI/8R0TB9E691rpcDZsFcWBzifNNQKtwS2NwHkqdVDuoH9AVh02tQBEPucbhmP
	4HVgvnEbRkDh7mCQ0VswmeEXVJh7dXZkjAM6pd7WO087A0xegBAv6ppBvc3g+fwP1gFU
	uw3KNzjahsDoA39w/fDxhRJENd+bcToAqr904ThXQSSAGM2Cmsgku5KJt728rSkSOVky
	qSjw==
X-Received: by 10.52.177.230 with SMTP id ct6mr7866643vdc.105.1358505704839;
	Fri, 18 Jan 2013 02:41:44 -0800 (PST)
X-Received: by 10.52.177.230 with SMTP id ct6mr7866629vdc.105.1358505704618;
	Fri, 18 Jan 2013 02:41:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Fri, 18 Jan 2013 02:41:24 -0800 (PST)
In-Reply-To: <50F92396.403@topic.nl>
References: <3116730.Gs6kyeAI7b@yiqingliang-pc> <50F92396.403@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jan 2013 10:41:24 +0000
Message-ID: <CAJTo0LYbNyBMhWNDH5pzmn2BO9mCt+0mODXohaC7ZO-PSyLVAQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQn1sJJ6XJnfdKSYXSabVK1c0hy4Oslzt1rurTPr/TnU5/FNe4gwBZ78bb+jHwk+QU4e8Gww77Lr1dcmWIGSCNwPcgzFEM3Hx/ofEfSA0QCn+OWBWDMkHMutocZbP+DRPckjOOVAtFMc2yerVNdGVSygffRcOIzJEKpenfYHTSlpYQfXDfmHr+8HScZSARBJwPruk9rF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OpenMP and OE-core (or: Why is OpenMP explicitly disabled?)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 10:57:31 -0000
Content-Type: text/plain; charset=UTF-8

On 18 January 2013 10:27, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> When trying to use OpenMP in an embedded ARM project, I found that oe-core
> explicitly tells GCC to NOT include the OpenMP support.
>
> Is there a particular reason why this was done?

Mainly because multi-core historically isn't where OE is used, but
that's obviously changing as "embedded" is including massively
parallel data centre uses.

It's totally reasonable for this to be some sort of tunable you can
configure in local.conf, be it a gcc configuration you can override or
a DISTRO_FEATURE.

Ross


