Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7XSZ-0001Di-QQ
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 20:28:08 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q7XQX-0004RV-Lk from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 11:26:01 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Apr 2011 11:23:52 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 6 Apr 2011 11:26:00 -0700
Message-ID: <4D9CB030.5020409@mentor.com>
Date: Wed, 6 Apr 2011 11:25:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1302001365.24596.459.camel@rex>
	<BANLkTim4ouc6ssOhfU4Dd8OfEq81MfC_gQ@mail.gmail.com>
In-Reply-To: <BANLkTim4ouc6ssOhfU4Dd8OfEq81MfC_gQ@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 06 Apr 2011 18:23:52.0474 (UTC)
	FILETIME=[C8147FA0:01CBF487]
Subject: Re: Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 18:28:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/06/2011 01:47 AM, Frans Meulenbroeks wrote:
> 2011/4/5 Richard Purdie <richard.purdie@linuxfoundation.org>:
> 
> [...]
>>
>> Does this make sense to everyone, are there any questions/ objections/
>> concerns/ things I've missed?
> 
> I think most embedded systems would only use one lib. To take your
> lib/lib64 example:
> If I am developing for an embedded system I know whether it will run
> as 32 or 64 bit, so there is no need to have both.

What about the case of new 64bit hardware and legacy software that's
still 32bit?  This is a problem that embedded systems have and OE needs
to support

> multilib has its merits when it comes to supporting multiple hardware systems.
> However as in the embedded world one is typically targeting a specific
> hardware configuration.
> (actually I don't recall having seen requests for multilib on the ML
> before, although I could have missed it).

You missed it :)  Roman Khimov posted a very basic thing years ago for
dealing with the x86/x86_64 problem.

> Also I'm somewhat worried by the actual complexity this adds (to the
> build process and the recipes, and timewise probably also to the
> bootstrap process as additional packages have to be built).

I agree, we do need to be careful to make sure the non-multilib case
isn't made more difficult by all of this.

-- 
Tom Rini
Mentor Graphics Corporation


