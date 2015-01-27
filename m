Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3FB718DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 16:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0RGHVoL021411; Tue, 27 Jan 2015 16:17:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ltkTR60gkFSj; Tue, 27 Jan 2015 16:17:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0RGH7xG021386
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Jan 2015 16:17:30 GMT
Message-ID: <1422375427.19798.55.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 27 Jan 2015 16:17:07 +0000
In-Reply-To: <54C7B296.5020506@windriver.com>
References: <1422372551.19798.53.camel@linuxfoundation.org>
	<54C7B296.5020506@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Add missing depends on virtual/kernel for depmod data
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
X-List-Received-Date: Tue, 27 Jan 2015 16:17:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-01-27 at 10:45 -0500, Bruce Ashfield wrote:
> On 15-01-27 10:29 AM, Richard Purdie wrote:
> > We need the depmod data so that the kernel depmod command works successfully
> > at rootfs time. The fact this was working inconsistently is now highlighted
> > after the command was made to error out. A simple test case is:
> >
> > bitbake virtual/kernel image
> > bitbake vrituak/kernel -c clean
> > bitbake image -c rootfs -f
> >
> > We fix it by adding the missing dependency.
> 
> Looks good here.
> 
> Out of curiosity, was this hiding before, or did it only come about due
> to our recent moves to the work-shared kernel builds ?

It was hiding before, it just used to silently do things differently
depending on whether certain files were present or not. Now we get a
hard error.

Cheers,

Richard


