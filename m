Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QTyl5-0003V2-7M
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 18:03:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p57G0e1V009656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 09:00:40 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 7 Jun 2011 09:00:40 -0700
Message-ID: <4DEE4B27.7030308@windriver.com>
Date: Tue, 7 Jun 2011 11:00:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1307102133.2529.260.camel@phil-desktop>	<4DEE44BF.1060308@linux.intel.com>
	<1307461872.2529.4771.camel@phil-desktop>
In-Reply-To: <1307461872.2529.4771.camel@phil-desktop>
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Tue, 07 Jun 2011 16:03:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/7/11 10:51 AM, Phil Blundell wrote:
> On Tue, 2011-06-07 at 08:33 -0700, Saul Wold wrote:
>> This patch has not comments, Upstream-Status, or Sign-off-by.
>>
>> Please add these so we have some history to this patch and can determine 
>> if it should be upstreamed.
> 
> Is there some documentation which describes how Upstream-Status is meant
> to be set?

Blame me.. the submission guide info has been sent out in draft, and I'm working
to get the final version done today.

Below is the chunk on the upstream status (from the last revision -- the fifth
revision):

Patch Header Recommendations
----------------------------
In order to keep track of patches and ultimately reduce the number of patches
that are required to be maintained, we need to track the status of the patches
that are created. The following items are specific to patches applied by recipes.

In addition to the items mentioned above, we also want to track if it's
appropriate to get this particular patch into the upstream project. Since we
want to track this information, we need a consistent tag and set of status that
can be searched.

While adding this tracking information to the patch headers is currently optional,
it is highly recommended and some maintainers may require it.  It is optional at
this time so that it can be evaluated as to it's usefulness over time.  Existing
patches will be modified with the tag as they are modified.

As mentioned in the above, be sure to include any URL to bug tracking, mailing
lists or other reference material pertaining to the patch. Then add a new tag
"Upstream-Status:" which contains one of the following items:

   Pending
   - No determination has been made yet or not yet submitted to upstream

   Submitted [where]
   - Submitted to upstream, waiting approval
   - Optionally include where it was submitted, such as the author, mailing
     list, etc.

   Accepted
   - Accepted in upstream, expect it to be removed at next update, include
     expected version info

   Backport
   - Backported from new upstream version, because we are at a fixed version,
     include upstream version info

   Denied
   - Not accepted by upstream, include reason in patch

   Inappropriate [reason]
   - The patch is not appropriate for upstream, include a brief reason on the
     same line enclosed with []
     reason can be:
       not author (You are not the author and do not intend to upstream this,
                   source must be listed in the comments)
       native
       licensing
       configuration
       enable feature
       disable feature
       bugfix (add bug URL here)
       embedded specific
       no upstream (the upstream is no longer available -- dead project)
       other (give details in comments)

The various "Inappropriate [reason]" status items are meant to indicate that the
person reasonable for adding this patch to the system does not intend to upstream
the patch for a specific reason.  Unless otherwise noted, another person could
submit this patch to the upstream, if they do the status should be changed to
"Submitted [where]", and an additional signed-off-by: line added to the patch by
the person claiming responsibility for upstreaming.

For example, if the patch has been submitted upstream:

   rpm: Adjusted the foo setting in bar

   [RPM Ticket #65] -- http://rpm5.org/cvs/tktview?tn=65,5

   The foo setting in bar was decreased from X to X-50% in order to
   ensure we don't exhaust all system memory with foobar threads.

   Upstream-Status: Submitted [rpm5-devel@rpm5.org]

   Signed-off-by: Joe Developer <joe.developer@example.com>

A future commit can change the value to "Accepted" or "Denied" as appropriate.


