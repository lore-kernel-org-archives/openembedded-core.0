Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9447C78368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 15:37:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7GFbmTd011975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Aug 2017 08:37:48 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 08:37:47 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<1502890461.13978.127.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e285fe7c-320d-db44-98fd-ff1d06df5706@windriver.com>
Date: Wed, 16 Aug 2017 10:37:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502890461.13978.127.camel@linuxfoundation.org>
Cc: peter.kjellerstedt@axis.com
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Wed, 16 Aug 2017 15:37:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/16/17 8:34 AM, Richard Purdie wrote:
> On Tue, 2017-08-15 at 16:41 -0500, Mark Hatle wrote:
>> From the comments to the original patch, the only not addressed was
>> adding an OE self-test for this behavior.  I tried to do this, but I
>> don't see any existing tests that build a recipe and inspect the
>> results of the built package.  I'm not sure of any other way to
>> identify if things are working or not.
> oe-selftest can do this.
> 

Are there any examples?  I was looking there and simply didn't see any.  I saw
the packaging for instance exercised python interfaces, version comparison
tools, etc.. but nothing that built a recipe/package and then verified the
contents were 'correct'.

Ideally the test would be to fabricate something with a known set of file
dependencies, produce a package from it and then verify that the package
properly included those dependencies.

I had looked at just picking some random library out of the deploy directory,
and doing a pattern search on it's provides.. but I'm not sure that type of test
would be very robust.

--Mark

