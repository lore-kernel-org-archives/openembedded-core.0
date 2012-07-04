Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SmQKj-0003fA-Bs for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 16:13:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64E2UUL024179
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 15:02:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24103-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2012 15:02:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q64E2Oir024169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2012 15:02:25 +0100
Message-ID: <1341410543.3906.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jul 2012 15:02:23 +0100
In-Reply-To: <0856ecabc55e047a8d4aeb67bf213a8d11cf385a.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
	<0856ecabc55e047a8d4aeb67bf213a8d11cf385a.1341338051.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 7/9] perf: add perf-scripting MACHINE_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2012 14:13:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-03 at 13:10 -0500, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
> 
> Add a new MACHINE_FEATURE named 'perf-scripting'.  Adding this into
> any machine configuration will enable perf scripting on the target,
> which will turn on all the language bindings currently aavailable in
> perf (Perl and Python), if perf is included in an image.
> 
> If 'perf-scripting' isn't named as a feature (the default), all perf
> language bindings will be disabled and unavailable.
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>  meta/recipes-kernel/perf/perf_3.4.bb |   11 ++++++++---
>  1 files changed, 8 insertions(+), 3 deletions(-)

Does this make sense as a MACHINE specific feature? Wouldn't it make
sense done on a per architecture basis for example?

Cheers,

Richard



