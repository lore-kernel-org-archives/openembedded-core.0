Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0070.outbound.protection.outlook.com [104.47.34.70])
	by mail.openembedded.org (Postfix) with ESMTP id 52DC87763A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 06:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=c2xIuajjxgKBEUTvK0y9yVEVBxp/WusqayEYI1TTREc=;
	b=LAS5HwagFmjziHd/ISK95kYzUQM7E4W0v0j/CpoIRMQMOR9oCqii7+YGc8s1+Y+cPV7JtoB7+1i2bz16jwPlGjHbPtSLYmpUoHs91IcgPqpBdOXaTyke8TrgQJ3svnNnJj794/loH8UniSsK0T0L3ktUkqE9Tkq5vik1SNYSeRs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from [192.168.1.2] (67.171.33.217) by
	BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.12; Fri, 10 Mar 2017 06:04:13 +0000
To: Khem Raj <raj.khem@gmail.com>
References: <7f8eeb62-a767-0882-dcc0-9a6882192d82@xevo.com>
	<CAMKF1sqAw-rwkKYuEsY4QN1rA-YyQcx5hjpzux3cLk+4qxAemA@mail.gmail.com>
	<CAMKF1spRq0quE-B+T5Wio_z5FmfGNkeGrE=dcd3H-KT1KNP4HQ@mail.gmail.com>
	<93a813bd-0faa-0585-9f6e-7a49d1282616@xevo.com>
	<CAMKF1spkQgzbNMmhgHJs1wPfuo86eZU+mBceHCyP58gwULXchw@mail.gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <0ef92edd-d6d4-07c6-bc6f-483accafc6c8@xevo.com>
Date: Thu, 9 Mar 2017 21:59:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spkQgzbNMmhgHJs1wPfuo86eZU+mBceHCyP58gwULXchw@mail.gmail.com>
X-Originating-IP: [67.171.33.217]
X-ClientProxiedBy: MWHPR11CA0019.namprd11.prod.outlook.com (10.172.48.157) To
	BY1PR01MB1403.prod.exchangelabs.com (10.162.211.152)
X-MS-Office365-Filtering-Correlation-Id: c926d466-ef89-41e6-0f1d-08d4677b46d1
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:BY1PR01MB1403;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	3:8hbcrO8f2VM7a9toqkFzrFVJktWIDME2lk3mbl7zdHp5uJ/n/ZFwGvNn77MMXFu3Oj787vgVcFKjX/ws+9KvmX10uPPri2T5LNo3Lit4PynjKtoyJzw6HIJvTwJzpsKlFtGuePaTtsTusHw7DzdLbj4etLAIxEq3WUU48WSVFEMGH2/4J7rlFdyjpDl7AwRuPfOrof7Pqz+awO3gWq7CZXP5cy2HnR/D6WE9TdqqXEvoYK684/7DNkpU+O7fmJX1w4h2pGWgmapeaNK42vcGMw==;
	25:igcWa4j8odZQIBpgKcuBm+IFP8iIkUyjnfy0lbOqEjGV3t2gdAm0SV6NeeiwChPWCfV7ZtzR2Pqo83POcGnBb3dgpk+as190V5vmHrhkBumxaSlFzmkAtvtgJrmMDhrpF4QJm37P7MqAU8gBwXuqWsFRP9O4XID6GBqm/AEwaEtEbTcybgnmCK6akTFmfLBtxS8R/USH4xh7jOVcfoiAb/8csO3yv/khRrGujJyCJ3Z2k0ni6kRKUdeGv7FbLrUB9v6+qPy4KUqdNwi8/XoPb+J5wU1PCT1zdCfV3fW4JzrQqUZMzsd24ccszNUjEzgDszdHtPzynaQXuQcoHGQznzs0OcPaMV2HjWPd0D4ay+hJR6iI6buuX0kpKwMU/1KcV41l1/D8n1xBmi/Iy98IDKm6oGO6MZbyjyVgv50WCJe8P7jvJnttrWdV4vnGEQIuh+lD+yTlY8BD6yulvmRl6w==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	31:h67xOBySJTqBKBJ5hY+xtbv+pRRYLrL5PCm+NTuZOwF6ZGxfyfKne0TrGYFusq5a1tTVuaTiSH5u3OPMjlQwNj7TcSi0b+JMZ9DpBGVAU89VLinC4woxHBNr1oR1vx96oDVaF1Y1EWljsrP8SM5YW+rw3EkQVRMIjDC1EWsujRmqqLyck5mOsPdHdqVbKp+yE/b66SrPv0vZDDG4uovM3fWHFqzdt1y3MHF5leFXcEF9s3+5amgi08/0tO+buGD6bVCogmZT5CQ3aFYlPaKfetS2JKx5nbFB4oB0nLBvgys=;
	20:Rl5hpXLsY0QLYOEedalZyhGjjcZIZn6H9Z4aFz0j7uAB6hpBkjUA7d4EbPqXAmNqmZDJ4Y6lhhZXs8E2araifBNCHzOuoJt6/ostfJefN9uewT7YA5Z0SGBfdiWHJAHQ1HHvnAI8fB+1uh5etTfGHEaFcXIEXkDRCkMRFueID4kVw8LW+PgqaxgfBZcApSEtXhmKncblIDcStOeNjx4c+I5WrxTwjNHtEzHc4ijjuPwMAZKeNnJCaD67jPM47N8/K6RsESrsuFTbL9Y8WETvr1R4xbrjJwmpYY01eg6IE/0C/AFZQtzF4WWpv14SfIEpY9VoldxTb+C7+AJwEvo57g==
