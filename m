Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8905D607BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:17:19 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so56707216qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E5ETEevrdcHx2vmwy1ytZIUEkRrvXebU1X5Mf/iYz1k=;
	b=QfivcYjZ7i4p1SfMj+iCrDplWCwpa0IYe8lfcMVPHPOxSCpoVPT7abM2v8NSKzK5AY
	thHH7Jjym+2tZ6kG9qVx43yRyJLAxvwsuuc3FDPfq+D7yPNLKv54zBYCdQ1h+vSfJGi6
	u4qhfcMTSqc4e5l/azJGfUs4R5U18AiY7FKEnjV2h3V3880GZgcbJp1g8KtZ08yU+RXX
	OhKSCUClbkpLD08fE1WrA8YU7E0hCydPcBfpTIPQl68N6yKpuqkALcQN8mPUZ8Y13fac
	gmuUfsWn0loH/rw6tM5cxEjdqFRCwyhSqRPvhgIzhxauW3CeezUq/ac+UN1rUQhH0RjV
	UXZA==
X-Gm-Message-State: ALoCoQmS3ucj11YcsgHZwzZCECt0e801ln2GdaLxybiXxTi6Fnsk+PU3IUkDYlmAzaZZQZZePoZi
X-Received: by 10.55.27.11 with SMTP id b11mr4872101qkb.105.1435331840909;
	Fri, 26 Jun 2015 08:17:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 08:17:01 -0700 (PDT)
In-Reply-To: <e70f95d9bb6247ec0f305966894b22f681135013.1435297800.git.mariano.lopez@linux.intel.com>
References: <cover.1435297800.git.mariano.lopez@linux.intel.com>
	<e70f95d9bb6247ec0f305966894b22f681135013.1435297800.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 16:17:01 +0100
Message-ID: <CAJTo0LZrsr7u7a-jRhoG6nKP51vXBGCiuRsm51YoySiK_YSxsg@mail.gmail.com>
To: mariano.lopez@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] report-error.bbclass: Added file syncronization.
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
X-List-Received-Date: Fri, 26 Jun 2015 15:17:23 -0000
Content-Type: multipart/alternative; boundary=001a1147f32e8357d205196d3cb3

--001a1147f32e8357d205196d3cb3
Content-Type: text/plain; charset=UTF-8

On 26 June 2015 at 06:56, <mariano.lopez@linux.intel.com> wrote:

> errorreport_handler would fail if several errors are
> triggered at the same time because of two proccess
> writting to the same file. This patch add the required
> syncronization to handle concurrent process.
>

The code in the autobuilder that sends error reports doesn't care for the
filenames, just that they're under error-reports/.  Instead of locking
around a single file - which surely will replace errors with lost reports -
just write each report to a unique filename.

Ross

--001a1147f32e8357d205196d3cb3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 June 2015 at 06:56,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mariano.=
lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":vy" class=
=3D"a3s" style=3D"overflow:hidden">errorreport_handler would fail if severa=
l errors are<br>
triggered at the same time because of two proccess<br>
writting to the same file. This patch add the required<br>
syncronization to handle concurrent process.</div></blockquote></div><br>Th=
e code in the autobuilder that sends error reports doesn&#39;t care for the=
 filenames, just that they&#39;re under error-reports/.=C2=A0 Instead of lo=
cking around a single file - which surely will replace errors with lost rep=
orts - just write each report to a unique filename.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f32e8357d205196d3cb3--
