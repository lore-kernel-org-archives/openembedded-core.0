Return-Path: <brendan.le.foll@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C8A7170178
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 17:05:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 04 May 2016 10:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,578,1455004800"; d="scan'208";a="97216192"
Received: from jupiter.iwi.intel.com (HELO jupiter.localdomain)
	([172.28.33.51])
	by fmsmga004.fm.intel.com with ESMTP; 04 May 2016 10:05:32 -0700
Date: Wed, 4 May 2016 18:06:00 +0100
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20160504170600.GA14676@jupiter.localdomain>
References: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
	<20160504143806.GA12969@jupiter.localdomain>
	<CAAPZna1M5ibZ8J2vOZ5PmJqAHVwNn=vR8mKrmYmuQ-YdLWopfw@mail.gmail.com>
	<20160504150732.GB12969@jupiter.localdomain>
	<CAAPZna2QkDzsa19=2rrKvypXpN-NOj02X724YVhm6Y+f8RdVXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAPZna2QkDzsa19=2rrKvypXpN-NOj02X724YVhm6Y+f8RdVXQ@mail.gmail.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm class usage
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
X-List-Received-Date: Wed, 04 May 2016 17:05:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2016 at 02:01:40PM -0300, Fabio Berton wrote:
>    Yes, it helps.
>    Now I see my error... I need to use
>    SRC_URI = "npm://[1]registry.npmjs.org;name=${PN};version=${PV}"
>    My recipe it's getting sources from github and not from registry.
>    Thanks!

No problem. FYI I have some examples here:
https://github.com/arfoll/meta-brendan-nodepkgs

They show usage of shrinkwrap and lockdown etc... It's not
particularly useful or used but really it's my test layer so feel free
to submit any other modules you think are helpful/useful.

Cheers,
Brendan

