Return-Path: <jpmv27@yahoo.com>
Received: from sonic301-32.consmr.mail.ne1.yahoo.com
	(sonic301-32.consmr.mail.ne1.yahoo.com [66.163.184.201])
	by mail.openembedded.org (Postfix) with ESMTP id E6CFA788DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1521132220; bh=1Bawe/j/JxYO5NXt8N7MsNYvzTlNTbzwyyikecDMmSw=;
	h=Subject:To:References:From:Date:In-Reply-To:From:Subject;
	b=m9PacMMsnfl9L1QtqyiVMIeViBhxVRHwKNJFcX6vEJql6y+o0RKHZl9Q5CHum2bTrOIZX9FwILpzIZUJaUHh0h7cr7+ZNSZnUG4UuJ6zNT+GXB5iOCP31nVmbRvvTi9aonZemtyJ0dstpZKSBQiBXQrjN80SO7d88TeLoL9VgVXimRqPGo6I1c1tsaDMYBNnnrUhi1pYtDLHVGJ3XBf2YPo6KkfctVkzckzKgQjPeixr6z8OZJnCAVE3b3At63N6P18bveXNjTUUDVBgLQfwbn5aUs2z6z2Ihn7rDqgGQ9pYh/wuBtDiv0l3dKQx1p4dNwkEH2THYgfJSmNdII1o1w==
X-YMail-OSG: .PKHSTEVM1ldu22gKJdXLK5TfhJke5NKXnidNq8R_A3Dlgicux2HVmATfLbS7eL
	_UoGWOh9LiFUZJ986zStsdUr60k0S75Y34J8vqHT6C1sxzHXEVdOcITwR5YWvRhsEy7cmi2_YpPu
	wrvFB9kHuM.VTtolSVmRnD_PTTRMXbj8QCgPONW8ssDAhD8HcOLuueMIw_BvB80_nmnrJfNWpn8I
	pODSQogVoS84QMJAdTQRb3JrmSIixw_hbSjTSXDvnuoc5VGNFVxLBbDF.3OQv1XsaNyHaRiQVoe7
	va61AHEG.txYZKEjJ.rmTMYM51viQBfH2Sx5ViM1uXp_O.HGjh5ANTT1Lql7m1uT_Zkx0hiGNLlK
	P6kqQu46hpU6bJ0QmriPMUK62hSGgJcdfsg0Itkk2XP9LQnKzsVqisJEl.F0_UA0LVYKaxAQOJWZ
	Ux1H8q6ZUjP0z1gNYQZJmwJciAotj3hlT6opo5O4i55Jy8d7Rt27ZcIftOAn9JwzsiCh9M1Ngg4J
	pizdJ
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic301.consmr.mail.ne1.yahoo.com with HTTP;
	Thu, 15 Mar 2018 16:43:40 +0000
Received: from CPE000db93f888c-CM001404556d28.cpe.net.cable.rogers.com (EHLO
	[10.11.12.90]) ([99.246.128.134])
	by smtp412.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
	6fae18b8b7c268d23c76d7bc63cb99fb
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:43:35 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
	<8ef4b697-ea48-80eb-9068-7b15fd7cc944@yahoo.com>
	<ff44760a-886b-b868-c309-3cf52dc142f5@linux.intel.com>
From: Martin Vuille <jpmv27@yahoo.com>
Message-ID: <5c0c563b-bbe2-e1b9-2da0-bb260a946042@yahoo.com>
Date: Thu, 15 Mar 2018 12:43:34 -0400
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
X-List-Received-Date: Thu, 15 Mar 2018 16:43:39 -0000
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

Perhaps I'm missing something. I'm offering a bitbake recipe. linux-yocto
doesn't seem to contain any layers or recipes.

MV

