Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7342771633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:00:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 28 Aug 2015 07:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="550298712"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.13.245])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2015 07:00:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 28 Aug 2015 15:00:16 +0100
Message-ID: <3982576.S6LufBxnUW@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAP9ODKr4bJH2ZWyNw6qdxaEg63ndbc+u5b8zCtBS34wn_YW5DQ@mail.gmail.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<26B844B8-BE69-427B-8DA7-B649C46A5632@gmail.com>
	<CAP9ODKr4bJH2ZWyNw6qdxaEg63ndbc+u5b8zCtBS34wn_YW5DQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] classes/whitelist: add class to allow whitelisting recipes from a layer
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
X-List-Received-Date: Fri, 28 Aug 2015 14:00:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 August 2015 10:55:41 Otavio Salvador wrote:
> On Fri, Aug 28, 2015 at 3:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Aug 27, 2015, at 5:36 AM, Paul Eggleton
> >> <paul.eggleton@linux.intel.com> wrote:
> >> 
> >> Allow restricting recipes brought from a layer to a specified list. This
> >> is similar in operation to blacklist.bbclass, but instead specifies a
> >> per-layer whitelist of recipes (matched by PN or BPN) that are able to
> >> be built from the layer - anything else is skipped. This is potentially
> >> useful where you want to bring in a select set of recipes from a larger
> >> layer e.g. meta-oe.
> > 
> > For the record, I am not in favor of such feature in OE, Distros can still
> > use BBMASK if they wish to
>
> I am also not in favor of the merge of this.

Do you have a practical alternative that has less downsides?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

