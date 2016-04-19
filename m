Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 56B226010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 07:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3J7Iqq1007264; Tue, 19 Apr 2016 08:20:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nFbDnHeLFQ78; Tue, 19 Apr 2016 08:20:11 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3J7K6KH007331
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 Apr 2016 08:20:08 +0100
Message-ID: <1461050406.9308.226.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Tue, 19 Apr 2016 08:20:06 +0100
In-Reply-To: <2192667.VMn04Uynna@peggleto-mobl.ger.corp.intel.com>
References: <cover.1460947932.git.liezhi.yang@windriver.com>
	<1dc231d4e16a29c432524c1dcbce24be1e5e61cc.1460947932.git.liezhi.yang@windriver.com>
	<CAJTo0LY7wbsghY5ypPSKAQ5tPN=pJkmQ=ZsC8+8SjARBqh4zoQ@mail.gmail.com>
	<2192667.VMn04Uynna@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] meta.bbclass: set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Tue, 19 Apr 2016 07:20:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-04-19 at 15:33 +1200, Paul Eggleton wrote:
> On Mon, 18 Apr 2016 21:27:25 Burton, Ross wrote:
> > On 18 April 2016 at 03:57, Robert Yang <liezhi.yang@windriver.com>
> > wrote:
> > > The recipe which inherits meta.bbclass doesn't require any
> > > default deps.
> > 
> > meta is only inherited by one class (populate_sdk_base.bbclass) and
> > three
> > recipes (two of which indirectly inherit populate_sdk_base) so do
> > we really
> > need this class?  Maybe we should drop it in the 2.2 cycle.
> 
> I don't think we ought to be in too much of a hurry to remove this -
> it's 
> still a handy class. Besides I was planning on using it to solve this
> issue:
> 
>   https://bugzilla.yoctoproject.org/show_bug.cgi?id=9257 

I have the opposite view. Its pretty much impossible to tell what a
"meta" class would do from its name or have any idea of whether a given
change should be added to the class since its purpose is so vague.

I'l like to see it renamed to something more useful, or removed given
its just two lines...

Cheers,

Richard

