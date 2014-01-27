Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id D503E6E879
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 17:25:38 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id w8so3602280vbj.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 09:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0WN/uq5JOfNj42xCe2+JYs0I/pC5s13TtPtdz59jqwM=;
	b=bBgNouAwLhpZ9ZiYQpkGE7z9i01SqDdjey4BNtm9j2f355jiFSnXiHm9gyAiKyrsDO
	DoKY50TGtrfFN6s9zqqi88m8Kbt37hLTsJiOZX0ryICeUYRyvWiot2yyUkGl0JXgCSwx
	7iiY3ema5ap201D4s9jlWt6OS/WAxTz3VUnUL0of1v0S0mCl6UVMen2AlPPt25GpvgII
	Ij3pEV8eO481a/RHWTpnlnvmVJPtwA1dJ/D2aqJLMO3+1o0aSgcZH4at0eiFD83oe2yc
	jjfqYKcP9Tv5/BhvnO//852t4ChC5nF0YKSia9liPktrbFPno3ENTI6wjeGy5EQP4Tc3
	3/eQ==
X-Gm-Message-State: ALoCoQlDBPh5dadQq004iXXFh/8cuMQzgHmSEcRJ9fPemJ8+sLxYni4XxCMVTH6yMywCxRimW4dw
X-Received: by 10.221.30.14 with SMTP id sa14mr132091vcb.44.1390843539433;
	Mon, 27 Jan 2014 09:25:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Mon, 27 Jan 2014 09:25:19 -0800 (PST)
In-Reply-To: <CF0BD5FA.79232%david.c.stewart@intel.com>
References: <1390833588.17424.254.camel@ted>
	<CAP9ODKpr8ydsGUYdniyFwO1pgp9pOW4+RcU78SxhOhRRn4XEVw@mail.gmail.com>
	<CF0BD5FA.79232%david.c.stewart@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jan 2014 17:25:19 +0000
Message-ID: <CAJTo0La6fWSvGN38Vpev9f=fE66_SdagLqALeNaJEjr3qtuRfw@mail.gmail.com>
To: "Stewart, David C" <david.c.stewart@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Mon, 27 Jan 2014 17:25:39 -0000
Content-Type: text/plain; charset=UTF-8

On 27 January 2014 17:23, Stewart, David C <david.c.stewart@intel.com> wrote:
> Nice! Now if we could just convince people to configure their VM guests
> with enough cpus -

Now if only we could make bitbake error out when it's running inside a VM. ;)

Ross

