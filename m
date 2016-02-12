Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 281286B6F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 12:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1D5FB180C2;
	Fri, 12 Feb 2016 13:55:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id B1EGA-tEYJz4; Fri, 12 Feb 2016 13:54:59 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 6D4A0180A1;
	Fri, 12 Feb 2016 13:54:59 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E4AE41599;
	Fri, 12 Feb 2016 13:54:58 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id D8FC0779;
	Fri, 12 Feb 2016 13:54:58 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id D47973E31B;
	Fri, 12 Feb 2016 13:54:58 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id C12CF9C075; Fri, 12 Feb 2016 13:54:58 +0100 (CET)
Date: Fri, 12 Feb 2016 13:54:58 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: Dmitry Rozhkov <dmitry.rozhkov@intel.com>
Message-ID: <20160212125458.GA31212@axis.com>
References: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
MIME-Version: 1.0
In-Reply-To: <1455279342-5458-1-git-send-email-dmitry.rozhkov@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] os-release: remove double-quotes around VERSION_ID value
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
X-List-Received-Date: Fri, 12 Feb 2016 12:55:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16-02-12 14:15 +0200, Dmitry Rozhkov wrote:
> man 5 os-release states that VERSION_ID is
> 
> "
> a lower-case string (mostly numeric, no spaces or other
> characters outside of 0-9, a-z, ".", "_" and "-")
> identifying the operating system version
> "
> 
> This becomes crucial when ClearLinux's software
> update mechanism is integrated into builds, because
> its client side ignores VERSION_ID's value if it
> doesn't conform the definition.

On Debian, the value is quoted:

VERSION_ID="8"

So I think the documentation refers to the value of VERSION_ID,
with the surrounding quotes not being part of the *value*.

-- 
olofjn

