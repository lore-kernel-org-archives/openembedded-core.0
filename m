Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qbw3j-0007Td-1U
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 16:48:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5TEiNe8025186
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 07:44:23 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 29 Jun 2011 07:44:23 -0700
Message-ID: <4E0B3A46.30407@windriver.com>
Date: Wed, 29 Jun 2011 09:44:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1309311935.git.mark.hatle@windriver.com>	<d0bbe06e703f6f9b7d0f38ffc372f3bb1425483a.1309311935.git.mark.hatle@windriver.com>	<1865303E0DED764181A9D882DEF65FB6A167F0C71E@shsmsx502.ccr.corp.intel.com>
	<1309358523.2551.45.camel@phil-desktop>
In-Reply-To: <1309358523.2551.45.camel@phil-desktop>
Subject: Re: [PATCH 2/2] prelink_git.bb: Only block the postinst script when no image-prelink (v2)
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
X-List-Received-Date: Wed, 29 Jun 2011 14:48:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/29/11 9:42 AM, Phil Blundell wrote:
> On Wed, 2011-06-29 at 22:39 +0800, Cui, Dexuan wrote:
>> Even if without the patch, we still skip this on the host side -- previously we skipped with "exit 1", and with the patch now we skip with "exit 1" or "exit 0".
>> So IMHO looks the patch doesn't actually help? :-)
> 
> If the script exits with 0 in offline mode then it won't get rerun at
> first boot on the target.  If it exits with 1 then it will.

Yes.  Since we've already run the equivalent of the script in the image-prelink,
we can safely exit with a '0' telling the "image" preinst code that this was
successfully run and to ignore it at first boot.

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



