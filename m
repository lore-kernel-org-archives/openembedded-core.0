Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QMh1A-0001NM-1v
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 15:43:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4IDdT4R007845
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 06:39:29 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 18 May 2011 06:39:28 -0700
Message-ID: <4DD3CC0F.7070702@windriver.com>
Date: Wed, 18 May 2011 08:39:27 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1865303E0DED764181A9D882DEF65FB694322A3FD4@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB694322A3FD4@shsmsx502.ccr.corp.intel.com>
Subject: Re: dpkg's admindir: /var/dpkg or /var/lib/dpkg?
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
X-List-Received-Date: Wed, 18 May 2011 13:43:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/18/11 4:27 AM, Cui, Dexuan wrote:
> Hi, I happened to find a bug: in target,  "dpkg --list" shows "dpkg-query: failed to open package info file `/var/lib/dpkg/status' for reading: No such file or directory"
> 
> Actually the files(status and available) does exist, but not in /var/lib/dpkg/ -- they're in /var/dpkg/. "ln -s /var/dpkg/{status, available} /var/lib/dpkg" can resolve the issue.
> 
> grepping '/var/dpkg' shows there are many files(package_deb.bbclass, rootfs_deb.bbclass, populate_sdk_deb.bbclas, apt.conf ) in which '/var/dpkg' is used and /var/lib/dpkg is not used at all.
> 
> However, looks dpkg's default admindir is /var/lib/dpkg -- e.g., Ubuntu uses this.
> 
> What should we do? Looks fixing the package dpkg's admindir in the do_configure needs the least coding.

I would say that /var/lib/dpkg is the "correct" directory to use.  This matches
the behavior on other deb bases systems.  (It also mimics other pkg managers who
place their data into /var/lib/...)

--Mark

> Thanks,
> -- Dexuan
>  
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



