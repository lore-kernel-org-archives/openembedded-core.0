Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id A114660097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 19:08:42 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id a108so3965261qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 12:08:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WvIIz9KtWFalc6R7rb0GAPt+Idq6o/1tyvIgGYWXSls=;
	b=KwOgHKJGxIBNBH35DQyu6mRCk5FM8ZYqLpmgFdsvW1UI2Ru/mkCsbW4uU/ApzD5kKX
	PsIyd3Q9SHvabQAGX+upaMHVnAx6GvwvUq3DJ3XY/H8mjqkvcms9dV2pCykHAcZ0mtB5
	Fpg7d5nMU0y7ZMsZkOzEsf03G7AjMbEF2f3QKAXhmnUXRdVuR8xqchqmT4fTEuFUC+ts
	L+z7m8dO6mTB/yMobstxP1CKaccGMhE6Td8oRWnsgRUSQbkSHKRrplGRWp0xG9nrh79z
	mPEe8b4gZ6wCfqr0WB0dTlFTR0tUt/6GkfwBVKv9PLcnNemkh23A/Qpr6B78+I/enecC
	DR2A==
X-Gm-Message-State: ALoCoQnMFQ0F7jlvq2CYp3vrfhrHzB1oxZZwlx8QPl6A+6hHUsOko3jyribVCB+E0b3oNT9TQ8ZI
X-Received: by 10.140.30.53 with SMTP id c50mr36806768qgc.77.1413832121640;
	Mon, 20 Oct 2014 12:08:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 12:08:21 -0700 (PDT)
In-Reply-To: <1413829859-8489-1-git-send-email-jeffrey.honig@windriver.com>
References: <1413829859-8489-1-git-send-email-jeffrey.honig@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 20:08:21 +0100
Message-ID: <CAJTo0LYQpivPS30fDyXV0mB4AGyM7sY=p2a8D+rYsk51JcWUbQ@mail.gmail.com>
To: jeffrey.honig@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Refuse to run bitbake on a kernel that is too old.
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
X-List-Received-Date: Mon, 20 Oct 2014 19:08:48 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2014 19:30,  <jeffrey.honig@windriver.com> wrote:
> +    # Check that our kernel will work for crosssdk
> +    if os.uname()[0] == "Linux" and LooseVersion(os.uname()[2]) < LooseVersion(d.getVar('OLDEST_KERNEL')):
> +        status.addresult("The system requires a kernel of at least %s to run\n" % d.getVar('OLDEST_KERNEL'))
> +

The OLDEST_KERNEL documentation says:

                    Declares the oldest version of the Linux kernel that the
                    produced binaries must support.
                    This variable is passed into the build of the Embedded
                    GNU C Library (<filename>eglibc</filename>).

So surely checking this value at *runtime in bitbake* isn't correct.

Ross

