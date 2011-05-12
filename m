Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jpuhlman@mvista.com>) id 1QKZop-0000cG-Hw
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 19:37:00 +0200
Received: by pxi6 with SMTP id 6so1351400pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2011 10:34:07 -0700 (PDT)
Received: by 10.68.19.227 with SMTP id i3mr631877pbe.303.1305221647631;
	Thu, 12 May 2011 10:34:07 -0700 (PDT)
Received: from [10.0.10.113] (gateway-1237.mvista.com [206.112.117.35])
	by mx.google.com with ESMTPS id q20sm790853pbt.72.2011.05.12.10.34.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 10:34:05 -0700 (PDT)
Message-ID: <4DCC1A0B.3040802@mvista.com>
Date: Thu, 12 May 2011 10:34:03 -0700
From: Jeremy Puhlman <jpuhlman@mvista.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
	ThunderBrowse/3.3.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <RFC: Layer tooling
	brainstorming>	<1304014179-32612-2-git-send-email-jpuhlman@mvista.com>
	<1304687702.30391.109.camel@rex> <4DCBDC96.1080306@mvista.com>
In-Reply-To: <4DCBDC96.1080306@mvista.com>
X-Enigmail-Version: 1.1.1
Cc: "paul.eggleton@linux.intel.com >> Paul Eggleton"
	<paul.eggleton@linux.intel.com>, chris_larson@mentor.com
Subject: Re: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Thu, 12 May 2011 17:37:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


> So currently it gets stashed in the locations specified above. Currently
> the code has the ability to extract values out of the uri as new bits.
> The above would be reasonable, but you could do as well:
> 
>  BBLAYERS = " \
>>  	http://url.to.my.tarball/tarball.tar.gz;local=/path/to/layer \
>>  	git://gitserver.com/git/repo;proto=httplocalLayer=/path/to/layer/two \
>>         /path/to/layer/three \
>>         /path/to/layer/four \
> 
> With the current implementation the above is fairly straight forward.
> (not that I am implying implementation should necessarily dictate the
> what is done, just noting the above is significantly easier to implement
> from the point the code is now.)

Arg. Too early this morning. That should have been something like:

>  BBLAYERS = " \
>>  	http://url.to.my.tarball/tarball.tar.gz;localLayer=/path/to/layer \
>>  	git://gitserver.com/git/repo;proto=http;localLayer=/path/to/layer/two \
>>         /path/to/layer/three \
>>         /path/to/layer/four \
>

or something to that effect.


