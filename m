Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TBBeo-0003o1-PW
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 23:36:38 +0200
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id BD01D21E7C;
	Mon, 10 Sep 2012 17:24:10 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 10 Sep 2012 17:24:10 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=ovVcHKMmU3tOOGJXn5A7HD
	zhFmA=; b=Z96UrrtRBhLBrXe9nZWfaVEuYAExtSnyWwkjJeiQ57xdmSGsGPOyaW
	htj/dq0Eh0PWlw7MAxj41sZpEUwOftXQxOL1oJCwFtSTamwO6PLhmpMZuWvtka0n
	e8A8kpvp3q8q/LakDNggtyueofWeJnQH2kbmlAdHlGw7C+0W6qhOI=
X-Sasl-enc: fBwd8NJl89aDGwBsEekC1KHUlflt3U4tKrvMLhWcTVKV 1347312250
Received: from [10.193.22.176] (unknown [66.187.233.203])
	by mail.messagingengine.com (Postfix) with ESMTPA id 559E4482760;
	Mon, 10 Sep 2012 17:24:10 -0400 (EDT)
Message-ID: <1347312212.1908.2.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 10 Sep 2012 17:23:32 -0400
In-Reply-To: <1347311665.1908.1.camel@lenny>
References: <1347292942-7241-1-git-send-email-ross.burton@intel.com>
	<1347311665.1908.1.camel@lenny>
X-Mailer: Evolution 3.4.3 (3.4.3-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkit-gtk: work around Make bug by re-running make
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
X-List-Received-Date: Mon, 10 Sep 2012 21:36:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-10 at 17:14 -0400, Colin Walters wrote:
> On Mon, 2012-09-10 at 17:02 +0100, Ross Burton wrote:
> 
> > +# fixed in Make CVS, so 3.83 won't have this problem.
> 
> I know this will be painful, but did you consider looking at the make
> version and determine whether or not this workaround is necessary?

Or actually, why not just backport the make patch into core now?




