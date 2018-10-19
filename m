Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 65028745D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 11:58:55 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w9JBwsAv016109
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 19 Oct 2018 13:58:54 +0200
Received: from [139.16.76.135] (MD1FZU9C.ad001.siemens.net [139.16.76.135])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w9JBwsqt031357;
	Fri, 19 Oct 2018 13:58:54 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <20181017104243.801-1-pascal.bach@siemens.com>
	<CAMKF1spO151yKD1O9Dx_sKEu1shSN976+kykQ9FoXKd6fstQVw@mail.gmail.com>
	<9e88a77b-a611-8c04-465b-41eca2a085c5@siemens.com>
	<CAMKF1somO_+n1w=ek=vcv1p=RuX-3m1tiho+qi7P_z4xocgefQ@mail.gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <953e09ed-9f74-a048-e8e7-c26b19be3eb2@siemens.com>
Date: Fri, 19 Oct 2018 13:58:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1somO_+n1w=ek=vcv1p=RuX-3m1tiho+qi7P_z4xocgefQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 19 Oct 2018 11:58:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 18.10.2018 17:28, Khem Raj wrote:
> On Thu, Oct 18, 2018 at 7:58 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>>
>> On 17.10.2018 20:50, Khem Raj wrote:
>>> On Wed, Oct 17, 2018 at 3:43 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>>>> This patchset is unmodified from v3. It is just rebased on top of master which
>>>> already includes a fixed version of libproxy and piglit.
>>>>
>>>> I built all cmake based recipes in oe-core (qemuarm64) and did not find any more issues.
>>>>
>>> Can you run world builds on meta-openembedded repositories with
>>> this series applied and also compile some other large projects which
>>> use cmake like meta-browser
>> I can try but usually I get into trouble with the proxy because there are always some recipes that fetch from some location via some protocol that doesn't work.
> Once the current cycle of builds is done on OE
> builders I will try to schedule this in OE builds and
> see where it ends up. hopefully by this weekend.
I was able to do a world build with all layers of meta-oe and there are a few failures:

Two of wich I think are related to cmake:
- libyui-ncurses => messing around with hardcoded path in their cmake setup
- civetweb => still trying to figure out what exactly goes wrong

The following I was unable to build due to fetch problems:
- oscam

I will try to send patches for these two recipes.

>>>> Pascal Bach (4):
>>>>   cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of
>>>>     CMAKE_LIBRARY_PATH
>>>>   cmake.bbclass: search both sysroot-native and host for native packages
>>>>   cmake.bbclass: move CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.cmake
>>>>   cmake.bbclass: allow cmake to find hosttools
>>>>
>>>>  meta/classes/cmake.bbclass | 24 +++++++++++++++---------
>>>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>>>
>>>> --
>>>> 2.11.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


