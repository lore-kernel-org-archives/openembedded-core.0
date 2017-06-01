Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC36377D2F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 17:13:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v51HD6wF015268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Jun 2017 10:13:06 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:13:05 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1496329361.git.alexander.kanavin@linux.intel.com>
	<1496335920.26945.80.camel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <b191e2fc-65c7-350f-1a7e-da684ca6b2b5@windriver.com>
Date: Thu, 1 Jun 2017 12:13:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1496335920.26945.80.camel@linux.intel.com>
Subject: Re: [PATCH 0/2] Multi-threaded RPM support
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
X-List-Received-Date: Thu, 01 Jun 2017 17:13:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/1/17 11:52 AM, Leonardo Sandoval wrote:
> On Thu, 2017-06-01 at 18:15 +0300, Alexander Kanavin wrote:

...

>> perl
>> before: 1m19s 63M
>> after: 55s 42M
>>
>> python3
>> before: 40s 38M
>> after: 28s 24M
> 
> it is interesting to see that perl and python does not benefit 'much'.
> buildstats should give us a better picture per recipe.

This may be due to how we process rpmdeps within OpenEmbedded.. but I'm not
sure.  I'd have expected a bigger time difference with large packages (lots of
sub packages) like perl and python3.

(kernel-modules would be another to look at, as it can get quite large.)

