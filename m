Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9382360655
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 22:57:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LN0aI2011437; Wed, 22 May 2013 00:00:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ATZISBtX_RG8; Wed, 22 May 2013 00:00:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LN0POX011428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 22 May 2013 00:00:31 +0100
Message-ID: <1369177001.3843.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Tue, 21 May 2013 23:56:41 +0100
In-Reply-To: <519BB951.2040502@mlbassoc.com>
References: <51962FFE.3040202@mlbassoc.com> <1369127448.11013.16.camel@ted>
	<519BB951.2040502@mlbassoc.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Poor first impression
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2013 22:57:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-21 at 12:13 -0600, Gary Thomas wrote:
> On 2013-05-21 03:10, Richard Purdie wrote:
> > On Fri, 2013-05-17 at 07:26 -0600, Gary Thomas wrote:
> >> I just tried to run Poky/Yocto on a fresh Ubuntu 12.04 system.  I knew there would
> >> be missing bits and have seen the "sanity" messages in the past, so I thought I'd
> >> just carry on.  Today's experience was not pretty and would it not for my experience
> >> with this, I would have been very perplexed...
> >
> > There are two issues there, firstly the scripts/bitbake binary is doing
> > a really bad job, secondly, one of the improved debugging patches I
> > added to bitbake, regressed things in this case.
> >
> > I posted a patch to bitbake last night, I've just posted a fix for
> > scripts/bitbake now. These two together should improve this. I agree
> > that particular error would create a poor first impression, thanks for
> > reporting it.
> 
> With this patch, no 'git' and a fresh build I still get this:
> 
> Traceback (most recent call last):
>    File "/home/local/poky-multi/bitbake/bin/bitbake", line 293, in <module>
>      ret = main()
>    File "/home/local/poky-multi/bitbake/bin/bitbake", line 260, in main
>      event = server.event_queue.get(block=False)
>    File "/usr/lib/python2.6/multiprocessing/queues.py", line 104, in get
>      raise Empty
> Empty
> Pseudo is not present but is required, building this first before the main build
> Traceback (most recent call last):
>    File "/home/local/poky-multi/bitbake/bin/bitbake", line 293, in <module>
>      ret = main()
>    File "/home/local/poky-multi/bitbake/bin/bitbake", line 260, in main
>      event = server.event_queue.get(block=False)
>    File "/usr/lib/python2.6/multiprocessing/queues.py", line 104, in get
>      raise Empty
> Empty
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>      Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>      Following is the list of potential problems / advisories:
> 
>      Please install the following missing utilities: git
> 
> Still not very pretty.


Did you apply both patches, the one for bitbake and the one for OE-Core?
This looks like the bitbake one is missing.

Cheers,

Richard



