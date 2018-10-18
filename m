Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D415C79B0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 02:29:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9I2SQRT018584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Oct 2018 19:28:42 -0700
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 17 Oct 2018 19:28:16 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181016090054.122374-1-mingli.yu@windriver.com>
	<fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
	<CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
	<CAJTo0LZT1ytnsBoKkfdwv8GThzsOCjoQtLdbe9dtFPMaPupMxw@mail.gmail.com>
	<CAJTo0LY79q4La-mTQwG552XAkwJ8UTLp9yztVCd4g7m-pogpKw@mail.gmail.com>
	<5BC6CCD3.4050003@windriver.com>
	<CAJTo0LaYemE+q9=n0LTET2DzsQgGQPWSH+bmaM0k4ifa9oRM+A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BC7EFBC.9070105@windriver.com>
Date: Thu, 18 Oct 2018 10:28:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaYemE+q9=n0LTET2DzsQgGQPWSH+bmaM0k4ifa9oRM+A@mail.gmail.com>
X-Originating-IP: [128.224.162.215]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Thu, 18 Oct 2018 02:29:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年10月17日 17:39, Burton, Ross wrote:
> On Wed, 17 Oct 2018 at 06:48, Yu, Mingli <mingli.yu@windriver.com> wrote:
>> I'm fine not add the the hack fix from boost side, but as I know there
>> is another package camera-calibration-parsers which has the same problem
>> as below apart from cv-bridge. BTW, there may some other package also
>> has this kind of problem. This to say we need to fix the issue for the
>> this kind of packages one by one.
>
> Yes, it will need to be fixed one by one, but everyone will have to do
> this because this is what Boost is now doing.  This isn't a change to
> boost that we introduced, upstream changed the library names so
> everyone who uses boost will be fixing their code.

Many thanks for Ross's clarification!
If we need to fix the packages one by one, but not add the hack at boost 
side, then https://bugzilla.yoctoproject.org/show_bug.cgi?id=12833 
should be invalid.

Thanks,

>
> Ross
>

