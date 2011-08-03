Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QodAZ-00083R-GC
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:15:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p73FBF8t003311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 08:11:15 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 3 Aug 2011 08:11:14 -0700
Message-ID: <4E396512.9090605@windriver.com>
Date: Wed, 3 Aug 2011 10:11:14 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1D9491FE-2F9E-4AE5-B176-117DDD21BAE0@kernel.crashing.org>
In-Reply-To: <1D9491FE-2F9E-4AE5-B176-117DDD21BAE0@kernel.crashing.org>
Subject: Re: redundant RPATH warning?
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
X-List-Received-Date: Wed, 03 Aug 2011 15:15:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/3/11 10:00 AM, Kumar Gala wrote:
> What causes warnings like the following:
> 
> WARNING: QA Issue: gthumb: /work/ppce5500-poky-linux/gthumb-2.12.3-r1/packages-split/gthumb/usr/lib64/gthumb/extensions/libexport_tools.so contains probably-redundant RPATH /usr/lib64

Something passing in rpath /usr/lib64 during linking.. likely libtool....

> Is this something we should by trying to clean up?

It doesn't have to be cleaned up, but it's a really good idea to find and fix
the problems.  I believe that the standard libtool in oe-core avoids passing
rpaths of standard system prefixes.. so it's likely the gthumb Makefiles
themselves that are doing this.  (Unless of course libtool has a bug....)

--Mark

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



