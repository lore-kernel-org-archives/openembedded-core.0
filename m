Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E808A788B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 16:12:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2MGCOGh012433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Mar 2018 09:12:24 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 22 Mar 2018 09:12:23 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, ChenQi
	<Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
	<284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
	<6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com>
	<16a50e80-4e34-e7aa-016e-12e2b1d32958@windriver.com>
	<bf908c93-3935-e053-e601-445400ff7ed4@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c0ceed82-d9c2-ccea-8140-9f212a10d49e@windriver.com>
Date: Thu, 22 Mar 2018 12:12:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <bf908c93-3935-e053-e601-445400ff7ed4@linux.intel.com>
X-Originating-IP: [172.25.44.10]
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Thu, 22 Mar 2018 16:12:24 -0000
Content-Type: multipart/alternative;
	boundary="------------9872E220AE213EA14430A3BF"
Content-Language: en-GB

--------------9872E220AE213EA14430A3BF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018-03-22 07:14 AM, Alexander Kanavin wrote:
> On 03/22/2018 08:06 AM, ChenQi wrote:
>> The test framework meson uses is like:
>>
>> |e = executable('prog', 'testprog.c') test('name of test', e)|
>>
>>
>> http://mesonbuild.com/Unit-tests.html
>>
>> So they could be defined in any valid meson.build file. In systemd's 
>> case, most of them are in top-level meson.build.
>>
>> I agree with you that it's possible to extract all these test cases 
>> and hold them in a custom script we write. I think this could serve 
>> as a fall-back approach to adding ptest support for systemd.
>> But I'd like to spend some time to try to find a more general 
>> approach, avoiding headaches when upgrading.
>
> That's right. We probably need to put some kind of 'hook' inside 
> meson's test() that would copy the test case to a ptest directory, 
> instead of running it.
>
> Alex


Best if we could pitch this to the meson devs on their list:

     The Meson Build System <mesonbuild@googlegroups.com>

The earlier that we describe the problem and our proposed solution with 
them the better.

../Randy


--------------9872E220AE213EA14430A3BF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018-03-22 07:14 AM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:bf908c93-3935-e053-e601-445400ff7ed4@linux.intel.com">On
      03/22/2018 08:06 AM, ChenQi wrote:
      <br>
      <blockquote type="cite">The test framework meson uses is like:
        <br>
        <br>
        |e = executable('prog', 'testprog.c') test('name of test', e)|
        <br>
        <br>
        <br>
        <a class="moz-txt-link-freetext" href="http://mesonbuild.com/Unit-tests.html">http://mesonbuild.com/Unit-tests.html</a>
        <br>
        <br>
        So they could be defined in any valid meson.build file. In
        systemd's case, most of them are in top-level meson.build.
        <br>
        <br>
        I agree with you that it's possible to extract all these test
        cases and hold them in a custom script we write. I think this
        could serve as a fall-back approach to adding ptest support for
        systemd.
        <br>
        But I'd like to spend some time to try to find a more general
        approach, avoiding headaches when upgrading.
        <br>
      </blockquote>
      <br>
      That's right. We probably need to put some kind of 'hook' inside
      meson's test() that would copy the test case to a ptest directory,
      instead of running it.
      <br>
      <br>
      Alex
      <br>
    </blockquote>
    <p><span class="l7"><br>
      </span></p>
    <p><span class="l7">Best if we could pitch this to the meson devs on
        their list:<br>
      </span></p>
    <p><span class="l7">    The Meson Build System &lt;<span class="lG"><a class="moz-txt-link-abbreviated" href="mailto:mesonbuild@googlegroups.com">mesonbuild@googlegroups.com</a></span>&gt;</span></p>
    <p><span class="l7">The earlier that we describe the problem and our
        proposed solution with them the better.</span></p>
    <p><span class="l7">../Randy</span></p>
  </body>
</html>

--------------9872E220AE213EA14430A3BF--
