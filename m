Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QqsVO-0001vD-5C
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 22:02:26 +0200
Received: by eyb7 with SMTP id 7so396764eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=V8+bRwePMHqWjm7YNBje7tbNPYLaW+sQHf7UdjB7n2I=;
	b=mekP35qkX+754CGR78Wedn8tPEJCS9pNBHl8ah4DCQ0rbixEtnHiv3L2hUlkR+nfx3
	xhtjkyVnxwtbGSDrMLRQIHo4ZtrdKdJcUUZnViszwuzmC6cPnYqMQfUKgbu0el4Y+Ev4
	s4ITIq9ypMvZmPqZQwgG8jl2IcwwQqDbiJjpw=
MIME-Version: 1.0
Received: by 10.213.25.77 with SMTP id y13mr1651633ebb.129.1312919874603; Tue,
	09 Aug 2011 12:57:54 -0700 (PDT)
Received: by 10.213.114.20 with HTTP; Tue, 9 Aug 2011 12:57:54 -0700 (PDT)
In-Reply-To: <CA+T6QPm78y5ygwrfQ7tuDeVViSgVXjgxGZF2UeraF7UikNUCpQ@mail.gmail.com>
References: <CAD=GYpZadKJYSOxnhyMtJOWOjO2iX6tpaWrGGZPtcc4bYvzTtQ@mail.gmail.com>
	<CAD=GYpY1ki5Y_u0KFWf+TJBJxDoSzvpV7W2hXBC1XJqfhruOPw@mail.gmail.com>
	<CA+T6QPm78y5ygwrfQ7tuDeVViSgVXjgxGZF2UeraF7UikNUCpQ@mail.gmail.com>
Date: Tue, 9 Aug 2011 14:57:54 -0500
Message-ID: <CAD=GYpZVTJ0pNLn3pwZkgojt5Lb6COjUg3=sUNqW45VTjgy55w@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Jason Kridner <jkridner@beagleboard.org>
Cc: beagleboard@googlegroups.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: systemd boot hang
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
X-List-Received-Date: Tue, 09 Aug 2011 20:02:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2011 at 2:42 PM, Jason Kridner <jkridner@beagleboard.org> wr=
ote:
> On Tue, Aug 9, 2011 at 2:59 PM, Joel A Fernandes <agnel.joel@gmail.com> w=
rote:
>> Just posted this on the systemd mailing list.
>
> Are these the right lists on this thread? =A0Just not sure if some folks
> on the CC might consider this too off-topic.
>
>>
>> It seems that I didn't go through enough testing on the
>> systemd-gnome-image built by OE. The success I reported with boot SD
>> card instead of over NFS was just a got-lucky case. So SD Card and NFS
>> alike, the boot still hangs.
>>
>> Koen and others, could you try my image?
>> http://www.beagleboard.org/~joelf/images/Angstrom-systemd-GNOME-image-eg=
libc-ipk-v2011.08-core-beagleboard.rootfs.tar.bz2
>
> Can you provide an SD card image as well? =A0Running mkcard.txt or
> linaro-create-image is often error prone and time consuming.

Could you untar the file I uploaded into the FS partition?
You could use the image from here:
http://circuitco.com/support/files/BeagleboardxM/xMc_4_25.zip

>>> [..]
>>> Starting Login Service...
>>> Starting Permit User Sessions...
>>> Started Permit User Sessions.
>>> Starting ntpd: Started Console System Startup Logging.
>>> Started D-Bus System Message Bus.
>>> Starting internet superserver: xinetd.
>>> [ =A0 =A05.773284] ntpd[137]: ntpd 4.2.6p3@1.2290 Fri Jul 29 17:35:18 U=
TC 2011 (2)
>>> done
>>> [ =A0 =A05.809906] ntpd[154]: proto: precision =3D 30.517 usec
>>> [ =A0 =A05.829437] ntpd[154]: Listen and drop on 0 v4wildcard 0.0.0.0 U=
DP 123
>>> [ =A0 =A05.849182] xinetd[156]: 156 {init_services} no services. Exitin=
g...
>>> [ =A0 =A05.864044] ntpd[154]: Listen and drop on 1 v6wildcard :: UDP 12=
3
>>> [ =A0 =A05.882141] ntpd[154]: Listen normally on 2 lo 127.0.0.1 UDP 123
>>> [ =A0 =A05.906188] ntpd[154]: Listen normally on 3 lo ::1 UDP 123
>>> [ =A0 =A05.935424] ntpd[154]: peers refreshed
>>> [ =A0 =A05.939361] ntpd[154]: Deferring DNS for pool.ntp.org 1
>>> [ =A0 =A06.385498] twl_rtc twl_rtc: rtc core: registered twl_rtc as rtc=
0
>>> [ =A0 =A07.948211] ntpd_intres[162]: host name not found: pool.ntp.org
>
> How long did you wait here for a timeout of some kind? =A0What happens
> here different when it works? =A0Did you try SysRq? =A0What is the state
> of the board and native console?

I waited for 15 minutes. The MMC card LED doesn't glow indicating no
activity. The console has hung with the messages above. I tried sysrq
but there is no response. CONFIG_MAGIC_SYSRQ=3Dy in my .config

Thanks,
Joel


