Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 91BA6781F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 06:44:30 +0000 (UTC)
Received: from pps.filterd (m0047963.ppops.net [127.0.0.1])
	by m0047963.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7T6iB1b033142 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 02:44:31 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170825064339.181395-1-jose.alarcon@ge.com>
	<1503664143.32591.229.camel@linuxfoundation.org>
	<c125eff9-fc40-5526-021f-af6aaeda18f7@ge.com>
Message-ID: <1b29a241-e0fc-c2f8-383a-4c95d44a2dc5@ge.com>
Date: Tue, 29 Aug 2017 09:44:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c125eff9-fc40-5526-021f-af6aaeda18f7@ge.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-29_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708290101
Subject: Re: EXT: Re: [PATCH resend] meta/classes: add class to test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Tue, 29 Aug 2017 06:44:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 26.08.2017 14:27, Jose Alarcon wrote:
>
> On 25.08.2017 15:29, Richard Purdie wrote:
>> On Fri, 2017-08-25 at 09:43 +0300, Jose Alarcon wrote:
>>> The do_rootfs log contains a number of unsatisfied package
>>> recommendations. At the moment those are only visible when
>>> reviewing the rootfs log.
>>>
>>> This class adds an extra check to surface any unsatisfied
>>> recommendation  as WARNINGS to the build output.
>>>
>>> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
>>> ---
>>>  meta/classes/rootfs-check-recommends.bbclass | 21
>>> +++++++++++++++++++++
>>>  1 file changed, 21 insertions(+)
>>>  create mode 100644 meta/classes/rootfs-check-recommends.bbclass
>> This looks like it would be a better fit for rootfs-
>> postcommands.bbclass?
> Thanks. I sent a new patch with this check done in rootfs-postcommands
> class.

New patch with the check done in rootfs-postcommands here:
https://patchwork.openembedded.org/series/8521/#

The reason why I implemented this as a class in the first place was that
we don't want to modify upstream layers and there is no way to append a
bbclass.
So I created a new class in our own layer instead. But for upstreaming
it is true that rootfs-postcommands is a better fit.

Thanks,

--
Jose

