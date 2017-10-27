Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id F2D14782CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 14:55:52 +0000 (UTC)
Received: (qmail 17784 invoked by uid 1003); 27 Oct 2017 14:55:55 -0000
Received: from unknown (HELO ?192.168.0.158?) (philip@opensdr.com@94.113.76.12)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	27 Oct 2017 14:55:54 -0000
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Fan Xin <fan.xin@jp.fujitsu.com>,
	openembedded-core@lists.openembedded.org, 
	Michael Halstead <michael@yoctoproject.org>
References: <1509069613-5005-1-git-send-email-fan.xin@jp.fujitsu.com>
	<59d43cd3-d34e-ac77-5016-34d1dd3f35f5@balister.org>
	<ef6661a5-5910-41a3-1240-9f898d294e40@linux.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <05905dc7-921d-a88e-55d6-6051526b4015@balister.org>
Date: Fri, 27 Oct 2017 16:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <ef6661a5-5910-41a3-1240-9f898d294e40@linux.intel.com>
Subject: Re: [PATCH] curl: update to 7.56.1
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
X-List-Received-Date: Fri, 27 Oct 2017 14:55:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 10/27/2017 02:46 PM, Alexander Kanavin wrote:
> On 10/27/2017 01:16 PM, Philip Balister wrote:
>> Can you also update the commit message to show the CVE entries in a
>> standard format? We are trying to collect commits that resolve CVE's on
>> the yocto-security list.
>>
>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Example:_CVE_patch_header
>>
>>
>> For this mentioning the CVE without the .patch might help. cc'ing
>> Michael in case he his suggesting to help the hook.
> 
> For this to work, recipe maintainers need to do this manual work
> consistently and reliably across all version updates, and I simply can't
> see it happening.
> 
> You should make the tooling work so that it looks at versions in
> addition to cve tags. So that this curl 7.54->7.56.1 commit resolves to
> the list of CVEs fixed in 7.56 automatically, via some database lookup.

We have to start somewhere.

Philip

> 
> Alex
> 

