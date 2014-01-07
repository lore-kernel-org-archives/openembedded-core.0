Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C94666C02E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 14:00:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s07DxjLt003236; Tue, 7 Jan 2014 13:59:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Rmok7-fSSPJR; Tue,  7 Jan 2014 13:59:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s07DxgkN003233
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 7 Jan 2014 13:59:44 GMT
Message-ID: <1389103177.6899.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sipke Vriend <sipke.vriend@xilinx.com>
Date: Tue, 07 Jan 2014 13:59:37 +0000
In-Reply-To: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
References: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC OE-core/meta/lib] BSP Specific Qemurunner
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
X-List-Received-Date: Tue, 07 Jan 2014 14:00:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-07 at 03:09 +0000, Sipke Vriend wrote:
> Hi,
> 
> This RFC is a proposal to allow BSP layers to setup qemu with their specific
> requirements for the testimage oe-core functionality.
> The suggested changes will be exercised by the 
> bitbake -c testimage <image> 
> command.
> Similarly to the oeqa test cases this proposal extends the meta/lib/oeqa 
> python modules to allow inclusion of python utility scripts in the BSP 
> layers.
> Any BSP layer wishing to supply their own qemu setup would need to create
> an appropriate meta-bsplayer/lib/oeqa/utils/<machine>starter.py
> The effect is that the lib/oeqa/utils/qemurunner will either allow the 
> bsp layer provided <machine>starter to spawn qemu or if not provided, 
> spawn qemu via runqemu as currently.
> An example bsp layer is available here:
> https://github.com/sipke/meta-xilinx/tree/sipke/qemurunner
> with all required additions in the meta-xilinx/lib directory.
> 
> This RFC is triggered by and indirectly related to
> Bugzilla report "runqemu shouldn't hard-code machine knowledge"
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4827

Why would we do this rather than improve runqemu to be extendable from
BSP layers?

Cheers,

Richard




