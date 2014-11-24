Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7151B65DAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 05:20:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAO5K1Lq029344
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 23 Nov 2014 21:20:02 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 23 Nov 2014 21:20:01 -0800
Message-ID: <5472BFFE.4090600@windriver.com>
Date: Mon, 24 Nov 2014 13:19:58 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1416295260.git.Chong.Lu@windriver.com>
	<6d00e71e0db5fd70243f69bbd6894a296620a41c.1416295260.git.Chong.Lu@windriver.com>
	<CAJTo0Lb48t-x82qYKAmOY5TmvbWmNvSHV2tSkT+JqyLXcDjxtw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb48t-x82qYKAmOY5TmvbWmNvSHV2tSkT+JqyLXcDjxtw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bison: update to 3.0.2
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
X-List-Received-Date: Mon, 24 Nov 2014 05:20:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/20/2014 07:20 PM, Burton, Ross wrote:
>
> On 18 November 2014 07:22, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     Upgrade bison to 3.0.2.
>
>
> In testing glibc fails to build on some arches and this patch may be 
> the cause:
>
> | plural.c: In function '__gettextparse':
> | plural.c:64:25: error: too few arguments to function '__gettextlex'
> |  #define yylex __gettextlex
> |                          ^
> | plural.c:1296:16: note: in expansion of macro 'yylex'
> |        yychar = yylex (&yylval);
> |                 ^
> | plural.c:64:25: note: declared here
> |  #define yylex __gettextlex
> |                          ^
> | plural.y:69:12: note: in expansion of macro 'yylex'
> |  static int yylex PARAMS ((YYSTYPE *lval, const char **pexp));
> |             ^
> | plural.y:178:29: error: 'arg' undeclared (first use in this function)
> |       ((struct parse_args *) arg)->res = $1;
>
> Does that look like something that bison 3 broke?  If so we need to 
> fix glibc.
>
> Ross

Hi Ross,

After I upgrade bison, I test world on qemuppc and qemux86, that's ok.
Can you tell me, which arch will build failure or how to reproduce this 
failure?
I will try to fix it.

Best Regards
Chong