X-Microsoft-Antispam-PRVS: <BY1PR01MB14036AFDD2C2F294981D0A3EAB200@BY1PR01MB1403.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123558025)(20161123564025)(20161123555025)(20161123560025)(20161123562025)(6072148);
	SRVR:BY1PR01MB1403; BCL:0; PCL:0; RULEID:; SRVR:BY1PR01MB1403; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	4:e9r3D+w2Tjylz0Ls5RvGJJStOlBIVEv57/zMleI/ZvfTKWLh/KD2L1NVHutHti6Fx7ySzscwMRRp/hRLfk4/1KzDTMqDGDNzHa3iQTPa7cgvXF/8+PM8NAqsLCe6Q6F43m9+ESpwkmCk3fBnCDpprCSdSJELg3OQpQBCbBL4Ux1ZPrZ96ZfKoxQVyHQ+wC3YdKXJXHdiZleuK3+LfCmwkKYYdfbfOrIHoKMVpu5AWGg0cfpeHWX9mfRYGq0mnzqDnzFUSPqla/BEsV5y1MYE/OXXXJGWlGKEK7BJVoeoM5DQzx87HDXZ93+YhPt8H/2yBpe85qot0NruR5iB6VgqK8yO/WgF5w3P7LE/oe8Dd+d5EXgVI7aPbaDJgG1z/Xkh5UjhPLhXVqOuQzaFxX6owS9OzdBDzrYgmoHLmUUv+lxyqag1JvVG7FdA5+MOYJXDM5NstzRd4SzzKq6MkP+UsHonNVJYlIHmRaxtC5dq0YKJ1a62gkMDILwfVPGuU8eamAyr++6C73rm7Na9c9VkQVIz+WPnkH6oKu87UajUv1bKG4FbkEG3YilCE56+//AcfIt0ftZPZ9nw1C1psTorhw==
