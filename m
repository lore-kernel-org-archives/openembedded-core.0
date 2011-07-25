Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlQcW-0006i4-U9
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 21:15:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6PJB3Oq027079
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 12:11:04 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 25 Jul 2011 12:11:03 -0700
Message-ID: <4E2DBFC6.70808@windriver.com>
Date: Mon, 25 Jul 2011 14:11:02 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<ec019a276e8c9b59f26bd492d9a37e3b8241aee3.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602925.30326.226.camel@phil-desktop>
In-Reply-To: <1311602925.30326.226.camel@phil-desktop>
Subject: Re: [PATCH 2/5] Fix recipe multilib header conflicts
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
X-List-Received-Date: Mon, 25 Jul 2011 19:15:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/25/11 9:08 AM, Phil Blundell wrote:
> On Mon, 2011-07-25 at 14:47 +0100, Richard Purdie wrote:
>> From: Mark Hatle <mark.hatle@windriver.com>
>>
>> Fix the issue where the generated header differs based on the bitsize of the
>> target at the time of building.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/recipes-devtools/binutils/binutils.inc        |    4 +++-
>>  .../linux-libc-headers-yocto_git.bb                |    5 ++++-
>>  .../linux-libc-headers_2.6.37.2.bb                 |    5 ++++-
>>  .../linux-libc-headers_2.6.39.bb                   |    5 +++++
>>  meta/recipes-support/apr/apr_1.4.2.bb              |    8 ++++++--
>>  meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    8 ++++++--
>>  6 files changed, 28 insertions(+), 7 deletions(-)
> 
> The changes in linux-libc-header and linux-libc-headers-yocto don't seem
> to be related to the description above. 

Yes, description is misleading.  The changes to the linux-libc-headers removed a
set of files that had different contents when built for different bitsize.

> Also, the binutils.inc change seems to be missing a PR bump.
> 
> The changes in apr and beecrypt look like they are probably fine, though
> it would be nice for the subject line to mention the names of the
> recipes being changed.

This can be split or kept as a unit.  I kept it as a single unit to show that
these changes are all related.  They don't change the contents of anything --
but resolve conflicts in header files.

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



