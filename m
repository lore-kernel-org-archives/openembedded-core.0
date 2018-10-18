Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id B3D2079C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 14:58:46 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w9IEwkNH012188
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 18 Oct 2018 16:58:46 +0200
Received: from [139.16.79.58] (MD1FZU9C.ad001.siemens.net [139.16.79.58])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9IEwk68005582;
	Thu, 18 Oct 2018 16:58:46 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <20181017104243.801-1-pascal.bach@siemens.com>
	<CAMKF1spO151yKD1O9Dx_sKEu1shSN976+kykQ9FoXKd6fstQVw@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <9e88a77b-a611-8c04-465b-41eca2a085c5@siemens.com>
Date: Thu, 18 Oct 2018 16:58:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spO151yKD1O9Dx_sKEu1shSN976+kykQ9FoXKd6fstQVw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/4] cmake.bbclass improvements
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
X-List-Received-Date: Thu, 18 Oct 2018 14:58:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 17.10.2018 20:50, Khem Raj wrote:
> On Wed, Oct 17, 2018 at 3:43 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>> This patchset is unmodified from v3. It is just rebased on top of master which
>> already includes a fixed version of libproxy and piglit.
>>
>> I built all cmake based recipes in oe-core (qemuarm64) and did not find any more issues.
>>
> Can you run world builds on meta-openembedded repositories with
> this series applied and also compile some other large projects which
> use cmake like meta-browser
I can try but usually I get into trouble with the proxy because there are always some recipes that fetch from some location via some protocol that doesn't work.

>
>> Pascal Bach (4):
>>   cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of
>>     CMAKE_LIBRARY_PATH
>>   cmake.bbclass: search both sysroot-native and host for native packages
>>   cmake.bbclass: move CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.cmake
>>   cmake.bbclass: allow cmake to find hosttools
>>
>>  meta/classes/cmake.bbclass | 24 +++++++++++++++---------
>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


