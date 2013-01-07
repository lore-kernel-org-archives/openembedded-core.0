Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsBCs-0006Sv-UV for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:49:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BYKLi004021;
	Mon, 7 Jan 2013 11:34:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32489-09; Mon,  7 Jan 2013 11:34:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07BYAnB004014
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 11:34:11 GMT
Message-ID: <1357558452.28649.229.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 07 Jan 2013 11:34:12 +0000
In-Reply-To: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
References: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [danny] Consolidated Pull Request
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
X-List-Received-Date: Mon, 07 Jan 2013 11:49:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 11:09 +0000, Ross Burton wrote:
> Hi,
> 
> This short series is mainly to fix a udev booting regression on hddimg and
> brings in a number of CVE fixes, with two other good fixing coming along.
> 
> d88bdd6 librsvg: CVE-2011-3146
> c30e7e5 cups CVE-2011-3170
> b91e5f6 cups - CVE-2011-2896
> 6f966f8 cups: CVE-2012-5519
> d25e356 libnss-mdns: fix mDNS resolving speed
> 002ef4a Revert "initrdscripts: fix udevd in the live boot init scripts"
> 774b05e bootimg: Use FAT 32 for images larger than 512MB

Merged to danny, thanks.

Richard



