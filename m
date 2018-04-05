Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 94DB87505F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 16:43:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w35GhfHY020159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 5 Apr 2018 17:43:43 +0100
Message-ID: <1522946621.11431.427.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 05 Apr 2018 17:43:41 +0100
In-Reply-To: <20180404111321.10824-20-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-20-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 20/22] procps: update to 3.3.13
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
X-List-Received-Date: Thu, 05 Apr 2018 16:43:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-04-04 at 14:13 +0300, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Does this build on musl?

https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/389/st
eps/BuildImages/logs/stdio

or was there some other bad interaction in master-next?

Cheers,

Richard

