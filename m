Return-Path: <net147@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 32DF96A4D2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2013 12:11:47 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hf12so3802631vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2013 05:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZphBxcqu8UXPTM/IcDO15TJH72HU2LjvDRfm3LevcDQ=;
	b=LcRKOjpnKfxFyJzgCW6b6S1KLghk1pVOccyMWgWj33BusUBYwsUReRB/sE0hGC5H8p
	ESRWf/5nCyEU0/6+LLzBevZv3aCf1MHGdn0iPooUv8GCrhNc9LQX9SrLnaUclJHsRCog
	6ATVhICNayjmBGDlhENrXE6DBz39q19endIykFhit25m2eNUhWG5Ta8KaKknBUj1Y9M5
	gcwe239E/cRjQ7Q7in47Z+7FRjyYUk6z2YUZjE0fStmcZ68oD/VIzYghqgilOYpAtfms
	DkijnZHDmhs1kf+WJ3sc7A6GYZ4LcE7imEke55OEexZ/T6ZQd7Xg2YZbwKh28FYviXr3
	o6AQ==
MIME-Version: 1.0
X-Received: by 10.58.22.74 with SMTP id b10mr3236629vef.47.1370779907943; Sun,
	09 Jun 2013 05:11:47 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Sun, 9 Jun 2013 05:11:47 -0700 (PDT)
In-Reply-To: <51B26D43.4050909@linux.intel.com>
References: <1368069844-13706-1-git-send-email-net147@gmail.com>
	<1368069844-13706-2-git-send-email-net147@gmail.com>
	<51B26D43.4050909@linux.intel.com>
Date: Sun, 9 Jun 2013 22:11:47 +1000
Message-ID: <CANwerB0bjquna2deETcig+e_=HTjT0TbEHC-YaA6dDH+3q1z2g@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] boot-directdisk: Scope HDDDIR and HDDIMG variables to avoid conflicts
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
X-List-Received-Date: Sun, 09 Jun 2013 12:11:47 -0000
Content-Type: text/plain; charset=UTF-8

On 8 June 2013 09:31, Darren Hart <dvhart@linux.intel.com> wrote:
> On 05/08/2013 08:24 PM, Jonathan Liu wrote:
>> These variables should not be shared with other image classes.
>> The bootimg class also has an HDDDIR variable that could be overwritten
>> if executing concurrently in the same image recipe.
>
> Nice catch. Would you considering sending a patch against the bootimg
> class as well?

I did originally submit a patch against the bootimg class as well but
it turns out those variables are used by grub-efi.bbclass and
syslinux.bbclass. See
http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078011.html.

Regards,
Jonathan

