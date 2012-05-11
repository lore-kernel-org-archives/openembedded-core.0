Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SStvJ-0003Nf-9s
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:46:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 May 2012 10:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99048638"
Received: from unknown (HELO [10.255.12.250]) ([10.255.12.250])
	by AZSMGA002.ch.intel.com with ESMTP; 11 May 2012 10:36:40 -0700
Message-ID: <4FAD4E28.5030206@linux.intel.com>
Date: Fri, 11 May 2012 10:36:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1336524034.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336524034.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/2] Let uclibc provide rtld(GNU_HASH)
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
X-List-Received-Date: Fri, 11 May 2012 17:46:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2012 05:43 PM, Khem Raj wrote:
> We have seen reports where rtld(GNU_HASH) is found missing
> on uclibc based images infact uclibc rtld does provide GNU_HASH
> support as default so we add that to PROVIDES
>
> snapshot mirror url is changed. Currently the url will fetch
> html files which will end in corrupted downloads so we
> update the url location in mirrors class.
>
> The following changes since commit 043871d7e5d2d19c2ff43e54d2ff180c09e8903e:
>
>    kern-tools: integrate minor fixes (2012-05-08 16:06:15 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
>
> Khem Raj (2):
>    uclibc.inc: uclibc rtld does support GNU_HASH
>    classes/mirrors.bbclass: Point snapshot.debian.org mirror to working
>      location
>
>   meta/classes/mirrors.bbclass        |    2 +-
>   meta/recipes-core/uclibc/uclibc.inc |    3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


