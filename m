Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UINCU-0001I5-1a
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 18:53:23 +0100
Received: by mail-vc0-f175.google.com with SMTP id hf12so1528000vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 10:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=GJaLDTpUuwPh89gmEOdyaMV3F5ez4KIrJENstyXYGqY=;
	b=Lr9ML0D4jRyvG8t+Zx3RteJ4dBhUtpsVkm87f7KkQaOjvdSt6oDpREm9E3HuVsRE3N
	7qsAwFg3VDvadmu98heuVWyEDdaiXhaMdLgnCnPy0NGBcnGrT1mRWqWcCcXK7aWYb9vv
	LaXa5UlUnqqg1eLrKLtrO8Ss700bidCh92W4a6SMZxLjF9+aTGwRXZG8wYl1fLbFaJed
	wC1lobh/Zrt4JV66b4NLo3OQE6tnr0slPy95PYwYAY3PeSEnmeu1pv/jEBfjmEWFFP0h
	mMrSsxXSH/S2176Qa45cesQUVZnalQ7H6rqq59bedhjCF/Cew8AgQOBjFqwJQ2Qmp5/i
	ASWQ==
X-Received: by 10.52.155.5 with SMTP id vs5mr7724517vdb.24.1363800990441; Wed,
	20 Mar 2013 10:36:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Wed, 20 Mar 2013 10:36:10 -0700 (PDT)
In-Reply-To: <1363730066-11361-1-git-send-email-obi@opendreambox.org>
References: <1363730066-11361-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2013 17:36:10 +0000
Message-ID: <CAJTo0LbN1exz6x9bFwc-YsHx5qZLHGVofGgTgOePGWJ2fEzmbw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQkV5g3MdlDO1J4Gpu8WQ/j1LLkngCACJSxieOG1Oktf+CqW/vw5dcu7x30ZyRWtNjvEINVX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "base-files: add fstab for systemd based systems"
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
X-List-Received-Date: Wed, 20 Mar 2013 17:53:24 -0000
Content-Type: text/plain; charset=UTF-8

On 19 March 2013 21:54, Andreas Oberritter <obi@opendreambox.org> wrote:
> For hybrid systemd/sysvinit builds, only one fstab can be used.
> The default fstab used by sysvinit should work fine with systemd.
>
> Since virtually every machine will ship its own fstab in its bsp
> layer, the bsp layer may decide how to override the fstab based
> on distro features.

Merged into my systemd branch.  Submission coming soon.

Thanks,
Ross


