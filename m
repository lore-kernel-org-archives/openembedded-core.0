Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id DEC4A77E05
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Apr 2017 22:53:44 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id h2so32725816uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Apr 2017 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2ZqpliE69DuUrt0cxibnP/OI1tqiAnzbj4JSy85LE5o=;
	b=MOxeYfswVKiuiqhOFQdGkVRLqmp1zdnVwKN34dfAK2p5dpWT+BDNb868khbMN1NPjY
	D3W1j2vJAviSsdcQm9RYppifJwEFzvhB45s4ljSc+HMxM5qxMtC2+ba9Y+arxQZAo9NA
	gtRssEd03jzwn4pwOs6pSrTy/vXCE1pTZx+ugU3T8uutSWXLIYOM8NxooawLa10A/Rrw
	VMLWVi9Oo859bw5poZxTC+uqryBGuPT0/1ohgiP/F9ye9lCcH1k0Aom44cyaUMNZ4J9K
	0kwhh57J3fL5mHMl3dewAPveH6dQUu9XJRJWHjpmazJchxzGabP9eNvDCerWX87ldCag
	4NQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2ZqpliE69DuUrt0cxibnP/OI1tqiAnzbj4JSy85LE5o=;
	b=KdK2iaRh335HbI6d5U3rUi4L/V+fViKQD1q/q6gR/Z1ZcBYzHITPGy/icaIyDAbFj7
	1krhWAQEfssrRftPQ9eT2doHdViHrONiiSzB6bUTRwP+oymog6wfQ9/vhFKhy5wW15lb
	dVc5QHna8KP2HCm6Q/K3bpCT67bPMhVqPeX8/F0ZHZTB5xaq5FHdviEy0b7XobuL8V0L
	w1zKrKPF6WdnToeGG9o40Mejwxla5T0S+zqTnoX7MX5Kd4EtOJQhwj3MpAPtbzeYDeUC
	jV6xrWY1v/jH1kqwElpJaa260mUd4+yq6jksVt96/TerFT6SBPKBj3M4R3xaa79MBeRZ
	JDSw==
X-Gm-Message-State: AN3rC/6RxndL107f4RK7BYjWPxb2+lKqEVcoMevlvCHw4eY+uhb1UmA4
	NazkkNmKH5Aptjn+/ZYxEBT4lJkqTA==
X-Received: by 10.176.9.196 with SMTP id e4mr1019831uah.34.1492296825688; Sat,
	15 Apr 2017 15:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Sat, 15 Apr 2017 15:53:45 -0700 (PDT)
In-Reply-To: <CAJTo0Lb1fMwBcn7=1yM8WB9qYQPBvkUgimVNtEvRt0M3FDs4Xg@mail.gmail.com>
References: <20170411013850.GA25337@linux-uys3>
	<CA+chaQcT7jApSyB4SqwPhsn+Pn_XTbryPT0FQZ_ST0OKDTH5xA@mail.gmail.com>
	<CAHUNapQdr_o_F7DbjNkmOYLXiMnntZJEKgw0+HVncMs6kC-Pmg@mail.gmail.com>
	<20170412063847.GA3855@jama>
	<CAJTo0Lb1fMwBcn7=1yM8WB9qYQPBvkUgimVNtEvRt0M3FDs4Xg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 15 Apr 2017 18:53:45 -0400
Message-ID: <CAHUNapT3bJEMaDM89qAoqO6KRgxUH+180=UAO_Tc3WZO1p8Cmw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Drew Moseley <drew_moseley@mentor.com>
Subject: Re: having llvm available for gallium
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
X-List-Received-Date: Sat, 15 Apr 2017 22:53:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 13, 2017 at 10:11 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Trevor, what layer were you getting llvm from?  Khem's fix looks good from a
> "stop host contamination" point of view, so we either need to fix
> meta-something or mesa very soon as oe-core is very close to the final RC
> builds.

meta-amd
http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/tree/common/recipes-core/llvm
MACHINE: steppeeagle

The mentor people fixed things up in meta-amd, so it looks like this
was a localized thing:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-amd/diff/common/recipes-graphics/mesa/mesa_git.bbappend

