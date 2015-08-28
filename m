Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B193D71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:19:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 28 Aug 2015 07:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,425,1437462000"; d="scan'208";a="634023826"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.13.245])
	by orsmga003.jf.intel.com with ESMTP; 28 Aug 2015 07:19:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 28 Aug 2015 15:19:13 +0100
Message-ID: <4561951.P3JYBJt1QK@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAP9ODKogFOzQxfJkQ-vm=H9H7ozcSk5esYrozOigrhNUKb6mEQ@mail.gmail.com>
References: <cover.1440678731.git.paul.eggleton@linux.intel.com>
	<3982576.S6LufBxnUW@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKogFOzQxfJkQ-vm=H9H7ozcSk5esYrozOigrhNUKb6mEQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Aug 2015 14:19:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 28 August 2015 11:09:19 Otavio Salvador wrote:
> On Fri, Aug 28, 2015 at 11:00 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 28 August 2015 10:55:41 Otavio Salvador wrote:
> >> On Fri, Aug 28, 2015 at 3:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> >> On Aug 27, 2015, at 5:36 AM, Paul Eggleton
> >> >> <paul.eggleton@linux.intel.com> wrote:
> >> >> 
> >> >> Allow restricting recipes brought from a layer to a specified list.
> >> >> This
> >> >> is similar in operation to blacklist.bbclass, but instead specifies a
> >> >> per-layer whitelist of recipes (matched by PN or BPN) that are able to
> >> >> be built from the layer - anything else is skipped. This is
> >> >> potentially
> >> >> useful where you want to bring in a select set of recipes from a
> >> >> larger
> >> >> layer e.g. meta-oe.
> >> > 
> >> > For the record, I am not in favor of such feature in OE, Distros can
> >> > still
> >> > use BBMASK if they wish to
> >> 
> >> I am also not in favor of the merge of this.
> > 
> > Do you have a practical alternative that has less downsides?
> 
> I do want people using full layers and offer tools to make fancy
> combinations does not enhance our quality in long term.

OK, sure - but you do appreciate that we do have an underlying problem here 
irrespective of whether this class gets taken into OE-Core or not, right?

Look, if people are really opposed to this then fine, I withdraw it. I just 
hope that it's understood that this class or other equivalent methods *will* 
get used until we fix the problem properly - all it means is the class will get 
copied around instead of being in one place.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

