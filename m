Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFROb-0007f5-HG
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 16:45:47 +0100
Received: by mail-vc0-f169.google.com with SMTP id n10so2719400vcn.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 08:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Z10MZZ+k0oMsIO98frbzXJjGgUJVEJ2X1xVotUu1bMI=;
	b=aAw/HONtKBSCAcUS8Dry3/VpRLX7qVAXJyZH/v5/TZsHN8fFiZ1hHKc2YIR21Xp/r2
	kPz/vZpQr66J1yLgGaVJKQCL604P0l7x28feTWf3C4nNdbOqus8dsDNd0x6m5pGXTt4S
	+HOl21d/8NosE9oNGuZ0WqNs98IiDrqzFqF6ucYi2osyqGJsP3zFT/g0BJBG8f0omtXU
	8cXNnBOUe59rhAc56kKgxt4YYUgaKGDu3yRoTVAxa5McL2RnujWMEzJG1x2rauQ5HhRX
	Nlzfs7tS6VNZ6J5glvvOhRKyiUNvCFYlD7/jIIJTPualqoUOCwRobWMN57zUXagiS32b
	CPAw==
X-Received: by 10.59.11.199 with SMTP id ek7mr6861272ved.19.1363102145805;
	Tue, 12 Mar 2013 08:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Tue, 12 Mar 2013 08:28:45 -0700 (PDT)
In-Reply-To: <1363087472-32085-1-git-send-email-Martin.Jansa@gmail.com>
References: <1363087472-32085-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2013 08:28:45 -0700
Message-ID: <CAJTo0LZypsC9Ai9ZyBhEmS8gv4zSQd7ViJ4k_KppqwD2oBMeKw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmfPdvQF0fdOm2mMm4fX4U/Vg/xCId7QjkiezsIy4WhZzNROobM2m7slGV2MmcDMoDYzXu5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: add debug-without-src PACKAGE_DEBUG_SPLIT_STYLE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 15:45:58 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 04:24, Martin Jansa <martin.jansa@gmail.com> wrote:
> * same as original and default version, but does not package source files in PN-dbg

You can mark this as closing
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3621, which would be
good for my bug list.  Richard had concerns that he listed in the bug,
so having done tests and demonstrating that the loss of source doesn't
impact the usefulness of the debug files would be good.

Ross


