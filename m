Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9D28665D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 23:00:23 +0000 (UTC)
Received: from [IPv6:fda8:8b75:6fa6:1000:8896:7124:2ba1:3b2] (192.168.15.34)
	by smtp.enea.com (172.21.1.208) with Microsoft SMTP Server id
	14.3.224.2; Thu, 26 Nov 2015 00:00:19 +0100
To: "Burton, Ross" <ross.burton@intel.com>
References: <1448322097-33026-1-git-send-email-tudor.florea@enea.com>
	<1448322097-33026-2-git-send-email-tudor.florea@enea.com>
	<CAJTo0LbNcwn0wxdoFvtitdyOVXEZ=HVsStN0JLdt9LFNOgkJJg@mail.gmail.com>
From: Tudor Florea <tudor.florea@enea.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56563D81.4060403@enea.com>
Date: Thu, 26 Nov 2015 01:00:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbNcwn0wxdoFvtitdyOVXEZ=HVsStN0JLdt9LFNOgkJJg@mail.gmail.com>
X-Originating-IP: [192.168.15.34]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux: Add ptest
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
X-List-Received-Date: Wed, 25 Nov 2015 23:00:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 25/11/2015 23:33, Burton, Ross wrote:
> 
> On 23 November 2015 at 23:41, Tudor Florea <tudor.florea@enea.com 
> <mailto:tudor.florea@enea.com>> wrote:
> 
> +--- a/tests/run.sh     2015-11-18 15:09:05.517018566 +0100 ++++
> b/tests/run.sh     2015-11-18 20:02:15.492749213 +0100
> 
> 
> Would it be possible to keep run.sh as it is but pass --parallel 1
> from run-ptest so it doesn't run the jobs in parallel?
Short answer is no. In the latest version the package run.sh has been
adapted to work with parallel test driver (only). Ptest however works
with serial test driver only at this moment.

Partly off-topic: This automake patch [1] would we a good step toward
having Ptest working in parallel. However the patch was not yet
applied in poky and upstream still haven't answered the query [2]

> Or, do we care if it runs the tests in parallel?
Running tests in parallel have the benefit of spending less time with
testing. Otherwise, the results should be the same.
> I'm looking at that patch and thinking it's going to be a nightmare
> to maintain when upstream modifies their script.
I agree is not the best patch. I simply revert to the file used in
version 2.24.2 ( plus a minor grep option addition) to make it work.
We will get rid of this patch when we eventually make Ptest run with
parallel test driver.

Another option is to ignore run.sh wrapper and add the logic "run all
testcases" into run-ptest.

> 
> Ross

[1]
http://lists.openembedded.org/pipermail/openembedded-core/2014-November/098932.html
[2] https://lists.gnu.org/archive/html/bug-automake/2014-11/msg00005.html

Regards,
  Tudor.

