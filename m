Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D61A57806D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 13:54:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03Drxhi018464
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 13:54:01 GMT
Message-ID: <1514987639.5525.138.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Jan 2018 13:53:59 +0000
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA01566B9AEB@ALA-MBC.corp.ad.wrs.com>
References: <cover.1509604697.git.jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA01566B9AEB@ALA-MBC.corp.ad.wrs.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db
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
X-List-Received-Date: Wed, 03 Jan 2018 13:54:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-12-22 at 02:08 +0000, Huang, Jie (Jackie) wrote:
> Ping, I didn't see any objection on this, but it's not merged yet, do
> I miss anything?

When we test it we see:

WARNING: glibc-2.26-r0 do_package: glibc-extra-nss-2.26 was registered as shlib provider for libnss_db.so.2, changing it to libnss-db-2.26 because it was built later

so it looks like you swapped one race for another?

Cheers,

Richard

