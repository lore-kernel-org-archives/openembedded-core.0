Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 856EE60B05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 15:38:55 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id h18so5253921igc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=caIAhKogsaypTrJRm2werhvH56zN3GS/Pmb2gA+Aa/g=;
	b=EOKAXr1fVF9rd3T9s0S+eOqNe22tkJy+OiSxdH2U5UXUpBDYRyHSWxFJ+NyY65BSJL
	16zjwEjj+Yprg3RLCUtyFfiS0yHflVuCVd+PlrzUQzhFxqRkq5WaEvG1/otYOJ2sQGaL
	Ivd1mBm70JfOaTUJVnxtg+4aFnjypXdTmpV1j5Dulf+dPLELM75zykl8C/iNZtCRs/w0
	1/SEWYpv8Aa2YZKdj18/la8SX3FJ3d8hwCgMI9f/8YcfGxmoB1RE+KxYyIjYrHuwXlK0
	fXDbOVLn5d9suguH+GVskZz4u3Ok2XQ354wnlgUFAORa7aU1yCSpYTqFIYTHEpNYtPmN
	heOA==
X-Received: by 10.50.134.136 with SMTP id pk8mr67587352igb.20.1406821136772;
	Thu, 31 Jul 2014 08:38:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Thu, 31 Jul 2014 08:38:26 -0700 (PDT)
In-Reply-To: <53DA0C70.50403@windriver.com>
References: <86wqaw5000.fsf@shell.gmplib.org> <53DA0C70.50403@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Jul 2014 08:38:26 -0700
Message-ID: <CAMKF1spmDkT6SOBRZjs7SGxnR72fJwdM4iJMxuoVRDw=4hZ-9A@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: backport patches for gmp-4.x.x
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
X-List-Received-Date: Thu, 31 Jul 2014 15:39:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 31, 2014 at 2:29 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
> Use GMP 6.0.0 or later of you dual-licensing is important.

OK so you have a way forward now.

