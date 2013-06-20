Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id F12596AD48
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 10:39:56 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id ib11so4652417vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 03:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7qUAcPgkt36a/JJcyGQXYhqL2K7gChI/2i1sjKIPmpY=;
	b=cEcWAofaAX/kMmbYv7pF239EMEAueJOWDVxn64iX5Qubv77nuxi3RqmF/oQiWgn6Tl
	YJc9SBQfUT1I1PQFYX8Oj6RfqEURwwZyxg10MShuWBDn2wSQxnFK6gAL9aWSrKzqyzRo
	gF+dPkmGssdJBsWtWNRqOsYG9Y2CLKx/A7SiwhowujqG0GePin55/fMZCwDGJnuP2w1P
	TQtsXqbWxHlIsG3K3VnpvTwjv9SPYM+whlfN8aDlWsQcuLgfpJULqtXOZG1pMowklGw3
	ea6JHBJyNRwssh85gqh+buR2U+95g/887npqU/nK43Xok345gQ1tKO8Vlf09BQmVOnr6
	wQtw==
X-Received: by 10.220.248.137 with SMTP id mg9mr2374958vcb.38.1371724797821;
	Thu, 20 Jun 2013 03:39:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 20 Jun 2013 03:39:37 -0700 (PDT)
In-Reply-To: <d3c4311cd7b6a3082fee8fe0fffb8dfadc061deb.1371724384.git.jackie.huang@windriver.com>
References: <cover.1371724384.git.jackie.huang@windriver.com>
	<d3c4311cd7b6a3082fee8fe0fffb8dfadc061deb.1371724384.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 11:39:37 +0100
Message-ID: <CAJTo0LY5v4n-8NCJmGNWh11dLMi4uYv5TN4u_f7FnuQvxAS55Q@mail.gmail.com>
To: jackie.huang@windriver.com
X-Gm-Message-State: ALoCoQmr81Yr7VPpSb5ptgy0nr77T0CDhWn3+pF4/Ct8xCOKhReKda1VlwgKjykUTGL0NMVBZ0d7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] dbus: move libdbus-1.so* to base_libdir
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
X-List-Received-Date: Thu, 20 Jun 2013 10:39:57 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2013 11:36,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> move libdbus-1.so* to base_libdir to kill a warning:
>
>     WARNING: QA Issue: lib32-consolekit: /lib/security/
>     pam_ck_connector.so, installed in the base_prefix,
>     requires a shared library under exec_prefix (/usr):
>     libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0xdead3000)
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

More and more and more libraries move.  Do we *really* need to support
split-usr?  Have you audited all of the udev helpers yet?

Ross

