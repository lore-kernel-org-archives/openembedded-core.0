Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF47D65C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 09:57:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s829va12023862
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 02:57:36 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 02:57:35 -0700
Message-ID: <5405948E.9050301@windriver.com>
Date: Tue, 2 Sep 2014 17:57:34 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Henning Heinold <henning@itconsulting-heinold.de>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1409650332.git.liezhi.yang@windriver.com>	<5b78099a3fbf3740a08eba0bf9c88fceaa14f3b6.1409650332.git.liezhi.yang@windriver.com>
	<20140902095158.GB8525@mail.itconsulting-heinold.de>
In-Reply-To: <20140902095158.GB8525@mail.itconsulting-heinold.de>
Subject: Re: [PATCH 1/1] piglit: add bash to RDEPENDS_piglit
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
X-List-Received-Date: Tue, 02 Sep 2014 09:57:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2014 05:52 PM, Henning Heinold wrote:
> On Tue, Sep 02, 2014 at 02:41:49AM -0700, Robert Yang wrote:
>> Bash:
>> piglit/usr/lib/piglit/tests/asmparsertest/make_test_list.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/asmparsertest/vp-tex.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/spec/glsl-1.10/variable-index-read.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/spec/glsl-1.10/variable-index-write.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/spec/arb_shader_texture_lod/compiler/make_tex_lod_tests.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/spec/glsl-1.20/execution/outerProduct-const.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/spec/glsl-1.20/execution/outerProduct.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/spec/glsl-1.20/compiler/built-in-functions/outerProduct-invalid-parameters.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/glslparsertest/glsl2/make_tex_lod_tests.sh:#!/bin/bash
>> piglit/usr/lib/piglit/tests/glslparsertest/glsl2/make_tex_rect_tests.sh:#!/bin/bash
>>
>> The bash scripts are in the tests directory, we had planned to move the
>> tests into the ptest pkg, but that would make piglit unusable without
>> installing piglit-ptest.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-graphics/piglit/piglit_git.bb |    5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
>> index 5c013ef..f468120 100644
>> --- a/meta/recipes-graphics/piglit/piglit_git.bb
>> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
>> @@ -45,4 +45,7 @@ do_install() {
>>
>>   FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
>>
>> -RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
>> +RDEPENDS_${PN} = "python waffle python-json python-subprocess \
>> +	python-multiprocessing python-textutils python-netserver python-shell \
>> +	mesa-demos bash \
>> +	"
>> --
>
> Hi Robert,
>
> how about to split out the tests into an extra package and let the package depends on bash?

That was the initial plan, but it didn't work as Ross commented, please
see this thread for more info:

http://lists.openembedded.org/pipermail/openembedded-core/2014-August/096438.html

// Robert

>
> Bye Henning
>

