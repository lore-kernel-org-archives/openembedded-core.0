Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E66EB6A35B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 22:40:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB3MeG3o000867; Tue, 3 Dec 2013 22:40:16 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e3kGKInSudef; Tue,  3 Dec 2013 22:40:16 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB3MeC71000861
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 3 Dec 2013 22:40:14 GMT
Message-ID: <1386110407.4463.148.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <kergoth@gmail.com>
Date: Tue, 03 Dec 2013 22:40:07 +0000
In-Reply-To: <CABcZAN=RUKdQcxE=9aQoXcap2LYA9F5begiT5jD2-JFY-h-NYw@mail.gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
	<CABcZAN=RUKdQcxE=9aQoXcap2LYA9F5begiT5jD2-JFY-h-NYw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Random fixes from the Mentor Graphics push queue
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
X-List-Received-Date: Tue, 03 Dec 2013 22:40:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-12-03 at 11:40 -0700, Chris Larson wrote:
> On Wed, Nov 27, 2013 at 11:07 AM, Christopher Larson
> <kergoth@gmail.com> wrote:
>         The following changes since commit
>         f991d2d60b74f5ebd990f77aecd3324b1a4533e9:
>         
>           libpng: set reasonable SUMMARY (2013-11-27 11:51:08 +0000)
>         
>         are available in the git repository at:
>         
>           https://github.com/kergoth/oe-core.git random-fixes
>           https://github.com/kergoth/oe-core/tree/random-fixes
>         
>         Christopher Larson (7):
>           update-rc.d: process symlinks recursively
>           perf: remove /usr/local/include from default makefile
>         includes
>           pulseaudio: fix RDEPENDS traversal for consolekit
> 
> Were there issues with these, or was it just that further testing was
> necessary? I noticed this series was partially applied.

On the most part just being cautious for M1. 

The perf one does worry me as we keep going around in circles on it
where we change one thing, it breaks something else, we fix that,
something else breaks, we fix that and we end up back where we started.
The commit history and/or the mailing list should have details about
what happened there. CC'ing Bruce since I know he has opinions on the
perf fix. Bruce, did we get a fix for that upstream in the end?

Cheers,

Richard





