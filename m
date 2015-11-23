Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC856605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 01:24:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAN1Oh3G027020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 22 Nov 2015 17:24:43 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 22 Nov 2015 17:24:42 -0800
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1511220702250.16489@localhost>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56526AD9.5080305@windriver.com>
Date: Mon, 23 Nov 2015 09:24:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1511220702250.16489@localhost>
Subject: Re: still seems to be a pile of "_append +=" stuff in oe-core
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
X-List-Received-Date: Mon, 23 Nov 2015 01:24:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

The _append and += are different, so we need either:

var_append = " foo"
or
var_append += "foo"

for example:

var += "foo"
var = "A"

Then var will be "A".

But:
var_append += "foo"
var = "A"

Then var will be "A foo"

On 11/22/2015 08:04 PM, Robert P. J. Day wrote:
>
>    i mentioned this a while back, and it *seems* that there's even more
> of this now -- the use of "_append" in conjunction with "+=", which is
> clearly(?) redundant.
>
>    one simply needs to run:
>
> $ grep -r "_append.*+=" *
>
> to see how much of that there is. sure, it doesn't hurt, but it's
> definitely not good programming practice.
>
> rday
>

