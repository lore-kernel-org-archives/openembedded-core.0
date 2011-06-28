Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QbhBP-0003lo-2x
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 00:55:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2011 15:51:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="19444797"
Received: from miles.jf.intel.com (HELO [10.7.199.155]) ([10.7.199.155])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2011 15:51:20 -0700
Message-ID: <4E0A5AE5.7000509@intel.com>
Date: Tue, 28 Jun 2011 15:51:17 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
In-Reply-To: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
Subject: Re: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Tue, 28 Jun 2011 22:55:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 03:41 PM, Khem Raj wrote:
> ERROR: Multiple .bb files are due to be built which each provide ssh
> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52.bb
> /home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.8p2.bb).
>   This usually means one provides something the other doesn't and should.
> ERROR: Multiple .bb files are due to be built which each provide sshd
> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-core/dropbear/dropbear_0.52.bb
> /home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-connectivity/openssh/openssh_5.8p2.bb).
>   This usually means one provides something the other doesn't and should.
>
> reason is that dropbear only provides ssh and sshd packages openssh
> provides a few more e.g. openssh-sftp-server which is demanded by
> some images and at same time wants dropbear to provide sshd and ssh
>
> Now both recipes are to be built but are in contention for providing
> ssh and sshd
>
> How to solve this problem. ? Are other packages that openssh provides
> strictly depending on ssh/sshd from openssh ? or will they work on
> any ssh/sshd ?
>
> If they are independent then may be the openssh recipe should be
> divided into openssh-ssh and openssh-rest so one can use openssh
> provided daemon or dropbear provided as they wish

I've run into that and have been wondering how to resolve it as well.

If there are currently existing images which are pulling in dropbear's 
ssh and sshd while using openssh's sftp-server, then that would imply 
they can work independently, even though that combo seems like an 
aggressive space optimization that I would tend to avoid.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


