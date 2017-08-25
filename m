Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C78C1783AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 12:29:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7PCT3US012015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 25 Aug 2017 13:29:04 +0100
Message-ID: <1503664143.32591.229.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Alarcon <jose.alarcon@ge.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 13:29:03 +0100
In-Reply-To: <20170825064339.181395-1-jose.alarcon@ge.com>
References: <20170825064339.181395-1-jose.alarcon@ge.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 25 Aug 2017 13:29:04 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH resend] meta/classes: add class to test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Fri, 25 Aug 2017 12:29:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-08-25 at 09:43 +0300, Jose Alarcon wrote:
> The do_rootfs log contains a number of unsatisfied package
> recommendations. At the moment those are only visible when
> reviewing the rootfs log.
> 
> This class adds an extra check to surface any unsatisfied
> recommendation  as WARNINGS to the build output.
> 
> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
> ---
>  meta/classes/rootfs-check-recommends.bbclass | 21
> +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta/classes/rootfs-check-recommends.bbclass

This looks like it would be a better fit for rootfs-
postcommands.bbclass?

We want to try and avoid too many classes if we can help it.

Cheers,

Richard

