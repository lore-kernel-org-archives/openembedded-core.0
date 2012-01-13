Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1Rldtw-0005qd-Nn
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 10:58:24 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 13 Jan 2012 11:50:53 +0200
Message-ID: <4F0FFE7D.4060006@bluegiga.com>
Date: Fri, 13 Jan 2012 11:50:53 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <1326067422-30771-1-git-send-email-andrei@gherzan.ro>	<4F0FD82D.80405@bluegiga.com>
	<CAK18fxHmd-pLX_nXcP1OZ7yQKnBFgyq6qqZ4wB38rabMEKPQ0Q@mail.gmail.com>
In-Reply-To: <CAK18fxHmd-pLX_nXcP1OZ7yQKnBFgyq6qqZ4wB38rabMEKPQ0Q@mail.gmail.com>
X-OriginalArrivalTime: 13 Jan 2012 09:50:53.0628 (UTC)
	FILETIME=[D6F2CFC0:01CCD1D8]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: defconfig modified in order to activate CONFIG_EXPR_MATH_SUPPORT_64
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
X-List-Received-Date: Fri, 13 Jan 2012 09:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2012 10:16 AM, Andrei Gherzan wrote:
> As i could see that patch has nothing in common with this bug. Yes, it
> uses expr from busybox... but that is all. No fix for 64bit numbers support.

Sorry, my fingers were faster than my head. I thought this bug was 
opened because of yocto time set issue:
https://lists.yoctoproject.org/pipermail/yocto/2012-January/006437.html

I see this is general issue. You can forget my previous message.

BR,
Lauri


