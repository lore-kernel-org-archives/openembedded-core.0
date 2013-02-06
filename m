Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U36QE-0001mh-QJ for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:56:27 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r16EjrVp004856; Wed, 6 Feb 2013 14:45:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xT0DK4e4YPcO; Wed,  6 Feb 2013 14:45:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r16Ejjlp004793
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 6 Feb 2013 14:45:48 GMT
Message-ID: <1360161619.28450.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Wed, 06 Feb 2013 14:40:19 +0000
In-Reply-To: <e952e3dadc8a912067a3385aec372e413dc23e02.1359362547.git.Qi.Chen@windriver.com>
References: <cover.1359362547.git.Qi.Chen@windriver.com>
	<e952e3dadc8a912067a3385aec372e413dc23e02.1359362547.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] populate-volatile.sh: improve this script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 14:56:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-28 at 17:05 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Here's a list of improvements:
> 1) Make it run correctly at rootfs time.
> 2) Handle link config items more reasonably.
> 3) Support read-only rootfs.
> 4) Avoid data loss when removing directories.
> 
> [YOCTO #3406]
> [YOCTO #3404]
> [YOCTO #3181]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../initscripts-1.0/populate-volatile.sh           |  287 ++++++++++----------
>  1 file changed, 143 insertions(+), 144 deletions(-)

I'm getting a little annoyed with this patch. Saul keeps sending it to
me, I keep seeing it and rejecting it.

I will not take code changes mixed in with whitespace reformatting. I've
said this once already.

This series should have a patch like:

http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=35f3369e5e6365aa06914862ef8a55e21f2fb73b

and then a follow up like:

http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=ca8ca587643caa81a6c6530dfead0db6fa8c27b6

which has the actual code changes in it. I did this just so I could see
what the patch was doing.

Next problem is that there are too many different code changes in this
to figure out what is going on and properly review it. It needs to be
split up further into logical changes with a clear explanation of what
is happening. Why was the cacheclear mechanism removed? Why isn't the
background parallelisation important (I know why when I think about it
but the commit message says nothing about it)?

There is also a typo of ROOT_DRI in there.

I will merge the whitespace change, just so I don't have to see it
again. Please split up the rest of the changes into a logical set and
resubmit. meld is a good tool for work like that.

Cheers,

Richard




