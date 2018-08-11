Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A80D078F18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 12:30:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w7BCTxmk017685
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 11 Aug 2018 13:30:01 +0100
Message-ID: <7144f3fde7dbc274b11329571a1da99aff1fece9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 11 Aug 2018 13:29:59 +0100
In-Reply-To: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
References: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [meta-oe][PATCH 1/3] testimage: Refactoring and fixing.
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
X-List-Received-Date: Sat, 11 Aug 2018 12:30:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-10 at 21:37 +0200, Paulo Neves wrote:
> The testimage.bbclass invocation of controllers besides
> simpletarget and qemutarget was broken.  Setting TEST_TARGET
> to class names did not work, only hardcoded values set in
> context.py were allowed.  On the other hand the other
> TEST_TARGETs available were supposedly available through the
> class name convetion but none of them were working. See:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12842
> 
> In this commit qemuwrapper and simpletarget TEST_TARGETS are
> now not available through these names, but through the
> common convention of class names.

There are some good cleanups in here, thanks! It is hard to review due
to the number/size of changes. I put it into a test run on the
autobuilder and it failed:

https://autobuilder.yocto.io/builders/nightly-musl/builds/1220/steps/Running%20Sanity%20Tests/logs/stdio

The rest of the builds have't gotten this far yet but I suspect we'll
see further similar failures and these will need to be fixed before we
can consider merging the patches.

Cheers,

Richard

