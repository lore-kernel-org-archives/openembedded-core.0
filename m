Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QKEJ3-00010S-Oz
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 20:38:46 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QKEGL-0003PS-Iv from Tom_Rini@mentor.com ;
	Wed, 11 May 2011 11:35:57 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 11 May 2011 11:35:47 -0700
Received: from [172.30.80.16] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 11 May 2011 11:35:46 -0700
Message-ID: <4DCAD6EE.5050609@mentor.com>
Date: Wed, 11 May 2011 11:35:26 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <4DCAB609.8030601@linux.intel.com>
In-Reply-To: <4DCAB609.8030601@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 11 May 2011 18:35:47.0162 (UTC)
	FILETIME=[3E867BA0:01CC100A]
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: RFC: create-pull-request / send-pull-request updates
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
X-List-Received-Date: Wed, 11 May 2011 18:38:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/11/2011 09:15 AM, Darren Hart wrote:
> Between myself and others, there are several outstanding proposals to
> modify the pull-request scripts. Patches have been sent, but nothing has
> been merged due to a lack of consensus. I thought I would summarize what
> I see to be the current weaknesses of the scripts and my proposal to
> address them. I would like your feedback to ensure we have tools that
> meet the needs of a broad user base. Once we agree, I'll be happy to
> write up the patches or help review those written by others.

Thanks for taking this up!

[snip]
> 2) create-pull-request needs to facilitate the use of multiple
>    repositories (Tom Rini)

So long as (a) it's supported and (b) it's easy to use, I'm fine with
however you want to implement it :)  Which brings me to...

[snip]
> 3) Rewrite the scripts in python (Tom)
> 
>    While I agree that anything of any significant complexity is better
>    written in python than bash, I feel that with the above changes, the
>    current scripts will be smaller and remain simple enough for bash to
>    be a viable option.
> 
>    I propose we leave the scripts in bash for the time being, leaving
>    the door open to rewrite them at a later date should their complexity
>    increase to merit the effort.

To me, dealing with some sort of prefs file means non-bash.  But if you
can figure out everything that's needed with a little bit of asking git
and a little bit of standard-shell-magic (which it sounds like you can),
yeah, keeping it in bash is fine.

-- 
Tom Rini
Mentor Graphics Corporation


