Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Pv9ma-0002co-Ak
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:45:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p23Ehv4e006707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 06:43:57 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 3 Mar 2011 06:43:57 -0800
Message-ID: <4D6FA92C.5010507@windriver.com>
Date: Thu, 3 Mar 2011 08:43:56 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4D6E7EB1.5080602@windriver.com>
	<1299088802.26736.10715.camel@rex>	<BED5DD21-1E73-4DB2-9E29-17E70DF7344C@dominion.thruhere.net>	<1299093521.26736.10877.camel@rex>
	<4D6EE7A6.20603@mentor.com>	<A0E1CD11-8650-4AAD-BE14-278241E67042@dominion.thruhere.net>
	<1299154222.26736.12921.camel@rex>
In-Reply-To: <1299154222.26736.12921.camel@rex>
X-Originating-IP: [172.25.36.227]
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 14:45:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/3/11 6:10 AM, Richard Purdie wrote:
> I'd really at least like the TSC members to comment on those different
> pieces. I've already seen Chris comment that "poky-init-build-env"
> shouldn't be in the core for example. What about the rest of the scripts
> directory?

I think they should be in oe-core, and specifically labeled as self-contained
examples for oe-core itself.

There must be a simple way for people to setup the environment and run a build
so they can test the oe-core itself.  But there should be nothing in the system
that requires all of the components to exist, if there is, it should be clearly
documented that it's not an example component.  (Even putting the word "example"
in the name would be fine with me.  i.e. replacing "poky" with "example".)

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



