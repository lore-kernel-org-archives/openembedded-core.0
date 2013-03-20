Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UINHj-0001Rd-R0
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 18:58:48 +0100
Received: by mail-vc0-f170.google.com with SMTP id lf10so1570528vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 10:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=BtwRn2OY/VbwP9SBUKyzATNOZdtgxzKTlxCB7SvwdpQ=;
	b=QKsFrB2OU1N6oja1H41fYC5/t2ssB0AdFIs+ffbNwOd28z7TrYbDwC2t5RE/trYref
	XnHEeYQKQGGE9B1LzavaCYQn6+pGKJ3TkuQYirt29d19NVsa4SiWw/11GSs6Wiyc3e6z
	YBUyzX0/KbsJIpyYUUnYENIioo+ZXPIeq8/l7+FRyosYbosgKWphmuEoizbcGuox/T1B
	aJXmtJzgSCuDR35U7LFhuTELgZdhJi1XfsHsWsQORkUIH7t4dLknMTiHZ0PJJKVIb54Q
	no42IFRHcYk2XlIU6CajiP7TR/dDGl6BfdgMsxLMod6ZKGmX6LiO4t2bfSedDs4EcmEp
	xO1A==
X-Received: by 10.52.230.197 with SMTP id ta5mr7771652vdc.103.1363801316217;
	Wed, 20 Mar 2013 10:41:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Wed, 20 Mar 2013 10:41:36 -0700 (PDT)
In-Reply-To: <1363313340.14476.13.camel@ted>
References: <cover.1363287636.git.sgw@linux.intel.com>
	<1363313340.14476.13.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2013 17:41:36 +0000
Message-ID: <CAJTo0LaU2iEeg-2z=nwaw3O-kTX_VLpKcZ9TUjGGU4gmAzPKqA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkXAHMdW0lBLRsaZk2tq37ctgZ7F5HK9jY1L0zRGsdX3j7PGjpO7Uz/R35iiJFBJDnFVBBW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/29] SystemD and other fixes
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
X-List-Received-Date: Wed, 20 Mar 2013 17:58:48 -0000
Content-Type: text/plain; charset=UTF-8

On 15 March 2013 02:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> Khem Raj (2):
>>   sudo: Compile mksigname and mksiglist for build host
>
> Took all these patches except the above which I want to double check
> whether there is an autotools method we can use for this now. Ross might
> have some knowledge about this.

Using ac_prog_cc_for_build.m4 to incorporate CC_FOR_BUILD would be the
logical solution but as it's quite intrusive this needs to be
discussed with upstream.  Short-term, this is a perfectly good
solution as the tools are simple to build (compared with the Mesa
tools, which are impossible to build like this).

Ross


