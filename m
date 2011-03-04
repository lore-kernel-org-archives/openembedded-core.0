Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1PvYHy-0002Kx-JD
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 17:55:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p24Gs88b012051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2011 08:54:08 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 4 Mar 2011 08:54:08 -0800
Message-ID: <4D71192E.3050706@windriver.com>
Date: Fri, 4 Mar 2011 10:54:06 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BFB7E27E-AFA1-4F08-8D64-3B55C21D180C@dominion.thruhere.net>
	<4D71175D.4050307@gmail.com>
In-Reply-To: <4D71175D.4050307@gmail.com>
X-Originating-IP: [172.25.36.227]
Subject: Re: Gst-plugin dependencies
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
X-List-Received-Date: Fri, 04 Mar 2011 16:55:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 3/4/11 10:46 AM, Khem Raj wrote:
> On 3/4/2011 7:58 AM, Koen Kooi wrote:
>> Hi,
>>
>> The current gst-plguin-<foo>  in oe-core is a bit anemic and the ones in OE are really full featured. How do we want to handle this going forward? I'm a big fan of shifting the pain to buildtime so people can install any plugin they want at runtime instead of needing to rebuild it.
>> At TI we have cut-down versions of the recipes to save buildtime[1], but it's a pain to maintain those and keep them up to date. It would be nice to come with a way to say you want full featured gstreamer or not. With my angstrom hat on, I would like the full feature set :)
>>
> 
> May be controlling it with distro features

Due to the licensing issues in the gst-plugins..  I'd be inclined to say they're
out of the core myself.  Move it to the distro specific layers.

--Mark

>> regards,
>>
>> Koen
>>
>> [1]  As well as dealing with the inabiltiy to build opencv with a specific CSL toolchain
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



