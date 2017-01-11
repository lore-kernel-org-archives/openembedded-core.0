Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9CB71A50
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 08:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0B8O6CM002894; Wed, 11 Jan 2017 08:24:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3ZjQURGUt0Jn; Wed, 11 Jan 2017 08:24:06 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0B8O1d0002891
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Jan 2017 08:24:02 GMT
Message-ID: <1484123040.4367.172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anders Oleson <anders@openpuma.org>,
	openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 08:24:00 +0000
In-Reply-To: <CAKTo2Enih-V=anW13QCVkeq_F+BM=COeOyHzasBum=GSt-SsyA@mail.gmail.com>
References: <CAKTo2Em1Lcs19L0M=WpGOJv3aQkQLJuetFsgm6nq_0sVix1X3A@mail.gmail.com>
	<CAKTo2Enih-V=anW13QCVkeq_F+BM=COeOyHzasBum=GSt-SsyA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: bug with dpkg-native and sstate-cache mirrors
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
X-List-Received-Date: Wed, 11 Jan 2017 08:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-12-20 at 19:45 -0800, Anders Oleson wrote:
> Should I open a bug report for this?

If you were not going to work on it anymore then yes, we would like to
keep track of a problem like this.

> Does this make sense and does it sound like a problem?

Yes it makes sense and yes its the kind of problem we should fix.

> Are you interested in a patch or fixes? I see some activity with
> dpkg, so I know there's a maintainer out there?

We are interested, there are people using the deb backend. We don't
have a specific deb maintainer as such but there are a few people with
varying levels of experience and interest.

Cheers,

Richard

