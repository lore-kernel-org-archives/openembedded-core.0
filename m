Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03EDC60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 10:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5593918101;
	Thu, 30 Jul 2015 12:14:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id uyGlo2hYvvi6; Thu, 30 Jul 2015 12:14:47 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id D61DD180E8;
	Thu, 30 Jul 2015 12:14:47 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id BF302122C;
	Thu, 30 Jul 2015 12:14:47 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id B3D54B8B;
	Thu, 30 Jul 2015 12:14:47 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id B12803E049;
	Thu, 30 Jul 2015 12:14:47 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Thu, 30 Jul 2015
	12:14:47 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 6A8729C68B; 
	Thu, 30 Jul 2015 12:14:47 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0La3miv94cfGvYYu6sDDyzw0X7e7-E7yosuKQb6FiQW9Ug@mail.gmail.com>
References: <1438249425-5423-1-git-send-email-olofjn@axis.com>
	<CAJTo0La3miv94cfGvYYu6sDDyzw0X7e7-E7yosuKQb6FiQW9Ug@mail.gmail.com>
Date: Thu, 30 Jul 2015 12:14:47 +0200
Message-ID: <1438250482-sup-5358@axis.com>
User-Agent: Sup/0.20.0
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Don't warn about "invalid" PACKAGECONFIGs by default
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
X-List-Received-Date: Thu, 30 Jul 2015 10:14:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Excerpts from Burton, Ross's message of 2015-07-30 11:53:39 +0200:
> Can you elaborate on what this approach you refer to is?

For some of our internal recipes, we export a list of PACKAGECONFIGs regardless
of their use in the recipe. This is to make sure the list is synchronized over
all the affected recipes.

-- 
olof johansson

