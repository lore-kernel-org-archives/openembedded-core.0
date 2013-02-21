Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U8exn-0006fs-9k
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 23:50:05 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so20369pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 14:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=IidFd8e3wqIUM0MbZ/iTehV98APoGAv89/UMqvs1Kl4=;
	b=WSy9iP8l6utTIG2C8pl2fIlye8yr/93Nqpkv2XsFpCD+KvDuSDa7M38Xfb/WgiLHJT
	sDHjcnfcNa9hF51fJZFEZVbFpv+UgLX8OtVpBE/XXEyZZXBCl1GpvMGoS0PtDelfZkz4
	2/UUnr+DJgco00aSY/+FCBSGg/9YGT3rbGp51tTQ4F2955jnhlHgPMLT/6KlDGQVdQj6
	Ezm5Dvo7A/Jfphv34vpQzoKqAezq3q+/YxgtRhoiW4INC5knx01iVsSZIdbFzZRh+FyK
	7EpzhdiOORAsiwIAyCyOOMDwNQIzKNTvezvyzhzNyoFe6SjhKP8YgB7GcuFOb7xB4mvd
	wltg==
X-Received: by 10.66.26.230 with SMTP id o6mr452102pag.218.1361486030055;
	Thu, 21 Feb 2013 14:33:50 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id c3sm477168pax.9.2013.02.21.14.33.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 21 Feb 2013 14:33:49 -0800 (PST)
Date: Thu, 21 Feb 2013 14:33:33 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Message-ID: <20130221223331.GB1833@sakrah.homelinux.org>
Mail-Followup-To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <1361054460-21397-1-git-send-email-holger@moiji-mobile.com>
	<51201281.1000801@linaro.org>
MIME-Version: 1.0
In-Reply-To: <51201281.1000801@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] conf: Remove unused ROOT_FLASH_SIZE variable from the config
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
X-List-Received-Date: Thu, 21 Feb 2013 22:50:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/02/13 00:13), Marcin Juszkiewicz wrote:
> W dniu 16.02.2013 23:41, Holger Hans Peter Freyther pisze:
> > This variable is set but never used in OE-core and meta-oe. It
> > was historically used for the Opie collection but seems to be
> > unused now.
> 
> As I am one of those who remember when it was added:
> 
> Acked-By: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

There are many BSPs that are still defining it and angstrom depended on
it which now defines it lazily since its not in bitbake.conf anymore
but I wonder if machine confs which define it should also remove it


