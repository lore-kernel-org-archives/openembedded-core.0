Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 84BB360144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:38:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8FEck7D018455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Sep 2014 07:38:46 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Sep 2014 07:38:45 -0700
Message-ID: <5416F9F4.30101@windriver.com>
Date: Mon, 15 Sep 2014 22:38:44 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1410247971.git.liezhi.yang@windriver.com>
	<b4b89028043c706ebd9e5d81d25f55224069e5a5.1410247971.git.liezhi.yang@windriver.com>
	<CAJTo0LZx+PrHbn=2imh1gpFQF2fnHaUZ6xbMeO8bhvixnWWOsA@mail.gmail.com>
	<5416E407.4050703@windriver.com>
	<CAJTo0LZsfdkvr7vsyvCzdK8mvn81jLk-FBdQf6D0SOhOvANuOA@mail.gmail.com>
In-Reply-To: <CAJTo0LZsfdkvr7vsyvCzdK8mvn81jLk-FBdQf6D0SOhOvANuOA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix python path and enable libxml2-python
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
X-List-Received-Date: Mon, 15 Sep 2014 14:38:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/15/2014 10:01 PM, Burton, Ross wrote:
> On 15 September 2014 14:05, Robert Yang <liezhi.yang@windriver.com> wrote:
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[python] =
>> +EXTRA_OECONF_class-native = "--with-python=${PYTHON} --without-legacy
>> --without-docbook --with-c14n --without-lzma --with-zlib"
>
> You should remove the python arguments from all overrides of
> EXTRA_OECONF and instead have PACKAGECONFIG overrides to add them
> back.  With this patch, native builds are passed --without-python
> --with-python (one from EXTRA_OECONF, one from the disabled
> PACKAGECONFIG).

Ah, yes, then we should set PACKAGECONFIG ??= "python" by default ? Otherwise
I'm afraid that there would be errors.

// Robert

>
> Ross
>
>

