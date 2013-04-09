Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UPh4w-0004Ym-0H
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 00:32:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r39MESs7024365
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 15:14:28 -0700 (PDT)
Received: from msp-dhcp59.wrs.com (172.25.34.59) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Apr 2013 15:14:27 -0700
Message-ID: <516492C2.8030005@windriver.com>
Date: Tue, 9 Apr 2013 17:14:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
	<CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
	<3664366.6RB48HkoAG@helios>
	<CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
In-Reply-To: <CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
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
X-List-Received-Date: Tue, 09 Apr 2013 22:32:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/13 12:29 PM, Trevor Woerner wrote:
> On Mon, Apr 8, 2013 at 1:48 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Unfortunately I think this is specific to bash, so it may not be portable.
>> Maybe the equivalent can be achieved with sed however.
>
> Under which shells do we expect a Yocto build to succeed? The latest
> version of this change wouldn't work under tcsh, for example. (Not
> that I'm suggesting it should!) Isn't there already an inherent
> Bourne-ish expectation?

dash, ash, bash and zsh.  POSIX compliant shells.

These are the places I try to verify scripts that refer to /bin/sh.

--Mark

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



