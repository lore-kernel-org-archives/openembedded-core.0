Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BC4EC74E53
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 10:09:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5PA9m42004838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 25 Jun 2018 11:09:49 +0100
Message-ID: <b3f7944ccabbcdefd8056b9c43ff884b7861c483.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Date: Mon, 25 Jun 2018 11:09:48 +0100
In-Reply-To: <CABcZAN=aMU1Y7SFJwsJBnF=yKTZsbdx0=TwvsO7cp9HYbWyAcQ@mail.gmail.com>
References: <cover.1529603271.git.chris_larson@mentor.com>
	<61dc8ffbd2c1268e13572d36916dbe3d54e51cce.1529603271.git.chris_larson@mentor.com>
	<83bb6e51f031775c329e8d23f1d97151753e1f7d.camel@linuxfoundation.org>
	<CABcZAN=aMU1Y7SFJwsJBnF=yKTZsbdx0=TwvsO7cp9HYbWyAcQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] bbpath-intercepts.bbclass: add class
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
X-List-Received-Date: Mon, 25 Jun 2018 10:09:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-22 at 08:10 -0700, Christopher Larson wrote:
> Yeah, I think in this case this works as a class, but you're right,
> we should probably shift more to the python package. Namespacing is
> probably a good idea, we've talked about doing that more in the past.

Whilst changing what we have today is hard, we can at least do better
when we add new classes. I've been trying to, not sure how well its
going but we can try!

> In this case it's technically not image-only, though an sdk uses the
> same underlying functionality, so it's debatable. I wonder if we
> should namespace into a subdirectory to also make it easier to make
> sense of classes/ at a command-line, i.e. inherit image/postinst-
> intercepts.bbclass? Hmmm.

I'd thought about image verses sdk and decided its roughly "image" and
clearer this way that any other I could come up with.

There is an open bug about "global" classes verses "recipe" classes too
and how hard it is to tell the difference currently. I'd probably
favour splitting things up a bit. I'd not considered subdirs, its worth
thinking about...

Cheers,

Richard



