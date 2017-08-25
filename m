Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6BCA277D11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 07:09:18 +0000 (UTC)
Received: from pps.filterd (m0047963.ppops.net [127.0.0.1])
	by m0047963.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7P79AJv017270 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 03:09:20 -0400
To: Andre McCurdy <armccurdy@gmail.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
From: Jose Alarcon <jose.alarcon@ge.com>
Message-ID: <17938e56-c1d0-5316-0263-b954006f9015@ge.com>
Date: Fri, 25 Aug 2017 10:09:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708250108
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Fri, 25 Aug 2017 07:09:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 24.08.2017 20:45, Andre McCurdy wrote:
> On Wed, Aug 23, 2017 at 10:37 PM, Jose Alarcon <jose.alarcon@ge.com> wrote:
>> This patch was a temporal workaround needed with 4.1 kernels.
>> Remove it.
> OLDEST_KERNEL is still set to 3.2.0
>
> How can you be sure nobody is using 4.1 ?

That's a good point!

I didn't know about this variable. I believe we should not integrate
this change.
I will resend it once OLDEST_KERNEL is set to 4.2 or bigger.

Thanks,

--
Jose

