Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QXcCm-0003Ye-76
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 18:47:37 +0200
Received: by pvc30 with SMTP id 30so662211pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 09:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=M5NKLg/mRSQ5Dt8Pwjm0pA1m0fm11evyAb7EJtPSrSA=;
	b=m7YK0GAfs4YrOFqYYLj7mIQ14qTBKQag6ONr+mn+hG0i/M58hhYKMhDDn1Q4k1H/5s
	pB9o0BqhAesz0tkd0YrsjlijfdLX/X4RON7Ot4NTcAeyGEUsGpQkf/QGZJdZMh56yKK6
	sl//HiIwMv5kTbyveq0uCpQkAje2tx+0ldl3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=W8Hn35E104ZJWG2MZFuFf7gDelCTemoLi2X5UykC7AUm+WvpYOhvuaZxRH+WdD6MHl
	49Av91FEzVMmAZAT5aVs1HUcKUdeslB6BaQ+dyMDKhfj7hnZmA93xzlglr6HMFmsP1j4
	UtkUEO0vc4LVWhH6JTDn9Tc3SJGDCx1QvaNiM=
Received: by 10.68.22.2 with SMTP id z2mr1163965pbe.428.1308329046084; Fri, 17
	Jun 2011 09:44:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.195 with HTTP; Fri, 17 Jun 2011 09:43:36 -0700 (PDT)
In-Reply-To: <4DFB820B.9070303@intel.com>
References: <cover.1308249837.git.scott.a.garman@intel.com>
	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
	<4DFA97A1.9090909@gmail.com> <4DFB820B.9070303@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Jun 2011 09:43:36 -0700
Message-ID: <BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic login.defs options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jun 2011 16:47:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 17, 2011 at 9:34 AM, Scott Garman <scott.a.garman@intel.com> wrote:
> On 06/16/2011 04:54 PM, Khem Raj wrote:
>>
>> On 06/16/2011 11:50 AM, Scott Garman wrote:
>>>
>>> This resolves the following runtime errors when various shadow-utils
>>> binaries are run:
>>>
>>> configuration error - unknown item 'FAILLOG_ENAB' (notify administrator)
>>> configuration error - unknown item 'LASTLOG_ENAB' (notify administrator)
>>> configuration error - unknown item 'OBSCURE_CHECKS_ENAB' (notify
>>> administrator)
>>> configuration error - unknown item 'PORTTIME_CHECKS_ENAB' (notify
>>> administrator)
>>> configuration error - unknown item 'QUOTAS_ENAB' (notify administrator)
>>> configuration error - unknown item 'MOTD_FILE' (notify administrator)
>>> configuration error - unknown item 'FTMP_FILE' (notify administrator)
>>> configuration error - unknown item 'NOLOGINS_FILE' (notify administrator)
>>> configuration error - unknown item 'ENV_HZ' (notify administrator)
>>> configuration error - unknown item 'PASS_MIN_LEN' (notify administrator)
>>> configuration error - unknown item 'SU_WHEEL_ONLY' (notify administrator)
>>> configuration error - unknown item 'CRACKLIB_DICTPATH' (notify
>>> administrator)
>>> configuration error - unknown item 'PASS_CHANGE_TRIES' (notify
>>> administrator)
>>> configuration error - unknown item 'PASS_ALWAYS_WARN' (notify
>>> administrator)
>>> configuration error - unknown item 'CHFN_AUTH' (notify administrator)
>>> configuration error - unknown item 'ENVIRON_FILE' (notify administrator)
>>>
>>> This fixes bug [YOCTO #1170]
>>>
>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>> ---
>>> .../base-passwd/base-passwd-3.5.22/login.defs | 32 ++++++++++----------
>>> .../recipes-core/base-passwd/base-passwd_3.5.22.bb | 2 +-
>>> 2 files changed, 17 insertions(+), 17 deletions(-)
>>>
>>> diff --git
>>> a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>> b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>> index 1d392ac..2708eb6 100644
>>> --- a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>> +++ b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
>>
>> I wonder if login.defs should be provided at all by base-passwd package.
>> It should come from shadow isnt it ?
>
> Hi Khem,
>
> The reason for including the login.defs file with base-passwd has to do with
> the new useradd.bbclass that I developed (Richard is still holding it for
> code review, but we should see it here soon). The way it works is custom
> users/groups get added to the passwd/group files in the target machine's
> sysroot. The shadow utils require a login.defs in order to work.

hence it should come from shadow isnt it ? why from base-passwd ?
if someone is not using using shadow this file will be useless for
him/her isnt it ?

-Khem


