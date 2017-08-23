Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DC730782D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 13:46:23 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7NDkLHE027558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 14:46:22 +0100
Message-ID: <1503495981.32591.159.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 14:46:21 +0100
In-Reply-To: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
References: <cover.1502989095.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 14:46:22 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/3] Restructure python2 and python3 packaging system
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
X-List-Received-Date: Wed, 23 Aug 2017 13:46:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-08-17 at 10:11 -0700, Alejandro Hernandez wrote:
> Alejandro Hernandez (3):
>   python: Restructure python packaging and replace it with
> autopackaging
>   python3: fix RDEPENDS on several recipes, due to non-existent
> python3
>     packages
>   python3: Restructure python3 packaging and replace it with
>     autopackaging

There was an issue exposed on the autobuilder from this patchset which
then highlighted problems with the incorrect PACKAGES_DYNAMIC use and
issues with the lack of a native manifest.

With M3 being now and this change potentially causing issues for other
layers, I've deferred this patch series for now as I don't think its
ready yet and I don't think it will be ready in a timeframe that can
make it into M3.

Cheers,

Richard

