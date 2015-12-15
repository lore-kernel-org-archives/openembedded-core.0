Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 85B3473193
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:30:06 +0000 (UTC)
Received: (qmail 9630 invoked by uid 1003); 15 Dec 2015 16:30:07 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@108.44.110.59)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	15 Dec 2015 16:30:06 -0000
To: Mariano Lopez <mariano.lopez@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
References: <567039E1.5000205@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <5670400E.6030201@balister.org>
Date: Tue, 15 Dec 2015 11:30:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <567039E1.5000205@linux.intel.com>
Subject: Re: [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Tue, 15 Dec 2015 16:30:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I also suggest copying the

https://lists.yoctoproject.org/listinfo/yocto-security

list.

Philip

On 12/15/2015 11:03 AM, Mariano Lopez wrote:
> There is an initiative to track vulnerable software being built (see
> bugs 8119 and 7515). The idea is to have a testing tool that would check
> the recipe versions against CVEs. In order to accomplish such task there
> is need to reliable mark the patches from upstream that solve CVEs.
> 
> There have been two options to mark the patches that solve CVEs:
> 
> 1. Have  "CVE" and the CVE number as the patch filename.
>   Pros:
>     Doesn't require a new tag.
>   Cons:
>     It is not flexible to add more information, for example two CVEs in
> the same patch
> 
> 2. Add a new tag in the patch that have the CVE information.
>   Pros:
>     It is flexible and can add more information.
>   Cons:
>     Require a change in the patch metadata.
> 
> What I would recommend is to add a new tag in the patch, it must contain
> the CVE ID. With this it would be possible to look for the CVE
> information easily in the testing tool or in NIST, MITRE, or another web
> page. For example, this would be part of the patch for CVE-2013-6435,
> currently in OE-Core:
> 
> -- snip --
> 
> Upstream-Status: Backport
> CVE: CVE-2013-6435
> 
> Reference:
> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435
> 
> -- snip --
> 
> The expected output of this discussion is a standard format for CVE
> patches that most, if not all, of community members agree on.
> 
> Please let me know your comments.
> 
> Cheers,
> 
> Mariano Lopez

