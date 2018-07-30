Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8827A71B2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 22:26:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j5-v6so14513613wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y9b/RCp+JqHEEOck89zk16PdTrHSYbiwTZmCiP1bZeY=;
	b=PokV/RSnU5yX1KLB+f1qiaYmbDh9bZPuS8++DpRxHR3aoZD4f89l+k1FSMrkTGHN6G
	/BZWOHSC3b3MXXSSvAqOUaGmMDwOXSIWfyJgNoUboKN5S8sGgyxrdCQMYDFjhbZQpd/R
	9605LLHZbFGooDzZT6/1i93ZR84560Jt3bD7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y9b/RCp+JqHEEOck89zk16PdTrHSYbiwTZmCiP1bZeY=;
	b=ThFKO5iwxIGJCVmnTODNfi5EPFBB/Y9rG0x6MY38wB9XzvmujeevHNMR9yF8QA0L3O
	MFU53QWBrGY139QM5Vrs8o6TC8033MdUQEAoFzrTObiohlZFmzjB4GOh+H3TtP+uu7yh
	ax+cHrPEV4/fqNCsF/Gp0lOkZ7WvcSpX37QeCwa70HEXoFMbujjX4lRbra/AOTU2zuOf
	Nv2kYeFVkF6vkvdJm70GS3gvLPDKHVcS8MstHdUFSRdXUS2otb4n1qG2cNOF1YaWe92k
	o/ATJjhrCXDVka4c7boQsn1dt9heQYXp1IPiVc4KpMO7ZbuFGTEjv02N7DMh2DeAqHLk
	+dyg==
X-Gm-Message-State: AOUpUlHRO9LMBjA3UQJaPzAPiU2IMhoooUDtgISEm6vmQkJ+nIA9O9rg
	UFwb33iHiceQAFbYJcS6Q/JzefGnBPs5cw==
X-Google-Smtp-Source: AAOMgpfqRQGyHt3tNkbrqUiyUayQ0L5lO4BhS8uEn+Btdj/J3oVRMwUx+QVJuTDgIw3y7uE4jzZN2w==
X-Received: by 2002:adf:d24a:: with SMTP id
	o10-v6mr16774318wri.229.1532989610312; 
	Mon, 30 Jul 2018 15:26:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k3-v6sm579919wme.44.2018.07.30.15.26.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jul 2018 15:26:49 -0700 (PDT)
Message-ID: <b0cb192801eb2e85702f319ad0a0cf33bbd2c239.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 30 Jul 2018 23:26:48 +0100
In-Reply-To: <1cc72609-d849-f8a3-6524-1f7d9ad214c3@windriver.com>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<1cc72609-d849-f8a3-6524-1f7d9ad214c3@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Mon, 30 Jul 2018 22:26:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-26 at 10:04 -0400, Bruce Ashfield wrote:
> > https://autobuilder.yocto.io/builders/nightly-multilib/builds/1139/
> > steps/BuildImages_4/logs/stdio
> > 
> > Error: Transaction check error:
> >    file /usr/bin/libtool from install of libtool-2.4.6-r0.0.i586
> > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
> >    file /usr/bin/libtoolize from install of libtool-2.4.6-r0.0.i586 
> > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
> > 
> 
> And that leaves this error.
> 
> I've not been able to reproduce it, and I've been looking at the
> elfutils RDEPENDS that is part of kernel devsrc, since that is what
> pulls in libtool as a DEPENDS.

I've just sent out two patches which together should fix this one, they
did locally at least...

Cheers,

Richard

