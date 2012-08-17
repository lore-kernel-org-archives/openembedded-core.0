Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T2SuY-0007Nq-O8
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 22:12:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7HK0oKj012096
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:00:50 -0700 (PDT)
Received: from msp-dhcp4.wrs.com (172.25.34.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 17 Aug 2012 13:00:49 -0700
Message-ID: <502EA2EE.8040506@windriver.com>
Date: Fri, 17 Aug 2012 15:00:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120814204116.6ba1ff3d@e6410-2>
In-Reply-To: <20120814204116.6ba1ff3d@e6410-2>
Subject: Re: RFC: Move PSEUDO_LOCALSTATEDIR for filesystems outside the filesystem
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
X-List-Received-Date: Fri, 17 Aug 2012 20:12:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/12 8:41 PM, Peter Seebach wrote:
> Got a bug related to this that probably only affects our build
> environment, but it caused me to note:
>
> When we're using export/dist as a user-mode NFS root (under pseudo),
> the PSEUDO_LOCALSTATEDIR is export/dist/var/pseudo.
>
> This seems a bit weird to me -- I don't think pseudo's db should be
> part of the filesystem it's maintaining. And I'm wondering whether
> there is a historical reason for this that I need to be aware of,
> before I propose moving it to something like export/pseudo.
>
> ... And if not, I propose we move it to something like export/pseudo.

The NFS export scripts and such expect the pseudo DB to be available to them. 
The filesystem can be anywhere the user wants, so somehow we have to know where 
it was extracted, and the only answer we came up with at the time was to put the 
pseudo database into the filesystem directory.  It doesn't cause any harm to the 
target that is being booted, and it ensures that the NFS server setup scripts 
know where the both the root and pseudo DBs are located.

--Mark

> -s
>



