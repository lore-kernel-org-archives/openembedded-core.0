Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 23614 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 May 2017 23:20:58 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0069.outbound.protection.outlook.com [104.47.33.69])
	by mail.openembedded.org (Postfix) with ESMTP id D28F86078E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 23:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tNXdYvs2pw6NGdVtKC6OVN+Cv9PpER+rEIfPO6DM9P8=;
	b=oDEDF0buZBOWNYU8blsp3HkSgjQHEC3V9VOOtu37CUBamE67+AMaSfQ8gvyQjfnzk1YD9cwbm9pOpMDx7E0bZal27zYru0xhcgRk14xbRrMvixMVMcvf+sgjK0MMEZrlJmN/boXjZiF8TuWC94j4nFapwMkFwRFc2EesFLrEkNA=
Authentication-Results: web.de; dkim=none (message not signed)
	header.d=none;web.de; dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	MWHPR01MB2688.prod.exchangelabs.com (10.172.165.14) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1061.12; Mon, 1 May 2017 23:20:56 +0000
To: brian avery <brian.avery@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1493674443.git.brian.avery@intel.com>
	<97028d3f45e62ba1e84b867d97fe5a55e0fc1d9f.1493674443.git.brian.avery@intel.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <8acd4c6d-ff42-de53-b9fa-313926a7cb0e@xevo.com>
