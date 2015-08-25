Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D586734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 02:06:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7P2616R022319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 19:06:01 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 24 Aug 2015 19:06:01 -0700
Message-ID: <55DBCD87.5040108@windriver.com>
Date: Tue, 25 Aug 2015 10:05:59 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1440386359-14110-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LbOFtEZwj3j39ukrSmZAp0O4s==9baGqLaqHYJZdJaMpw@mail.gmail.com>
In-Reply-To: <CAJTo0LbOFtEZwj3j39ukrSmZAp0O4s==9baGqLaqHYJZdJaMpw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xmlto: xsltproc is required by both native and target
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
X-List-Received-Date: Tue, 25 Aug 2015 02:06:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年08月25日 00:18, Burton, Ross wrote:
>
> On 24 August 2015 at 04:19, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     @@ -20,9 +20,7 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
>                         util-linux \
>                         libxml2 \
>                         bash \
>     -"
>     -RDEPENDS_${PN}_append_class-target = " \
>     -                  libxslt-bin \
>     +                  libxslt \
>
>
> This drops the runtime dependency on libxslt-bin, is this intentional?
> Should the dependency on libxslt be libxslt-bin?  Does it even need an
> explicit dependency on libxml? (does it use the xmllint or xmlcatalog
> binaries).
>
> Ross

it should be that target depends on libxslt-bin, and native depends on
libxslt, and dependency on libxml has been added on RDEPENDS

I will send v2


-- 
Best Reagrds,
Roy | RongQing Li

