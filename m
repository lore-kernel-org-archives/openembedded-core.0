Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrsiV-0001S7-Mg
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 17:32:39 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 08:21:16 -0700
Received: by qcmv28 with SMTP id v28so1604702qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 08:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=GuUg/kP+MlkbYKLztpxvvM6Rbqn6hDF0RN0kaxsfghg=;
	b=cCTTZZa3HstjdESxaGK3yq5KYKfE7k4OQWfqYlWxjhrSJ7CcjtCGdn6PNU5zB6HBh9
	Ow3a/6jVozUAjQpqZ+n+RzcrdBKCsFWVrSxlgXbE27dELuBRfreCB2jTwb43SYK6MP4m
	ddIZVNve0CmE+rtdOoOEZDe3B08V7/PxpwHLYcIaS3yxhMB/55ZSkpHFImoILWk9V3Xs
	jIxZgy9a3sIDHoIvYwNuDw8dzLccNLGWXtMRCvKbgW+uCzRIF+tW4RNX3CZbXY/P371b
	SvE+Ht8BCZEiXNW1MBFdfb8a2QmrNN5rRvqRjLBNRLyS0n5BWjYXRuPQtogWPaX9jx1+
	04Ug==
Received: by 10.224.182.136 with SMTP id cc8mr4411137qab.60.1342711275558;
	Thu, 19 Jul 2012 08:21:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Thu, 19 Jul 2012 08:20:55 -0700 (PDT)
In-Reply-To: <1342710998-15446-1-git-send-email-otavio@ossystems.com.br>
References: <1342710998-15446-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jul 2012 16:20:55 +0100
Message-ID: <CAJTo0LaVqK2KJUVcn1=HXPSuV7cyDEyxGaiDFreUTgE0sdbM0Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnpB2b3zzqfUxxLt5SDD5/Tcy2K/k3yIgMucpqrRB8pGmefkNQjzd4HwhmSJfwKIq3PIgRp
Subject: Re: [PATCH] bash: fix warning about bashbug reference /usr/bin when installed in /bin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jul 2012 15:32:39 -0000
Content-Type: text/plain; charset=UTF-8

On 19 July 2012 16:16, Otavio Salvador <otavio@ossystems.com.br> wrote:
> We change the installation process so we have bashbug in ${bindir} and
> bash at ${base_bindir}; we also build tested it many times in a 8 CPU
> machine and had no problem building it in parallel so we dropped
> PARALLEL_MAKE override.

I'd really like to see those split out as separate commits...

Ross


