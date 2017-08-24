Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 57D0F78249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:16:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7OEGrWf024236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 24 Aug 2017 15:16:55 +0100
Message-ID: <1503584213.32591.192.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Thu, 24 Aug 2017 15:16:53 +0100
In-Reply-To: <f1547a4c-ad34-2b9d-955a-1c3047e61cbe@siemens.com>
References: <1502981085-18209-1-git-send-email-andrej.valek@siemens.com>
	<1502987497.13978.239.camel@linuxfoundation.org>
	<b911b7ff-0309-e459-0baf-b0fab4b68747@siemens.com>
	<1503048946.32591.0.camel@linuxfoundation.org>
	<aa161775-9c09-bf1f-8190-9c6e701f07c7@siemens.com>
	<c9d3d7c6-f6d0-c316-1e1e-8b67f652ae4a@windriver.com>
	<dff127f0-b668-0d09-3270-ce1d67c04891@siemens.com>
	<1abbf9f3-8f0e-3fba-26f5-114f049cb977@siemens.com>
	<1503492285.32591.152.camel@linuxfoundation.org>
	<cda65980-6ae8-426d-72e3-0e016d9fe315@gmail.com>
	<f1547a4c-ad34-2b9d-955a-1c3047e61cbe@siemens.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 24 Aug 2017 15:16:55 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] ca-certificates: prevent executing update-ca-certificates from host system
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
X-List-Received-Date: Thu, 24 Aug 2017 14:16:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-08-24 at 12:38 +0200, Andrej Valek wrote:
> What about enabling ASSUME_PROVIDED functionality also for nativesdk-
> components?

That would mean something quite different, that the dependency was
provided on the system the nativesdk package ended up running on?

Since I've spent the time to understand the problem, I wrote and sent
out a patch which I think should address the issues you're seeing?

Cheers,

Richard



