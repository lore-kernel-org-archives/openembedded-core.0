Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 78FD871A5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 11:35:50 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3vmv5f3fZpz3hjk8;
	Mon, 20 Mar 2017 12:35:50 +0100 (CET)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3vmv5f2cQZz3jgYC;
	Mon, 20 Mar 2017 12:35:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id LXpNts32PSLB; Mon, 20 Mar 2017 12:35:48 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221]) by mail.mnet-online.de (Postfix) with ESMTP;
	Mon, 20 Mar 2017 12:35:48 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id E1463454043A;
	Mon, 20 Mar 2017 12:34:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DXpPM5EXJkNg; Mon, 20 Mar 2017 12:34:54 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 5AAB24540275;
	Mon, 20 Mar 2017 12:34:53 +0100 (CET)
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>,
	Robert Yang <liezhi.yang@windriver.com>, Stefano Babic <sbabic@denx.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
	<2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
	<ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
	<490a19b0-0d48-c090-685f-1edf1e017c4b@windriver.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2458A130E3@XSJ-PSEXMBX01.xlnx.xilinx.com>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <fbe16392-dd05-24c3-0016-52c7b07be73a@denx.de>
Date: Mon, 20 Mar 2017 12:35:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <14EB1FFCA0C8D24A8B04EDEC1EA78C2458A130E3@XSJ-PSEXMBX01.xlnx.xilinx.com>
Subject: Re: [PATCH 5/5] file: 5.29 -> 5.30
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
X-List-Received-Date: Mon, 20 Mar 2017 11:35:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 20/03/2017 12:29, Manjukumar Harthikote Matha wrote:
> 
> 
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Robert Yang
>> Sent: Monday, March 20, 2017 3:14 PM
>> To: Stefano Babic; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 5/5] file: 5.29 -> 5.30
>>
>> Yes, file's upstream commit ID has changed, Paul has sent a patch for it:
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2017-
>> March/134261.html
>>
> 
> Is it better to use nobranch=1 ?

Is it ? I would prefer to not skip test, just fix the issues.

> Changes in this file.git has broken Morty as well, we used nobranch=1 to resolve this issue.

But which revision is taken in your build ? IMHO it is better to fix the
revision as Paul does in his patch.

> I haven't tested this for other released versions of Yocto.

I tested -krogoth, -morty and -master, all of them are broken.

Stefano


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

