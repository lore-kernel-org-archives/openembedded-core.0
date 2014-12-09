Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 61F8B724CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 09:48:38 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Dec 2014
	10:48:32 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id CF4F42800CB;
	Tue,  9 Dec 2014 10:48:32 +0100 (CET)
Date: Tue, 9 Dec 2014 10:48:32 +0100
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20141209094832.GA32129@sestofb10.enea.se>
References: <1416995667-1286-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
In-Reply-To: <1416995667-1286-1-git-send-email-maxin.john@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: thomas.lundstrom@enea.com
Subject: Re: [PATCH 0/2] Enable ptest support for rt-tests package
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
X-List-Received-Date: Tue, 09 Dec 2014 09:48:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ping ..

On Wed, Nov 26, 2014 at 10:54:25AM +0100, Maxin B. John wrote:
> The tests are implemented using rt_bmark.py which uses the "stress" application
> to check the real-time performance under various conditions. 
> 
> We need to add the stress package as a dependency for this ptest. At present,
> this recipe is duplicated in meta-linaro and meta-arago-extras.
> 
> [YOCTO #1569]
> 
> Maxin B. John (2):
>   rt-tests: enable ptest support
>   stress: Add new package
> 
>  meta/recipes-extended/stress/files/texinfo.patch |  79 +++++
>  meta/recipes-extended/stress/stress_1.0.4.bb     |  14 +
>  meta/recipes-rt/rt-tests/files/rt_bmark.py       | 411 +++++++++++++++++++++++
>  meta/recipes-rt/rt-tests/files/run-ptest         |   3 +
>  meta/recipes-rt/rt-tests/rt-tests_0.89.bb        |  10 +
>  5 files changed, 517 insertions(+)
>  create mode 100644 meta/recipes-extended/stress/files/texinfo.patch
>  create mode 100644 meta/recipes-extended/stress/stress_1.0.4.bb
>  create mode 100644 meta/recipes-rt/rt-tests/files/rt_bmark.py
>  create mode 100644 meta/recipes-rt/rt-tests/files/run-ptest
> 
> -- 
> 1.9.1

