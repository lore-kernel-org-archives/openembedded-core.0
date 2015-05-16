Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D613473D7E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 May 2015 21:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4GLYQnC010164; Sat, 16 May 2015 22:34:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FredhS_WwhgG; Sat, 16 May 2015 22:34:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4GLYA0t010161
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 16 May 2015 22:34:22 +0100
Message-ID: <1431812050.4956.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Sat, 16 May 2015 22:34:10 +0100
In-Reply-To: <55555B65.80600@windriver.com>
References: <55555B65.80600@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe> ?
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
X-List-Received-Date: Sat, 16 May 2015 21:34:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:
> Hello,
> 
> Is is useful/possible if we add something like bitbake <recipe> -cmenuconfig,
> just like kernel's make menuconfig ?
> 
> We can use the menuconfig to config the vars such as MACHINE, DL_DIR,
> DISTRO_FEATURES, MACHINE_FEATURES and all the variables which are
> configurable, I think that this would help the newbie a lot.
> 
> I think that we can add a menuconfig.bbclass (or other names) to do this,
> and I'd like to work on it.

Why would you want to specify a <recipe> when configuring MACHINE? I
understand why you're thinking this but it isn't well thought out and in
this form would confuse users more than help them.

I don't think the system will even parse without a valid MACHINE, let
alone execute tasks.

Cheers,

Richard


