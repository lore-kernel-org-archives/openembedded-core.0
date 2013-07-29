Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF8860958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:01:21 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb4so207053pbc.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=ardUN27/oa7AOVEAuabKaLNB0WkiwYctcX9g7oGPlZc=;
	b=BEEEO3fSETwOA2+q0/OEKz4Tfqo72/g+FdNcj9EHbvS/14whdof8U5f9HMGM2fPbox
	IBS/cp8aaEwUYtnwtZMPiPggocM2zfgQpuYeY7GU7cyd24/3TI1q6U3FnBiPE5iDzmtF
	mpIHO5nVHqO50BgUCL2DU0rwvaIaCKLmv9u9s/a/dknJkrihm/HOySfvtGGW/T6ii9mR
	x0ZHsK384cHq0HWofFK9PZIBEPUVvB/+bTnN0r0lWO/HDTZJ+6N9MZtm7OGsfIL2Lr90
	eXSqGtAIqpfCEwDfZpVOl+XuPpvzYYlLc5Vn1by2xwWjeFmjkmt+o3isEcZiz5PT//zg
	4H7w==
MIME-Version: 1.0
X-Received: by 10.66.192.132 with SMTP id hg4mr34070150pac.84.1375092082090;
	Mon, 29 Jul 2013 03:01:22 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Mon, 29 Jul 2013 03:01:22 -0700 (PDT)
In-Reply-To: <1375092018.6324.176.camel@phil-desktop.brightsign>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
Date: Mon, 29 Jul 2013 11:01:22 +0100
X-Google-Sender-Auth: pQ1RoXL5GJcHtx9F5TdM2OeUb3E
Message-ID: <CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmnK64tiPh40w0BPAYfgwTDyP2JpFQGMYIZ0asa3kwNGrvWKkdOPuKojUj7gkluIvItStym
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:01:21 -0000
Content-Type: multipart/alternative; boundary=047d7bdc93ca1635c604e2a393c4

--047d7bdc93ca1635c604e2a393c4
Content-Type: text/plain; charset=ISO-8859-1

No, that was intentional. That is why the change has been updated.

I can update the commit message if that is what you wish?


On Mon, Jul 29, 2013 at 11:00 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Mon, 2013-07-29 at 08:16 +0100, Laszlo Papp wrote:
> > This is necessary to get the build going, for instance with older Code
> Sourcery
> > compilers.
>
> You seem to have inadvertently sent a patch to busybox.inc as well as
> the defconfig change that's described in the commit message.
>
> p.
>
>
>

--047d7bdc93ca1635c604e2a393c4
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">No, that was intentional. That is why the change has been updated.<div><br></div><div>I can update the commit message if that is what you wish?</div></div><div class="gmail_extra"><br><br><div class="gmail_quote">
On Mon, Jul 29, 2013 at 11:00 AM, Phil Blundell <span dir="ltr">&lt;<a href="mailto:pb@pbcl.net" target="_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class="im">On Mon, 2013-07-29 at 08:16 +0100, Laszlo Papp wrote:<br>
&gt; This is necessary to get the build going, for instance with older Code Sourcery<br>
&gt; compilers.<br>
<br>
</div>You seem to have inadvertently sent a patch to busybox.inc as well as<br>
the defconfig change that&#39;s described in the commit message.<br>
<span class="HOEnZb"><font color="#888888"><br>
p.<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--047d7bdc93ca1635c604e2a393c4--
