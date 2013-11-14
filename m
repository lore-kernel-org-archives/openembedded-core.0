Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 71230617AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:50:23 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 74EF2F811EE; Thu, 14 Nov 2013 06:50:25 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C6377F811EC;
	Thu, 14 Nov 2013 06:50:24 -0700 (MST)
Message-ID: <5284D523.1040106@mlbassoc.com>
Date: Thu, 14 Nov 2013 06:50:27 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1384433183.git.Qi.Chen@windriver.com>	
	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>	
	<5284CFAD.2060903@mlbassoc.com>
	<1384436557.17320.62.camel@phil-desktop.brightsign>
In-Reply-To: <1384436557.17320.62.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 13:50:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-14 06:42, Phil Blundell wrote:
> On Thu, 2013-11-14 at 06:27 -0700, Gary Thomas wrote:
>> Also, is "-" actually valid?  I seem to recall having problems when my build
>> tree had the hyphen ("-") in the path.
>
> Paths with "-" in certainly work for me.  If there are any recipes which
> break in that situation then we should just fix them.
>
> OE already has quite a range of baroque restrictions on what sort of
> TMPDIR you are allowed to use (no nfs, no symlinks in the path, no
> spaces in the name) and every new prohibition represents a loss in
> usability.  This patch as proposed already forbids a whole range of
> characters, including things like "+", and I think that disallowing "-"
> as well would be a step too far.

Fair enough.  I don't recall exactly what problems I had (in the dark
past), but I've just avoided trees with "-" in them.  I'll give it
another look if/when an opportunity comes by.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

