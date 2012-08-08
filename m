Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz6Kk-0004Ms-DT
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:29:58 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 06:18:09 -0700
Received: by obbuo19 with SMTP id uo19so975430obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 06:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=m8V92NL/6/T2cUKqmC+KcRM6uNUf+qzKI/xJvMVmAm8=;
	b=Z6TssBiKOc9vN4GKFKrvsploCNnkrnyuRXA8i1XXNkWdkgE/62nQH4v6Kzzx1GyZa9
	VC05BCDrJO9c1nw+0SB5EFukfLeMh+k2CEXJlFiuPF4PdhH+z3FdvtZ8pCgfrZrw+PLQ
	8wgUPs4wYPt0bk2/yJEn1liVRyWlDRuaL+hj8EIw+KiopoqFIhD2zky+1rzRq+iVVE1i
	B8j/88Oz6Gf/6FGezTY+gpWVAyhi6R3wUUmY24C9YUwLQ81b2F/g9x5j8Mfnadx1JHHF
	ZWD47cjyycYJLgexQufq/3daBAMkKRQ43yD8sFhbKrePdBIhQZCWG662V5e4WpHirIA4
	sbWA==
Received: by 10.182.78.228 with SMTP id e4mr262250obx.77.1344431888660; Wed,
	08 Aug 2012 06:18:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 06:17:48 -0700 (PDT)
In-Reply-To: <1344374781-21240-1-git-send-email-raj.khem@gmail.com>
References: <1344374781-21240-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 14:17:48 +0100
Message-ID: <CAJTo0LY9f-nAD7+eO=jDJqD0qYRa8FPUhB-VkWDum0Urq3q=7A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl46cDTaEdkvKkEOvyXLhipHmibnfbGgXVMHjvrAKrTAux5rlUGXq8jtzI8cEdL2q5De44t
Subject: Re: [PATCH] binutils: Enable threaded linking with gold
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
X-List-Received-Date: Wed, 08 Aug 2012 13:29:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 7 August 2012 22:26, Khem Raj <raj.khem@gmail.com> wrote:
> This options will let gold spawn multiple
> threads for linking and speeding up linking
> on multicore build hosts.

I turned on the DISTRO_FEATURE ld-is-gold and rebuild my toolchain and
then webkit-gtk, but there was no improvement in build time (I'm
attributing a 20s difference in build time to noise considering the
build was 24 minutes).  Is there something else I need to change, as I
was expecting WebKit would be a good winner with this.

Ross


