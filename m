Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAF265CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 15:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAIFdDQp030188; Wed, 18 Nov 2015 15:39:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tmAmqFK63xHd; Wed, 18 Nov 2015 15:39:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tAIFcwb7030161
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Nov 2015 15:39:09 GMT
Message-ID: <1447861138.12500.83.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 18 Nov 2015 15:38:58 +0000
In-Reply-To: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/8] Deprecate package_regex.inc and split it into recipes
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
X-List-Received-Date: Wed, 18 Nov 2015 15:39:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-11-18 at 11:52 +0200, Alexander Kanavin wrote:
> This patch series deprecates package_regex.inc and splits its contents into
> respective recipes. This is done for same reasons as deprecating 
> upstream_tracking.inc: having upstream version check tweaks bundled into a 
> separate file makes the information prone to getting out of date.

Looking at the patches the one thing that bothers me is the name of this
variable, "REGEX". In the recipe context its rather ambiguous what it
means.

I'm wondering if we should take the opportunity to call it something
like SRC_URI_REGEX or something? 

We either do it now or not at all...

Cheers,

Richard





