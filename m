Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA2C608CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:46:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 20 Jun 2013 04:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,904,1363158000"; d="scan'208";a="352879793"
Received: from unknown (HELO [10.255.13.131]) ([10.255.13.131])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2013 04:47:19 -0700
Message-ID: <51C2EBA0.8070804@linux.intel.com>
Date: Thu, 20 Jun 2013 04:46:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1371724384.git.jackie.huang@windriver.com>
	<d3c4311cd7b6a3082fee8fe0fffb8dfadc061deb.1371724384.git.jackie.huang@windriver.com>
	<CAJTo0LY5v4n-8NCJmGNWh11dLMi4uYv5TN4u_f7FnuQvxAS55Q@mail.gmail.com>
	<1371726864.20823.227.camel@ted>
In-Reply-To: <1371726864.20823.227.camel@ted>
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
X-List-Received-Date: Thu, 20 Jun 2013 11:46:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2013 04:14 AM, Richard Purdie wrote:
> On Thu, 2013-06-20 at 11:39 +0100, Burton, Ross wrote:
>> On 20 June 2013 11:36,  <jackie.huang@windriver.com> wrote:
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> move libdbus-1.so* to base_libdir to kill a warning:
>>>
>>>      WARNING: QA Issue: lib32-consolekit: /lib/security/
>>>      pam_ck_connector.so, installed in the base_prefix,
>>>      requires a shared library under exec_prefix (/usr):
>>>      libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0xdead3000)
>>>
>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>
>> More and more and more libraries move.  Do we *really* need to support
>> split-usr?  Have you audited all of the udev helpers yet?
>
> I have to admit I'm not happy with the piece by piece approach this is
> taking. We're going to end up with nearly everything moving to
> base_libdir at this rate. If we're going to do this, I want someone to
> come up with a definitive list of what needs to move before any more of
> these merge.
>
And this should be checked with various DISTRO_FEATURES such as pam 
(enabled/disabled) and systemd (enabled/disabled), not just one 
variation, please be sure to list what your testing matrix is.

Thanks
    Sau!

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

