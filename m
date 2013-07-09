Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB0A6A5AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 14:48:03 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ha12so4339141vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 07:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=WoxKoYxgfoTzlZX93lLIkzkkWwh41NNiZGdjNKc3h98=;
	b=FvR/ZNvOltY65jfGbnuhIE0rYqXeS8GWShqOHNL3frJo6bxLsanBvUZ5EncQMkgbbN
	5CidpA4GlSddPfjiM+J5jSq9GAaf6PCgqG4hwiIFD7oXNidi4BJ5lRBmGmRarvkoVpOg
	VVFlP8tDMk0kTPoZ9LLsmkBRO9qjjE2xvnJUV3FaF7/2K/2jpyCXPdN8SsOdoxMkxSIx
	9Attd5LUWZLfwrtTRxX/ySi429VuUNcfahkL8291zGh5cUeXMgsWqWA18QXN/2DVfOwn
	AiE3v7cuVMiUHXkzQ79OSO3YLSlYxhaUyc+auy+PqjBDld5RxsR+uMaJog3R2XIekmMb
	sJqg==
X-Received: by 10.58.24.41 with SMTP id r9mr16370469vef.44.1373381283930; Tue,
	09 Jul 2013 07:48:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 9 Jul 2013 07:47:43 -0700 (PDT)
In-Reply-To: <1372980674-42981-1-git-send-email-kirgene@gmail.com>
References: <1372980674-42981-1-git-send-email-kirgene@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2013 15:47:43 +0100
Message-ID: <CAJTo0LYa07yvkw=5tCvN9kapckOF-XPecWeVQny1qacLncp_=g@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Gm-Message-State: ALoCoQmqsgvUIA0Y+VQmEIAvsLYxELxjvKtRlI00Jvdk/MFkv3Ygz78n4tY49j8G4mQGJXtiJBOy
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v8] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 09 Jul 2013 14:48:04 -0000
Content-Type: text/plain; charset=UTF-8

On 5 July 2013 00:31, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu \
> +        ${@base_contains('DISTRO_FEATURES', 'python', 'pythonnative python-dir', '', d)}

You've just invented a new DISTRO_FEATURE, right?  I don't think we
should invent these without due thought.  There's a good discussion to
be had around a distro feature to enable all Pythonic integration
where possible, but it hasn't been had yet.

I see two options here:

1) systemd doesn't enable Python, and we add another recipe
systemd-python that only builds and ships the Python bindings.

2) Decide as a project that we need a new DISTRO_FEATURE "python" that
means "has full support for Python", meaning that every package that
had Python integration should enable it.

I'm currently leaning towards (1) as it's less intrusive on the OE
environment as a whole.

Ross

