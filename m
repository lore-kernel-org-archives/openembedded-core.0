Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9348965CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:29:59 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id BFDDB23844
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:29:58 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <5641FF66.7040705@pseudoterminal.org>
Date: Tue, 10 Nov 2015 15:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <5641FF6D.7000508@linux.intel.com>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 14:30:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2015 03:30 PM, Alexander Kanavin wrote:
> On 11/10/2015 04:22 PM, Jussi Kukkonen wrote:
>
>> There's currently no software built with vala in oe-core. That's not
>> great for vala (as it's not getting the automated testing that high
>> quality maintenance would require) and it's not great for oe-core (as
>> maintenance effort is better spent on components that _are_ used).
>>
>> Based on the above there's a feature request** to remove vala from
>> oe-core. Please comment here or on the bug if you think this is an
>> inappropriate idea or have suggestions.
>
> I have to say no. A lot of things in oe-core (libsoup for instance) 
> come with an option to build vala bindings which in turn require 
> native vapigen binary provided by vala package.
>
> Alex
>

Doesn't vala rely on GObject introspection, which is unsupported in OE?

