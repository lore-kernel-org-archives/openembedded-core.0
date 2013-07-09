Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70D5E6ABED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 02:06:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6926Ofw019940
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Jul 2013 19:06:24 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 19:06:23 -0700
Message-ID: <51DB701D.70904@windriver.com>
Date: Tue, 9 Jul 2013 10:06:21 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Andy Ross <andy.ross@windriver.com>
References: <cover.1373267292.git.jackie.huang@windriver.com>
	<f3947aac42370ea5f114852fd677ff1689a9b7ca.1373267292.git.jackie.huang@windriver.com>
	<51DB148F.9020702@linux.intel.com> <51DB1755.8070309@windriver.com>
In-Reply-To: <51DB1755.8070309@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] udev: add runtime dependency on blkid
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
X-List-Received-Date: Tue, 09 Jul 2013 02:06:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 7/9/2013 3:47 AM, Andy Ross wrote:
> On 07/08/2013 12:35 PM, Saul Wold wrote:
>> On 07/08/2013 12:10 AM, jackie.huang@windriver.com wrote:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> udev requires blkid, but this wasn't explicit.  Note that the
>>> dependency is on util-linux specifically, the one from e2fsprogs
>>> won't work.
>>>
>> Doesn't udev use an internal builtin-blkid?  Or is the configure finding
>> that we have util-linux and using it instead of the built-in?
>
> I think (I'm really stale here) I wrote that patch against a udev
> version prior to the addition of the builtin.  And in any case didn't
> I see that blkid got yanked from the e2fsprogs package at some point
> anyway?  Pretty sure this is not needed in upstream oe-core.  Not sure

Thanks for clarifying this, I think it it not needed in our layer's 
bbappend file as well since we had sync up with upstream oe-core, I will 
check that and clean up the bbappend.

Thanks,
Jackie


> if it ever was.
>
> Andy
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

