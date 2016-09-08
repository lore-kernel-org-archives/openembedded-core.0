Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C0DE96AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 22:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u88M1WLX018063; Thu, 8 Sep 2016 23:01:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EnqYoBHboKOs; Thu,  8 Sep 2016 23:01:32 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u88M1QBk018059
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 8 Sep 2016 23:01:28 +0100
Message-ID: <1473372086.20226.251.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, "Elizabeth 'pidge'
	Flanagan" <pidge@toganlabs.com>
Date: Thu, 08 Sep 2016 23:01:26 +0100
In-Reply-To: <1529433.MFaUV9yMeV@peggleto-mobl.ger.corp.intel.com>
References: <20160908092601.7588-1-pidge@toganlabs.com>
	<1529433.MFaUV9yMeV@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] report-error.bbclass: Add support for autosending
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
X-List-Received-Date: Thu, 08 Sep 2016 22:01:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-09 at 08:42 +1200, Paul Eggleton wrote:
> Hey Beth,
> 
> On Thu, 08 Sep 2016 11:26:01 Elizabeth 'pidge' Flanagan wrote:
> > 
> > This commit pulls and extends the functionality of .oe-error-report 
> > into
> > local.conf. It maintains the functionality of .oe-error-report.
> > 
> > It also enables report-error to automatically send error reports to
> > a
> > specified error report server. This patch enables infrastructure
> > ppl to
> > set development teams up so that we can gather error metrics
> > automatically.
> > 
> > This relies on a new set of variables:
> > 
> > REPORTERROR[autosend]="yes|no|ask"
> > REPORTERROR[user]=username
> > REPORTERROR[email]=email
> > REPORTERROR[server]=error-report-web instance
> > 
> > For autosend yes and no are pretty self explainatory. ask does not
> > pass
> > the -y flag to send-error-report, thus enabling the end user to
> > review
> > the report prior to submission.
> I'm not sure if sentiment has changed on this issue (FWIW, it hasn't
> really
> on my part), but this topic did come up before - start of thread
> here:
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2014-March/
> 090621.html

Thanks for digging that up. I am conscious that this was deliberately
designed so the user has to sign up for auto submission. To do
otherwise lets layers "spy" on users far too easily.

That said there are 101 ways you could do that anyway, this just makes
it very very easy.

So I'm torn on this issue. How easy should auto-error submission be,
given the information that could accidentally expose?

Cheers,

Richard




