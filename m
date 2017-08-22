Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6111778280
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 04:54:03 +0000 (UTC)
Received: from pps.filterd (m0048206.ppops.net [127.0.0.1])
	by m0048206.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7M4r1ws020450 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 00:54:05 -0400
To: Khem Raj <raj.khem@gmail.com>, Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <20170821102342.167780-1-jose.alarcon@ge.com>
	<CAHiDW_FBQHxDOLgRC_tr-i5Y_rd4TBge0Vt_TwnRg9x5VU2ikg@mail.gmail.com>
	<CAMKF1sp+yQe637v_s9RfxvufHY50DP5VhgUGyTe1UvMzqJ16JA@mail.gmail.com>
From: Jose Alarcon <jose.alarcon@ge.com>
Message-ID: <d0d95f15-e0d8-8d03-4a24-c4ade9017120@ge.com>
Date: Tue, 22 Aug 2017 07:53:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp+yQe637v_s9RfxvufHY50DP5VhgUGyTe1UvMzqJ16JA@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-22_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708220075
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [meta-oe][PATCH] Dhrystone: add recipe 2.1
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
X-List-Received-Date: Tue, 22 Aug 2017 04:54:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

Thank you for your comments


On 21.08.2017 21:16, Khem Raj wrote:
> On Mon, Aug 21, 2017 at 5:35 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>> On 21 August 2017 at 13:23, Jose Alarcon <jose.alarcon@ge.com> wrote:

<snip>
>>
>> Hi,
>>
>> Please send meta-oe patches to openembedded-devel@lists.openembedded.org.

My bad. I will send the v2 to the correct list.

>>
>> Also this part is unlikely to be welcome on oe-devel either:
>>> LICENSE = "Proprietary"
>> I think I remember seeing a dhrystone recipe submission with an open source
>> license (NCSA maybe?) last year .
> https://patchwork.openembedded.org/patch/129975/
>
> a v2 was expected, which I cant find so it never got applied. if you
> are interested rework the v1 and test it out. Submit a v2 and we can
> take it further along the line.

About the license, I couldn't find any in the source of Dhrystone.

There is an Android package that mentions NCSA. I believe that Public
Domain would be more appropriate in this case.

I wasn't able to find a dhrystone package in Debian or Fedora to double
check about the license.

Thanks,

--
Jose

