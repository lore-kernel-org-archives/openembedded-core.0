Received: from ecbiz66.inmotionhosting.com ([69.174.114.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <juraj.hercek@jhksoftware.com>) id 1RdOWD-00055L-UX
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 16:55:50 +0100
Received: from mail.hck.sk ([87.197.106.197]:62091 helo=[192.168.66.35])
	by ecbiz66.inmotionhosting.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <juraj.hercek@jhksoftware.com>)
	id 1RdOPL-0001NY-Ui for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 10:48:44 -0500
Message-ID: <4EF1FFD9.6060407@jhksoftware.com>
Date: Wed, 21 Dec 2011 16:48:41 +0100
From: Juraj Hercek <juraj.hercek@jhksoftware.com>
User-Agent: Mozilla-Thunderbird 2.0.0.24 (X11/20100328)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EF1F39E.60903@jhksoftware.com> <4EF1F84A.6060102@eukrea.com>
In-Reply-To: <4EF1F84A.6060102@eukrea.com>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - ecbiz66.inmotionhosting.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - jhksoftware.com
Subject: Re: meta-toolchain-qte and wrong paths to QT tools
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
X-List-Received-Date: Wed, 21 Dec 2011 15:55:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric,

On 12/21/2011 04:16 PM, Eric Bénard wrote:
> Hi Juraj,
> 
> Le 21/12/2011 15:56, Juraj Hercek a écrit :
>> I've two questions:
>>
>> 1) When I build meta-toolchain-qte (c2de8d4 metadata revision) and 
>> install the
>> resulting sdk, I see two directories in /usr/local/: oecore-i686-arm and
>> oecore-i686-i686. What is a rationale behind having these two directories
>> instead of one i.e.: oecore-i686-arm?
>>
>> 2) The oecore-i686-arm/environment-setup-armv5te-oe-linux-gnueabi 
>> script sets
>> paths to the QT tools which should be installed in oecore-i686-arm 
>> directory,
>> but they are not. These tools are installed under oecore-i686-i686 
>> directory.
>> Changing the path in environment-setup-armv5te-oe-linux-gnueabi after
>> toolchain installation is easy, but I do not consider it to be a 
>> correct fix
>> (assuming that oecore-i686-{arm,i686} directories represents proper 
>> toolchain
>> structure). What is a proper fix for this issue?
>>
>> Thank you in advance for your response(s).
>>
> did you build a i686 machine before building the arm one in the same tmp ?

AFAIR, I've just "bitbake meta-toolchain-qte" after removing 
build/{bitbake.lock,pseudodone,sstate-cache,tmp-eglibc} files/directories.

> I have a similar problem reported here :
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014480.html

It seems to be the same, or at least very similar problem.

> Eric

--juraj


