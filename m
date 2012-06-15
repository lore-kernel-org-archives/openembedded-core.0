Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Sfcmb-0003s1-QV
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 22:06:14 +0200
Received: (qmail 4994 invoked by uid 1003); 15 Jun 2012 19:55:34 -0000
Received: from unknown (HELO ?192.168.1.108?) (philip@opensdr.com@71.171.27.98)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	15 Jun 2012 19:55:34 -0000
Message-ID: <4FDB9332.6010807@balister.org>
Date: Fri, 15 Jun 2012 15:55:30 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>	<4FDB57DB.5090407@gmail.com>	<CAP9ODKrkmDNCzXcK3wDqypxZW6Le44004rcO7e5CiW4HD5o-AA@mail.gmail.com>
	<CAK18fxGOAi40Tzduw99=fQMf_cn9sySqr=dvJzRncNCutjjyaw@mail.gmail.com>
In-Reply-To: <CAK18fxGOAi40Tzduw99=fQMf_cn9sySqr=dvJzRncNCutjjyaw@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Fri, 15 Jun 2012 20:06:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/15/2012 02:55 PM, Andrei Gherzan wrote:
> On Fri, Jun 15, 2012 at 9:08 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:
> 
>> On Fri, Jun 15, 2012 at 12:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> I think creating a networking layer is fine idea, alongside meta-oe,
>>> as a separate layer in meta-openembedded repo. Reshuffling recipes
>>> from meta-oe into different layers is fine. I would like to avoid copies.
>>
>> I'd prefer if it used another git repository; people needing to use it
>> shouldn't be forced to clone whole meta-oe.
>>
>> This would be my proposal as well. To have this as a separate layer.

meta-oe already hosts several layers. It is kind of nice not to have to
clone a slowly increasing number of git repos. Rather clone a few and
manage the layers within them.

My larger concern with the networking layer, is what layers will it
depend on? Will the layer dependencies change based on the distro
features? This is the hardest thing to get right with layer grouping.

Philip


