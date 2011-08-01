Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QntwW-0004gT-Bg
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 16:58:08 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p71Erl3m026619
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 07:53:47 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 1 Aug 2011 07:53:47 -0700
Message-ID: <4E36BDFA.4020409@windriver.com>
Date: Mon, 1 Aug 2011 09:53:46 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312208782-14078-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
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
X-List-Received-Date: Mon, 01 Aug 2011 14:58:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/1/11 9:26 AM, Kumar Gala wrote:
> Some of powerpc's dont support the fsqrt[s] instructions so we need an
> implementation of the library functions for those processors.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  .../recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch |  538 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
>  2 files changed, 540 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/ppc-sqrt.patch

I'm a bit confused by this patch.  Why is gcc even generating (or trying to) the
fsqrt instructions on cores that don't have it?  Did someone optimize gcc so
that it always requires fsqrt on PPC?  (This is horribly broken behavior BTW...)

As for the patch, I don't object.. but this just looks like the wrong solution
to me..

--Mark


