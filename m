Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D2D526FEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 20:42:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2016 13:42:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,302,1470726000"; d="scan'208";a="165994853"
Received: from llim12-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.92])
	by fmsmga004.fm.intel.com with ESMTP; 08 Sep 2016 13:42:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Elizabeth 'pidge' Flanagan <pidge@toganlabs.com>
Date: Fri, 09 Sep 2016 08:42:25 +1200
Message-ID: <1529433.MFaUV9yMeV@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.2-101.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <20160908092601.7588-1-pidge@toganlabs.com>
References: <20160908092601.7588-1-pidge@toganlabs.com>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 08 Sep 2016 20:42:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hey Beth,

On Thu, 08 Sep 2016 11:26:01 Elizabeth 'pidge' Flanagan wrote:
> This commit pulls and extends the functionality of .oe-error-report into
> local.conf. It maintains the functionality of .oe-error-report.
> 
> It also enables report-error to automatically send error reports to a
> specified error report server. This patch enables infrastructure ppl to
> set development teams up so that we can gather error metrics automatically.
> 
> This relies on a new set of variables:
> 
> REPORTERROR[autosend]="yes|no|ask"
> REPORTERROR[user]=username
> REPORTERROR[email]=email
> REPORTERROR[server]=error-report-web instance
> 
> For autosend yes and no are pretty self explainatory. ask does not pass
> the -y flag to send-error-report, thus enabling the end user to review
> the report prior to submission.

I'm not sure if sentiment has changed on this issue (FWIW, it hasn't really
on my part), but this topic did come up before - start of thread here:

http://lists.openembedded.org/pipermail/openembedded-core/2014-March/090621.html

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

