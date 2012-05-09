Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SS9OK-0003Iv-75
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 18:05:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q49FtXsD028653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 08:55:33 -0700 (PDT)
Received: from msp-dhcp19.wrs.com (172.25.34.19) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 08:55:33 -0700
Message-ID: <4FAA9373.1030901@windriver.com>
Date: Wed, 9 May 2012 10:55:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
	<CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
	<CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
	<CAMKF1sp0-We3JrGue+J-scDv0JCOHg5O44G9AZaPO3xfzNO2AQ@mail.gmail.com>
	<4FAA8415.40006@windriver.com>
	<CAMKF1sp2x-JmNkx4+Exg=jFndVk_mfTfvNLO7DrUB-KhZPqbGw@mail.gmail.com>
In-Reply-To: <CAMKF1sp2x-JmNkx4+Exg=jFndVk_mfTfvNLO7DrUB-KhZPqbGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Wed, 09 May 2012 16:05:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/12 10:47 AM, Khem Raj wrote:
> On Wed, May 9, 2012 at 7:49 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> The per-file "advanced" dependencies, which are not yet being used by ipkg
>> or deb, include a marker for rtld support.  The libc on the system needs to
>> have a provide that it supports GNU_HASH, otherwise a missing dependency
>> occurs and the system knows the package and libc has a mismatch.
>
> I would assume that this was needed when transition for sysv hash to
> gnu hash was going on. Now that GNU_HASH is default in OE for long
> time this kind of
> makes it redundant unless I am missing something w.r.t. advanced dependency
> support. What is it exactly doing ?

In the RPM case it was for people who download random binary packages from 
upstream sources and attempt to install them.  If the local system doesn't 
support GNU_HASH then it won't work.

I thought it was still possible to build and configure a system w/ no GNU_HASH 
dependencies (or even support).

I know OE itself probably doesn't have this problem, OE-Core certainly 
shouldn't.. but it's external binary package cases that cause problems.

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



