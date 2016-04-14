Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 122A173177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 11:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EBoYjY007682; Thu, 14 Apr 2016 12:50:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id brYSnfL6ZSOL; Thu, 14 Apr 2016 12:50:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EBoWrK007669
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 14 Apr 2016 12:50:33 +0100
Message-ID: <1460634632.9308.169.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>, "Maxin B. John" <maxin.john@intel.com>
Date: Thu, 14 Apr 2016 12:50:32 +0100
In-Reply-To: <5d0ce4d1b23e4a10adbb3552ff1525fb@XBOX02.axis.com>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
	<CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
	<4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
	<1460545515.9308.85.camel@linuxfoundation.org>
	<5715165f841f46d0a50fb951acfbf0ac@XBOX02.axis.com>
	<1460564978.9308.95.camel@linuxfoundation.org>
	<1460630455.9308.168.camel@linuxfoundation.org>
	<5d0ce4d1b23e4a10adbb3552ff1525fb@XBOX02.axis.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Thu, 14 Apr 2016 11:50:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-04-14 at 11:46 +0000, Peter Kjellerstedt wrote:
> Ok, this looks like a good start for me to continue working on.
> 
> What is the easiest way to execute the useradd selftest?

oe-selftest --run-tests useradd.Useradd.test_useradd

Cheers,

Richard

