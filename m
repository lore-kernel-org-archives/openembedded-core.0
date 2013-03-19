Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHvDb-0005ui-NO for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 13:01:21 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2JBqqj1029580; Tue, 19 Mar 2013 11:52:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WPszbWbX4oeg; Tue, 19 Mar 2013 11:52:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2JBqhem029566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 19 Mar 2013 11:52:46 GMT
Message-ID: <1363693405.16482.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Mar 2013 11:43:25 +0000
In-Reply-To: <CAJTo0Laf2ZxBE34ncKE3rBPhBwGpYmFgwrKzt1WFOC7MHTZepw@mail.gmail.com>
References: <1363639611-21822-1-git-send-email-jslater@windriver.com>
	<1363639611-21822-2-git-send-email-jslater@windriver.com>
	<CAP9ODKrk0S1g6TcLxs=iVuv3eBRgZgfhtwSDVaYzJawnAH7rRg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF8436F75A5F@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0Laf2ZxBE34ncKE3rBPhBwGpYmFgwrKzt1WFOC7MHTZepw@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH [v3] 1/1] tzcode & tzdata: update to 2013b versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 12:01:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-19 at 10:25 +0000, Burton, Ross wrote:
> On 18 March 2013 22:14, Slater, Joseph <joe.slater@windriver.com> wrote:
> > Do we not use PR anymore?   Joe
> 
> Correct - oe-core assumes a PR Service is being used if required.

So just to be really clear, PR still works as it always has but we're no
longer bumping values manually, we're recommending people use the PR
service to maintain a set of consistent values for use in their feed.
The checksums ensure things get rebuilt when they need to in other
cases.

Cheers,

Richard



