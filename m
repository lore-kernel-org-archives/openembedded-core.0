Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TA1qD-0003Sp-6A
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 18:55:37 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 07 Sep 2012 09:43:10 -0700
Received: by oagn9 with SMTP id n9so150474oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 09:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=x3FUoyeEhkFuCluaF22cL5EIu4dcD/g+L65oTbJkjOU=;
	b=MuOA19kgIRSHpnGV6F+JSOKE99sQ8lbi/odatgqdfI9ijBUw4m2jKcIOG5tpdhOvyq
	ansDzgiqOX25hovwIEbakAcfnHQSt8qL/RajYz7PFw3RWAd3nV+qWb2JEu2cZ3XkIQaF
	18jHo9rtafH1taELcR2BUNYCopgG+H5N0tBIKdyxTmxK0DS6gYSpQBZlEOBnoyo2LwDy
	mzRyqbxf9XL/F6/JcPHDyR/bRLVh1OxjNjcpuaHls4x8hZKfiKAF8LWlJSBwwOWfA+OH
	je4H0v3UlMr8xeGYxkIHtvXQ3Sln+MVCuWiHKIoM994OMs7Z5lWNPokAbGpGuCsfKBVT
	tpvQ==
Received: by 10.60.30.168 with SMTP id t8mr6945598oeh.89.1347036175760; Fri,
	07 Sep 2012 09:42:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 7 Sep 2012 09:42:34 -0700 (PDT)
In-Reply-To: <504A21A5.7000309@windriver.com>
References: <1347033943.8619.0.camel@ted> <504A21A5.7000309@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Sep 2012 17:42:34 +0100
Message-ID: <CAJTo0LYnG1BdZ=UkKPWju7UwBZWjEJhQ_svmO4bVwaSL1ZGGkA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQkuET1s9VoOoNL8fJP/rxaxETtoe0onabBsxh0TZrmN5IeUkmmUxILMpFNXfPUrZhQ+7ifu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a distclean when reconfiguring
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
X-List-Received-Date: Fri, 07 Sep 2012 16:55:37 -0000
Content-Type: text/plain; charset=UTF-8

On 7 September 2012 17:32, Mark Hatle <mark.hatle@windriver.com> wrote:
> I'm curious, is there any [easy] way we can force a rerun of configure as a
> test pass over the system?
>
> I'd like a way to verify that both this patch works as expected, and future
> recipes work as expected.  (It would also be nice to test the things that
> don't use the autotools.bbclass..)

Yeah, I expect we'll discover some cases when upstream just don't
expect a distclean.  By generally taking from git and re-running the
entire autotools we *should* be okay, but...

Ross


