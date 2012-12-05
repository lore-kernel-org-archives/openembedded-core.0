Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TgGtp-00072y-9k
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 16:28:37 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 05 Dec 2012 07:13:25 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so23119585obq.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 07:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=gR3MUlgwhx5ewMG/ezql/BTtct84n2Ec8xMlm7Jog+0=;
	b=nT6oV5mnEFvlRq9K5Lvp34/K+//Q4NkjEWrJRjxyVyma2LcMeh4Or6hqfFZ0KiQkcH
	TE1eHMOkBV99O4QnzjXEcoUX7qj9s5b3ApRwwn9fSGL3N+7jXVwAVQJgE4H/KjmS3KgU
	z0D2x2h5hl9+tmynZeq+xl9eBP1Vq57lG4hkFSlyxqN0UJXO3osj8IbGZNnadBevaJiV
	BENX9WAcf2LNHB4Eh+Ng4nrCpu/8qgRKLM0BePMdRCUB73CA4oqAAIj7itXy7x42Bd/a
	yDCLFJ5tzzc4FDKDIyXldu4eiR0unui0OliODtMy+ub0QXRjem1WACI0Q+cc2+x0K4rX
	Rf+Q==
Received: by 10.182.64.101 with SMTP id n5mr10327516obs.11.1354720451266;
	Wed, 05 Dec 2012 07:14:11 -0800 (PST)
Received: by 10.182.64.101 with SMTP id n5mr10327510obs.11.1354720451168; Wed,
	05 Dec 2012 07:14:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Wed, 5 Dec 2012 07:13:51 -0800 (PST)
In-Reply-To: <cover.1354214034.git.bruce.ashfield@windriver.com>
References: <cover.1354214034.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Dec 2012 15:13:51 +0000
Message-ID: <CAJTo0LYPdGn20J6Zueug2YZDHni94u=0eajCT0dVdoc6dEKrfQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQl2ne2BHMiaQ/uOwEQ0TLNQdn7bBa/tqMQsglgur4zbwc/Wp/NqLbj29nBRCKIVK4/9wIt1EuqAvQ0HtLjHYdaIPjXlHSGdQ152UYN8CUaLMc54HrX/lO8mzfavhiwOHKkPeq68HUQkhjy4BrpZvJaVmeU3Hs4HsFNAW3nBRzx/NzwQJvLS37bdLt56n3yHV3p8cJn7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1 master/for-danny] kernel-yocto: validate branches fix
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
X-List-Received-Date: Wed, 05 Dec 2012 15:28:37 -0000
Content-Type: text/plain; charset=UTF-8

On 29 November 2012 18:42, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> Richard/Saul/Ross,
>
> This is a fix for YOCTO #3478, and it fixes a problem that was
> being seen when BSPs created by yocto-bsp. It turned out to be
> triggered by meta branch SRCREVs that triggered a branch reset,
> which then prevented the tools from doing the rest of their job.
>
> The fix is both for master and for danny, I've tested it, TomZ
> has tested it, and so has the bug submitter, we are all happy
> with the results.

Merged to danny-next.

Ross


