Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C28D278262
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 10:06:54 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5CA6mxp005677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 12 Jun 2017 11:06:50 +0100
Message-ID: <1497262008.3942.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 11:06:48 +0100
In-Reply-To: <0c83f6d3e761aa93c07528c5a3730e2ddc43d748.1496993458.git.jussi.kukkonen@intel.com>
References: <cover.1496993458.git.jussi.kukkonen@intel.com>
	<0c83f6d3e761aa93c07528c5a3730e2ddc43d748.1496993458.git.jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 12 Jun 2017 11:06:51 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] Enable parallel compilation for python3-numpy
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
X-List-Received-Date: Mon, 12 Jun 2017 10:06:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 10:36 +0300, Jussi Kukkonen wrote:
> Support for "-j N" does not seem like a generic distutils thing
> but numpy supports it.
> 
> This improves compile time by 2 minutes (real time).

Sorry:

https://autobuilder.yocto.io/builders/nightly-musl/builds/298/steps/BuildImages/logs/stdio

Appears to have races?

Cheers,

Richard

