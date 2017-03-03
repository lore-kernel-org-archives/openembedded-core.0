Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 25FB177696
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 10:59:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Mar 2017 02:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,236,1484035200"; d="scan'208";a="231855976"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2017 02:59:06 -0800
To: openembedded-core@lists.openembedded.org
References: <20170228045004.GA5913@linux-uys3>
	<b7a65c18-be64-8689-131d-c06b0aeb3b2a@rsi-elektrotechnik.de>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <90be46df-caaa-edc2-aa77-cf3b3a190d24@linux.intel.com>
Date: Fri, 3 Mar 2017 12:57:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <b7a65c18-be64-8689-131d-c06b0aeb3b2a@rsi-elektrotechnik.de>
Subject: Re: npm thoughts
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
X-List-Received-Date: Fri, 03 Mar 2017 10:59:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2017 12:45 PM, Josef Holzmayr wrote:
> - Given the current situation, the best practise seems to be to have
> package.json take care of the needed modules, and have it handle that.
> Means in my opinion that there should be as little npm-based stuff
> installed as possible. Exactly one, in the optimal case. Downside: this
> means a second dependency tracking is layered under bitbake. No good
> that sounds....

I've been looking into this for the past few days. Unfortunately, it 
looks like we do need a generic, extensible mechanism for dealing with 
the likes of npm, cargo (i.e. rust), and 'go get' and similar things.

I've just set up a minimal MEAN project on my machine, and npm pulled in 
1087 dependencies just so it could run. This is not 'wrong', it's simply 
where the world of software development is heading. It's just so much 
nicer to get a project started and running this way, than the old way of 
writing Makefiles and installing development dependencies by hand into 
the system. But it does create a headache for distributions, and those 
who need reproducible builds.

I'll write down my ideas (and maybe even a design proposal!) in a few 
days about this.

Alex


