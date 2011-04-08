Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q8GVe-0003eu-1R
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 20:34:18 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 85CF616606B5; Fri,  8 Apr 2011 12:32:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 4599016606B3;
	Fri,  8 Apr 2011 12:32:02 -0600 (MDT)
Message-ID: <4D9F54A2.7010109@mlbassoc.com>
Date: Fri, 08 Apr 2011 12:32:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1301388474.git.dexuan.cui@intel.com>	<c9789f2d0873c6b8ff2ae3a7b338b72527cfbf02.1301388474.git.dexuan.cui@intel.com>	<1301395410.24596.22.camel@rex>	<1865303E0DED764181A9D882DEF65FB68A3F6A15D4@shsmsx502.ccr.corp.intel.com>
	<4D9F5166.1020500@intel.com>
In-Reply-To: <4D9F5166.1020500@intel.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH 1/1] qt4: remove the option -feliminate-dwarf2-dups to fix the build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Apr 2011 18:34:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2011 12:18 PM, Saul Wold wrote:
> On 03/29/2011 04:43 AM, Cui, Dexuan wrote:
>> Richard Purdie wrote:
>>> On Tue, 2011-03-29 at 16:52 +0800, Dexuan Cui wrote:
>>>> From: Dexuan Cui<dexuan.cui@intel.com>
>>>>
>>>> [YOCTO #932]
>>>>
>>>> After commit 5ea06dc295b657383fd97545c15255b294cf1a79(bitbake.conf:
>>>> Prune global OPTIMIZATION flags) that adds an option
>>>> -feliminate-dwarf2-dups, gcc 4.5 reports such an internal compiler
>>>> error when building Qt4 if the option is used:
>>>>
>>>>> graphicsview/qgridlayoutengine.cpp:1553:1: internal compiler error:
>>>>> in build_abbrev_table, at dwarf2out.c:9806 Please submit a full bug
>>>>> report,
>>>>> with preprocessed source if appropriate.
>>>>> See<http://gcc.gnu.org/bugs.html> for instructions.
>>>>
>>>> This is a gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47361
>>>>
>>>> At present we can remove the option as a workaround.
>>>>
>>>> Thanks Robert Berger for reporting the bug and his investigation in
>>>> gcc bugzilla and thanks Khem Raj for the quick suggestion about
>>>> removing
>>>> the option.
>>>
>>> How about we add the patch for this issue:
>>>
>>> http://gcc.gnu.org/ml/gcc-patches/2011-01/msg01647.html
>> Ok, I'll apply the patch to g++ and test building qt4.
>>
> Any update on this patch?

Does this matter any more, since Richard removed that option globally?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


