Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QwMxG-0007bY-3C
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 01:33:55 +0200
Received: by gxk3 with SMTP id 3so1238263gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 16:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=mahdjmGTgdiprOFgjmpwRdRyLYHUfE+f93uaT6Pw3uw=;
	b=cwfs4eZRUYGJE7I7QpVMG3sCNgXd2tYTupi8RnJlYLQaAypGy4WVfkocOW/3NBm0Vr
	ABU/hhfBT+eUUH9SZck5dAefnyrAREWV/BQowo25SinBjouLZBy+lld5CGINeNdyaTX7
	jFaU397S3vZ4KGgofZA9fVF9UOTsOEu6yjtdQ=
MIME-Version: 1.0
Received: by 10.101.121.2 with SMTP id y2mr5498769anm.113.1314228545877; Wed,
	24 Aug 2011 16:29:05 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Wed, 24 Aug 2011 16:29:05 -0700 (PDT)
In-Reply-To: <CADkTA4Pvsk1jE+QXcRvLC4bSwH15XYkr=D_ZRR_5MOxLcFzBJg@mail.gmail.com>
References: <cover.1314218753.git.bruce.ashfield@windriver.com>
	<1314227326.5939.149.camel@rex>
	<CADkTA4Pvsk1jE+QXcRvLC4bSwH15XYkr=D_ZRR_5MOxLcFzBJg@mail.gmail.com>
Date: Wed, 24 Aug 2011 19:29:05 -0400
Message-ID: <CADkTA4MRmsaUmC+B5WtxXETh7vAYVehK96H4KmKSgQSavgDkxA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: dvhart@linux.intel.com, saul.wold@intel.com
Subject: Re: [PATCH 0/4] linux-yocto: consolidated kernel pull request
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
X-List-Received-Date: Wed, 24 Aug 2011 23:33:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2011 at 7:21 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Aug 24, 2011 at 7:08 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Hi Bruce,
>>
>> On Wed, 2011-08-24 at 16:50 -0400, Bruce Ashfield wrote:
>>> Here's a consolidated kernel pull request that fixes a series
>>> of bugs that have been around for a while and fixes some of the
>>> remaining issues from the -rt work that completed last week.
>>>
>>> Darren: I also updated the -rt source revs and recipe with some
>>> streamlining that builds on top of changse that merged last week.
>>>
>>> The patches have the details of the bugs and fixes.
>>>
>>> cc: Darren Hart <dvhart@linux.intel.com>
>>>
>>> The following changes since commit f852199ff598069bbecad4146f13377753df=
1648:
>>>
>>> =A0 linux-yocto: update meta SRCREVs for beagleboard config changes (20=
11-08-24 16:29:22 -0400)
>>>
>>> are available in the git repository at:
>>> =A0 git://git.pokylinux.org/poky-contrib kernel-oe
>>> =A0 http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel=
-oe
>>>
>>> Bruce Ashfield (4):
>>> =A0 kern-tools: allow flexible branch points
>>> =A0 linux-yocto-rt: update qemuppc support and streamline variables
>>> =A0 linux-yocto: update machines and default configuration
>>> =A0 linux-yocto/2.6.37: apmd + get time of day fixes
>>
>> I took the first two of these. The other two didn't apply and I didn't
>> feel happy taking them. I tried to look at the git tree above and I
>> couldn't see the patches there...
>
> Really ? That strange .. how could they not apply, they were stacked
> and pushed on top of an up to date master. Which part rejected ?
>
> I'll re-push and see what's up.

Heh. Operator error.  I did this:

   git push ssh://git@git.pokylinux.org/poky-contrib kernel-oe:kernel-oe

and generated the pull request against zedd/kernel-oe, which is
largely fine, but
I had one more patch in the stack.

I've now pushed to zedd/kernel-oe and everything is there. Let me know if y=
ou
want anything resent.

The following changes since commit f8cddd74574756174a82c856cecdeb6f83b9dea5=
:

  mpc8315e-rdb: add kernel modules to rootfs (2011-08-23 20:45:07 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kernel-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel-oe

Bruce Ashfield (5):
  linux-yocto: update meta SRCREVs for beagleboard config changes
  kern-tools: allow flexible branch points
  linux-yocto-rt: update qemuppc support and streamline variables
  linux-yocto: update machines and default configuration
  linux-yocto/2.6.37: apmd + get time of day fixes

 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   11 ++++-------
 meta/recipes-kernel/linux/linux-yocto_2.6.37.bb    |   14 +++++++-------
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   14 +++++++-------
 4 files changed, 19 insertions(+), 22 deletions(-)


Bruce


>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


