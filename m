Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E76F77E83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:12:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6RLCDXv004831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 27 Jul 2017 22:12:14 +0100
Message-ID: <1501189933.22282.170.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Humberto Ibarra <humberto.ibarra.lopez@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 22:12:13 +0100
In-Reply-To: <b042029a217b541e652776a7117a35c70c81f4e3.1501186507.git.humberto.ibarra.lopez@intel.com>
References: <cover.1501186507.git.humberto.ibarra.lopez@intel.com>
	<b042029a217b541e652776a7117a35c70c81f4e3.1501186507.git.humberto.ibarra.lopez@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 27 Jul 2017 22:12:15 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] multiconfig.py: added testsuite for multiconfig
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
X-List-Received-Date: Thu, 27 Jul 2017 21:12:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-07-27 at 15:18 -0500, Humberto Ibarra wrote:
> Multiconfig was not being tested at all. This adds a few basic
> tests for multiconfig, including globbing.
> 
> [Yocto #11612]
> 
> Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>

If I run this selftest and I have some multiconfigs already in my build
directory, what happens to them?

Cheers,

Richard

