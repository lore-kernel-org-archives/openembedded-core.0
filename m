Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TljEF-0000r0-VQ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 17:44:16 +0100
Received: from mail-yh0-f69.google.com ([209.85.213.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 08:29:29 -0800
Received: by mail-yh0-f69.google.com with SMTP id 3so5055625yhp.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 08:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=RSH2zh0MxNnyLIZnmdgx/sLmao5WuMiqHy+Xppto2fE=;
	b=d2sKqiQJ6/dDNBO+1x8aGDOgT93af8727nTK+nk1LsSx96sMCEdep1eJa0+3zkuGSU
	lIgHxCFleKomGjuSG0rnT3hSzf7xwLKiCvz52PjAWrSeU1iMZTLN90iC4o1Xd4X+HwW1
	lVO0IMGLYzxzPrr/aC9JiV8UB20intWzlITsuLlXeQdc/Cip2UkZKv+wM3KwfGwY0ncT
	b/AwOrUPniRgJ6GWnqVAm4zmGpiBRqHF8p7KXqLDqLdS+uxLcmAMEITXPK3KrejfVLo/
	/skHINvN5chvvmSswt4ZuyhRM/Zq1b7C2VJ7WOmk/ObzeBOM00iir6u1xKnAU1D8eqHQ
	E00g==
X-Received: by 10.58.127.195 with SMTP id ni3mr15790227veb.30.1356020968891;
	Thu, 20 Dec 2012 08:29:28 -0800 (PST)
Received: by 10.58.127.195 with SMTP id ni3mr15790222veb.30.1356020968827;
	Thu, 20 Dec 2012 08:29:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 08:29:08 -0800 (PST)
In-Reply-To: <50D33B07.7020203@intel.com>
References: <1355933032-25392-1-git-send-email-laurentiu.palcu@intel.com>
	<1356016878.24487.187.camel@phil-desktop>
	<CAJTo0Lb5Z67naXx-pFWd_ksEP5SYpd0qnDzv801UO9MpLB1PdQ@mail.gmail.com>
	<50D33B07.7020203@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 16:29:08 +0000
Message-ID: <CAJTo0La3aruvPrxHh1yAdq5WwcZyPWkcCFuCAB9mYSNio66_bQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkrwq8lIwP/aEAj8jitfzKsQshJzzJjcBsFaRiAjhLZBRWRmyaHwBJFRWuwqZe5cQ42QkTyoFMkb+Y04wWS8DuziITpyVBSufqpnQnmeV8gN4fm7zQ7/yTOfa+gy9g3RdecfJAdIIXPSJfpI3fRobQPr1+6mgoGi1puxTIWKYFnfk+aS0DztT//PRwYle5cXLp5HfWl
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: have postinstalls run at do_rootfs time
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
X-List-Received-Date: Thu, 20 Dec 2012 16:44:16 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 16:21, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> How do they handle the cross-compiling issue? They cannot run the native
> pango-querymodules on a cross-compiled shared object. It will fail.

Sure, they don't have that problem.  But for us, any package that
ships pango modules could use qemu to generate it's modules files.

It was mainly an interesting comparison of packaging strategy.

Ross


