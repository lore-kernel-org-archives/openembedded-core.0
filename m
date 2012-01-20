Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RoJO2-0006yQ-Dw for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 19:40:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KIWnA0022000
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 18:32:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21531-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 18:32:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0KIWh3V021994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 18:32:44 GMT
Message-ID: <1327084362.8805.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jan 2012 18:32:42 +0000
In-Reply-To: <1327076359.4268.6.camel@ted>
References: <1327076359.4268.6.camel@ted>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] lib/oe: Add sstatesig, OE specific signature generator classes
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
X-List-Received-Date: Fri, 20 Jan 2012 18:40:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-20 at 16:19 +0000, Richard Purdie wrote:
> +
> +class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
> +    name = "OEBasic"
> +    def init_rundepcheck(self, data):
> +        pass
> +    def rundep_check(self, fn, recipename, task, dep, depname):
> +        return sstate_rundepfilter(fn, recipename, task, dep, depname)
> +
> +class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
> +    name = "OEBasicHash"
> +    def init_rundepcheck(self, data):
> +        pass
> +    def rundep_check(self, fn, task, dep, dataCache):

This should be:

def rundep_check(self, fn, recipename, task, dep, depname):

> +        return sstate_rundepfilter(fn, recipename, task, dep, depname)
> +
> +# Insert these classes into siggen's namespace so it can see and select them
> +bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
> +bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash

Cheers,

Richard



