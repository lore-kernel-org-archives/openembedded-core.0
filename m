Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QKtXl-0006mR-KW
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 16:40:42 +0200
Received: (qmail 28737 invoked by uid 1003); 13 May 2011 14:37:49 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.165.110)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	13 May 2011 14:37:49 -0000
Message-ID: <4DCD423C.40802@balister.org>
Date: Fri, 13 May 2011 10:37:48 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BANLkTinm-YXGM0z1CFJamQG7N0Em442VHw@mail.gmail.com>
	<1305280030.2421.57.camel@phil-desktop>
In-Reply-To: <1305280030.2421.57.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Where to host new layers
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
X-List-Received-Date: Fri, 13 May 2011 14:40:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2011 05:47 AM, Phil Blundell wrote:
> On Fri, 2011-05-13 at 02:10 -0700, Khem Raj wrote:
>> I have created couple of layers namely meta-slugos (distro layer) and
>> meta-nslu ( machine layer). I was  looking for place to host those
>> layers. Would they be good under meta-openembedded ? I dont think
>> http://www.nslu2-linux.org/
>> has git infrastructure otherwise that would be one place to put it.
>
> I thought the idea was that meta-openembedded would remain distro- and
> machine- neutral and that the BSP bits would live in separate repos.
> Whether we want one repo per machine or some kind of shared repository
> with a bunch of distros in is, I guess, something of an open question.
>
> In the short term you could obviously host them on github or somewhere.
> (I was originally planning to do that with meta-micro, but it turned out
> to be fractionally more convenient to host it on my own git server so I
> did that instead.)
>
> In the longer term I don't think there's any reason we couldn't host
> those kinds of distro layers on openembedded.org, either in separate
> repositories or a single shared one.  I know there was some board
> discussion a few months ago about whether or not oe.org should be in the
> business of hosting third party BSPs but I'm not quite sure what the
> outcome of that was.

I'd like to hear what the slugos guys would like to do.

Philip


