Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f50.google.com (mail-qe0-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 654DF608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 12:11:16 +0000 (UTC)
Received: by mail-qe0-f50.google.com with SMTP id f6so3668646qej.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iVDDvfH+180MdzBjO/KhAchhHDG2ZY5bszHHpGXYvl4=;
	b=s0xyyyKxtXDcVPlX3cJmW7CRRWadm4gQqz9QT6MGcTheZVN+LrMcnOMiUtrZfi73/x
	Kr3i0PBTI2t9/NAOA8g2PoCIhcSOGoeIbAdYLXP4FAvuUvAWkZtY2a7zva1R6M910AKL
	h1IRy+CZ8kQtm79cNXI5WQf8C3p4ibL6CdftQCGmxHoWzb53YdAOIut44RRdV5n+WDTl
	5X0ET7UhtB+txQjdvyZTkNuT+KzrI8UjZ5wXWotIyNvs781NWXzrMSyGQT82UI99/FwD
	dzRjOnQMa9tApx+07skFzJ/ZHiq7bEOBK3lYxrTqsf1PV3bEB762Mld7zUEelFSAOZpu
	UojQ==
MIME-Version: 1.0
X-Received: by 10.229.204.131 with SMTP id fm3mr5956064qcb.15.1373458276311;
	Wed, 10 Jul 2013 05:11:16 -0700 (PDT)
Received: by 10.49.59.3 with HTTP; Wed, 10 Jul 2013 05:11:16 -0700 (PDT)
In-Reply-To: <CAJTo0LYa07yvkw=5tCvN9kapckOF-XPecWeVQny1qacLncp_=g@mail.gmail.com>
References: <1372980674-42981-1-git-send-email-kirgene@gmail.com>
	<CAJTo0LYa07yvkw=5tCvN9kapckOF-XPecWeVQny1qacLncp_=g@mail.gmail.com>
Date: Wed, 10 Jul 2013 15:11:16 +0300
Message-ID: <CADV-EXH5kaMOnHoBzds0srMs7rqhRdLZn2pY071EewY_GgWO_w@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 10 Jul 2013 12:11:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ok, agree with you to have 2 recipes.
But can you show me the way how to avoid building systemd twice (in
systemd and python-systemd) while including python bindings in
python-systemd.
Best regards,
Yevhen


2013/7/9 Burton, Ross <ross.burton@intel.com>:
> On 5 July 2013 00:31, Yevhen Kyriukha <kirgene@gmail.com> wrote:
>> +inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu \
>> +        ${@base_contains('DISTRO_FEATURES', 'python', 'pythonnative python-dir', '', d)}
>
> You've just invented a new DISTRO_FEATURE, right?  I don't think we
> should invent these without due thought.  There's a good discussion to
> be had around a distro feature to enable all Pythonic integration
> where possible, but it hasn't been had yet.
>
> I see two options here:
>
> 1) systemd doesn't enable Python, and we add another recipe
> systemd-python that only builds and ships the Python bindings.
>
> 2) Decide as a project that we need a new DISTRO_FEATURE "python" that
> means "has full support for Python", meaning that every package that
> had Python integration should enable it.
>
> I'm currently leaning towards (1) as it's less intrusive on the OE
> environment as a whole.
>
> Ross

