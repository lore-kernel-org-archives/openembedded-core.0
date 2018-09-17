Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 14A5871AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:52:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HBpakZ000434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 04:52:07 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Sep 2018 04:51:41 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1536913629.git.hongxu.jia@windriver.com>
Message-ID: <8cb5e7ef-599e-af65-11b1-d9322b50663e@windriver.com>
Date: Mon, 17 Sep 2018 19:51:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cover.1536913629.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/2] package.bbclass: improve auto debug package splitting order
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
X-List-Received-Date: Mon, 17 Sep 2018 11:52:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月14日 16:49, Hongxu Jia wrote:
> Hi RP,
Ping RP,

//Hongxu
> Is it necessary to split multiple sub dbg packages or only
> one dbg is allowed? If the former, this fix makes sense.
>
> I know in oe-core, almost one dbg package per recipe, but
> in oe, 21 recipes have extra sub dbg package and 18 of them
> did not set NOAUTOPACKAGEDEBUG = "1".
>
> So rather than modify them one by one tediously, how about to
> improve auto debug package splitting order? If ${PN}-dbg exists,
> split the unsplit debug file to ${PN}-dbg, if ${PN}-dbg does not
> exist, still split them to first dbg package.
>
> //Hongxu
>
> The following changes since commit d180dc758710c7259d45eeb9304e7284a8fd8825:
>
>    oeqa/selftest/recipetool: fix non-determinism in cmake test (2018-09-13 16:28:26 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib hongxu/dbg-split
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/dbg-split
>
> Hongxu Jia (2):
>    package.bbclass: improve auto debug package splitting order
>    selftest/package: improve case to test debug package splitting
>
>   .../selftest-hardlink/selftest-hardlink.bb         |  4 +++-
>   meta/classes/package.bbclass                       | 10 +++++++-
>   meta/lib/oeqa/selftest/cases/package.py            | 27 ++++++++++++++++------
>   3 files changed, 32 insertions(+), 9 deletions(-)
>


