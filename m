Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QfdDd-0003Tw-Vz
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jul 2011 21:29:38 +0200
Received: by pwi1 with SMTP id 1so1815642pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2011 12:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=mJibp9wKkm4FQRteo9e2iTUxDn6LiLNwWzGjN6/lPN4=;
	b=cOzuyXYrzizLm8IP1IkHtLR9roZ2KBaBlQP6c7N1kv6q5RkPAmzVvol/IQnHkJjC5i
	2/O0GZ6ENQOAXUI4k3JbEt6QmBBX8YPmdVZ7vdsFavw23IgcK6f+94S9xj6HfLZVGLBX
	8fQpvBYRJdF7+xVO+xhqOBQOvCPrFkNanI+t8=
MIME-Version: 1.0
Received: by 10.143.27.25 with SMTP id e25mr1058280wfj.61.1310239542363; Sat,
	09 Jul 2011 12:25:42 -0700 (PDT)
Received: by 10.142.239.3 with HTTP; Sat, 9 Jul 2011 12:25:42 -0700 (PDT)
In-Reply-To: <CAAQYJAvA1BPC=JoSbeckRcBLE5eX3qO0gwrUOmua_EjN538ccg@mail.gmail.com>
References: <cover.1310079506.git.andrea.adami@gmail.com>
	<54796cbee0dc1928f2295a57b4a4783a1222ace1.1310079506.git.andrea.adami@gmail.com>
	<4E172466.6040805@linux.intel.com>
	<CAAQYJAvA1BPC=JoSbeckRcBLE5eX3qO0gwrUOmua_EjN538ccg@mail.gmail.com>
Date: Sat, 9 Jul 2011 21:25:42 +0200
Message-ID: <CAAQYJAuTpzEjAshanOsWWjtYQoLkTRhxbTRuwGEsfJ6qEY-Ysg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Sat, 09 Jul 2011 19:29:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2011 at 11:44 PM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> On Fri, Jul 8, 2011 at 5:38 PM, Darren Hart <dvhart@linux.intel.com> wrot=
e:
>>
>>
>> On 07/07/2011 04:11 PM, Andrea Adami wrote:
>>> * from org.openembedded.dev (oe-classic)
>>
>> Hi Andrea,
>>
>> Please include a descriptive blurb about the patch. When people read
>> through the commit log they need to know what problem this patch
>> addresses and how it intends to go about it. If possible, it should also
>> include the commit id from the source (I suspect that isn't an option he=
re).
>>
> Well, there isn't =A0really much to say: whether you know what an
> initramfs is or not :)
> Seriously, about the history of the patch, there have been so many
> commits that I could not choose one. See next comment.
>

Anyway, you're right. I'm putting together something more descriptive :)

>>
>> Hrm... Why is this part of do_configure? Seems a lot more like a deploy
>> or install step.
>
> If you look at the history at
> http://cgit.openembedded.org/cgit.cgi/openembedded/log/classes/kernel.bbc=
lass?h=3Dorg.openembedded.dev&ofs=3D50
> you'll discover that there was a separate task (72761e4) which has
> been unified by the author as of commit =A03e3f297.
>
> After some rounds of fixes, =A0the code was moved in do_configure with
> commit id fc03e2b (kernel.bbclass: move initramfs stuff to configure
> so we can do postprocessing on it with do_configure_append).
>

If there are any further remarks I would keep the code in do_configure
for the initial commit.

<cut>


Regards
Andrea


