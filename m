Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1F32E6FF64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 23:23:59 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1a7X2c-0002Ws-J8 from Nathan_Lynch@mentor.com ;
	Fri, 11 Dec 2015 15:23:58 -0800
Received: from wedge.localnet (147.34.91.1) by svr-orw-fem-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Dec 2015 15:23:58 -0800
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
References: <cover.1449523356.git.anibal.limon@linux.intel.com>
	<75b7c85d17559f2f279039e1606fbf1e1e1dee23.1449523356.git.anibal.limon@linux.intel.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <566B5B0C.2000501@mentor.com>
Date: Fri, 11 Dec 2015 17:23:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <75b7c85d17559f2f279039e1606fbf1e1e1dee23.1449523356.git.anibal.limon@linux.intel.com>
Cc: paul.eggleton@linux.intel.com, georgex.l.musat@intel.com, bjst@enea.com,
	benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ptest-runner: Add version 2.0 re-implementation in python.
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
X-List-Received-Date: Fri, 11 Dec 2015 23:24:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 12/07/2015 03:26 PM, Aníbal Limón wrote:
> The new ptest-runner supports timeout of upstream tests executed,
> it looks for stdout of process and if no information is available
> in certain time (defaults to 5m) the process is treaty as blocked
> and ptest-runner kills it, this handles problems of ptest-runner
> being blocked indefinitly for upstream test suites.

Having the option to specify a timeout is obviously useful, but please
add the ability to wait indefinitely, and consider making this the
default behavior.  The appropriate value for a timeout, if any, will
always be a function of the particular circumstances of the test run.
An indefinite wait at least gives one the opportunity to investigate a
misbehaving test without racing the test harness.

> +DEFAULT_TIMEOUT_SECS = 500

The change description says the default is five minutes, but this is not
five minutes :-)



