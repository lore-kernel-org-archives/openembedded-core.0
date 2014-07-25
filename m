Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEA765E48
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 16:30:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6PGTtD4031004; Fri, 25 Jul 2014 17:29:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id c-gqlOefv0zU; Fri, 25 Jul 2014 17:29:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6PGTphA030987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 25 Jul 2014 17:29:52 +0100
Message-ID: <1406305785.27697.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 25 Jul 2014 17:29:45 +0100
In-Reply-To: <1962350.z6r6hkHnKy@peggleto-mobl5.ger.corp.intel.com>
References: <1406205685-7685-1-git-send-email-georgex.l.musat@intel.com>
	<1406205685-7685-2-git-send-email-georgex.l.musat@intel.com>
	<1962350.z6r6hkHnKy@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] oeqa/runtime: Added skipModule import for test modules that use it.
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
X-List-Received-Date: Fri, 25 Jul 2014 16:30:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-25 at 17:16 +0100, Paul Eggleton wrote:
> Stefan pointed out to me that this contains a seemingly unintentional revert 
> of the following earlier change:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/lib/oeqa/runtime/pam.py?id=14735be703de1b1e173d444b51df7aad902428d5

Thanks, I've fixed that.

Cheers,

Richard


