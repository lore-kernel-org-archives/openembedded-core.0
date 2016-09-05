Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D29377382
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u85EiHuD025857; Mon, 5 Sep 2016 15:44:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uFWuXg6k2DBw; Mon,  5 Sep 2016 15:44:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u85EiC40025793
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Sep 2016 15:44:13 +0100
Message-ID: <1473086651.20226.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Mon, 05 Sep 2016 15:44:11 +0100
In-Reply-To: <CAP9ODKq8Z8z4a7SoZoxzOz8GrEWnsoZZoL8Se++wMMWJp6yzsQ@mail.gmail.com>
References: <1472639558.29583.70.camel@linuxfoundation.org>
	<CAP9ODKq8Z8z4a7SoZoxzOz8GrEWnsoZZoL8Se++wMMWJp6yzsQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-modules: Update 2.7.3 -> 2.8.0+master
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
X-List-Received-Date: Mon, 05 Sep 2016 14:44:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-09-05 at 11:40 -0300, Otavio Salvador wrote:
> On Wed, Aug 31, 2016 at 7:32 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > We need master for the changes to work with 4.8 kernels.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> This broken for kernels which does not enable CONFIG_TRACEPOINTS.
> 
> Up to now, the lttng-modules build were fine if this was disabled
> just
> printing a warning on the build. Now it makes build fail.
> 
> The behaviour changes was made on:
> 
> https://github.com/lttng/lttng-modules/commit/ca62d279e2e83fd46b8a04e
> 6ad4471e9f8fc7c47

Hmm, any idea how we should proceed then?

> Another thing I noticed is that we ought to be using stable-2.8
> branch or name the recipe accordingly as master is in fact 2.9-pre.

We'll need to rename it then as there are changes in master needed for
4.8 kernels which is why I upgraded it in the first place.

Cheers,

Richard

