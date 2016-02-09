Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7D662133
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 21:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u19LUt3o007342; Tue, 9 Feb 2016 21:30:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mHQLopBohQqL; Tue,  9 Feb 2016 21:30:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u19LUpGQ007337
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 9 Feb 2016 21:30:53 GMT
Message-ID: <1455053451.16142.84.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Tue, 09 Feb 2016 21:30:51 +0000
In-Reply-To: <20160209151635.6327ebb0@seebs-worktop>
References: <cover.1455047631.git.peter.seebach@windriver.com>
	<56BA47DD.6020007@windriver.com>
	<20160209151635.6327ebb0@seebs-worktop>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo 1.7.5 [jethro][fido]
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
X-List-Received-Date: Tue, 09 Feb 2016 21:30:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-09 at 15:16 -0600, Peter Seebach wrote:
> On Tue, 9 Feb 2016 14:11:09 -0600
> Mark Hatle <mark.hatle@windriver.com> wrote:
> 
> > Everything remains compatible, but it does fix a subtle race
> > condition that can
> > lead to files under pseudo control inheriting their host system
> > permissions.
> > 
> > See bug 9031 for more details.
> 
> For reference, the thing which exposed the circumstance where this
> was
> actually remotely likely to come up was added in f1d4744, back in
> 2014,
> and somehow the actual change isn't mentioned in ChangeLog.txt, but
> in
> practice it's been there since 1.6.1. But it would only (probably)
> show
> up if you ran some commands with "pseudo <cmd>" *while* running other
> things using a pseudo server normally.

Which we do as standard if you enable buildhistory.

(for full disclosure of the issue)

Cheers,

Richard


