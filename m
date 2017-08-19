Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5A54C78380
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 08:16:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7J8GuY2007166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 19 Aug 2017 09:16:57 +0100
Message-ID: <1503130616.32591.19.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 09:16:56 +0100
In-Reply-To: <20170818155227.2439-1-raj.khem@gmail.com>
References: <20170818155227.2439-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 19 Aug 2017 09:16:57 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH V2] db: Add --tag parameter to libtool invocation
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
X-List-Received-Date: Sat, 19 Aug 2017 08:16:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-18 at 08:52 -0700, Khem Raj wrote:
> Fix do_configure to be able to regenerate configure files
> 
> Use cross libtool as installed by OE, as done in normal autotooled
> recipes
> 
> These changes help in invoking the libtool with proper tags for C
> and C++ compiler and linker invocation and not use same tag across
> all
> different invocations
> 
> Fixes errors like
> libtool: compile: unable to infer tagged configuration
> libtool: compile: specify a tag with `--tag'
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

https://autobuilder.yoctoproject.org/main/builders/buildtools/builds/1193/steps/BuildImages/logs/stdio

(which failed the same way in many places)

Cheers,

Richard

