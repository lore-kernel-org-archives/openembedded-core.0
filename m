Return-Path: <jpmv27@yahoo.com>
Received: from sonic314-20.consmr.mail.ne1.yahoo.com
	(sonic314-20.consmr.mail.ne1.yahoo.com [66.163.189.146])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADA671A0C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1521129661; bh=4G5Ik5S+2I0KrZImWEnuX8qvCihWEEyn6tuCPbWSQGE=;
	h=Subject:To:References:From:Date:In-Reply-To:From:Subject;
	b=smzGTkv2HRFyz2/GJ2zTiWe1usUIirNmgglBh8ojynlFwvryY750kEjXd942mtoRHiKGVvJOwwWuFcggHHafExHkB2mtFehSA8CNtA0cqdxXIEIWpuI8QuLwf5LPm9xLAS1iWbR1TlIT/5EB2iXdSy/f21iLM/F5lhKpMn0q5Qee9tRMn8LjzpWTI3u+T+Wcv6kqBEl+eNtmG/Qob1Y5steAhjoBd7nGem1KgVzCLEdJMmJKiiMYCwzeuxL23PeOY7IzhUA63XxPA3CVq/8WtqGedyWKQ5vraClzLHn91QVkfUVVClbuLKHijUGLC9hpHJvypM7SBNl66/3/NbEixA==
X-YMail-OSG: JZv2PF0VM1ldIHYCU8kiak1ifAcsQs2PFr1dvR29gXB_qj1bJCa0C3HJfPW.SKf
	9qe0bYfRHBiq0vfSs_xkVLjyB7T6GxHp.clVD5kfHrh.wd0BcJoO1t1spjK0inO1f32dpoOTjrAk
	V7TR1Z8JzoZdUfC2oZIuJt0mOovmW5rgqZrh6XNsfpyri3IrAgKgKhOdv5IUlsBGgc1tQFZvAdci
	Vbh5ibtcr_6FXEmuDUgas4Bsvg70KhfP0e092V638rD2FmKLOdPFSJrwghe1Eujr_Yj3QMEfI96I
	PcdJ6zx5eq3OA7npuMTDBVMgqmfmuoCO6fs_yyRYolbxmrqq1IiJgaXdnPQwVUkB087MthlJmGpq
	NCJz6Yo9XtMTclqXcRNeCQIXqIea1YeEtke3ZfI23fi2PCdjDgDZzVVZlyAQVaWt90JGMIIjUnQv
	aSnqn8hT4Lkdii_RgzIcMIgZQOFdSLPYQsW.sxOpM1QvNW9GWIXti5RLeC2oBxb_0Nj602IdN0yV
	d_j4l
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic314.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 15 Mar 2018 16:01:01 +0000
Received: from CPE000db93f888c-CM001404556d28.cpe.net.cable.rogers.com (EHLO
	[10.11.12.90]) ([99.246.128.134])
	by smtp412.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	35458c10fb263b1af7c2af2aa5d84fd8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:00:59 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
	<8ef4b697-ea48-80eb-9068-7b15fd7cc944@yahoo.com>
	<ff44760a-886b-b868-c309-3cf52dc142f5@linux.intel.com>
From: Martin Vuille <jpmv27@yahoo.com>
Message-ID: <336ef165-2577-f2c6-0c66-a5381f36e727@yahoo.com>
Date: Thu, 15 Mar 2018 12:00:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <ff44760a-886b-b868-c309-3cf52dc142f5@linux.intel.com>
Subject: Re: Recipe for Linux page-types tool
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
X-List-Received-Date: Thu, 15 Mar 2018 16:01:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/15/18 06:49, Alexander Kanavin wrote:
> On 03/15/2018 12:20 AM, Martin Vuille wrote:
>> page-types is a simple Linux kernel debugging tool to list information about
>> the state of virtual memory (VM) pages.
>>
>> The source is distributed as part of the kernel tree: tools/vm/page-types.c
>>
>> MV
>>
>> On 03/14/18 11:22, Martin Vuille wrote:
>>> I have a recipe for building the page-types Linux kernel VM tool.
>>> Is there any interest in this?
>>> If so, to what project/layer should I send it?
> 
> 
> This questions is probably better asked on the linux-yocto mailing list then?
> 
> Alex

Thanks for the tip, I'll look into it.
MV

