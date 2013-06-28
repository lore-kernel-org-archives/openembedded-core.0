Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5D66C6AEEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:48:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5S9tLag022461; Fri, 28 Jun 2013 10:55:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6E_RjRHbhV34; Fri, 28 Jun 2013 10:55:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5S9tE6C022456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 28 Jun 2013 10:55:16 +0100
Message-ID: <1372412888.9930.250.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Fri, 28 Jun 2013 10:48:08 +0100
In-Reply-To: <046be676719830bf994889ee23db12db1a0ce287.1372386599.git.Qi.Chen@windriver.com>
References: <cover.1372386599.git.Qi.Chen@windriver.com>
	<046be676719830bf994889ee23db12db1a0ce287.1372386599.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base-files: remove the unnecessary /media/xxx directories
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
X-List-Received-Date: Fri, 28 Jun 2013 09:48:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-28 at 15:48 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> A few directories under /media were created by default, /media/card,
> /media/ram, /media/realroot, etc.
> 
> These directories actually have no real usage now, thus removing them.
> 
> The /media/ram entry in the fstab is also removed, as mounting a tmpfs
> over /media/ram in our system brings no benefit.
> 
> Note that a duplicate '/mnt' entry in dirs755 are also removed.
> 
> [Yocto #4774]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Just to be clear, most of these date around 10 years from OpenZaurus and
similar times. We now automount media and there is no real need for
these specific directories or the ramfs. If there is some need in legacy
systems (I did wonder about opie), I'd suggest they get created by them
rather than the core base-files.

Cheers,

Richard


