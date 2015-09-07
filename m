Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 4685676104
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 16:38:10 +0000 (UTC)
Received: from [192.168.1.5] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id 999F6280053;
	Mon,  7 Sep 2015 18:38:07 +0200 (CEST)
Message-ID: <55EDBD6F.7090900@topic.nl>
Date: Mon, 07 Sep 2015 18:38:07 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <55963864.2030604@topic.nl> <55ED6393.6050906@topic.nl>
	<CAHiDW_GfhUoDMBtwbj2G8RbRnA7OWR_3b_M_tDc-hEz8g4NqYw@mail.gmail.com>
In-Reply-To: <CAHiDW_GfhUoDMBtwbj2G8RbRnA7OWR_3b_M_tDc-hEz8g4NqYw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Getting rid of "The license listed internal was not in the licenses collected" warnings?
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
X-List-Received-Date: Mon, 07 Sep 2015 16:38:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-09-15 13:56, Jussi Kukkonen wrote:
> On 7 September 2015 at 13:14, Mike Looijmans <mike.looijmans@topic.nl
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     Just sped another hour or so trying to pinpoint this, but I cannot
>     wrap my head around it. What do I have to do to add a license to a
>     layer without these annoying warnings?
>
>
> I just tried this (with master branch) and it seems to work fine
> here...  Are you using master or something older?

Did you try that in a separate, empty layer? I suspect I'm missing a 
variable or directive of some kind which cause it to miss the license file.

> Do you not get a "${DEPLOY_DIR}/licenses/${BPN}/generic_internal" file
> when you build the recipe for BPN?

Nope.


>
>   - Jussi
>
>     Mike.
>
>
>     On 03-07-15 09:23, Mike Looijmans wrote:
>
>         In my layer.conf I have:
>
>         LICENSE_PATH += "${LAYERDIR}/licenses"
>
>
>         In that path, there's a license file called "internal"
>         containing the
>         following short text:
>
>         For TOPIC internal use only.
>         Do not distribute.
>
>
>         Now on each build I get warnings like this for every recipe that
>         refers to
>         this license:
>         "WARNING: The license listed internal was not in the licenses
>         collected for
>         recipe ..."
>
>
>         As far as I know, I did everything right, but I can't figure out
>         what else I
>         need to do here. How do I get this license into the "license
>         collected"?
>
>
>
>
>
>     Kind regards,
>
>     Mike Looijmans
>     System Expert
>
>     TOPIC Embedded Products
>     Eindhovenseweg 32-C, NL-5683 KH Best
>     Postbus 440, NL-5680 AK Best
>     Telefoon: +31 (0) 499 33 69 79
>     <tel:%2B31%20%280%29%20499%2033%2069%2079>
>     Telefax: +31 (0) 499 33 69 70 <tel:%2B31%20%280%29%20499%2033%2069%2070>
>     E-mail: mike.looijmans@topicproducts.com
>     <mailto:mike.looijmans@topicproducts.com>
>     Website: www.topicproducts.com <http://www.topicproducts.com>
>
>     Please consider the environment before printing this e-mail
>
>
>
>
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
Mike Looijmans

