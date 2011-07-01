Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QccYk-0004AK-MJ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 14:10:58 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	14:07:07 +0200
From: Anders Darander <anders@chargestorm.se>
Organization: ChargeStorm AB
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 14:07:10 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.39-2-amd64; KDE/4.6.4; x86_64; ; )
References: <cover.1309503939.git.anders@chargestorm.se>
	<D041C15B-428E-432D-996B-EF7356B38E29@dominion.thruhere.net>
	<201107011352.08558.anders@chargestorm.se>
In-Reply-To: <201107011352.08558.anders@chargestorm.se>
MIME-Version: 1.0
Message-ID: <201107011407.10730.anders@chargestorm.se>
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v4 7/8] task-base: remove modutils reference.
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
X-List-Received-Date: Fri, 01 Jul 2011 12:10:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit


* Anders Darander Anders Darander <anders@chargestorm.se> [07/01/11 01:52 PM]:

> from task-base.bb? Should that part just be new, general
> RRECOMMENDS = "\
>     kernel-module-nls-utf8 \

I should have written:

RRECOMMENDS_task-base = "\
    kernel-module-nls-utf8 \

Regards,
Anders

-- 
Anders Darander
ChargeStorm AB		




