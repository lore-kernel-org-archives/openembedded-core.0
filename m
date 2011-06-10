Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QV3O3-0004ZB-LC
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 17:12:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5AF9HWc025691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 08:09:17 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 10 Jun 2011 08:09:17 -0700
Message-ID: <4DF2339C.5000609@windriver.com>
Date: Fri, 10 Jun 2011 10:09:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1307716082.25285.21.camel@phil-desktop>
In-Reply-To: <1307716082.25285.21.camel@phil-desktop>
Subject: Re: [PATCH] import recipe_sanity.bbclass from oe master
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
X-List-Received-Date: Fri, 10 Jun 2011 15:12:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/10/11 9:28 AM, Phil Blundell wrote:
> This is a verbatim copy of the corresponding class from oe master.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---

One of the new features we have in oe-core (likely not well publicized) is
"SUMMARY" information.

If this patch goes in, we likely should check for the existence of a SUMMARY as
well.  Not all recipes have package summaries, but in the end they all should.

--Mark

> +__recipe_sanity_reqvars = "DESCRIPTION"
> +__recipe_sanity_reqdiffvars = "LICENSE"



