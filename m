Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE546FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 13:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31DE4fC012741; Fri, 1 Apr 2016 14:14:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L-dz_eAomEMq; Fri,  1 Apr 2016 14:14:04 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u31DE2gM012737
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 1 Apr 2016 14:14:03 +0100
Message-ID: <1459516442.7348.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Armin Kuster <akuster808@gmail.com>
Date: Fri, 01 Apr 2016 14:14:02 +0100
In-Reply-To: <20160401120304.GE2567@jama>
References: <1454270130-11287-1-git-send-email-akuster808@gmail.com>
	<20160401120304.GE2567@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][jethro] glibc-locale: fix QA warning
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
X-List-Received-Date: Fri, 01 Apr 2016 13:14:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-04-01 at 14:03 +0200, Martin Jansa wrote:
> On Sun, Jan 31, 2016 at 11:55:30AM -0800, Armin Kuster wrote:
> > From: Armin Kuster <akuster@mvista.com>
> > 
> > WARNING: QA Issue: glibc-locale: /glibc-binary-localedata-sd
> > -in/usr/lib/locale/sd_IN/LC_CTYPE is owned by uid 1000, which is
> > the same as the user running bitbake. This may be due to host
> > contamination [host-user-contaminated]
> 
> FWIW: my last bitbke world build shows few of these:
> glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ka
> -ge/usr/lib/locale/ka_GE/LC_MEASUREMENT is owned by uid 3004, which
> is the same as the user running bitbake. This may be due to host
> contamination [host-user-contaminated]
> glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-mr
> -in/usr/lib/locale/mr_IN/LC_MEASUREMENT is owned by uid 3004, which
> is the same as the user running bitbake. This may be due to host
> contamination [host-user-contaminated]
> glibc-locale-2.23: glibc-locale: /glibc-binary-localedata-ru
> -ua/usr/lib/locale/ru_UA/LC_MEASUREMENT is owned by uid 3004, which
> is the same as the user running bitbake. This may be due to host
> contamination [host-user-contaminated]
> 
> Even with your change already in master.

I do wonder if this might be a pseudo issue which we fixed in master.
The trouble is that whilst master is working better, there is a bigger
rewrite/fixup of some pseudo code planned for 2.2 so even with master,
its not "properly" fixed yet. Master would error more clearly and
hasn't shown errors in recent builds though.

Cheers,

Richard

