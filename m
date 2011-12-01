Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RW6bB-0007CC-4R
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 14:22:50 +0100
Received: (qmail 19348 invoked by uid 1003); 1 Dec 2011 13:16:07 -0000
Received: from unknown (HELO ?192.168.43.128?)
	(philip@opensdr.com@32.144.158.198)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	1 Dec 2011 13:16:06 -0000
Message-ID: <4ED77E14.1080309@balister.org>
Date: Thu, 01 Dec 2011 08:16:04 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ED0CC76.4040606@emagii.com>
	<1322579029.7964.0.camel@ted>	<4ED53438.9040903@emagii.com>
	<7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
In-Reply-To: <7E3B66F1-28FC-45D4-BA89-193D9EA6DCA6@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Thu, 01 Dec 2011 13:22:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/29/2011 03:06 PM, Koen Kooi wrote:
> 
> Op 29 nov. 2011, om 20:36 heeft Ulf Samuelsson het volgende geschreven:
> 
>> On 2011-11-29 16:03, Richard Purdie wrote:
>>>
>>>> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no longer
>>>> available.
>>>>          tzdata , same problem.
>>>>          The recipe is located in two places.
>>>>          meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the
>>>> problem
>>>>          This is what the build uses.
>>> This is something to raise with the meta-oe maintainers. I think there
>>> isn't a problem in OECore.
>>
>> Since we now have a large number of layers, maybe it is a good
>> idea to define in each layer,  how the "git send email" should behave in
>> by providing a better ".git/config" file in the trunk?
>>
>>
>> I.E:
>>
>> [sendemail]
>>    to = openembedded-core@lists.openembedded.org
>>
>> or
>> meta-angstrom/.git/config
>> [sendemail]
>>    to = angstrom-distro-devel@linuxtogo.org
>> [format]
>>    subjectprefix = "[meta-angstrom]"
>>
>>
>> No need to look in the README file with this.
> 
> That assumes git-send-email is the preferred way, which it isn;'t for a lot of layers

Even if it is not the preferred way, it would direct the discussion to
the appropriate list. This would reduce the number of mis-directed
emails to this list.

And we know that no one reads the README's :)

Philip

> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


