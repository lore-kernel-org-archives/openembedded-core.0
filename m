Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 52826609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:28:08 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 26EAAF811E9; Fri, 22 May 2015 07:28:10 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C072AF811DC;
	Fri, 22 May 2015 07:28:09 -0600 (MDT)
Message-ID: <555F2EF9.10506@mlbassoc.com>
Date: Fri, 22 May 2015 07:28:25 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>	<CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>	<CAGXeWgkEspQ4aK4rXfabQvHCXa+B-KvgWzkL96d86PRisc+sdg@mail.gmail.com>
	<2176018.53hRFMtF2v@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2176018.53hRFMtF2v@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
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
X-List-Received-Date: Fri, 22 May 2015 13:28:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-22 07:12, Paul Eggleton wrote:
> Hi Thomas,
>
> On Friday 22 May 2015 15:02:02 Thomas PERROT wrote:
>> If the machine layer definition is applied after meta-systemd also
>> with a default setting operator instead an affectation, this var will
>> be bad initialized. It's the case with meta-raspberrypi layer.
>
> 1) Where in meta-systemd is SERIAL_CONSOLE being set? I can't find it anywhere
> in there.

It's actually in OE-core:
   meta/recipes-core/systemd/systemd-serialgetty.bb

>
> 2) Should you even be using meta-systemd? systemd support in OE-Core is 99%
> complete; meta-systemd is mostly only needed for legacy usages.
>
> 3) When the machine configuration sets the value, that happens pretty early on
> in the parsing process so there's no way that this value is going to take
> precedence over the machine value. Have you looked at the output of
> bitbake -e systemd-serialgetty | less to see how the value of this variable is
> being set?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

