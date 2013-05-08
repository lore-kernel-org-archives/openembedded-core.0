Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Ua1NV-0006CS-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 12:13:42 +0200
Message-ID: <518A2119.3010601@communistcode.co.uk>
Date: Wed, 08 May 2013 10:55:37 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130428 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
	<0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
	<51628545.6050106@communistcode.co.uk>
	<5162888A.90502@communistcode.co.uk>
	<6488B785-095B-4077-96A6-0E2004900C68@gmail.com>
In-Reply-To: <6488B785-095B-4077-96A6-0E2004900C68@gmail.com>
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	"openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc-cross-initial Failure (is a meta-aarch64 screw up)
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
X-List-Received-Date: Wed, 08 May 2013 10:13:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/13 03:23, Khem Raj wrote:
> Hi Jack
>
> since I was playing with archlinux today, I could reproduce this gcc ICE problem with angstrom. Actual issue has been already fixed with
>
> http://git.openembedded.org/openembedded-core/commit/?id=b1dc91969f9bb0c2a3a4336f5e9a2f57aabb9f78
>
> but it was still failing on angstrom/cortex-a8-hf and it took some time to realize that angstrom is including meta-aarch64 layer and
> it has totally totally screwed up the toolchain build since this layer forked the .inc files from oe-core gcc at some point and never did kept them
> in sync with OE-Core it meant that even when I wanted to use gcc 4.7 from OE-Core it was picking .incs from meta-aarch64 and the patch
> which was applied to OE-Core recently has been ignored and hence the gcc ICE
>
> <snip>

Thanks for the follow up Khem, I jumped to your GCC 4.8 patches so I 
haven't been following the progression of this but it's good to know 
it's been fixed.

Cheers,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



