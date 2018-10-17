Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB2371BEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 05:48:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9H5lBxw021746
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Oct 2018 22:47:22 -0700
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 16 Oct 2018 22:47:00 -0700
To: "Burton, Ross" <ross.burton@intel.com>, "Purdie, Richard"
	<richard.purdie@linuxfoundation.org>
References: <20181016090054.122374-1-mingli.yu@windriver.com>
	<fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
	<CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
	<CAJTo0LZT1ytnsBoKkfdwv8GThzsOCjoQtLdbe9dtFPMaPupMxw@mail.gmail.com>
	<CAJTo0LY79q4La-mTQwG552XAkwJ8UTLp9yztVCd4g7m-pogpKw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BC6CCD3.4050003@windriver.com>
Date: Wed, 17 Oct 2018 13:46:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY79q4La-mTQwG552XAkwJ8UTLp9yztVCd4g7m-pogpKw@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 05:48:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年10月16日 20:05, Burton, Ross wrote:
> On Tue, 16 Oct 2018 at 12:18, Burton, Ross <ross.burton@intel.com> wrote:
>> OpenCV has a patch to "fix" (bodge) the Py2 build:
>>
>> https://github.com/ros-perception/vision_opencv/pull/239
>>
>> But this doesn't work for Py3.
>
> This was just pushed:
> https://github.com/ros-perception/vision_opencv/commit/b57fd5b

Thanks Ross!
I'm fine not add the the hack fix from boost side, but as I know there 
is another package camera-calibration-parsers which has the same problem 
as below apart from cv-bridge. BTW, there may some other package also 
has this kind of problem. This to say we need to fix the issue for the 
this kind of packages one by one.

meta-ros/recipes-ros/image-common/camera-calibration-parsers_1.11.13.bb:do_configure 
failed
| CMake Error at 
/$Prj/camera-calibration-parsers/1.11.13-r0/recipe-sysroot-native/usr/share/cmake-3.12/Modules/FindBoost.cmake:2048 
(message):
|   Unable to find the requested Boost libraries.
|
|   Boost version: 1.68.0
|
|   Boost include path:
|   /$Prj/camera-calibration-parsers/1.11.13-r0/recipe-sysroot/usr/include
|
|
|   Could not find the following Boost libraries:
|
|           boost_python3
|
|   Some (but not all) of the required Boost libraries were found.  You may
|   need to install these additional Boost libraries.  Alternatively, set
|   BOOST_LIBRARYDIR to the directory containing Boost libraries or 
BOOST_ROOT
|   to the location of Boost.
| Call Stack (most recent call first):
|   CMakeLists.txt:10 (find_package)

Thanks,

>
> Ross
>

