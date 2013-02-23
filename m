Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1U9BMl-00059b-9i
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Feb 2013 10:26:07 +0100
Message-ID: <5128858F.1030107@communistcode.co.uk>
Date: Sat, 23 Feb 2013 09:02:07 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1361563821-7683-1-git-send-email-cristian.iorga@intel.com>
	<7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
In-Reply-To: <7EF31BEB21E340DBAFB08ABD4321A269@intel.com>
Subject: Re: [PATCH] connman: enable connman client
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Feb 2013 09:26:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/23/13 08:34, Ross Burton wrote:
> Hi Cristian,
>
> On Friday, 22 February 2013 at 20:10, Cristian Iorga wrote:
>> - --disable-client \
> I'd prefer to see an explicit --enable-client here to make it clear what we're turning on and off.
>   
>> + install -m 0755 ${S}/client/connmanctl ${D}${bindir}
> ${S} (source) should be ${B} (build), although at the moment they are the same directory I've been slowly working on changing that.
>
> Also the fact that you have to do this is depressing.  I wonder why upstream doesn't want to install any of the tools?

Connmanctl is a helper, even though I have connman in my image, I 
wouldn't want connmanctl. I assume this is why they don't ship it by 
default; as my use case is fairly normal for connman.

Which leads to the next point, this should be a seperate package.

>
> Ross
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



