Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id AB59877A90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 21:47:20 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id t189so49043898wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 14:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NSnOtUJnrT+rN6JA2R3WMUZI35GEAnMn2RsJG5rXFyM=;
	b=drFvdr8UoCEdQ5TviS3tqEENu7+D5pHvrwXZqwVezhraX7LlZ4W5N/MMy9YoakM1eg
	O20D2rRcWPBMH5uiRfq3j8nIckpgGHYoaVMAu/6CFvKU9AvuQ7+uTqxO1sEMRFCgJdLU
	6LLXSwnFuE53ryposvnO4Fl3uFIdbKCDDMvtx5RfgM7hycGdFfNNYttEfmAz803jcUgO
	oT5WzyJ72MTrKWwVQbN7Msuqbi0ewUCIINaTfBRkNuDnYO4aruHP7BN67Xe/acJrA01y
	HFIuInWtuChKQGR+VVlDX8jZiyAgfxySD+zFGo4eIf/9lgKsQkxFT/Bn0san7M4AAfbX
	s7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NSnOtUJnrT+rN6JA2R3WMUZI35GEAnMn2RsJG5rXFyM=;
	b=WBIIQqU93sLTWPUsSijduwUAPLakovPC6iRkXm9tyJxLUrVy+CWdy5YWCaU0zM1Dit
	9dJoiQ4haBHKGXC8COVwnpzrGQDbeevRheZwB+ZBTnyjwRPfsIG8fUkOpfN+anBiiLxa
	9udqlbZcnKlPlc6PcmzfADX+yzb3g+eUajgtC9Ec7A5aVphlEgMIZyYkDMjqi4bpo46K
	OYfzmO71gDd2GLM1YpFxH8DDbrSIagSQ0+zk0lAU0k9ntoqHJUVCES7sjGzAIlqY8Z3z
	35DZHOzKA/g83vv10XDEBe8z40y+12YGpmA4TjDuTx0YWVZS/P2ntc11YxSCMwmlJmLj
	J0Og==
X-Gm-Message-State: AFeK/H2+w3IpJ4QZ4ySuwqldqb0iVFGxyGD8Tk0q9txdClK+gCIcH8B/agKyK6qGGbG0fIjU1FVJtchrcEZAug==
X-Received: by 10.28.140.135 with SMTP id o129mr9772146wmd.101.1490219241359; 
	Wed, 22 Mar 2017 14:47:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 22 Mar 2017 14:46:50 -0700 (PDT)
In-Reply-To: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
References: <CAJ86T=WhxRaQ42=2bsFVZpeLhrZo2XwZBYoWp=f42tyebo2=2A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Mar 2017 14:46:50 -0700
Message-ID: <CAMKF1sq0b7U2wZo=65ox=KZ+JAq1oScfxpzCdiQRT3iC_Y5hNw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Using MACHINE_FEATURES in a native recipe
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
X-List-Received-Date: Wed, 22 Mar 2017 21:47:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 2:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Currently native.bbclass clears MACHINEOVERRIDES but leaves
> MACHINE_FEATURES alone. Is that an oversight? Or is there ever a
> legitimate reason for a native recipe to have a dependency on
> MACHINE_FEATURES?

MACHINE_FEATURES is specific to target only.

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

