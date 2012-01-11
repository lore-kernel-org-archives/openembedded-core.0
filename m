Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RkviZ-00046v-8P for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 11:47:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0BAeAiT022907
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 10:40:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21682-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 10:40:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0BAe2GC022893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2012 10:40:03 GMT
Message-ID: <1326278405.23315.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jan 2012 10:40:05 +0000
In-Reply-To: <cover.1326267271.git.sgw@linux.intel.com>
References: <cover.1326267271.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 0/5] final items for M2 RC1
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
X-List-Received-Date: Wed, 11 Jan 2012 10:47:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-10 at 23:36 -0800, Saul Wold wrote:
> Richard,
> 
> Here are the final items we discussed yesterday, a succesful
> build finished, and we seem to be in good shape, please pull 
> these early in your day and fire up AB Master is you can.
> 
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit 9b944ae2f0e4dbac5a8f1f235f60730e56b26516:
> 
>   Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-01-10 18:32:16 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Lianhao Lu (2):
>   meta/PRService: Added export/import fuctions.
>   package.bbclass: per recipe PRSERV_HOST support
> 
> Robert Yang (2):
>   Incremental rpm image generation
>   Incremental rpm image generation(Add config sample)

I merged these, thanks.

> Shane Wang (1):
>   hdparm: upgrade to 9.37

This one needs to be split up as Paul points out...

Cheers,

Richard



