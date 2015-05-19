Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8B9601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 11:55:52 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 29F57F811E3; Tue, 19 May 2015 05:55:54 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C2FDDF811E2;
	Tue, 19 May 2015 05:55:53 -0600 (MDT)
Message-ID: <555B24D4.6070101@mlbassoc.com>
Date: Tue, 19 May 2015 05:56:04 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>	<20150508162311.GA20977@bang.betafive.co.uk>	<3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>	<2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>	<3230301C09DEF9499B442BBE162C5E48258F21ED@sestoex09.enea.se>
	<3230301C09DEF9499B442BBE162C5E482599AC00@SESTOEX04.enea.se>
In-Reply-To: <3230301C09DEF9499B442BBE162C5E482599AC00@SESTOEX04.enea.se>
Subject: Re: opkg and gpg signed ipk packages
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
X-List-Received-Date: Tue, 19 May 2015 11:55:53 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-19 05:47, Sona Sarmadi wrote:
>
>>> I'm guessing you would want something like this in your custom distro
>>> config (or local.conf if you must):
>>>
>>> PACKAGECONFIG_append_pn-opkg = " sha256"
>>> PACKAGECONFIG_append_pn-opkg-native = " sha256"
>>
>
> Thanks a lot guys for your help, this is now working :)
> There is support for sha256 in opkg but not in the opkg-utils.
> opkg-utils (opkg.py) just uses md5 as default option. I changed
>
> opkg.py:
> ........
>          # compute the MD5.
>          if not self.fn:
>              self.md5 = 'Unknown'
>          else:
>              f = open(self.fn, "rb")
>              sum = hashlib.md5()
> to
>              sum = hashlib.sha256()
>
> and now I get checksum sha256 in the "Packages" file:
>
> SHA256Sum: 6be1fb5b9dab3de5848fd578d515d05adc5c6cd3b0009f8c1b13ab1250cee594
>
> Do you think this patch would be of interest for someone?

Yes, including everything you found that needs to be set up to
support these checksums.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

