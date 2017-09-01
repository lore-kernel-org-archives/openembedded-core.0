Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E400F780C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:49:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v81Gj1aD020595
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Sep 2017 17:45:03 +0100
Message-ID: <1504284301.2175.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "leonardo.sandoval.gonzalez"
	<leonardo.sandoval.gonzalez@linux.intel.com>
Date: Fri, 01 Sep 2017 17:45:01 +0100
In-Reply-To: <070bdf6fc9e8418eb8c4d514fde90573@XBOX02.axis.com>
References: <1504275645-6421-1-git-send-email-richard.purdie@linuxfoundation.org>
	<070bdf6fc9e8418eb8c4d514fde90573@XBOX02.axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 01 Sep 2017 17:45:04 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/3] lib/oe/package: Improve filedeprunner subprocess handling
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
X-List-Received-Date: Fri, 01 Sep 2017 16:49:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-01 at 16:32 +0000, Peter Kjellerstedt wrote:
> Even with these changes applied, I still see texinfo succeed to
> build 
> even when it should not (i.e., without having applied the patch to 
> package_deb.bbclass that I just sent).

Right, there are some nasty bugs with python's multiprocessing
exception handling in a few places. I've sent some patches for some
others which I ran into with other problems, Leo should have a patch
for this specific issue shortly. Thanks for the colon fix!

Cheers,

Richard