Date: Mon, 1 May 2017 16:15:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <97028d3f45e62ba1e84b867d97fe5a55e0fc1d9f.1493674443.git.brian.avery@intel.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: DM5PR16CA0011.namprd16.prod.outlook.com (10.173.216.21) To
	MWHPR01MB2688.prod.exchangelabs.com (10.172.165.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95e466b6-9a8c-4ac5-b257-08d490e8b8a4
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:MWHPR01MB2688; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	3:w9fgvaT8/ewFOBqEbnKwiW5mQikwRLYSNApdFnXOTAhEZUP+nra7pBqLedaC7xygKVtRtspVfsDGX51PBr5woYOpQF/CUp1apVHCm3vt4WzUlOv7zFzRElE/zmHr57YN/srep7oeIiRVPjQ/9U9qbeXk91rW/DPU5sdEEv522HN5NmEv2QkYi7IbrhbTsqKtdEZyksixhWdOjpOFhoavFtq4/aNpVrZaI8nJJZ9Sb3j+luO+lNj4nBRXBbPAIIhli891Gkx1oNnVhHlu2W0ogKOvn9r1UNRU1HdHJt3RQYio0gnUuEqyXIryhWg9zxOCvSoGoPqpoS7Hsvq9xVAp1g==;
	25:R+baCeXGdfDu6fU5Bdyt4kuYd8ahZmwTW56TbTy/jpp72BjkIlgrJA5egXzkTg3jYRVUj3rbzaF3XmQfjUG0td5Lg3QxbIeXoTd8GLjWvShJlcigUARLrNi4gvPUcDtvHq0FBwHoCAkuMfb0YNYDq1P2Gj7ke3vxgF4f6hVGaRt9kbHNcElb7tpjLedi8G/PbrSMWHZ9+Kzi1zADUeYH7Z7B2N0HQDZy3WL8D/UxZ/oYwJQjGdLLCqKfvZA7i7Z5iV5B1CulECQLPbmhmgJKaC+0p4Q4tyLIhuAfxG+15CY+djY8LqA6otpJrY0qw9pt8KiASni34TK+RV7WdtUYAnkuvE8PV+1eh9SZyU/fuDuaODPKCGEXDZbLobBINlilzhwAZDDHTsuvyb9zK5Geg6bLwjxltHNFjn9HxgpXk9/MeHPKoZ+9A98L16V1KwGuVzZhHPHIf18elMZZ+G5e6w==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	31:bGO4upbRySQ69oQkBa3ZRQjrN0pG0wk0sXepLVwl04R4ZsRYHuAQjhV78yQGU0g/6kF29leHufQDNohaUT5Epcme4ePCt8E775ui6Az85JsiPvZFnzUdkM6kaB9qZ4zxFJAcB8UAat9vFrkfKPphv5GB2CsTizumjR9k9ec+StMKnhcTjGkQnEU5xUbR2CSFFMXQUtf9pgOvNMqnK996wU5aqP9H4ooMO5hTvZXopwA1EhxTL8gV0ScMZxZ3dNf3eNFrpJqdyDxLs1WwtEm15Q==;
	20:akk/NiVMXgXYPxfM03771yKWTiLK3yzzqqiqFcowd6+6VhAEtz6Vr8fWx5BgRKS2HsQIcRF5VX5Jsei1t+pZimWwoAiEtWE6h66uMcPmx446KhdcuIz0ixRwYczLKNj7Gb7FWEud5u50Ep4tm2SKhsPmlNE8HVdg2AObswTfVA5bVerVlyXsooOVlQbnG+RQSMc16HwENRWroNTKoxfPWm5OsmKBM73AearBSMha5L9IxzLLWw60suGd3CJ7zWWuH3+9bLTTvYVtN4uLfXxzyUO8BkGsIiqEjsQDnBkV2e5+pXNyKtHhz5HYZFlB/oN36TixSmH11Zz7oKR5VhbZSQ==
X-Microsoft-Antispam-PRVS: <MWHPR01MB2688AF501B4F112EDB83F757AB140@MWHPR01MB2688.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123555025)(20161123558100)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148);
	SRVR:MWHPR01MB2688; BCL:0; PCL:0; RULEID:; SRVR:MWHPR01MB2688; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	4:SNSAsR3L200+B7IQ5eDXYFtp014fcy7PxYv4PzDHK+eu8+/d4kOjzyCNljLzTJ7mD6sQ5q1YuswdmpvsNTjFPmLl7kSUsvwQ7kFKtRDBtBmMbixFvVnzoN01z2bAdAZZuOancNlauhW0xEkUe8u6zSHOaxLPmyshFy0/3CyJFozyj1zb9IO/SoIpt06iSjbx0bOCoxS50W3UtgEu122xLYW4AOWxLHzwzvJYgU3hw4XtmDVFl2fDmJPoVU3XZv39laQ1IY7pTrR31GoqyKnFjvYaMBOKHj0SMFlRcD4atPSVDLfg/bH+rDlBLK65Vk96ZXezRDDI8GVE8mIupBc3XIMBY0gFFr8vzPZahrRJl2xTL+9mn9uTERjKVQCXWqGoFtLP9YrRFmztkopiqdrDDRiOiWdngawJoDwB3y9mD/8u7q/ckIW2MVH8Ty2IhughhqQypVh1r3hHcV2yaYIbu8+VgjjTJ2rylo30rtmBsetQ4GyLzKoTs0Cn0bAFfAX+tY9rJbyN+N6SVudTwJ5byCGftFut13hPF8xZvy+1DALpTxOrVyZLyPoMqfxRxVzcDfU2sroj9VWoG5EfbnjcgsTMOATNr1Ir8+S+A7iKj+2iVy2f18e7v3pEC/5Zqb0adPUAVZn+5b4tsA3kJaT3jSTel71p8jdMujEqk4WNEMuA9jUEN1JEmIPb4Q9b6fynZ5VTJnIsSpH6+BVVFWH2pUM3ybobf3ohDMzq4K24LR8lf6/IoaVtjjCbNLCEtNqS4Y+QPUTjnn420w4ojhayRYZEKC0FnL49tkyKNErS7xyxXPbrSQse35bXz6vL37yA
