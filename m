Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5D5781E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 22:52:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8IMqRFl009560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 18 Sep 2017 15:52:28 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 18 Sep 2017 15:52:27 -0700
To: Matt Madison <matt@madison.systems>, "Slater, Joseph"
	<joe.slater@windriver.com>
References: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
	<20878500-1BB2-43F0-A6A5-087775FC0FAB@madison.systems>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <b8a7eae3-2b65-e17d-efe0-f7efb113fd38@windriver.com>
Date: Mon, 18 Sep 2017 17:52:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20878500-1BB2-43F0-A6A5-087775FC0FAB@madison.systems>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: go-runtime does not build for mips32r2 tune
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
X-List-Received-Date: Mon, 18 Sep 2017 22:52:27 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/18/17 5:50 PM, Matt Madison wrote:
> 
>> On 18 Sep 2017, at 2:11 PM, Slater, Joseph <joe.slater@windriver.com
>> <mailto:joe.slater@windriver.com>> wrote:
>>
>> This is the default tune for qemumips.  It appears that the problem does not
>> occur for an oe-core checkout just before the split creating go-runtime.
>>
>> Before the split, go-helloworld will build, but after the split it will not
>> because it needs go-runtime.
> 
> There’s a TUNE_CCARGS_remove in go_1.9.bb to remove the ‘-march=mips32r2’ flag
> that probably either needs to be moved to a .inc file or copied to
> go-runtime_1.9.bb.  Missed that when splitting out the runtime recipe.

That seems wrong.  We should be using the TUNE_CCARGS, and -not- using the
arguments that 'go' has decided must be right.

Otherwise the optimizations may or may not be compatible... and if someone
selects different arguments, they won't get filtered.

--Mark

> -Matt
>>
>> Joe
> 


