Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 833DE72318
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:53:58 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hy4so2398794vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=u2U1Gnv+cFOrtx4jsGAWXIslTqatcGz2wJJx1CgDovw=;
	b=VsLOBdGAmnXI9B9K/DINdDwD70YlDAwQBgYTwTBN8TfR2jG0aVXJyir0jnhv74qzlv
	QnOTJfD8ZX897MkX9quC59wKEMihy3v4cHN1qrI8RSoJTjZplq6XkOz1e94tCHmPMKs6
	O0GDNVHjBsQ264ZdUx7hXRe4nz8J9j/mtCi8JiybXSgnxzYu8Ho8wWP2u1ywn4CONeAp
	epkywkPXncM/+GzBtqloN5LPbUjPtshcUkBEHZP1fJj9pJAdVP9SaBF/nIJ62b1yCtmQ
	6aehHfTqZsTbd26dVCUTVLZMQ98fr7YcSKamc+9CA4jUxeKHCTDOo6rE3sq5q24TK0au
	yXjQ==
X-Gm-Message-State: ALoCoQlPBFCDzJ+PVDO1prRn4tyM6QNEaQbsD7wNjrneQfNXN22fUFnrWsZDbU1CpOcIZBDSn3m1
MIME-Version: 1.0
X-Received: by 10.52.18.98 with SMTP id v2mr17198174vdd.86.1417110838696; Thu,
	27 Nov 2014 09:53:58 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Thu, 27 Nov 2014 09:53:58 -0800 (PST)
In-Reply-To: <CAOMwXhNCtMkkpSvCtd4c7r26FVEtxsr4-605acjRMgicTm-rAA@mail.gmail.com>
References: <1408716303-32264-1-git-send-email-root@pol-lx-007.polatis.com>
	<33115ABC4887814E8A92A08FBC93416B23C470D7@IRSMSX103.ger.corp.intel.com>
	<CAOMwXhNCtMkkpSvCtd4c7r26FVEtxsr4-605acjRMgicTm-rAA@mail.gmail.com>
Date: Thu, 27 Nov 2014 17:53:58 +0000
X-Google-Sender-Auth: jS_7VbJTrj4vqHs0TGPgDub12EQ
Message-ID: <CAOMwXhMvUBY-SWX=2DdhEbkUJ9V=BEgYPf0TmX06b+F-odOVQQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest-runner: return 1 instead of zero if any test fails
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
X-List-Received-Date: Thu, 27 Nov 2014 17:53:59 -0000
Content-Type: text/plain; charset=UTF-8

Ping. I have not received a reply for about three months now? What is
the problem?

On Fri, Aug 29, 2014 at 11:54 AM, Laszlo Papp <lpapp@kde.org> wrote:
> On Mon, Aug 25, 2014 at 7:42 AM, Stoicescu, CorneliuX
> <corneliux.stoicescu@intel.com> wrote:
>> Hello,
>>
>> From my experience with ptest, there will always be a few tests failing, so we will always get exit code 1.
>
> Ptest is not only about meta-core, you need to remember that. My use
> case is actually quite different: running ptest only on my binaries,
> and I will trust the rest of the system. For me, it is critical to see
> if there is any issues in my system. This patch resolves that use
> case, but even for Yocto, you really oughta aim for fixing your tests,
> either with "known failure" or correct means.
>
>> Should this better return exit code 0 if the individual tests performed correctly(weather they passed or failed) and 1 if there were any errors during the running of the tests?
>
> I do not understand this question. This is what the current change tries to do.

