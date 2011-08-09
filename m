Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QquVb-00055N-7a
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 00:10:47 +0200
Received: by ewy5 with SMTP id 5so315268ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=JgXoGiofl/S4i3W7OiiaOr79JHKZ5RkAMWJOJu49QXM=;
	b=jAlpoJbxq1k66lVbA86PKgJXURo4P3wl6qaka/euZ3uaRlw1cAhitJHHSEik5KAGOY
	QGuRgLpo6ES0XTN24BXzQaeUJYt0TyR5aJP28PEbU3J0d+LmWVdpyAo/6ei3DLTjXHL8
	bAsIMyZWWm273A3+5SAXVcM5qbT+X2yPt/GZU=
MIME-Version: 1.0
Received: by 10.213.104.2 with SMTP id m2mr943352ebo.15.1312927577704; Tue, 09
	Aug 2011 15:06:17 -0700 (PDT)
Received: by 10.213.114.20 with HTTP; Tue, 9 Aug 2011 15:06:17 -0700 (PDT)
In-Reply-To: <CA+T6QPmgo-t+5D547ANO=O=nTs4um9Ga=aum3H61Dex4OJ+BqA@mail.gmail.com>
References: <CAD=GYpYwTkfShO4KhzDfH=xpka3t9SDtqZaunsTN7vi5ESm3Zg@mail.gmail.com>
	<CA+T6QPmN5HC=HxscTzckcxpGjm7oEnvX4s0Y1Zu+TWJX5RfOvQ@mail.gmail.com>
	<CAD=GYpbX24u+Pc7d7OVHjCy_B52pzupexKz=dx40WkyrS3uk4w@mail.gmail.com>
	<CA+T6QPmgo-t+5D547ANO=O=nTs4um9Ga=aum3H61Dex4OJ+BqA@mail.gmail.com>
Date: Tue, 9 Aug 2011 17:06:17 -0500
Message-ID: <CAD=GYpaGAQ+-G+MAkC8QhByMagOOxtTMd-x-PnqUBpZTN1483g@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: beagleboard@googlegroups.com
Cc: steve@sakoman.com, "Kooi, Koen" <k-kooi@ti.com>, "Kridner,
	Jason" <jdk@ti.com>, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [beagleboard] Re: [meta-ti] Kernel 3.0 meta-ti recipe
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
X-List-Received-Date: Tue, 09 Aug 2011 22:10:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2011 at 4:57 PM, Jason Kridner <jkridner@beagleboard.org> wr=
ote:
> On Tue, Aug 9, 2011 at 5:48 PM, Joel A Fernandes <agnel.joel@gmail.com> w=
rote:
>> Hi Jason,
>>
>> Thanks,
>>
>> On Tue, Aug 9, 2011 at 3:48 PM, Jason Kridner <jkridner@beagleboard.org>=
 wrote:
>>> Adding Steve...
>>>
>>> On Tue, Aug 9, 2011 at 4:19 PM, Joel A Fernandes <agnel.joel@gmail.com>=
 wrote:
>>>> I am seeing some very erratic memory corruption issues all morning,
>>>> both with NFS and MMC cards. The traces are at the end of this email.
>>>>
>>>> I have narrowed down the issue to one of the 13 Sakoman patches:
> ...
>>>> =A0 =A0 =A0 =A0 =A0 =A0file://sakoman/0009-rtc-twl-Switch-to-using-thr=
eaded-irq.patch \
>>>
>>> I'm not familiar with the impact or the arguments being passed. =A0If
>>> some upstream changes happened in this area, this one might be a bit
>>> dangerous.
>>>
>>
>> This is it! Adding 0009 back causes the same irq problems to show up.
>> Do we need this patch for now?
>
> I think you can leave it out for now. =A0Are all the other ones back in?
> =A0Will you be sharing another test image?
>

Yes, I could share another image. Its uploading right now.

The memory corruption still shows up though once in 3 boots with the
other 12 patches in so we still have to narrow down, but for now I can
atleast get it to show the systemd boot messages almost always (and
then it hangs ofcourse due to a possible issue with systemd)

If you're going to be running it, I would appreciate it if you could
try to get systemd to show you debug messages using any technique and
share how you did it. So far I have added bootargs, modified systemd
configuration and also tried to start systemd using command line
options from the "init=3D" bootarg but haven't been able to make it show
anything useful.

Thanks,
Joel


