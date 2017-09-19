Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 505F378094;
	Tue, 19 Sep 2017 17:02:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8JH2otg023826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Sep 2017 10:02:50 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 19 Sep 2017 10:02:49 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
	<efbc10e5-7596-1a3d-e7f8-526cedf20394@windriver.com>
	<CAJTo0La5F6e8sADgUz7PQO9GzCDObGWdH7tQ7xD9wTaN74EDxw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <3da9ee13-d200-d242-4a0e-e3904193bbf1@windriver.com>
Date: Tue, 19 Sep 2017 13:02:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La5F6e8sADgUz7PQO9GzCDObGWdH7tQ7xD9wTaN74EDxw@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [oe] Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 17:02:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Add oe-core, oe-devel back after checking privately with Ross.

On 2017-09-19 12:38 PM, Burton, Ross wrote:
> On 19 September 2017 at 17:29, Randy MacLeod 
> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote:
> 
>     On 2017-09-19 04:09 AM, Burton, Ross wrote:
> 
>         Then the tarball for one of Erlang's repositories changed, and
>         was noticed
>         by the checksum in the recipe (thanks Gunnar Andersson for reporting
>         this).  The extracted contents are identical, but the tarball
>         itself has
>         changed.  I'm presuming this is due to the old tarball expiring
>         in their
>         cache, and a newly generated tarball using a later version of tar.
> 
>         So we now have documented evidence that this can and does
>         happen, and it's
>         quite frustrating when this happens.  So, I suggest that use of
>         github.com <http://github.com>
>         /archive/  URLs be considered a bad practise for the primary
>         SRC_URI tarball.
> 
> 
>     Agreed but it's a shame to have to deal with this as users rather
>     than have github fix the problem.
> 
>     Could report a bug if it's not already known?
>     https://github.com/contact
> 
> 
> They know, and don't commit to the /archive/ tarballs being persistent.  
> They're for convenience and if the project owner wants a stable tarball 
> they should upload one (that's almost quoted verbatim from my mails with 
> github).
> 
> Last time I looked they were generated on demand using git-archive and 
> cached for "some time" on AWS.  If nobody access the tarball for a while 
> it will fall off AWS and then be re-generated.  The output from 
> git-archive will be identical but eg a new tar may write a different 
> byte stream for the same input.

Ugh, but I guess it makes sense from their point of view since
they're all about the git repos.

Thanks for the background info Ross,

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

