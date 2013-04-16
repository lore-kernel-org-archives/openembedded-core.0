Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1US1FN-0006Jl-IF
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 10:28:29 +0200
Message-ID: <516D0783.8040608@communistcode.co.uk>
Date: Tue, 16 Apr 2013 09:10:43 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4914614.5LoTVAGS7p@yiqingliang-pc>
In-Reply-To: <4914614.5LoTVAGS7p@yiqingliang-pc>
Subject: Re: gcc compile error
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
X-List-Received-Date: Tue, 16 Apr 2013 08:28:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/04/13 05:38, Yi Qingliang wrote:
> hello, i'm using archlinux, the gcc is 4.8.0.
>
> when compiling gcc 4.7.2 in oe, I got the error:
>
> | /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
> r19/gcc-4.7.2/libgcc/libgcc2.c: In function '__absvdi2':
> | /mnt/src/arm9plf-build/tmp/work-shared/gcc-4.7.2-
> r19/gcc-4.7.2/libgcc/libgcc2.c:273:1: internal compiler error: Segmentation
> fault
>
>
>

Hi,

Many people have run into this problem so far (myself included) and I 
have been told it is the fault of the ArchLinux GCC. Now, I noticed the 
ArchLinux devs pushed a new build of GCC out yesterday, have you tried 
upgrading to that yet and giving it another go?

If not, my solution was to move to GCC 4.8 using the patches posted to 
oe-core/oe-dev.

Regards,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



