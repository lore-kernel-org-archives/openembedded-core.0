Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AFBDB77CE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v3BIPTmJ017686; 
	Tue, 11 Apr 2017 19:26:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O54yiDEsQAR1; Tue, 11 Apr 2017 19:26:05 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3BIPrdE017852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 11 Apr 2017 19:25:54 +0100
Message-ID: <1491935153.12091.37.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 19:25:53 +0100
In-Reply-To: <c647b8b4229e8862b8066f52aaefee133a65e6ee.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
	<c647b8b4229e8862b8066f52aaefee133a65e6ee.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 3/8] -cross recipes: ignore TARGET_ARCH sstate hash
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
X-List-Received-Date: Tue, 11 Apr 2017 18:26:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'd tweak the subject line to recipes/*-cross:

On Tue, 2017-04-11 at 16:56 +0200, Patrick Ohly wrote:
> "yocto-compat-layer.py --machines" showed that shared packages like
> gcc-cross-powerpc64 have a sstate signature that depends on
> TUNEFLAGS. As a result, there are unnecessary rebuilds and potential
> conflicts in a multiconfig.
> 
> That's due to the way how TARGET_ARCH is set. Richard Purdie
> suggested
> setting TARGET_ARCH[vardepvalue] as fix, which works. It would be
> shorter to do that in cross.inc instead of repeating the relevant
> line
> in different recipes, but Richard was concerned about potential
> side-effects in other usages of cross.inc.

s/cross.inc/cross.bbclass/g

Cheers,

Richard

