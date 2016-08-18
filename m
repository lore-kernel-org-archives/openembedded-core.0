Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 73B62731CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7IGtUTI016592; Thu, 18 Aug 2016 17:55:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xz04f_IV6VOd; Thu, 18 Aug 2016 17:55:30 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7IGtPux016589
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Aug 2016 17:55:26 +0100
Message-ID: <1471539325.16712.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Awais Belal <awais_belal@mentor.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 17:55:25 +0100
In-Reply-To: <1471523878-32164-1-git-send-email-awais_belal@mentor.com>
References: <1471523878-32164-1-git-send-email-awais_belal@mentor.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] insane.bbclass: handle INSANE_SKIP for license-checksum
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
X-List-Received-Date: Thu, 18 Aug 2016 16:55:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-08-18 at 17:37 +0500, Awais Belal wrote:
> The function populate_lic_qa_checksum() is used to do the
> QA test for license-checksum but it does not handle the
> scenario where a package adds license-checksum to its
> INSANE_SKIP and hence fails in such condition.
> This patch adds handling of INSANE_SKIP to the
> populate_lic_qa_checksum() function so it returns
> cleanly in such a scenario.

license-checksum is not per package. Its already handled based on
WARN_QA and ERROR_QA so I don't think we need to complicate this
further. You could for example set:

WARN_QA_remove_pn-XXX = "license-check"
ERROR_QA_remove_pn-XXX = "license-check"

Skipping license checksums is likely a bad idea anyway and not
something we want to make easier?

Cheers,

Richard


