Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CCE116A95B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:10:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7RAMNHG010566; Tue, 27 Aug 2013 11:22:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7WbqgVkSo13K; Tue, 27 Aug 2013 11:22:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7RAMJm2010544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 27 Aug 2013 11:22:21 +0100
Message-ID: <1377598192.32502.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Tue, 27 Aug 2013 11:09:52 +0100
In-Reply-To: <f1e2a5ea20351fbe0e1e0552462752a5f5c70330.1377587203.git.Qi.Chen@windriver.com>
References: <cover.1377587203.git.Qi.Chen@windriver.com>
	<f1e2a5ea20351fbe0e1e0552462752a5f5c70330.1377587203.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] runqemu-internal: change the lock acquire/release logic
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
X-List-Received-Date: Tue, 27 Aug 2013 10:10:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-27 at 15:08 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Checking whether the lock file exists is sufficient for runqemu.
> The contents of the lock file is not important.

What happens if the runqemu script crashes and leaves the lockfile
around? Why are we removing perfectly functional code?

Cheers,

Richard



