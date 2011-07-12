Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QggQg-0007XS-21
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 19:07:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6CH3RJ7003270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 10:03:27 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 12 Jul 2011 10:03:27 -0700
Message-ID: <4E1C7E5E.5020001@windriver.com>
Date: Tue, 12 Jul 2011 12:03:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1309780493.20200.17.camel@desktop.home>	<4E11DFA1.70608@slimlogic.co.uk>	<1309795942.20200.123.camel@desktop.home>
	<4E11EDD1.1000308@slimlogic.co.uk>
In-Reply-To: <4E11EDD1.1000308@slimlogic.co.uk>
Subject: Re: [PROPOSAL] Package feature switches, redux.
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
X-List-Received-Date: Tue, 12 Jul 2011 17:07:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/4/11 11:44 AM, Graeme Gregory wrote:
> On 07/04/2011 05:12 PM, Chris Elston wrote:
>>> Hi, with my Angstrom cap on I like this syntax and I think it will be
>>> really useful.
>>>
>>> A second level concern I have is about conflicting features, its not
>>> something we will come across probably in DISTRO land as we are sensible
>>> enough not to select them. But users could select them in local.conf.
>>>
>>> Graeme
>> As a new developer, I've discovered that there are plenty of things that
>> you can set in local.conf which break things :D
>>
>> Could you please give an example of conflicting features that could
>> cause problems, I'm not experienced enough with OE to have encountered
>> that problem yet.
>>
>>
> Cant think of a solid one off the top of my head, but I mean the cases where
> 
> --enable-feature means that --disable-another-feature is done.
> 
> This is why I listed it as a secondary issue.

I remember seeing similar issues as well.

I really like this syntax described for the options.  If there is some way to
list a conflicting option -- or even simple some python syntax useful within a
recipe itself to say "hey you can't specify these two things and use this
recipe", that would be all that I think is needed.

I rarely find packages where it's likely someone will try to configure a
conflicting option set, but it does happen.. if we find it.. we should be able
to note it within the recipe and have it flag the user before do_configure is
run.  (Preferably even before that!)

--Mark

> Graeme
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



