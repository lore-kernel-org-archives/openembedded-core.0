Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UPZmo-0004fA-T9
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:45:39 +0200
Received: by mail-ve0-f171.google.com with SMTP id b10so6577499vea.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=fdnJTntC4KmiJ0Z/FCow6ilCHHZS3RO4iDElFJh6Xb8=;
	b=Lmnjg78wcCKbnoP/p67LvMOTInv4ZW8GCnCGYfBIrQxDYPnF375vLhSSCy2kDpIqGt
	r4yOf0/upI9w6wpp6n/E78ABQs986/Wuv8nIxOgolEFoGhOlAa276WzgQo1jnq3iSYjM
	fzaw8Ust+sWZZHLng59ZXeRT1imolNWZBMgxzzmqKOx428+wSGEjaHwgscxVMzTSZbtI
	wT1s7eOzF82iG2kqigMm+Mp6xw4WZ/uk8g5lPFXcFOewv2l513Sg62VEjJcYzzl10GMX
	JhM++eSoqNJ2tyzAwFf/Uf2n+Wq53TcEP9QwdT7LvF5GqZnfmT0+XHgsYuceehe0Ve1o
	h7NQ==
X-Received: by 10.58.188.48 with SMTP id fx16mr19402627vec.22.1365517638265;
	Tue, 09 Apr 2013 07:27:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 9 Apr 2013 07:26:58 -0700 (PDT)
In-Reply-To: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Apr 2013 15:26:58 +0100
Message-ID: <CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
To: Marco Cavallini <koansoftware@gmail.com>
X-Gm-Message-State: ALoCoQm2bANJaftZ1nr9bZ5BEXT1/pgFaJcidNIYiwZ39LZDX+vNThPgD5VLvIKxYuGX3Lsm4xhV
Cc: Marco Cavallini <m.cavallini@koansoftware.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
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
X-List-Received-Date: Tue, 09 Apr 2013 14:45:40 -0000
Content-Type: text/plain; charset=UTF-8

On 9 April 2013 15:21, Marco Cavallini <koansoftware@gmail.com> wrote:
>  * Recipe taken from oe-classic
>  * Required by xinput-calibrator

oe-core already ships not one but two terminal emulators, let's not
add another one.  Can we make this configurable in the recipe somehow
and default to use matchbox-terminal (which is in the Sato images)?

Long-term, alternatives along the lines of Debian's
x-terminal-emulator is probably something we want.  Then again I'm
still not entirely sure why this is even spawning a terminal in the
first place.

Ross


