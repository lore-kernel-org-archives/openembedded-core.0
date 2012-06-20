Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1ShMlX-00015y-W4
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:24:20 +0200
Received: from [192.168.0.46] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 23A34600CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 15:05:02 +0100 (BST)
Message-ID: <4FE1E8D7.2010407@communistcode.co.uk>
Date: Wed, 20 Jun 2012 16:14:31 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FE1E603.4040408@linaro.org>
In-Reply-To: <4FE1E603.4040408@linaro.org>
Subject: Re: Apache recipe?
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
X-List-Received-Date: Wed, 20 Jun 2012 15:24:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 20/06/12 16:02, Marcin Juszkiewicz wrote:
> Does someone has recipe for Apache? I want to make LAMP image for our
> tests and so far my choices are lighttpd or creation of new recipes for
> Apache (based on 2.2.17 from OE classic).
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Last time I checked the PHP recipe needs a bit of love too, I've done a 
slightly updated customised build but it's a fantastic hackfest.

Any reason you specifically want Apache? I'm using Hiawatha webserver 
which is another lightweight alternative with PHP-cgi support as I 
wasn't too keen on lighttpd.

I would be happy to provide the recipes if you wish you to use them.

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



