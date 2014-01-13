Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00E3D6B565
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 02:00:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0D20AwF001958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Jan 2014 18:00:10 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 12 Jan 2014 18:00:09 -0800
Message-ID: <52D348A5.6080808@windriver.com>
Date: Mon, 13 Jan 2014 10:00:05 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1388769973.git.liezhi.yang@windriver.com>
	<5b836adb7023cf075f9eb2246c7b2bbe420fd1cf.1388769973.git.liezhi.yang@windriver.com>
	<CAJTo0LY2hTEcqZyqrDsoBGEbWYwovCSu7+gZdo4av+9=0w_J5g@mail.gmail.com>
	<52CBFBB5.8030009@windriver.com>
	<CAJTo0LaMobezC+B7eNbXc-2NLnS2fxLid=xNvE_7hzMR5ntQnQ@mail.gmail.com>
	<8DE9C4FF-2468-4BE0-9FF3-8DC428F5A762@dominion.thruhere.net>
In-Reply-To: <8DE9C4FF-2468-4BE0-9FF3-8DC428F5A762@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gconf.bbclass: remove --disable-schemas-install
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
X-List-Received-Date: Mon, 13 Jan 2014 02:00:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2014 02:33 PM, Koen Kooi wrote:
>
> Op 8 jan. 2014, om 17:12 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>
>> On 7 January 2014 13:05, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>> *Some* packages have migrated away from gconf to gsettings.  Not all
>>>> packages have done this, so anything still using gconf is now broken.
>>>> Note that almost nothing in oe-core uses gsettings as we're still
>>>> using the GTK+ 2 stack generally.
>>>
>>> Hi Ross, which recipe is failed, please ?
>>
>> A better question would be what package did you get this warning from?
>>
>> As I said, any recipe that did inherit gnome and still used GConf
>> would be affected by your change.
>
> Which is over half of the meta-gnome recipes :(
>

Sounds bad, fortunately, it had been reverted.

// Robert

