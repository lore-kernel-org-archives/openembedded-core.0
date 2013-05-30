Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 05C94608CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 19:58:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UK2qpk013076; Thu, 30 May 2013 21:02:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YjpriQqvgT1S; Thu, 30 May 2013 21:02:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UK2n7G013070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 21:02:51 +0100
Message-ID: <1369943898.14887.328.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Thu, 30 May 2013 20:58:18 +0100
In-Reply-To: <d3bc55086bd5ab4f56dbad4d302beafc49fe0a84.1369916015.git.pkj@axis.com>
References: <cover.1369916015.git.pkj@axis.com>
	<d3bc55086bd5ab4f56dbad4d302beafc49fe0a84.1369916015.git.pkj@axis.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 5/5] makedevs: Make count actually behave as a count for device blocks
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
X-List-Received-Date: Thu, 30 May 2013 19:58:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-30 at 14:18 +0200, Peter Kjellerstedt wrote:
> Previously count actually behaved as end, and did not take start into
> account.
> ---
>  meta/files/device_table-minimal.txt                      | 2 +-
>  meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

No signed-off-by line :(

I merged the others.

Cheers,

Richard


