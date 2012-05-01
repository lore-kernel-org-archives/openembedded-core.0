Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SPFaz-0000gF-5w
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:06:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q41FukWX016000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 May 2012 08:56:46 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 May 2012 08:56:45 -0700
Date: Tue, 1 May 2012 10:56:21 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120501105621.041ac91e@wrlaptop>
In-Reply-To: <B8BDFC7E-873F-4AC3-8B6B-111299DEB9A7@dominion.thruhere.net>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
	<4F9EF944.9080503@windriver.com> <20120430154823.3a4ea3ee@wrlaptop>
	<1335867674.7415.76.camel@ted>
	<B8BDFC7E-873F-4AC3-8B6B-111299DEB9A7@dominion.thruhere.net>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
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
X-List-Received-Date: Tue, 01 May 2012 16:06:33 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 1 May 2012 12:25:48 +0200
Koen Kooi <koen@dominion.thruhere.net> wrote:

> TUNE_FEATURES     = "armv7a vfp neon cortexa8"

I'd like to suggest a separate patch which uses the TUNEVALID info
to explain these, and also explores the tunings of any selected
multilibs, because this is under-informative in some cases.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


