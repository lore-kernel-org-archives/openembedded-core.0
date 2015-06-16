Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0EA73BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 13:30:08 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C1645F811E3; Tue, 16 Jun 2015 07:30:09 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5E2E9F811E3;
	Tue, 16 Jun 2015 07:30:09 -0600 (MDT)
Message-ID: <558024F3.5030604@mlbassoc.com>
Date: Tue, 16 Jun 2015 07:30:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <557E9EFE.1030703@linux.intel.com>	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>	<CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>	<557EE4C2.501@linux.intel.com>	<CALbNGRS-xR52wapA2viFa0oZJ6kotFdjhXpb6kyOtpRyn--5=A@mail.gmail.com>	<55801903.4040905@linux.intel.com>
	<CALbNGRTJeh4eCD45cGUOx-DRZPHSeKTqndq1Jk+7V-ANQtAPNA@mail.gmail.com>
In-Reply-To: <CALbNGRTJeh4eCD45cGUOx-DRZPHSeKTqndq1Jk+7V-ANQtAPNA@mail.gmail.com>
Subject: Re: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Tue, 16 Jun 2015 13:30:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-06-16 07:27, Andreas Müller wrote:
> On Tue, Jun 16, 2015 at 2:39 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 06/16/2015 09:50 AM, Andreas Müller wrote:
>>
>>> How about doing same as others do e.g fedora [1-2]: Keep two version
>>> of webkit-gtk based on same recent code:
>>>
>>> * gtk2/webkit1
>>> * gtk3/webkit2
>>
>>
>> Before showing how, you need to explain why. Fedora has to package webkit1
>> because they have a lot of apps in the Gnome stack that still haven't been
>> ported to webkit2. Oe-core on the other hand has only one such app: midori.
> Yes and midori is the only working browser in Yocto (I know): firefox
> crashes since very long time for illegal ARM instruction and chromium
> does not start at all.

What platform are you using?  Are you building these from meta-browser?

I routinely use both firefox and chromium on ARM (i.MX6) with no problems.

>
> I suggest we stop discussing my comment: You continue updating
> webkitgtk and I'll try to get a working browser.
>
> Andreas
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

