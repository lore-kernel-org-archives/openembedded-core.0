Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZSs7-0002vC-GD
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:18:27 +0200
Received: by pbbrq2 with SMTP id rq2so6844599pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZCplFD7rcS1aS9/MKhHtZMnMb+bP5JhARIy/56ZCcw0=;
	b=DFHzkc4RorQAWpEERyRrvN2Fs7btmjyDBIidD0fRHeNGgeFXdoEVp7itQivhcxemoj
	mfgfiWMq3bgtSzn5rABmMSxkcxvBlfqsy0uIrcc+FQqnZvvbefDPPRFpLojg+DkbJ6aL
	35aFNspXdYfxpVosvTFELMvydLn51MMdFT9+ThDQgx4KzpSll9kDAqRbDJnrly8RXsZe
	KHnQ0qZr9i6V6E7U2w3KZ52WKD5xKDvNHM2vXhJ4m7s5hks6zJRcIfcVPum5OmMNeEKH
	rxXptlRsagQPN/WtB6+jm/JNoPTI3gNyLSNgMTX/ivXcIzpQZ5LqTxvf6QfxDouApfL0
	q+uA==
Received: by 10.68.231.10 with SMTP id tc10mr41681845pbc.107.1338322088858;
	Tue, 29 May 2012 13:08:08 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id
	qt10sm23807939pbc.57.2012.05.29.13.08.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:08:07 -0700 (PDT)
Date: Tue, 29 May 2012 13:07:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120529200740.GC5528@sakrah.homelinux.org>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2] valgrind: Enable valgrind for armv7
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
X-List-Received-Date: Tue, 29 May 2012 20:18:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 
> At some extend yes, the configuration checks the host, the default
> string passed is "arm" but the configure.in checks for:
> 
> case "${host_cpu}" in
> ...
>      armv7*)
> 	AC_MSG_RESULT([ok (${host_cpu})])
> 	ARCH_MAX="arm"
> 

in OE we know that compiler is configured to generate code for armv7
therefore you can safely change armv7* above in configure.in to be arm*

> 
> So if we use the default from autotools it won't work.
> I've seen the arch in some examples on the net, do you prefer -host=armv7?


