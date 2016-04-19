Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF4CF6E681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:21:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J2LUCm026075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Apr 2016 19:21:30 -0700 (PDT)
Received: from [128.224.162.138] (128.224.162.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 19:21:30 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1460106177-22822-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0La47_jBoFLh+UoMqshBec2BT+G76rrUK6Fa5x5gL82+KQ@mail.gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <57159628.3070609@windriver.com>
Date: Tue, 19 Apr 2016 10:21:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La47_jBoFLh+UoMqshBec2BT+G76rrUK6Fa5x5gL82+KQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: add krb5 to PACKAGECONFIG
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
X-List-Received-Date: Tue, 19 Apr 2016 02:21:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年04月08日 18:04, Burton, Ross wrote:
>
> On 8 April 2016 at 10:02, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     +PACKAGECONFIG[krb5] =
>     "--with-gssapi-includes=${STAGING_INCDIR}/gssapi/, \
>     +                       --without-gssapi,krb5"
>
>
> If you're using pkgconfig why do you need to pass paths?
>

this is similar with --with-gssapi, but which can not the header files.
so I use --with-gssapi-includes=${STAGING_INCDIR}/gssapi/

-Roy



> Ross

-- 
Best Reagrds,
Roy | RongQing Li

