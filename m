Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SL5Rl-0007nh-7z
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 06:27:49 +0200
Received: by qafl39 with SMTP id l39so246961qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2012 21:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=ZrzCwxkxh60foZj9Sb8qpG+/TiHtC1YON4eAbCbANME=;
	b=gdqG3Rm6//a1ViYNCFCoKZ0kpZ5cM1zt8nk6VWYaCWiCFoy1/kRxdorTS9crvBa+1p
	c5RapLbBOuAKXN0xSSc3pX9eJz9/EGz9hvFYX9H7KCUMeKvFMhiXiH5yIeuCh6yO1C2/
	S5pJVHAZ/BlKlMexClgXtt9UVyiTUwj/3EwBrpsc2Je3Ba7Qrl5fr25YYek+Ux8u9yHF
	QqNYdvQcDEPKoZGC8GidiEt7ovv9CVedcZQv+cU6xSDppe1M348LG8ki6t5S0r5UPn57
	5IKtbkgWnwPwLBmf16rryznJ7m0cN+eMT4CZMa5REAyNVGpQ0IHzgMwcCcBwixPw9Bwz
	KQJQ==
Received: by 10.224.179.76 with SMTP id bp12mr6013542qab.46.1334895499506;
	Thu, 19 Apr 2012 21:18:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Thu, 19 Apr 2012 21:17:58 -0700 (PDT)
In-Reply-To: <ad439be70f90f60d12d905c8c6546d373448ca6a.1334875218.git.sgw@linux.intel.com>
References: <cover.1334875218.git.sgw@linux.intel.com>
	<ad439be70f90f60d12d905c8c6546d373448ca6a.1334875218.git.sgw@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 19 Apr 2012 21:17:58 -0700
X-Google-Sender-Auth: IZZ8EkpnJy4T4FyT2u0YxwJos7Y
Message-ID: <CABcZAN=aojEpwUEWj0wB=6OD7wkwOwteGAGvN9TQGS+HCs+DtA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: dvhart@linux.intel.com
Subject: Re: [PATCH 06/10] quilt: move empty quiltrc to native
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
X-List-Received-Date: Fri, 20 Apr 2012 04:27:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 19, 2012 at 3:44 PM, Saul Wold <sgw@linux.intel.com> wrote:
> The package.bbclass uses the native sysroot /usr/bin/quiltrc as an empty quiltrc
> to ensure that the user quiltrc does not affect our patching scheme. This ensures
> the correct file is in the correct sysroot.

I assume this was meant to be patch.bbclass? Aside: ${bindir} really
isn't where that should go, as a point for future improvement :)
-- 
Christopher Larson