X-Forefront-PRVS: 02426D11FE
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(6009001)(39450400003)(377454003)(51884002)(24454002)(53936002)(6246003)(38730400002)(4326008)(53546006)(64126003)(50466002)(2950100002)(83506001)(6916009)(5660300001)(230700001)(2906002)(6116002)(3846002)(36756003)(23676002)(25786008)(305945005)(6486002)(86362001)(7736002)(42186005)(66066001)(77096006)(31696002)(93886004)(90366009)(189998001)(54356999)(33646002)(31686004)(4001350100001)(50986999)(76176999)(110136004)(47776003)(229853002)(117156001)(8676002)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR01MB1403; H:[192.168.1.2];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjAxTUIxNDAzOzIzOnhnZWtLOG1nM3RWNHN5STFFclNtbE1jSTA4?=
	=?utf-8?B?dERXSVg0aXVOWGhHekRJR2xmcnVqWDFpZEltNXBHNk9UMmk1Y2dqbnJwTm5q?=
	=?utf-8?B?UnUwUzNuMjNmazJ1UFRjSWdMU3BFMlh5bjJXT0k0NGpSQzFhalZ4cWc4amJ3?=
	=?utf-8?B?aWdVTmkvbkhBNFNobWdhUkxjZDZXSVB2YTlEN2M0K1pyZ0dja2grMXVCalU0?=
	=?utf-8?B?K1RUWlgvdGxkK3dmdE9EbEMxeU8wZHJRR1dYdy9IN090elU5UDhNWGJTTkhD?=
	=?utf-8?B?bEx1VjNlOUsyMmxJTmtMYWtwK3FycjJTTjI5OUZORUxvWGgwTmZ1VE10WFVj?=
	=?utf-8?B?NzBleTFaUUR2dW82eGZ4TnBDdXNDQjdSWTNweDBzRld0Y3IvQnk3aEI0L0Vj?=
	=?utf-8?B?c3lqbVpvY1V5MXhvU09kaDBEMmc0OEZNN0JsUnJCeGdVVzVFZEx0dWR0T2J5?=
	=?utf-8?B?b05pbGlyQU9UclAwQS9meVFpOTFwcjAzanEwU3BoZTFCd290U0lEdGo5MkV2?=
	=?utf-8?B?aDJkSTJmOVgvQ01CUDlobytaZjNXV2w5clh4bkVzSEZMWFEwK0JIZ2hYcW9x?=
	=?utf-8?B?cDZ0dVRMZ2NDTU1DTXAvTS9TWWdyRWRnQ3V5LzJMV3d5RGxiSU1pN2Y4cnVO?=
	=?utf-8?B?Rm5RSE90dU5kWHE4QW9wZmx3WXJ2alA3dVBScnlHYWZBM0RpKzBTVUlFd1Uw?=
	=?utf-8?B?Z29HYUxiaUl4UkJDL2w3dDVtWi94M3hlVHE0S090WU1GTWhkemplU2txVWtj?=
	=?utf-8?B?a255b2QyNFZ0bzlUK3grYjB1eEtFSDhPc1J6YlJLQUJwODByL3RkTG9remcz?=
	=?utf-8?B?eWJIYjBra0xRK2M3bDA5SW5yOVZxdWc1aGJFTUFuSDlZRGx6dm5xQ05udEVJ?=
	=?utf-8?B?ay9teFRqWnM5NnRwc0R6ZVRDL3ZIdVhJRzNvWndYVDdMQ3N5YlpGcjZZOFd6?=
	=?utf-8?B?MEl5SmNlVHBKeEdvT2FPaFROSkE2SjlpMmM0cTA2R2pGV1VMSUN1UmtwenF3?=
	=?utf-8?B?SDRZNzc4clFXcllrSGE2eDJoZVpNUDJiV2h5bXUweGZZdEUrbzN6TzR5Y1hw?=
	=?utf-8?B?Z2JYUGpyZUk0cVo2RUZPUTBaL2xJeE5QaWJ6M1Q5SW15TzZUK1pmYjc0SDVN?=
	=?utf-8?B?emVqd1ZHcXhab2l6bitXTHpkNUR6RGpmQnBnY1J6RmFKci9EOXpoaDMwVDVq?=
	=?utf-8?B?YnRQcm83dnFWNjR6eHJkYXR0bktER29uWGF1KzdicXMvRnRwTEdZMWFaQ2dE?=
	=?utf-8?B?UU11bUtpWmQ3RmdVS0taVWFDR2dPcDFJR1kwaW16Y2c2VEo5bkVRN1NiVy94?=
	=?utf-8?B?YTloNVlzdVpHQU5ONWVnZGJzTGtlbFNsL3ZRUjVpYkV1R1dFWkYwUGRLR3Zi?=
	=?utf-8?B?RUNQdDR3cEJubDNQbThnMVJpeG1YL2oxbHdLaXpTNE1rOWxsZDlodTFIdUxx?=
	=?utf-8?B?UGNhZ3M1TmxzWWxHVmJFY0wzUlNWUVZRRkszR3FVWGRydDFyekhXRlFJZEZ0?=
	=?utf-8?B?TzNNYVFGbjBUVkFMS2xhMllSbVJxNXhwMUtNMjdNaEZBeC80eVpLcDEycjVl?=
	=?utf-8?Q?m4P1JmUYrLSftx3psdGW0BZE0g1A7ItrqywRMGJ16Lrk=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	6:wXVzuO4kGWvrHdkjmLWd0BYETZ5s40+NsRmoHXfZtOD7y1hruRiNeXNzk3t5nCHI9oAmPi1EaQQ/CtOPoBjB0yccU8RNZJm+cFUs5qEVyFWeJ2U/zKhu7AxK2wmU3PKqaSZivXpHB5hL+wNosfP1ZOWZFSVkbTwSUFIwxU+3j/xwB5ypyCmRN2Rb9saG8nfnyVnY2Fgh/Srd+l1ef93Ksnn3hB6XqkqRxoo6kwnDuBeupYNKKlo26Y4KHwF95CV6pv88b2IMaSiMbfT2naqee0l37+U/aQDVFXLB0cK2GXVQD5RDC9tylo6+8fvRt/zMc9Ww8NRzCEzX5Hk9S8g9b8wF88DDbSDUZt3p2nOrPi2sPdU1ptu/29Dg3QWFZiOj+/j71VOusfZNrtW3s82jjA==;
	5:Pzswucv4gFsW/gaREGPOi7HJ9peEEo4Z7LgYSQcV9rUqhTEna3cD7uSRdgaBjt5gIPvZh/GaMGk+eBmM2eN4J4UPnSDWcDS2mmWiWg/97vUzcarLo5nBEUhiivJjaBI7Z7LRUYiK1CjxFlthHx9AaQ==;
	24:7TKN1H/jdhUdU8K7RDxhETmI+Fqn4yC9rCEKd4zN8RqNyYCHtNxsy70XY2FMnaE6MuSeyqUs23l3e9GUr5ndm9en06jiBah4yw3rEN6jiTw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR01MB1403;
	7:hRDiiQgNpKQwCG/wgLcG4YlIUiO+C8KamwGGcsbbwgNp4iS+Nwc1mGnXu+Nq6Se1MxV7T14AKrrTekaJaR3Wq1zwr9ggxAv+9XOD956POwbQ+7k8UWMGC5AmzRwvsUMjFB9+kAfnD4tXrpMyIk2zQTHIHQus3FTEWmXXhDg6sP83MJcShOMViDiAgkAoUBrJuaDeZ6MFiaoh6kEa0N/2yMNm2Lxuw0OQui4GqkzPbs31WpgqYEL2Fz6Pg8TIdsP9c+GJBFaWROGuVlLwaXRwIymxfTw9RHR36tQ1DVXDIYW/J6eL1XfNN+WMaQC+lTkQYr0ahkbeZF7h1CY36O/6qw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2017 06:04:13.0795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR01MB1403
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] LLVM shared library support
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
X-List-Received-Date: Fri, 10 Mar 2017 06:04:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2017 09:20 PM, Khem Raj wrote:
>
> slow down is 6x when using clang to compile on target, I dont know if such
> a patch would be a good thing from compiler pov.
>

I definitely understand the drawbacks of a slowdown. That said, some 
programs (such as the one I'm working on packaging) don't support static 
libLLVM at all, so without such a patch you cannot use them in Yocto, 
which is sad. In addition, using the shared version helps reduce disk 
and memory usage if you have multiple programs using it. These of course 
are always good things in an embedded context.

Would it be possible to somehow split the shared and static versions 
into separate recipes, or somehow trigger the choice from local 
configuration? That could provide the best of both worlds.

