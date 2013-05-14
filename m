Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UcEtn-0003G7-Ik
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 15:04:14 +0200
Received: by mail-wg0-f51.google.com with SMTP id b13so436883wgh.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=sHYifYHHN4uUqfZwuMMEL+jLDfTBjPcuRtTgjSfSqYY=;
	b=hMJJKvJZpVreQFa5nOt6o+1414g0iyzLFIISIqhG8vAJjdp0jfKUc33uaelT5C4T50
	ZyqTpRhLVEeVwOtA0J96gr6Kfmk+OUVRVPNXuDhFp1Hmbq8tHCS3r3P+61jlvJfMQhS3
	3G+vM7SnkCdfVA+sFxKu0iNFMLPEF2cX+z1IOOT9vq7DWl7taCBVsI7RF3ByLvckxJ9a
	zMWVTmMJ+A4OxMlCklF/J1QFGPbrMMmy/+M/feBr7i8ZMx0kMdJMTa4pi5Wjc2l/oSTG
	km57ecHGDx6Bp5jy4n+TQ846GKiRSHS3lUClGzDDvj7mABrS72wr3O+fxwFK78anb7Lc
	Ww6Q==
MIME-Version: 1.0
X-Received: by 10.180.185.44 with SMTP id ez12mr6175407wic.7.1368535173016;
	Tue, 14 May 2013 05:39:33 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Tue, 14 May 2013 05:39:32 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305140423590.26605@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
Date: Tue, 14 May 2013 08:39:32 -0400
Message-ID: <CAHUNapQBtTyUnmTrpiSkz8e8A1DcWSDFF_zq8ym+0SXzcU-gBw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Tue, 14 May 2013 13:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 14, 2013 at 4:28 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> On Mon, 13 May 2013, Khem Raj wrote:
>> can you try this
>>
>> add
>>
>> SRCREV_machine_qemumips64 = "bbefde394205a1b317eae31942bfc13afce0b0ac"
>>
>> to linux-yocto_3.8.bb
>>
>> and rebuild the kernel and see if that boots
>
>   ok, that gives me a successful boot (tried it twice, success both
> times) but i'm now at a boot prompt:
>
>   qemumips64 login:
>
> that's not accepting any keyboard input.  tried a couple more times,
> same result -- boot to login prompt, but no keyboard input. thoughts?

Me too. If I use the "serial" option on the "runqemu" cmdline I can
log in via the serial console. There was a time when I would get an
unresponsive qemumips console (via SDL) but could log in on console...
3? or 4? That isn't the case with qemumips64.

By the way, my build is still wanting to use linux-yocto_3.4.43.

What's interesting is: without the change described by Khem above if I put:

    PREFERRED_VERSION_linux-yocto := "3.8%"

in my local.conf I would get 3.8.11. When I add the change as
described above, this line in local.conf gives me linux-yocto_3.8.4!


With Khem's suggestion above:
- linux-yocto_3.8.4 boots but the SDL console doesn't accept input
- linux-yocto_3.4.43 doesn't fully boot (as before)


> p.s.  i can ping the VM (192.168.7.2) but can't ssh into it, FWIW.

I don't have any issue ssh'ing into the VM (with the 3.8.4 kernel)
when I add "ssh-server-openssh" to "EXTRA_IMAGE_FEATURES".


