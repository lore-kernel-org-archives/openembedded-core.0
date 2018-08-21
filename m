Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE1A7918F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 20:29:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7LKTpst022475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 21 Aug 2018 21:29:53 +0100
Message-ID: <5adbae192a432b8997d266ddb4fb6860be4f5ccf.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2018 21:29:51 +0100
In-Reply-To: <3540cc10-ffab-8805-c471-0a7f12b81acc@siemens.com>
References: <20180719085353.4499-1-andrej.valek@siemens.com>
	<20180719113037.6337-1-andrej.valek@siemens.com>
	<3540cc10-ffab-8805-c471-0a7f12b81acc@siemens.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] busybox: update to 1.29.1
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
X-List-Received-Date: Tue, 21 Aug 2018 20:29:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-17 at 10:18 +0200, Andrej Valek wrote:
> ping

Fails to build on the autobuilder due to missing crypt headers. That is
probably a missing DEPENDS but I'm wondering what changed and if the
change was intentional.

https://autobuilder.yocto.io/builders/nightly-x86/builds/1259/steps/BuildImages/logs/stdio

https://autobuilder.yocto.io/builders/nightly-x32/builds/1225/steps/BuildImages/logs/stdio

and more...

Cheers,

Richard

