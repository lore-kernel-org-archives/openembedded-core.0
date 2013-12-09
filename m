Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 573726DCA6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 11:49:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB9BmqtV010776; Mon, 9 Dec 2013 11:48:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pZhK2YRrJHEx; Mon,  9 Dec 2013 11:48:52 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB9BmlLA010772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 9 Dec 2013 11:48:49 GMT
Message-ID: <1386589722.25847.79.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 09 Dec 2013 11:48:42 +0000
In-Reply-To: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
References: <1386380546-13936-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Convert ??= weaker assingment to weak ?= assignment
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
X-List-Received-Date: Mon, 09 Dec 2013 11:49:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-12-06 at 17:42 -0800, Khem Raj wrote:
> ??= does not react at all with
> BOOST_LIBS += "${@base_contains('PACKAGECONFIG', 'python', 'python', '', d)}"
> 
> even though we have
> 
> PACKAGECONFIG ??= "" it does not honor it and always add python to
> BOOST_LIBS but the dependency is not added so it fails to build
> complaining for missing python headers which is a understood outcome
> 
> When converted to ?= it works as expected and only add --with-python
> in bjam when python is specified in PACKAGECONFIG otherwise not.
> 
> Is it a bitbake bug ? in anycase ?= should be enough of loose rope
> to let user/distro configure the packageconfig policy
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/boost/boost.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This needs more investigation as there is something missing from the
description above.

To illustrate why I'm struggling to follow this, "bitbake boost -e |
grep BOOST_LIBS" on OE-Core does not show python in the list...

Cheers,

Richard



