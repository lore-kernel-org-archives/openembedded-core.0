Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 188876FCA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 07:33:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s827XPa2004259
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 00:33:25 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 00:33:24 -0700
Message-ID: <540572C3.4080607@windriver.com>
Date: Tue, 2 Sep 2014 15:33:23 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1408340319.git.Chong.Lu@windriver.com>	<d03fddc6174a0fefe406c4dae2daffcca218ce70.1408340319.git.Chong.Lu@windriver.com>	<CAJTo0LZ89Wg1QfzYheNO0u2YWVTQFo58je1KqYPnKzJeKK+UGA@mail.gmail.com>
	<54052811.50209@windriver.com>
In-Reply-To: <54052811.50209@windriver.com>
Subject: Re: [PATCH 1/1] piglit: enable ptest support
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
X-List-Received-Date: Tue, 02 Sep 2014 07:33:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2014 10:14 AM, Robert Yang wrote:
>
>
> On 08/28/2014 10:09 PM, Burton, Ross wrote:
>> On 18 August 2014 06:39, Chong Lu <Chong.Lu@windriver.com> wrote:
>>> +env PIGLIT_BUILD_DIR=`pwd`/.. piglit-run.py `pwd`/tests/sanity.tests
>>> `pwd`/results/sanity.results 2>&1
>>
>> You shouldn't need to set PIGLIT_BUILD_DIR.
>>
>> The sanity tests are very basic so this won't count as "running
>> piglit" in any meaningful QA sense.
>>
>>> @@ -36,7 +37,6 @@ do_install() {
>>>          cp -Pr lib/ ${D}${libdir}/piglit/
>>>          cp -Pr framework/ ${D}${libdir}/piglit/
>>>          cp -Pr generated_tests/ ${D}${libdir}/piglit/
>>> -       cp -Pr tests/ ${D}${libdir}/piglit/
>>>          cp -Pr templates/ ${D}${libdir}/piglit/
>>>
>>>          sed -i -e
>>> 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|'
>>> ${D}${bindir}/piglit-*.py
>>> @@ -46,3 +46,7 @@ do_install() {
>>>   FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
>>>
>>>   RDEPENDS_${PN} = "python waffle python-json python-subprocess
>>> python-multiprocessing python-textutils python-netserver python-shell
>>> mesa-demos"
>>> +
>>> +do_install_ptest() {
>>> +       cp -Pr tests/ ${D}${PTEST_PATH}/
>>> +}
>>
>> Why move the tests directory to the -ptests package?  That makes
>> piglit unusable without installing piglit-ptest.
>
> Hello, if we keep the tests dir in piglit, shall we add perl to

Sorry, bash, in fact.

// Robert

> the RDEPENDS ? There are perl scripts in the tests dir.
>
> // Robert
>
>>
>> I agree that piglit should be ptest-enabled, but the piglit-ptest
>> package should simply depend on piglit and contain the runner script.
>>
>> Ross
>>

