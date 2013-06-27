Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1B9B619DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 03:36:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5R3aUPJ028292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2013 20:36:30 -0700 (PDT)
Received: from [128.224.163.147] (128.224.163.147) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 20:36:29 -0700
Message-ID: <51CBB33B.1090202@windriver.com>
Date: Thu, 27 Jun 2013 11:36:27 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Saul Wold
	<sgw@linux.intel.com>
References: <cover.1371724384.git.jackie.huang@windriver.com>
	<d3c4311cd7b6a3082fee8fe0fffb8dfadc061deb.1371724384.git.jackie.huang@windriver.com>
	<CAJTo0LY5v4n-8NCJmGNWh11dLMi4uYv5TN4u_f7FnuQvxAS55Q@mail.gmail.com>
	<1371726864.20823.227.camel@ted> <51C2EBA0.8070804@linux.intel.com>
	<51C3B43C.8040707@windriver.com> <1371818179.20823.303.camel@ted>
In-Reply-To: <1371818179.20823.303.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] dbus: move libdbus-1.so* to base_libdir
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
X-List-Received-Date: Thu, 27 Jun 2013 03:36:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/21/2013 8:36 PM, Richard Purdie wrote:
> On Fri, 2013-06-21 at 10:02 +0800, jhuang0 wrote:
>>
>> On 6/20/2013 7:46 PM, Saul Wold wrote:
>>> On 06/20/2013 04:14 AM, Richard Purdie wrote:
>>>> On Thu, 2013-06-20 at 11:39 +0100, Burton, Ross wrote:
>>>>> On 20 June 2013 11:36,  <jackie.huang@windriver.com> wrote:
>>>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>>>
>>>>>> move libdbus-1.so* to base_libdir to kill a warning:
>>>>>>
>>>>>>       WARNING: QA Issue: lib32-consolekit: /lib/security/
>>>>>>       pam_ck_connector.so, installed in the base_prefix,
>>>>>>       requires a shared library under exec_prefix (/usr):
>>>>>>       libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0xdead3000)
>>>>>>
>>>>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>>>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>>>>
>>>>> More and more and more libraries move.  Do we *really* need to support
>>>>> split-usr?  Have you audited all of the udev helpers yet?
>>>>
>>>> I have to admit I'm not happy with the piece by piece approach this is
>>>> taking. We're going to end up with nearly everything moving to
>>>> base_libdir at this rate. If we're going to do this, I want someone to
>>>> come up with a definitive list of what needs to move before any more of
>>>> these merge.
>>>>
>>> And this should be checked with various DISTRO_FEATURES such as pam
>>> (enabled/disabled) and systemd (enabled/disabled), not just one
>>> variation, please be sure to list what your testing matrix is.
>>
>> I tested with DISTRO_FEATURES 'pam' (enabled/disabled) and 'systemd'
>> (enabled/disabled) and WARN_QA = "unsafe-references-in-binaries
>> unsafe-references-in-scripts", and I have sent a v3. If you are agree to
>> merge, please merge the v3 one, thanks!
>
> As I said, I'm not taking any more of these moves until there is a well
> thought out analysis/plan. Sorry.

Hi Richard/Saul,

We sent these since we used bbappend approach to fix issues in our layer 
and now we want to minimize the usage of bbappend files, I admit that 
the piece by piece approach is not good so I undertand if it is not 
taken, we will analyze the issue and come out a plan sometime later.

Thanks,
Jackie

>
> Cheers,
>
> Richard
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

