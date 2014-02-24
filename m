Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5D38660172
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:09:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Feb 2014 05:09:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,534,1389772800"; d="scan'208";a="487060752"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2014 05:09:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: John Stirling <ap.john.stirling@gmail.com>
Date: Mon, 24 Feb 2014 13:09:22 +0000
Message-ID: <33174834.ez2WBfx6yb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CABuzA3O+hVfd0gqgGJYSuGhe40F8teU_Ts+qrhGcSJbir=Ss7A@mail.gmail.com>
References: <CABuzA3Odaup7ZC1EZPMLEULzjpDxrhRq6Oq97Ben9uLjCOKNEA@mail.gmail.com>
	<CAJTo0LYxZpiSyyQoa_Q=dY8=ShTOc2=aq5Gn4nkqLn-jmbX_BA@mail.gmail.com>
	<CABuzA3O+hVfd0gqgGJYSuGhe40F8teU_Ts+qrhGcSJbir=Ss7A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - jpeg, gif, tiff support
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
X-List-Received-Date: Mon, 24 Feb 2014 13:09:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 24 February 2014 12:43:40 John Stirling wrote:
> Thanks. That works now (tested jpeg, gif, tif).
> 
> Presume I probably don't need the change to qt4.inc I mentioned earlier ?
> (rebuild takes a while)

You almost certainly don't want Qt's internal shipped version of these 
libraries. The defaults (i.e. use the "system" libraries) should be fine.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

