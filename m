Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F136577E43
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 08:49:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3E8nKik019455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 14 Apr 2017 09:49:21 +0100
Message-ID: <1492159760.19076.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Apr 2017 09:49:20 +0100
In-Reply-To: <cover.1492135840.git.pkj@axis.com>
References: <cover.1492135840.git.pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 14 Apr 2017 09:49:21 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/2] Allow postinst functions to be verbose
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
X-List-Received-Date: Fri, 14 Apr 2017 08:49:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-04-14 at 04:39 +0200, Peter Kjellerstedt wrote:
> This enables tracing of the postinst functions created in base-passwd
> and useradd.bbclass if BB_VERBOSE_LOGS is enabled. I found this
> extremely useful during verification of the useradd functionality,
> especially as there otherwise is absolutely nothing in the logs of
> why
> a failure in a postinst function happened.
> 
> I also simplified useradd_sysroot_sstate() by only having the code to
> create the postinst files once.
> 
> Feel free to squash these commits with the "base-passwd/useradd:
> Various improvements to useradd with RSS" commit if you prefer.

I'm afraid I can't take these since these scripts get written into the
sstate objects for the recipes in question and this would make the
sstate change depending on the parameters you call bitbake with. I
think we'd both agree that is undesirable.

Not sure what we can do but this needs more thought.

Cheers,

Richard





