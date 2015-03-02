Return-Path: <openembedded-devel@urbanec.net>
Received: from mail16.tpgi.com.au (mail16.tpgi.com.au [203.12.160.231])
	by mail.openembedded.org (Postfix) with ESMTP id 92D2872130
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:30:03 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Mon, 2 Mar 2015 21:30:00 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail16.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t22ATwpM020642
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 2 Mar 2015 21:30:00 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YSNbq-0000VW-92; Mon, 02 Mar 2015 21:29:58 +1100
Message-ID: <54F43BA5.8010101@urbanec.net>
Date: Mon, 02 Mar 2015 21:29:57 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>	<54F0756E.7020205@urbanec.net>
	<CAJTo0LbPVzhW9C7e3-2J45Yc5HiTEsby=c95PuaCRhF+bV01tQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbPVzhW9C7e3-2J45Yc5HiTEsby=c95PuaCRhF+bV01tQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/1] Python: Upgrade from 2.7.3 to 2.7.9
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
X-List-Received-Date: Mon, 02 Mar 2015 10:30:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/15 03:07, Burton, Ross wrote:
> IIRC the general argument is if that if you're assuming a self-signed
> certification is valid, you've lost so much security.  We're in the
> middle of a development cycle so this will only impact people using or
> moving to 1.8.

I'm completely in favour of this change from the security point of view. 
However, it is likely to trip up a few people, so the change in 
behaviour should be prominently highlighted in the release notes. I also 
think that it may be a good idea to keep 2.7.3 around so that it is 
possible to move to new oe-core and keep the old python around. I would 
not be surprised if there were other differences between 2.7.3 and 2.7.9 
that complicate life. My main rationale for keeping both 2.7.3 and 2.7.9 
would be that 2.7.9 can not be made backwards compatible when it comes 
to the SSL certificates. The only fix is at the source code level for 
every application that uses SSL based protocols or alternatively 
convincing the server operators to use certificates issued by well known 
CAs. For my use case scenario, that's not workable because the user of 
the device can download packages from third party feeds, including 
closed source plugins. Yes, 2.7.9 is doing the right thing, but in this 
case doing the right thing breaks too much stuff.

> I've just verified that python-imaging works for me (and works on the
> autobuilders), so if you can replicate the failure on demand that filing
> a bug would be useful.

Good to know that is is something that is specific to my setup. I'll 
look into it again when I have a little bit of time on my hands. Right 
now I've put python 2.7.3 in my local overlay and am using it to get 
work done.


