Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4277D8E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:26:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3CIQMn3014786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Apr 2019 11:26:22 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 12 Apr 2019 11:26:22 -0700
To: Daniel Thompson <daniel.thompson@linaro.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <20190412123046.17510-1-daniel.thompson@linaro.org>
	<5b21542499899b2465a2b1f581faba726351e58d.camel@linuxfoundation.org>
	<20190412131616.2mwd5qefxrvlxaw3@holly.lan>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <85282e93-ffdf-6db5-f143-2139a5d4f90d@windriver.com>
Date: Fri, 12 Apr 2019 14:26:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190412131616.2mwd5qefxrvlxaw3@holly.lan>
X-Originating-IP: [172.25.44.10]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] go: Allow bootstrapping using host go compiler
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
X-List-Received-Date: Fri, 12 Apr 2019 18:26:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 4/12/19 9:16 AM, Daniel Thompson wrote:
> We could make things fully deterministic by downloading go compiler
> binaries (rather than source) if the host architecture is not supported
> by go-1.4. Is this feasible or should I continue trying to adopt the
> host go compiler for these architectures?

You may already know but in case you hadn't consider the use case,
we also have a requirement to do off-line builds
so this download would have to fit into the fetcher system
that we rely upon to avoid build-time rather than fetch-time
downloads.

Also adding a downloaded binary could be a (minor?) complication
for IP analysis for some organizations. If a user is paranoid, is
there a well-tested, reproducible procedure for generating the
binary from source on an x86-64 host? If so should a recipe
for that be added to oe-core?

In the long run, don't we want to avoid any new binaries or host tools? 
Is anyone else in the go community (Debian maybe?) interested in
bootstrapping go on arm64 hosts or do they all just use the binary?

After all that I suppose that adding the go-1.4 binary download
could be a reasonable short-term approach that we should live with
until a source-based solution is available.



Finally, as an aside, some time ago I noticed:
     https://bootstrappable.org/
and:
 
https://www.freelists.org/post/bootstrappable/A-major-milestone-in-bootstrapping
and thought that would be a good thing for oe-core that would
allow dropping even the host gcc requirement albeit at
likely significant build time cost.

-- 
# Randy MacLeod
# Wind River Linux

