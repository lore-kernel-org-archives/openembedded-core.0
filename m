Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 072A5609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:08:38 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id E6BE2F811DC; Fri, 22 May 2015 07:08:39 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6552DF811DC;
	Fri, 22 May 2015 07:08:39 -0600 (MDT)
Message-ID: <555F2A67.5080904@mlbassoc.com>
Date: Fri, 22 May 2015 07:08:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>
In-Reply-To: <CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 May 2015 13:08:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-22 05:11, Otavio Salvador wrote:
> On Fri, May 22, 2015 at 7:09 AM, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
>
> Nack! The setting here is the default if machine does not define it. I
> see no benefit in dropping this.
>

I disagree - if this variable needs a value then it should be
an error to not have one assigned.  Adding a default in an obscure
recipe (which would not have a useful value for many/most targets)
is simply wrong.

Also SERIAL_CONSOLE should now replaced by SERIAL_CONSOLES...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

