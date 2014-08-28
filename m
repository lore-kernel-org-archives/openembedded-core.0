Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1863D71164
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:17:00 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id t60so670691wes.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=tAhqdmcBKmkE3PA0efqL702pIRFIQsGU3P0Ht2aY8VM=;
	b=aH0kbQt2h2H/CSVxwhj/EorDaOqwcRM/zXAsTrEA7jU2PXCbOpTLjCvgKak/6+3ahH
	eezunl1sOKuyE8U+8R6Z7hKR1qwuktCGVji3snhKoZm4Ow2e+OF1bg/JXmL//1Kb2J6i
	zWWAMFK1Hcoa9RUI7gioC1tnY/50xB4M2tigVZMEkKFKn1/xn3UeSQCZKBtcwLcgsDqF
	M2YciCxDLGRtiYkwpUIU2wiMiWbD1qtdCNNwuhzCFHvZm0nY32T6uOxk4KHjCzb1+JqJ
	ApnlpSKwK8qaTuIk+ILFkgJ1S3uQveVVroGnZa36vjOP32RtAcn3Qw3Pdj8x/q/MbqX3
	OuNg==
X-Received: by 10.180.20.105 with SMTP id m9mr174800wie.35.1409228220498;
	Thu, 28 Aug 2014 05:17:00 -0700 (PDT)
Received: from 176066136000.atmpu0053.highway.a1.net
	(176066136000.atmpu0053.highway.a1.net. [176.66.136.0])
	by mx.google.com with ESMTPSA id k5sm14167662wiv.21.2014.08.28.05.16.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 05:16:59 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <1409221634.29296.134.camel@ted>
References: <1409221634.29296.134.camel@ted>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 28 Aug 2014 14:16:50 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <a88f1215-74bc-42bf-a221-55565b4ce8cf@email.android.com>
Subject: Re: [RFC PATCH] uninative: Add uninative - a way of reusing native/cross over multiple distros
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
X-List-Received-Date: Thu, 28 Aug 2014 12:17:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On 28 August 2014 12:27:14 CEST, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>These patches illustrate a new idea, a way of allowing a single set of
>cross/native sstate to work over multiple distros, even old ones.
>
>The assumption is that our own C library is basically up to date. We
>build
>and share a small tarball (~2MB) of a prebuilt copy of this along with
>a
>patchelf binary (which sadly is C++ based so libstdc++ is in there).

Begs for patchelf built against uClibc++ for the build.

Otherwise I like the idea!
Thanks,


