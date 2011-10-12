Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1RE3Gu-0008Pl-J6
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 20:11:16 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 0AD91799088; Wed, 12 Oct 2011 20:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-249-031.pools.arcor-ip.net
	[88.71.249.31]) by gravedo.de (Postfix) with ESMTPSA id 99110799086;
	Wed, 12 Oct 2011 20:05:32 +0200 (CEST)
Message-ID: <4E95D6EB.4050703@gravedo.de>
Date: Wed, 12 Oct 2011 20:05:31 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<040b38fbd0ab7c7a1275b2e688dba177a907c716.1318405370.git.Martin.Jansa@gmail.com>
	<201110121023.52795.paul.eggleton@linux.intel.com>
In-Reply-To: <201110121023.52795.paul.eggleton@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 2/4] qt4-x11-free: bring back pkg-config fixups
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
X-List-Received-Date: Wed, 12 Oct 2011 18:11:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.10.2011 11:23, Paul Eggleton wrote:
> On Wednesday 12 October 2011 08:45:03 Martin Jansa wrote:
>> From: Simon Busch <morphis@gravedo.de>
>>
>> With b40b9c024be5e1ec81a31961158b3e6b529acfe0 some pkg-config fixups where
>> removed from qt4.inc which breaks the pkg-config files for qt4-embedded.
>> Without that the pkg-config files for qt4-x11-free are broken. So this
>> patch puts the fixes into the qt4-x11-free.inc file to be used by
>> qt4-x11-free and not qt4-embedded.
> 
> So why do we need these only in the X11 version? Surely they should be 
> applicable to both embedded and X11, or not at all...?

With b40b9c024be5e1ec81a31961158b3e6b529acfe0 I removed this fixups from
qt4.inc as I had problems with building agains qt4-embedded as cflags
were incorrect in the created pkg-config files.

Now I switched my application to x11 and got other problems with the
pkg-config files from qt4-x11-free which can be resolved with the fixups
I removed before.

So you are right we need them for qt4-x11-free but not for qt4-embedded.
I didn't investigated from where these differences are coming.

regards,
Simon

-- 
Simon Busch - http://mm.gravedo.de/blog/


