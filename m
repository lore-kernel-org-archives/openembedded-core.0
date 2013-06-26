Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 212D16AC48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 02:44:55 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp12so13424057pab.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 19:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=jT85G3uf4Nloo+7MK1YvU7gbG/80Q4fIQhUPjQAUxiY=;
	b=z62U8IjF0kY77kzb8Hemif4ljQ799PrHkMvQiiHswoxYAqLc7InKtlqu5+NdUZ9P5n
	yAhMjeS46SlC9xgS78B06b11HkYt3aQdUHsM/Tz/VzsHI/0IhmB/y2F1URs3qSRm5wOX
	SjLySGEYNHeeRsUvI+IFPULihgkIevTfcSpGWyQtXw2F+Q0s0kr7rlN1cE+pW3M+njpQ
	QQHYkMs9AE69Zp3b+6f2QDtBNcWnarpSf3FYXLnWUXbL5zJiJrqJCac1LE1577f4kKzM
	82LEwdxHVsxHalsO7ipcT3VAyWFCLfS+1RybRZ7SKXtQ4ay1gfK0fuC/b1HRmiaSW7pj
	53+A==
X-Received: by 10.66.160.97 with SMTP id xj1mr2697268pab.5.1372214696050;
	Tue, 25 Jun 2013 19:44:56 -0700 (PDT)
Received: from leo.localnet (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209]) by mx.google.com with ESMTPSA id
	gb2sm25402540pbd.38.2013.06.25.19.44.54 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 19:44:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 25 Jun 2013 19:44:53 -0700
Message-ID: <2409553.DWj15DeEDt@leo>
Organization: Himvis LLC
User-Agent: KMail/4.11 beta1 (Linux/3.9.0-7-generic; KDE/4.10.80; x86_64; ; )
In-Reply-To: <51C9CE42.8020207@linux.intel.com>
References: <51C9CE42.8020207@linux.intel.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Zhenhua Luo <zhenhua.luo@freescale.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
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
X-List-Received-Date: Wed, 26 Jun 2013 02:44:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, June 25, 2013 10:07:14 AM Saul Wold wrote:
> Guys,
> 
> There is a continuing failure on the auto-builder with the 4.8 version
> of GCC for the fsl-ppc and fsl-arm BSPs.  This is currently holding
> oe-core back from updating GCC to 4.8, which we want to do soon so 
that
> we have get any other issues worked out that might come up.
> 
> These seem to be ICE issues can get bee seen in the following log files:
> 
> http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-arm/builds/148
> /steps/Building%20Images/logs/stdio
> 
> http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc/builds/149
> /steps/Building%20Images/logs/stdio
> 

ppc issue is singled out and reported as regression in gcc
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717

> Has anyone investigated these?
> 
> One possibility discussed during the tech call was to set the tune for
> these BSPs to use GCC 4.7, but this is not preferred as it just defers
> and hides the issue.
> 
> Thanks


