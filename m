Return-Path: <sergeimir@emcraft.com>
Received: from ocean.emcraft.com (ocean.emcraft.com [185.75.190.205])
	by mail.openembedded.org (Postfix) with ESMTP id 4C02860670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:47:42 +0000 (UTC)
Received: from sergmir.emcraft.com ([172.17.0.19])
	by ocean.emcraft.com with esmtps (TLSv1:AES128-SHA:128) (Exim 4.76)
	(envelope-from <sergeimir@emcraft.com>)
	id 1bMWsI-00027q-FL; Mon, 11 Jul 2016 11:47:35 +0300
To: openembedded-core@lists.openembedded.org,
	Mariano Lopez <mariano.lopez@linux.intel.com>
References: <1467620748-20129-1-git-send-email-sergeimir@emcraft.com>
From: Sergei Miroshnichenko <sergeimir@emcraft.com>
Message-ID: <57835D26.7070004@emcraft.com>
Date: Mon, 11 Jul 2016 11:47:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1467620748-20129-1-git-send-email-sergeimir@emcraft.com>
Cc: Roger Meier <r.meier@siemens.com>,
	Alexander Dyachenko <sasha_d@emcraft.com>
Subject: Re: [PATCH v2 0/1] license: Add support for SPDX 2.0 operators
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
X-List-Received-Date: Mon, 11 Jul 2016 08:47:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping

Thanks,
Sergei

On 07/04/2016 11:25 AM, Sergei Miroshnichenko wrote:
> Composite SPDX license expressions can be constructed using "OR",
> "AND" and "WITH" operators: map them to "|" and "&" operators
> accordingly.
> 
> Recognize long form license identifiers: "[DocumentRef-XXX:][LicenseRef-]YYY".
> 
> Tested on the following expressions:
> LICENSE = "Artistic-1.0"
> LICENSE = "LicenseRef-Artistic-1.0 AND NASA-1.3"
> LICENSE = "(LicenseRef-Artistic-1.0 WITH GPL-3.0-with-GCC-exception)
>            OR (DocumentRef-spdx-tool-1.2:LicenseRef-NASA-1.3 AND GPL-2.0+)"
> 
> Reference:
> https://spdx.org/sites/spdx/files/SPDX-2.0.pdf Appendix IV: SPDX License Expression
> 
> Sergei Miroshnichenko (1):
>   license: Add support for SPDX 2.0 operators
> 
>  meta/classes/license.bbclass | 17 ++++++++++-------
>  meta/lib/oe/license.py       | 21 ++++++++++++++++-----
>  2 files changed, 26 insertions(+), 12 deletions(-)
> 

