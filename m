Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 951A860761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 23:23:09 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id t127so86548236qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aJYxHKefJ2RxcMREDbSDrLjQnOLXK/i32QSAbFzj8eI=;
	b=cDQEN6VvqqBUreGP8hkaL3fHZYRoDl29LXy/UDH8Wi5ioq1+ayca3ve9L6XHKSnRJg
	sBrm0MDdYXcMD/WTr/usha5WufoXsj+3Nn48MfTdt9BdiGEd2RiKUhzYrG6zjib2RKpP
	7VCHwmbHtBHUM3eCY/8hWye3U23tZ3CfA5OOSo074L9jKRaOSHCxDPTk+nGxTos18/M2
	PCJ/URp5wwrF3iAxqAXv0ZXnlGbeVX6K/iZnl7QEu1DcB0f3yQUKqDUi5Dv3f/5o66aH
	3XS/2rKqcWfv0982mt8U73ZrBvtL6TkxjVKMEn25BHtZbnlA8oDgPyizyZ6DR9FipaJh
	i7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aJYxHKefJ2RxcMREDbSDrLjQnOLXK/i32QSAbFzj8eI=;
	b=FffQXZxNLWKYS5BZVUs09G6m28Zvbbgszg3ppRNQCF97NFO/3Ts2mlGVMQ12cOWOG3
	kZ6oNUFUWQ3NEfi4TnEIxZpTJgOyZGgXsYpozb5A3GoonwVorTRb+r+fwmHWtQRkHNxv
	6L0doKc1+FlAHhbqaWHOnIfgV6p7SjB8+ub/f9Na1TQo55gcink6OX3mCK+FqXso5cQP
	0a+M+O9CgH6QoTU9rxzzy23zbJett32C7+7TPTyiTZjR1Udo0PHX4Zwhv6eP18zmpRt5
	sxheqG6/ABe4CNnWlOIOjoyu629s+oOLRMfxfnrIe58qsZh+sFo3hJIiNbfhLx20AOhX
	SFxw==
X-Gm-Message-State: ALyK8tLeuGmYtR4p4VjheUIdW7DoBzWeZaI4cci8nYoPnVOqMXkgqUbdmKw7EE7spxRk12kzalHeKdu7wrbF2w==
X-Received: by 10.200.42.43 with SMTP id k40mr39764193qtk.98.1466637789812;
	Wed, 22 Jun 2016 16:23:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Wed, 22 Jun 2016 16:22:40 -0700 (PDT)
In-Reply-To: <6ea53ae7-5516-a991-f9f6-111db319e5dc@windriver.com>
References: <1466632764-22540-1-git-send-email-jslater@windriver.com>
	<CAMKF1soa5wBYFyFV0sqxsN_0bpjTjpQ==Aow0Ui7ZAAhh-Mp=g@mail.gmail.com>
	<6ea53ae7-5516-a991-f9f6-111db319e5dc@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jun 2016 16:22:40 -0700
Message-ID: <CAMKF1sqiD+SP+UkbNFY9_yhhR6nCm-wsVsOSEAD70Y-ewqOU5g@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] blacklist: add BPNBLACKLIST support
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
X-List-Received-Date: Wed, 22 Jun 2016 23:23:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 22, 2016 at 3:45 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 6/22/16 5:35 PM, Khem Raj wrote:
>>
>> On Jun 22, 2016 2:59 PM, "Joe Slater" <jslater@windriver.com
>> <mailto:jslater@windriver.com>> wrote:
>>>
>>> We have encountered some issues with the use of PNBLACKLIST in recipes.
>>> In particular, PNBLACKLIST[pkg] will not suppress building of lib32-pkg
>>> or lib64-pkg so world builds can fail unexpectedly.
>>>
>>> One solution could be to implement BPNBLACKLIST[] which checks BPN instead
>>> of PN when a recipe is being parsed.  I have included a patch to do this.
>>>
>>> If this were adopted, there are many recipes under meta-openembedded that
>>> should probably changed to use BPNBLACKLIST instead of PNBLACKLIST.
>>
>> Bpn will also mean native and nativesdk among others. I think its better to list
>> multilibs explicitly.
>
> This is intentional.

It can be problematic when a native package is needed for an image to
build or nativesdk is needed for SDK builds
so it seems to be a broader brush. If just target packages beyond PN
could be covered thats what you are looking for
or may be PNBLACKLIST could just be extended to cover this case when
multilibs are enabled.

>
> The problem with saying we have to list multilibs explicitly.  multilib naming
> is arbitrary.  I can say that it probably fits the pattern of lib64, lib32,
> libn32 and libx32.... but it doesn't have to.
>
> But then I'd also need to blacklist native and nativesdk versions as well.. so
> for a simple recipe that for some reason I want blacklisted, it's easier to hack
> the recipe to just blacklist itself -- then enter 7 or more blacklists.
>
> Using the BPNBLACKLIST I can blacklist a single recipe with one command and not
> worry about multilibs, class extensions, etc.
>
> (The patch leave PNBLACKLIST, specifically so that in the case where you want
> only partial usage blacklisted you can.)
>
> --Mark
>
>>>
>>> Joe Slater (1):
>>>   blacklist: add BPNBLACKLIST support
>>>
>>>  meta/classes/blacklist.bbclass |   24 ++++++++++++++++++++----
>>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>>
>>> --
>>> 1.7.9.5
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>> <mailto:Openembedded-core@lists.openembedded.org>
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

