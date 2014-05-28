Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83F996FADF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 11:25:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4SBPV9A010833
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 04:25:31 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 28 May 2014 04:25:29 -0700
Message-ID: <5385C7A6.4020103@windriver.com>
Date: Wed, 28 May 2014 19:25:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1401267658.git.hongxu.jia@windriver.com>
	<bf82873db79aba78e0ecb8b744d30fc6839c9f99.1401267658.git.hongxu.jia@windriver.com>
	<CAJTo0La0d-hJs9-Lgpaw_4Zm4gJ2=Y9F47J-SPcTbwACa62mrg@mail.gmail.com>
In-Reply-To: <CAJTo0La0d-hJs9-Lgpaw_4Zm4gJ2=Y9F47J-SPcTbwACa62mrg@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] apr: fix cross compiling failed
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
X-List-Received-Date: Wed, 28 May 2014 11:25:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2014 06:48 PM, Burton, Ross wrote:
> On 28 May 2014 10:05, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> The tools/gen_test_char was invoked at build time, and it didn't
>> work for the cross compiling, so we used the native one to instead.
> Building all of libapr natively and installing the extra binary is
> wasteful when the binary is trivially compiled natively in the target
> build.
>
> Simply add a do_compile_prepend() that uses BUILD_CC and so on to
> compile tools/gen_test_char.  As it only uses standard C headers this
> is trivial and you won't need to patch the build at all (obviously
> test when MACHINE is massively incompatible with the host, ie qemuarm
> with x86 host).

Sounds reasonable, I will do that in V2.

//Hongxu

> Ross


