Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tvrpf-0002YY-4U
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:56:48 +0100
Message-ID: <50F81BA2.1030304@communistcode.co.uk>
Date: Thu, 17 Jan 2013 15:41:22 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <50F816A8.4080508@eumx.net> <50F816C9.5000504@communistcode.co.uk>
	<CABcZANn4fZGec9P3siPCSGWONP9p6gpW+U+s2JWyHcpq1Fc+YQ@mail.gmail.com>
In-Reply-To: <CABcZANn4fZGec9P3siPCSGWONP9p6gpW+U+s2JWyHcpq1Fc+YQ@mail.gmail.com>
Subject: Re: lttng-ust issue
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
X-List-Received-Date: Thu, 17 Jan 2013 15:56:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/13 15:23, Chris Larson wrote:
>
> On Thu, Jan 17, 2013 at 8:20 AM, Jack Mitchell <ml@communistcode.co.uk 
> <mailto:ml@communistcode.co.uk>> wrote:
>
>     On a build today I was hit with this error. I am at commit
>     169b9afcf2d357fdcf254a380d21d17701685834.
>
>     |  * check_data_file_clashes: Package lttng2-ust-dbg wants to install
>     file
>
>
> Don't install lttng2-ust :) It no longer exists.
> -- 
> Christopher Larson

Hmmm, none of my recipes specify lttng2, it seems to be an artifact from 
previous builds. How would I deal with this? I can't clean lttng2-ust as 
bitbake insists it doesn't exist....

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



