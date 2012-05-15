Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SUQ0I-0002e3-U0
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 00:14:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4FM412d003754
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 15:04:01 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 15 May 2012 15:04:00 -0700
Date: Tue, 15 May 2012 17:03:51 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120515170351.22a3467d@wrlaptop>
In-Reply-To: <20120515195914.GO29324@mx.loc>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
	<1336065154-8513-2-git-send-email-rep.dot.nop@gmail.com>
	<4FA859E5.4080609@linux.intel.com> <20120515195914.GO29324@mx.loc>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] runqemu: use modern, single-char name of test(1)
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
X-List-Received-Date: Tue, 15 May 2012 22:14:03 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 15 May 2012 21:59:15 +0200
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:

> Really that whole name hardcoding is plain stupid and over-engineered.
> If the darn image exists then, heck, just use it.

This may not be a bad idea, but it's a larger change than I wanted to
make, which is why I didn't change the effect as a whole in the
proposed patch.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


