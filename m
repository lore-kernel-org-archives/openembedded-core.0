Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 19A836D001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 17:46:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAJHkN29020330; Tue, 19 Nov 2013 17:46:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tZxAIZAkJEmT; Tue, 19 Nov 2013 17:46:23 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAJHkKp0020316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 19 Nov 2013 17:46:21 GMT
Message-ID: <1384883176.16887.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Nov 2013 17:46:16 +0000
In-Reply-To: <CADkTA4MQF4be4RO0vm=a2Rv404M9sjK6ZFE7V0hV_gDBX5hvMQ@mail.gmail.com>
References: <20131119173725.GA13018@mcrowe.com>
	<1384882665-26840-1-git-send-email-mac@mcrowe.com>
	<1384882665-26840-2-git-send-email-mac@mcrowe.com>
	<CADkTA4MQF4be4RO0vm=a2Rv404M9sjK6ZFE7V0hV_gDBX5hvMQ@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel.bbclass: Call make with correct variables in kernelscripts_sstate_postinst
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
X-List-Received-Date: Tue, 19 Nov 2013 17:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-11-19 at 12:41 -0500, Bruce Ashfield wrote:
> On Tue, Nov 19, 2013 at 12:37 PM, Mike Crowe <mac@mcrowe.com> wrote:
> > Ensure that the environment variable and command line arguments that are
> > used when calling make in kernel_do_compile are used in
> > kernelscripts_sstate_postinst.
> 
> What issue was this causing for you ? The scripts are native, and hence
> should just be using the build machines compiler, linker and don't need
> the kernel args.
> 
> So I'm not convinced that we need this patch, without seeing a tangible
> issue that was triggered.

I think for some arches at least, something targetish is being cleaned
and then needing to be rebuilt.

I don't want to have to add dependencies for the toolchain so we need to
look into this further. 

Mike: which arch was this on and do you have the compile error?

Cheers,

Richard


