Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3CBC67233E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 18:55:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 11 Dec 2014 10:55:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="427885387"
Received: from amoested-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.16.105])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Dec 2014 10:44:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Thu, 11 Dec 2014 18:55:12 +0000
Message-ID: <2731996.o7KRurrPZW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5489E2A9.3060709@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<4747988.F41N2UaoOI@peggleto-mobl5.ger.corp.intel.com>
	<5489E2A9.3060709@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 11 Dec 2014 18:55:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 December 2014 13:30:01 Trevor Woerner wrote:
> Awesome!! I'm giving this update a whirl right now...
> 
> ...just one small nit... in commit
> 7d2c6430131ccf94b8bdc185b8cd849fe479d552 the warning message says:
> 
> +        lines_before.append('# NOTE: LICENSE is being set to "CLOSED"
> to allow you to at least start building - if')
> +        lines_before.append('# this is not accurate with respect to the
> licensing of the software being built (it')
> +        lines_before.append('# will not be for in most cases) you must
> specify the correct value before using this')
> +        lines_before.append('# recipe for anything other than initial
> testing/development!')
> 
> Is the "for" in "it will not be for in most cases" out of place? Perhaps
> replace with "so", "true" or "accurate"?

Ah yes - fixed, thanks :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

