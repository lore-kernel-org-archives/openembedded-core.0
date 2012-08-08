Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz5bR-0003HP-3w
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:43:09 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 05:31:21 -0700
Received: by ggnf1 with SMTP id f1so619871ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 05:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=pjSn4FdMv4NXngYNefKqjkXuTehfDb6rEh0r2WPG8ww=;
	b=XD1VLTrA5XvsBzQy9vYm9bc2xkTMitzE0ickQYVG33WcXjz5NHMnQwS590wWF3XeZY
	mNh5F2m6bbU5hk3ioRs7F6stJ5GfBPA1qva02ItodThrTDHEP7v/WYcCnHgJYl5b24dL
	k4rdVCpSbnIwoUoaG8nz8xQsojgt7u9WejqHvNWZ8TJdW/g2xUgBfnn9IpmAgXlvLnaQ
	xzN0CtMo7x7BVJ20yJlYUkCzFrfWHKn4KL0S/506MMbAa6FtTYyFoCIZG0xcVYn40ky4
	aCrolFKbOV8lFuEk6tGra1j/AS8FD+PWvhTiCz9IvppzssaGHxSpsoRRrvJXt8M0tu5x
	iawA==
Received: by 10.60.0.161 with SMTP id 1mr29257373oef.63.1344429080270; Wed, 08
	Aug 2012 05:31:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 05:31:00 -0700 (PDT)
In-Reply-To: <1344428808.23275.244.camel@phil-desktop>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1344422390.23275.233.camel@phil-desktop>
	<CAJTo0Laqeyr4AeKdZ5Fw5BQiDGdZPJNcm8VZZvWR9ZqjbjnaUw@mail.gmail.com>
	<1344428808.23275.244.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 13:31:00 +0100
Message-ID: <CAJTo0LYiUJq66Jzi+8AMS=68pG1P-UB0BRQu8pkPsG8qfeTkEA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnzQvePYCLnbBXYWzYfYYz+HraGhbFlVOo6FTD6PeA5F/9M2bddlMLHWDlhs5YQuB1oYP0g
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 12:43:09 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2012 13:26, Phil Blundell <philb@gnu.org> wrote:
> Yes, I agree, and that's one reason that I think having WebKit in
> oe-core proper (rather than relegated to part of the testsuite) would
> make sense.
>
> If WebKit did go into oe-core then I agree that using some sort of
> WebKit-based browser (which might well be Midori) as part of the test
> harness would be an entirely reasonable thing to do.

WebKit (well, webkit-gtk 1.8.1) is already in oe-core as it's needed
by Web, but it's not built by default in the core-image-sato as Web is
opt-in.

Ross


