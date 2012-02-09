Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rvd6A-0007Xa-PL
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 00:08:18 +0100
Received: by lahc1 with SMTP id c1so2027128lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 15:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gl/iRiKOHc6cMj8f6TSrTIFhbj2g/1XJ0kluf3tSDkU=;
	b=MfM0bIrjoDa/CAt13aQCZm2MLVBdkjUFiH9heStinDeMCr6YiAG9Vd6zUMAnahUfkq
	Jvd4I6CcZPU75F0eg+f1Bt3wa/PypHo00VEDVmPSUh43ULVZjdnzEE/JS/1+NqZ0LHg/
	VuIhImxiQfWhQYcm13GlsCbhOaHuCQ/umyEJc=
Received: by 10.152.123.68 with SMTP id ly4mr2521728lab.13.1328828413237; Thu,
	09 Feb 2012 15:00:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 9 Feb 2012 14:59:43 -0800 (PST)
In-Reply-To: <20120209223044.GF10322@jama.jama.net>
References: <20120201151531.BE60410330@opal>
	<20120201153742.GA6969@jama.jama.net>
	<4F344389.7060005@linux.intel.com>
	<20120209223044.GF10322@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2012 14:59:43 -0800
Message-ID: <CAMKF1spw=sa4qTXpPO-3Px18aNXUn7WvLYLGkuJpe7W4BGPTgA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Saul Wold : opkg-utils: convert to git repo at git.yoctoproject.org
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
X-List-Received-Date: Thu, 09 Feb 2012 23:08:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2012 at 2:30 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why +git when we have +svnr not +svn? and both systems call it revision?

yes +${SCM}r seems more prevalent


