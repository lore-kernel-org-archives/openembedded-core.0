Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CAA9760620
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 14:38:43 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1botWu-00042B-QP from Nathan_Lynch@mentor.com ;
	Tue, 27 Sep 2016 07:38:44 -0700
Received: from [172.30.80.93] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Sep 2016 07:38:44 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1474581198-14398-1-git-send-email-nathan_lynch@mentor.com>
	<CAJTo0Lb=ynjGK-d7fe0boA8z1Y1Ep561CF5E2hHx9o3QRQMm-w@mail.gmail.com>
From: Nathan Lynch <Nathan_Lynch@mentor.com>
Message-ID: <712a875b-6bff-ec9e-3df2-a9af143d00a0@mentor.com>
Date: Tue, 27 Sep 2016 09:38:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb=ynjGK-d7fe0boA8z1Y1Ep561CF5E2hHx9o3QRQMm-w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: fix ptest
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
X-List-Received-Date: Tue, 27 Sep 2016 14:38:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 09/27/2016 06:41 AM, Burton, Ross wrote:
> 
> 
>     -RDEPENDS_${PN}-ptest += "make perl bash"
>     +RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps"
>     +# babelstats.pl <http://babelstats.pl> wants getopt-long
>     +RDEPENDS_${PN}-ptest += "perl-module-getopt-long"
>     +# getopt itself needs overload
>     +RDEPENDS_${PN}-ptest += "perl-module-overload"
>     +# overload, in turn, needs overload_ing_
>     +RDEPENDS_${PN}-ptest += "perl-module-overloading"
> 
> 
> Why are those perl dependencies here and not in the perl modules themselves?

No good reason. I'll move them to the perl metadata and respin.