X-Forefront-PRVS: 02945962BD
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39410400002)(39400400002)(39830400002)(39450400003)(377454003)(24454002)(25786009)(86362001)(117156002)(31696002)(478600001)(76176999)(31686004)(230700001)(8676002)(81166006)(23746002)(38730400002)(6246003)(54356999)(6486002)(77096006)(90366009)(53936002)(50986999)(47776003)(4326008)(33646002)(65806001)(66066001)(65956001)(189998001)(2950100002)(42186005)(36756003)(6666003)(5660300001)(83506001)(6116002)(3846002)(2906002)(50466002)(7736002)(64126003)(4001350100001)(305945005)(229853002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR01MB2688; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; MWHPR01MB2688;
	23:ouLNaA+b1ZraI3xcihVcq7IDZbmx7DZkOB3q9?=
	=?Windows-1252?Q?3j3C0yVS4i1RiutZ1IBTrRkDyHDbMVGNFLwEKA53tUlh/cG0xuE33aVG?=
	=?Windows-1252?Q?Fw/QChA+7aAxAaqAxjv1TqM/Nup5pj/276y14sc2k0gkqrsiNvkiT/QG?=
	=?Windows-1252?Q?zLq01JMG7zKWdBg6Q75hp0Ir4icatENRb+2Pmwb9Yy8XVpOSLNbp+qMO?=
	=?Windows-1252?Q?SUz0iwlKrnFtzK4//2ueTqlZ9hccb0uenwh//cJG3NZo5Z2YHjGAPOs5?=
	=?Windows-1252?Q?TFz/MyS56fmZoMS4HT/5u/cCNSDEadqzAyACo+tpoZYdpycgTldWo9/o?=
	=?Windows-1252?Q?uOm2hSmdWvjS4RWqE+ph4+JTiwhNWAnsLLjUDbnUiC7x0CFg9rpkCBD8?=
	=?Windows-1252?Q?6BMOt3ONBwAtEk5i2Mtsep0q4c0uaK1651hKM1HbMsIrFLNX/FVVBsR6?=
	=?Windows-1252?Q?Qrh8Mm0ZWhmLv1AqwjQPRmWMzFRLE7izACps9NEzw27JQNZ2+awZLWtK?=
	=?Windows-1252?Q?11hFJ9PTcEvCWHDAIlbl/NZ/FArKOeJn7kY2KNH7qG8bsobEPlXfu6xh?=
	=?Windows-1252?Q?Z2vb1nlunLGdtTHTWM43+LQcCwMcp028/SKY6em6ZQJYqA65bHAlWu3Q?=
	=?Windows-1252?Q?+DWtzTAwn0t7FwgjNAodz5+tUXbv8p7IdgPBxhNcQtJymiH/2UTkQrTu?=
	=?Windows-1252?Q?I+FmRY2GRidlkxsiQYPpvFJU6BEUp2JbCAsxoLK5aDq9jaZUiuzRuhRb?=
	=?Windows-1252?Q?HrHRbsGdXD647IY0OmMmU3ZBJ+Ikz1UIw5C/UxmiriymewJEm8WyPhou?=
	=?Windows-1252?Q?Se83+0A2d3xDsLteiBLxyre/YhnFlZ9tSsjBHKdb8EKxk1AeUp+tPN77?=
	=?Windows-1252?Q?ZLPwMQEYnJC9jByTxFfdhq9WWhum7GXA+gFvFT1ql9Nbe+qSuaqUMVLl?=
	=?Windows-1252?Q?7Mkxgqq8kqa5xIJwV1f2oAodGcxkJNFUoUjDDjnNICPGLCCmsMZAk/sy?=
	=?Windows-1252?Q?euw/avt4HNZ0cmWBuwVzcuq2rWsvC5UAlmSi4apHsbN4yMqjNg6Sj1NA?=
	=?Windows-1252?Q?AqkKKf2qKcB2CgMZK9NfzGeKbQj4zih85LQa/txapMAOz7nkr52UMHt+?=
	=?Windows-1252?Q?weAjcTBNiExMCed495G258rtYK0QE1gIMNWr4JE7nt1cj518FuzR+xgm?=
	=?Windows-1252?Q?qkH0OEeFIFTHyTDuLwl5OsFlwlF12fYkUL/3Fo0DCO6uMhnykdx6mWRX?=
	=?Windows-1252?Q?NyIGZ7AsfsqtaWbzw0nbPFfCSuUspLNwK2WeFcdGDu6V+PfWg+aPGBDm?=
	=?Windows-1252?Q?W1m8VIMfY2WaS4mwzmCQel9kq3upeOiD9XmPjjKQCM/PlY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	6:+vaUVdGbfOkjMvgmPSmf5j+5JlgD9tPgNxEKXS/iFiAEavMefxL/L4antKraoCk8Oadxx4MnLpzZ0t/JtfDoJS9oT3jTIItpOwIZbdk6cDzfXquAWGddXLuOdEtzQmyaWBF9XAjnnNYC8lh7iyb+eLmoOaRxtrUNcbESNyWsCULtSfMtycO7bxyiz1V4IMMJ+gumi8kN2nAxtOd+5KSz/t6G7q/OPPeNeYdqLhXcVKQboFU2RkYUMVLcy6PhTE+JaH0gkvSpnoopuqPuwU3SoC7dKsZ/ap8DDubnlvpKoZABtGDqSeGxHuEoWTQnDAeaxeeC9ZAmAxU2jltp9iHRGbdQCHUw2vWQRnytpI56CA83oMbZGAt3NDbtto+v8UrAQiIoOL1vvMeOE0kTqUtORCJk/+5F0qbffzZV2lNJ5zKfw9pZOaeLMs4a5lc/ncmCNMPf/3/t2MIpssTBimKbMbtgLuYHD2Q3/1dxUvDup2hysQD0eRdUAgbTufh4aZtpa4tbvCiWEFxIABBy15Fntg==;
	5:p5P6G8V+/9jmpl5VOazAGCI3i9YmmI7QRPVzMbkQ+psT4kQrjH/mc1rI9aRo6AQND9euEv8JeGQXGnoD0oajGw/tw/hnAm+G7mfp5F0KOMktcazuqu3SRp3+CwohRnNkQzOYFbtTNi8YTCA3LIGeuQ==;
	24:zufBvwl0zwvyqsbo5SRfMj2RQScJ14c45WlNKFj8UG8DnFecj7PojtLqOSmtCdEYjD8LEbSg27ekyFQY9wbpIAkdbWlWTZBe8P+PwszlwmQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR01MB2688;
	7:HFm2cEFEYqwkr7HnOBUvQpVU13U2mOxpQoUy6smGDWwa2NFqbkPbRwNeWc2S0fXsC0W6a/eU4oPzaJbjd+rRevYrx70i+MvVvbBgend3dRMTfZWcekGInenKC7p0cZKmMrQ4XA4HFlZIUcNXruNJ2g1dd0UlF4ww50quLXQhcSnNP2fna6EeBAnQMRLLD+xlWrQnkjL3hYkD9vAgX5qYfsT2VCOCJY/KKqqfla5oThDpO6Aha1bZSpruSLu9BH4hzsRPt+7haduIaRUAF3e5jxborhFdog1LM0Z2FHvBD9N/rr2FKslN5o41VBqCrM7o8ufUvj2WgpoUq1UNKvVXjA==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2017 23:20:56.5539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2688
Cc: Jan Kiszka <jan.kiszka@web.de>
Subject: Re: [PATCH 1/1] tcf-agent: add -USR2 to stop/kill initscript
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
X-List-Received-Date: Mon, 01 May 2017 23:20:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Looks like this is addressing the same problem as Jan's patch from 
earlier today. I think the differences are:

- kill vs start-stop-daemon

- Jan removed the retry loop while this patch does not

On 05/01/2017 02:59 PM, brian avery wrote:
> The current initscript was lacking a -USR2 signal in the stop section.
> This resulted in /etc/init.d/tcf-agent stop; taking roughly 10 seconds
> then failing to kill the tcf-agent process. This patch brings us in line
> with how upstream stops the agent.
>
> Fixes [YOCTO #10858]
>
> Signed-off-by: brian avery <brian.avery@intel.com>
> ---
>  meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
> index 6303280..13497cc 100755
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.init
> @@ -35,7 +35,7 @@ case "$1" in
>          echo -n "Stopping $DAEMON_NAME: "
>          count=0
>          while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
> -            killproc $DAEMON_PATH >& /dev/null
> +            kill -USR2 `pidofproc $DAEMON_PATH`  >& /dev/null
>              sleep 1
>              RETVAL=$?
>              if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ; then
> @@ -72,4 +72,3 @@ case "$1" in
>  esac
>
>  exit $RETVAL
> -
>

