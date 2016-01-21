Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3DEB5731AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 08:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 841772E1A1;
	Thu, 21 Jan 2016 09:16:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id fFfwnBGBu9Si; Thu, 21 Jan 2016 09:16:55 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 1AA7A2E19C;
	Thu, 21 Jan 2016 09:16:55 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id F03C112B7;
	Thu, 21 Jan 2016 09:16:54 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id E2D99F91;
	Thu, 21 Jan 2016 09:16:54 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id DE7503E478;
	Thu, 21 Jan 2016 09:16:54 +0100 (CET)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Thu, 21 Jan 2016
	09:16:54 +0100
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 86F489C724; 
	Thu, 21 Jan 2016 09:16:54 +0100 (CET)
Date: Thu, 21 Jan 2016 09:16:54 +0100
From: Olof Johansson <olof.johansson@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160121081654.GD31212@axis.com>
References: <cover.1453363852.git.liezhi.yang@windriver.com>
	<39e5a62da63a29ebd513bc2e926bd11f4b250227.1453363852.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <39e5a62da63a29ebd513bc2e926bd11f4b250227.1453363852.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA
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
X-List-Received-Date: Thu, 21 Jan 2016 08:17:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16-01-21 00:11 -0800, Robert Yang wrote:
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1098,6 +1098,7 @@ python do_package_qa () {
>  
>  do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
>  do_package_qa[rdeptask] = "do_packagedata"
> +do_package_qa[vardeps] += "${WARN_QA} ${ERROR_QA}"

Shouldn't this be "WARN_QA ERROR_QA"? Or you'll get the expanded
values of the variables.

-- 
olofjn

