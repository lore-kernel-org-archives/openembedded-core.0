Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QWs7y-0006vy-5d
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 17:35:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5FFW7vw029011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 08:32:07 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 15 Jun 2011 08:32:06 -0700
Message-ID: <4DF8D076.4050206@windriver.com>
Date: Wed, 15 Jun 2011 10:32:06 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1308139578.25285.1539.camel@phil-desktop>	<14EEB73F-6128-4529-9A23-6F18D713F8F2@dominion.thruhere.net>	<4DF8C3F5.90204@linux.intel.com>
	<1308148934.25285.1795.camel@phil-desktop>
In-Reply-To: <1308148934.25285.1795.camel@phil-desktop>
Subject: Re: tinylogin unfetchable
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
X-List-Received-Date: Wed, 15 Jun 2011 15:35:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/15/11 9:42 AM, Phil Blundell wrote:
> On Wed, 2011-06-15 at 07:38 -0700, Saul Wold wrote:
>> Is the fallback to MIRRORS not working?
> 
> Which MIRRORS are you thinking of?  If there's meant to be an
> appropriate one set in oe-core then I guess the answer is no, it isn't
> working :-}

The FALLBACK mirrors are not enabled by default in the OE-Core configuration
files.  This is because each distribution will likely want to provide their own
mirroring.

If anyone wants to use the Yocto mirrors this is the way to enable it, in your
local.conf add:

PREMIRRORS ?= "\
bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
hg://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
osc://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
p4://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
svk://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
svn://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n"

MIRRORS =+ "\
ftp://.*/.*      http://autobuilder.yoctoproject.org/sources/ \n \
http://.*/.*     http://autobuilder.yoctoproject.org/sources/ \n \
https://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n"

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



