Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 21DBE6E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 10:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4JAI0iN031382; Thu, 19 May 2016 11:18:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rdZ-ExrPUove; Thu, 19 May 2016 11:18:00 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4JAHv2C031377
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 May 2016 11:17:58 +0100
Message-ID: <1463653077.4578.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Thu, 19 May 2016 11:17:57 +0100
In-Reply-To: <573D917C.4090002@windriver.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com> <573D2EAF.9010602@windriver.com>
	<1463651156.4578.113.camel@linuxfoundation.org>
	<573D917C.4090002@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 10:18:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-05-19 at 18:12 +0800, Robert Yang wrote:
> On 05/19/2016 05:45 PM, Richard Purdie wrote:
> > To be really clear, OE-Core will not have a different signature
> > policy
> > on release branches since that differing policy would break user
> > expectations and also wouldn't get tested apart from on the branch
> > so
> > we'd have less confidence it was working.
> 
> Yes, I agree with this, I just used stable release as an example (big
> changes won't happen on a stable release).
> 
> > 
> > Users are free to set their own policies, the system was designed
> > to do
> > that. If WindRiver wants to have a much more permissive policy, I'm
> > more than happy for them to do so.
> 
> Thanks, frankly speaking, not only WindRiver wants this. After cloud
> computing and virtualization gets hot, more and more users want to
> customize their own images (for saving disk space, memory and
> security
> reason), oe/yocto is very good at customizing images, so more and
> more people try to use it to build their own distros, where live
> upgrades becomes very important.

I understand that. So are we going to get binary diff working? Its the
only viable solution we have to the problem at the moment that I know
of. Randomly hacking bits of the signature generation isn't going to
help this unfortunately.

Cheers,

Richard


