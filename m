Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UNfYi-00048w-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 10:30:13 +0200
Received: by mail-ob0-f174.google.com with SMTP id 16so2263684obc.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=KIuFFJr3d/eyaeLko2LslRx9E4vRxw3KPdgk8/goRIM=;
	b=PO97bxuSdVseq5jNdV/6HCVeHUdSU+z4BKgKxT+ofsqZZyN8mOscLdTE2yiP8JmCPE
	r+D4NzfcWCSLhApLGsx+3K4cBKPTJ3ESt+yDWbN3pU4h0IR9cmwRxe91i1KrXKx/RLnw
	hlw+p9tbF5UOvDv4L3oCDf/LI4DEgPoCSB5AWDFHxgexiYy5fCJCA6EomtbA6WIQK539
	W81UKUskQc+BSadJ7hu1N89tCVwD2f8NBGJL1ven/KvfB3+Q7gGstt5TjhFT/NW/yO3v
	pHSejVAX0SGq+kYuIBmQ8QTaHV2lnkpwkYtgUBxMY6NndFB0JTURGjUbXPqQZ4dkrStW
	YnpQ==
MIME-Version: 1.0
X-Received: by 10.60.19.101 with SMTP id d5mr3182781oee.115.1365063179202;
	Thu, 04 Apr 2013 01:12:59 -0700 (PDT)
Received: by 10.60.46.69 with HTTP; Thu, 4 Apr 2013 01:12:59 -0700 (PDT)
In-Reply-To: <AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
	<CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
	<CAJTo0La=bsNXhSA8_86n7gjL9FqFRa0wKT0OUv-siTTa2MVXbg@mail.gmail.com>
	<AEA1C7AC-2089-4F6C-A23A-1D04827A55F3@dominion.thruhere.net>
Date: Thu, 4 Apr 2013 10:12:59 +0200
Message-ID: <CAGiJk9epQh2+duGcZH-60LLviRg3n0Eq+vbG+m2Ph8i9UtPoKA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 08:30:13 -0000
Content-Type: text/plain; charset=UTF-8

2013/4/4 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 3 apr. 2013, om 17:27 heeft "Burton, Ross" <ross.burton@intel.com> het volgende geschreven:
>
>> On 3 April 2013 15:51, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>>> When we decide that we handle standard behavior different than the
>>> rest of the world, then this patch is basically a fork of systemd.
>>> Also we tell every affected software developer:
>>> "No your software won't work with OE-core / Yocto Project without
>>> adaption, we are incompatible with the systemd standard to make life
>>> more comfortable for (some of) us"
>>
>> Changing the default target depending on the use of the image isn't
>> really the same as forking systemd, and we're not making anything
>> incompatible.
>
> I think the point that Samual is trying to make is that when using systemd you implicitly agree to a kind of "social contract" to not be different for the sake of being different. Samuel, please correct me if I misinterpreted what you're saying.


Kind of, this discussion is about being compatible with systemd.

>
> Let's look at an example, 2 years ago this was the accepted by upstream:
>
>         http://cgit.freedesktop.org/systemd/systemd/commit/?id=1bd8b8184ee3bc7fc023d6d6dfb2ca99fb6612f3
>
> But nowadays that is a big no-no:
>
>         http://cgit.freedesktop.org/systemd/systemd/commit/?id=bc2708414babc5c99bb8000e63c84e87606cc15d
>
> Any time you want to make a change it you should ask the systemd folks on #systemd or their mailinglist if that's the right way to do that. The systemd recipe is already a deviant by using prefix=/, but we know why that is and accept the consequences.
>
> From what I can tell changing the default runlevel based on the image content should be OK and not make the OE systemd implementation different from all the others. But I have lost track what is being discussed here, see below.

Yes, you are right, but this patch already changes the configuration
at the root of systemd and not on a per image level.
If this patch would just enable us to make a per image level change of
the systemd behavior then it would be "the way to go".

>
>>>> How would you implement this?  Register the alternative in systemd.bb
>>>> defaulting to graphical, and then switch it in every image recipe in
>>>> oe-core/meta-oe/etc that doesn't use an X or Wayland (patches coming
>>>> shortly) session?
>>>
>>> If this works why not?
>>> It sounds like a good idea, because this way would not break anything,
>>> and we would be compatible with the standard systemd.
>>
>> Obviously the nuances of my sentiment were lost as it was transcribed to ASCII.
>>
>> I'm advocating changing the default target to multi-user and then
>> patching the two recipes where X session scripts are packaged to also
>> set the target to graphical.  People switching to systemd who don't
>> use the standard X sessions (they roll their own, or don't use X, or
>> whatever) will notice quickly that the default target needs to be
>> changed, and can do it in their graphical startup recipes.
>>
>> You're suggesting leaving the default target as graphical and changing
>> uncountable numbers of *image recipes* to override the default target,
>> the alternative being errors in the log.
>>
>> So far "the community" disagrees on the approach here - we've had
>> vocal objections to errors in the log for any image, changing the
>> default target, and the other proposals.
>
> I'm getting a bit lost on what the actual problem is and what kind of fixes are needed besides this patch. So can the people involved tell me what will change when I have the following:

Technical this problem can be solved with this patch, but it would
break all images that use X and it is incompatible with the rest of
the world for the sake of being different.
My proposal for this solution is to use u-a to change the
default.target where needed, instead of changing the default.target in
systemd AND changing the default.target back to un-break stuff that is
functional now.

>
> 1) console-image already using systemd, used as-is
> 2) gdm-image already using systemd, used as-is
> 3) console-image already using systemd, gdm will be opkg-installed at some point.
>
> What will be different between 2 clean builds before and after these changes and what will happen when I 'opkg update ; opkg upgrade' those image built before the change with ipks built after the change?
>
>> We *do* need a way of changing the default target.  Do we at least all
>> agree that update-alternatives is a logical way of changing it on a
>> per-image basis?
>
> Looking at http://www.freedesktop.org/wiki/Software/systemd/FrequentlyAskedQuestions it suggest using symlinks, which is what u-a does under the hood, so it looks like a decent solution to me.
>



--
Regards
Samuel


