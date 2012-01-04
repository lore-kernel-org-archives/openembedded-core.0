Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiUv3-0006vJ-Ep
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:46:33 +0100
Received: by obcwn6 with SMTP id wn6so14904831obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 09:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nwyG6Io33WA+BbaKjYPD65rBDuBjjE02J6ulKHIDHBE=;
	b=k2S0Ez/f4RHBn946SHIhiO/5JY9CPByh/bBuYdLo7CjkP21NLQVCwpXwrFT8yxRJZH
	hEQNRj7BgG7oDKQU+cVeRMX/40mfYMCC7z0Jc83fxIJYnaZyzeJEmCmZnuZKT4niq4+N
	xKQG5M1DSitCzbhgisQgNeJGy5w0o/otPyg4Q=
Received: by 10.50.76.162 with SMTP id l2mr34148492igw.1.1325698748410;
	Wed, 04 Jan 2012 09:39:08 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id g7sm16275057igv.7.2012.01.04.09.39.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jan 2012 09:39:07 -0800 (PST)
Date: Wed, 4 Jan 2012 09:39:30 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120104173930.GB32676@sakrah.homelinux.org>
References: <4F03FFB2.8040606@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F03FFB2.8040606@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Recent xserver-kdrive failure and util-macros update
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
X-List-Received-Date: Wed, 04 Jan 2012 17:46:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/01/12 23:28), Saul Wold wrote:
> 
> We seem to have a relatively new failure in xserver-kdrive, which
> appeared in the last set of change.  I tried to run though a bisect
> but was not able to find the problem.
> 
> The problem seems to be related to configure.ac setting of
> XSERVER_CFLAGS='$(CWARNFLAGS)' and then using -Werror=address, which
> is what causes the failure.
> 
> This seems to be related to the util-macros update to 1.16, which
> adds more warnings to errors.  Since we are still using the older
> xserver-kdrive, there are warnings that are now errors with the
> update.

Fix xserver-kdrive


