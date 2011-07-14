Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QhAfj-00014d-GL
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 03:24:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6E1KxWD019404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 18:20:59 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 13 Jul 2011 18:20:59 -0700
Message-ID: <4E1E447A.2060703@windriver.com>
Date: Wed, 13 Jul 2011 20:20:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E1E18AA.2050808@mentor.com>
In-Reply-To: <4E1E18AA.2050808@mentor.com>
Subject: Re: siteinfo for recipes oe-core lacks?
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
X-List-Received-Date: Thu, 14 Jul 2011 01:24:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/13/11 5:14 PM, Tom Rini wrote:
> Hey all,
> 
> Do we have an opinion on siteinfo for recipes that oe-core lacks?  I
> have two easy examples:
> - mono: neither meta-oe nor oe-core have a recipe, we have siteinfo
> stuff specific to it.  Ignore it? drop it?  update it with what meta-oe has?
> - postgresql: meta-oe has it, oe-core lacks it.  Keep in meta-oe only?
> 

For both of them, I'd keep them as local to the recipe as possible.. no recipe,
no siteinfo listed.

--Mark


