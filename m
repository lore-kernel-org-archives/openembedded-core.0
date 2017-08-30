Return-Path: <twoerner@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 96CC971C27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 15:13:08 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id h127so4242428ywf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 08:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Si9W/y50krw1GlYtTK57mGp68MaNDz0dA5MBwFVL3Rc=;
	b=YpRL1eG/TqEG9iy6JjqLdojRAWfkFwpA0VPaYGwk2Xrg/s+FzKx3HMwJ0A+i5V9p8y
	iwM9hf+7nZeiztUznXZNEFd4K+qcrBRg69epbhewMFrYcttSEpq1VRTcD14tfuSTin2k
	vdfr8YIXRPJ80nErDcxpAPuN+oD14h/RzV34VoDGkNFTCbbUxZNg3WpXIKbJsklqlk9G
	4f1fMOEpqT2eGJlDPbnBaIxom9bL++lQFRJIpg8m76JWs5elqfL1xRGsBkaCb2OKH+CE
	+ffKsfexaQ77ddmgVqA1n1DYfu1Kq/rRLG+aSMTUG/AuOxrmlxrDWR2a8PUw6+NM92NI
	SdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Si9W/y50krw1GlYtTK57mGp68MaNDz0dA5MBwFVL3Rc=;
	b=SSwYI/XRz3dubMdUuDQ63rVgUH/ZepK/a9PXvWugb21yt5sjjW2a8/lI8T7NSpx0nJ
	KixqUKz7dZmN4zAdTQLq5Tw53IhcbOWSdnzqP6T8JQwWpPKq1+eNPEc2IuSiAW3DOjfG
	N6asZa2q+W14Z/Klyp5ojwiDQLatBe9X7Iinsoqx2+NmvfG8dTpKdvmskaC40lukZbud
	alY4Ciw97ccuBLs6RNYpQOyV+pvxCECqpy13mnwi4jiXZcdZmA9DFjn0iY+Hx8abv/Jx
	Hwv2QcRklBQITE6m13wlZDwEM1zncMwoPpM1OrHtWPv4E0ea5wiJdpA2XpYs/AEnGAiS
	CUsQ==
X-Gm-Message-State: AHYfb5is4ov2ngguvcDtalY6VP8mVWBmr9hNumUJ80ZngdrjqxSsPIKv
	1tFR1j5Jc+aLBn5j3r3TcFpDIghUbQ==
X-Received: by 10.13.221.214 with SMTP id g205mr1669390ywe.440.1504105989301; 
	Wed, 30 Aug 2017 08:13:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.4.11 with HTTP; Wed, 30 Aug 2017 08:13:08 -0700 (PDT)
In-Reply-To: <CAJTo0LYAddb5=Lm8tfX8E4SHTeHRsUfv=HV1Civ7ak9G8M4sAg@mail.gmail.com>
References: <1503991517-3965-1-git-send-email-yi.zhao@windriver.com>
	<CAJTo0LYAddb5=Lm8tfX8E4SHTeHRsUfv=HV1Civ7ak9G8M4sAg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 30 Aug 2017 11:13:08 -0400
Message-ID: <CAHUNapQKyAK7F3TSf4Mi4xkGdjt99QL=j_+3nhYUUiuuA7UXRw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libmnl: add recpie
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
X-List-Received-Date: Wed, 30 Aug 2017 15:13:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 30, 2017 at 6:53 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Note that we've reached feature freeze for 2.4 so this will have to wait for
> 2.5.

A lot of my builds failed last night because I'm not including
meta-networking (which pulls in meta-python) because they weren't
needed previously for what I was building. But with libmnl now being
needed by iproute2, maybe this is a stronger argument for needing it
in oecore for this release? oecore should stand on its own, unless
there's a way to make this dependency a non-default packageconfig?

It's not a big deal, I can just add meta-networking and meta-python
and "solve" the problem.

>> Move it from meta-networking to oe-core as it is a dependency for
>> iproute2 to support tipc.

