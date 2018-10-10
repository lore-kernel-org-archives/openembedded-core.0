Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 115B474743
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 18:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A68A2184F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:25:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id FEZD8S_huxP7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:25:23 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 22D131846A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:25:23 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD9671E09B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:25:22 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B213B1E09A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:25:22 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:25:22 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id A596A313;
	Wed, 10 Oct 2018 20:25:22 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 98EE19C118; Wed, 10 Oct 2018 20:25:22 +0200 (CEST)
Date: Wed, 10 Oct 2018 20:25:22 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Peter Kjellerstedt <pkj@axis.com>
Message-ID: <20181010182522.s5lncc5z4s2tqksj@axis.com>
Mail-Followup-To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20181010153528.9110-1-olofjn@axis.com>
	<fcb530f7332f441fb868ad51cd0bc50c@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <fcb530f7332f441fb868ad51cd0bc50c@XBOX02.axis.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool-source.bbclass: Only create each patch branch once
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
X-List-Received-Date: Wed, 10 Oct 2018 18:25:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18-10-10 17:48 +0200, Peter Kjellerstedt wrote:
> > Change-Id: I8adca0b54179793ca92478ad5b3b1b6e0448e26b
> 
> You probably want to remove the Change-Id before applying this...

Sorry! :( I'll probably forget to remove that again in the
future, I should try making git format-patch automatically strip
that. Thanks Peter!

-- 
olofjn

