Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TE6Yc-0000Vb-NK
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:46:18 +0200
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 4B8CA28E44;
	Tue, 18 Sep 2012 15:33:39 -0700 (PDT)
Message-ID: <5058F6C1.8080701@windriver.com>
Date: Tue, 18 Sep 2012 15:33:37 -0700
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1348004325-30668-1-git-send-email-andy.ross@windriver.com>
	<1348004325-30668-2-git-send-email-andy.ross@windriver.com>
	<1348004325-30668-3-git-send-email-andy.ross@windriver.com>
	<5058F4C5.9030903@linux.intel.com>
In-Reply-To: <5058F4C5.9030903@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev-extraconf: Don't mount root filesystem under /media
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 22:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 03:25 PM, Saul Wold wrote:
> How much bigger does this make the busybox image?

These binaries are manually stripped and not prelinked, but probably
close enough:

-rwxr-xr-x. 1 andy andy 557312 Sep 18 15:30 busybox-r0
-rwxr-xr-x. 1 andy andy 561696 Sep 18 15:30 busybox-r1

So 4k or 0.8%, basically.

Andy



