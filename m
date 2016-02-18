Return-Path: <Fupan.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8AB6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 08:32:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1I8Wpog012760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Feb 2016 00:32:51 -0800 (PST)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 00:32:50 -0800
Message-ID: <56C5818F.8060707@windriver.com>
Date: Thu, 18 Feb 2016 16:32:15 +0800
From: fupan <fupan.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1455761419-21043-1-git-send-email-fupan.li@windriver.com>
	<1455783550.28376.75.camel@linuxfoundation.org>
In-Reply-To: <1455783550.28376.75.camel@linuxfoundation.org>
Subject: Re: [PATCH] oe-core: Fix base-files wrong softlink of /var/run and /var/lock
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
X-List-Received-Date: Thu, 18 Feb 2016 08:32:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2016 04:19 PM, Richard Purdie wrote:
> On Wed, 2016-02-17 at 18:10 -0800, fupan.li@windriver.com wrote:
>> From: fli <fupan.li@windriver.com>
>>
>> OE-CORE's fs-perms.txt force /var/run to link /run and
>> /var/lock to /run/lock, so in order to match with it,
>> make base-files /var/run and /var/lock link the absolute
>> path too.
> You really need to explain what the issue you're solving is here. You
> appear to be replacing two relative paths with absolute paths? Why does
> this matter?
>
> Cheers,
>
> Richard
>
>
when base-files linked /var/run to relative path of ../run
  and other packages linked /var/run to absolute path of /run by
OE-CORE's fs-perms.txt processing, this will cause two rpm packages
installed two the same name file but they are different , which will
cause files confliction.

Fupan

