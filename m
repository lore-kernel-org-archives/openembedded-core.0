Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 80E6F6E87E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:53:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0TCr2df031010; Wed, 29 Jan 2014 12:53:02 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id A7N9luhsBSCg; Wed, 29 Jan 2014 12:53:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0TCqxw7031006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 29 Jan 2014 12:53:00 GMT
Message-ID: <1390999973.24655.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laszlo Papp <lpapp@kde.org>
Date: Wed, 29 Jan 2014 12:52:53 +0000
In-Reply-To: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: daniel.elstner@kdab.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ROOT_HOME: /home/root
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
X-List-Received-Date: Wed, 29 Jan 2014 12:53:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
> Hi,
> 
> Is there any obstacle why this cannot be /root as per default Unix
> philosophy [1]?
> 
> It is not an unusual that the /home partition is a separate, and the
> sysadmins would like to manage the core system without getting that
> partition mounted, etc.
> 
> It is true that it would be possible to work that around, but /root as
> a default just feels so much more natural on a Unix system.
> 
> What I currently see after talking to a few people, the people keep
> changing it in their layer (distribution) config. It looks sub-optimal
> at first, but perhaps there are still valid reasons to keep this
> around?
> 
> I was told on IRC the first embedded debian may have done it to keep
> rootfs read-only. First, you can remount the root partition on jffs2,
> ubifs, etc... as R/W.
> 
> Even if you could not, you can have a separate /root partition which
> is a good idea anyway to keep the super-user separate from the
> "regular" users. If that is not OK, there is still the option for the
> minority to override it to /home/root if really needed, but I
> personally do not think it should be...
> 
> So, all in all, I am in favor of changing this back to /root to be
> more linux-y and well-separated from the normal users.
> 
> Unfortunately, it would lead to some breakages out there when they
> update Yocto, so it may not be acceptable in this project. I do not
> know the rules. The migration could be aided though with some proper
> documentation.

These directories can be configured by the user extremely easily. By
having a default of /home/root/ we can catch software that has issues
with relocation of that. Having the writeable user data in one directory
like this is useful for several classes of embedded style devices.

So to be honest I don't see a pressing reason to change this.

Cheers,

Richard


