Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 045CE783E9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Sep 2017 09:42:59 +0000 (UTC)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v829coA3044543 for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Sep 2017 05:43:01 -0400
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170826112602.15344-1-jose.alarcon@ge.com>
	<20170826112602.15344-2-jose.alarcon@ge.com>
	<CAJTo0LZPPuC23W4UnbTYBA8MLZAh1E=8RmU5LeTdVEDpJiQ46Q@mail.gmail.com>
From: Jose Alarcon <jose.alarcon@ge.com>
Message-ID: <081604aa-0f5d-e013-672b-c7f93c9dc039@ge.com>
Date: Sat, 2 Sep 2017 12:42:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZPPuC23W4UnbTYBA8MLZAh1E=8RmU5LeTdVEDpJiQ46Q@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1709020149
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH 2/2] rootfs-postcommands: add test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Sat, 02 Sep 2017 09:43:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 02.09.2017 03:22, Burton, Ross wrote:
> On 26 August 2017 at 12:26, Jose Alarcon <jose.alarcon@ge.com
> <mailto:jose.alarcon@ge.com>> wrote:
>
>     The do_rootfs log contains a number of unsatisfied package
>     recommendations. At the moment those are only visible when
>     reviewing the rootfs log.
>
>     This patch adds an extra check to surface any unsatisfied
>     recommendation  as WARNINGS to the build output when
>     "debug-tweaks" is enabled.
>
>
> But isn't that the point of recommends?
>
> If the user uses BAD_RECOMMENDATIONS to explicitly stop specific
> recommendations being installed, or the package just isn't available,
> that's fine.

Yes. The purpose of this patch is to surface those unsatisfied
recommends. The user then can decide whether to use BAD_RECOMMENDATIONS,
satisfy the recommend if it is something he needs or just ignore them.

Thanks,

--
Jose

