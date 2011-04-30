Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGIQ7-0002Bf-8P
	for openembedded-core@lists.openembedded.org;
	Sun, 01 May 2011 00:13:47 +0200
Received: by eye27 with SMTP id 27so1450279eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Apr 2011 15:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=7nThlgvvwZr3AT2BSaorZrDhC4wEzAXNTCVzzoRvaBs=;
	b=SJK0neVYxqd8GPsRajR6z6XTKNjqh3CPB2qojsvbYIMSTOHVY6O2o1jXXQKTMbOHW1
	FK8nppZ9cp0/9qdhx4HQp8yCkmUTO4YUes6AmUjgT+I8JLVpzZg5arIK5eWfngZxnMUK
	x0vFe5ZhcuRwmscdC4SqFgS1JMsqCE8bOEvws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=DbOSr3UVuAIW9r7fC2QHJPQ/W2WxYnf2/tS0A8hqb7oI7icfx8EOANX1DVYcv4KWXB
	T8zsqQM1AwRRkwCuIpAz9j16iktZmKr8fxLKo8SjAjEQcQAKf7HCegh5ucSyQzXdo3ss
	glSFKxrPEytddAVdvmA5lMQB4wSfklcL79fBw=
Received: by 10.14.11.132 with SMTP id 4mr2720505eex.45.1304201471268; Sat, 30
	Apr 2011 15:11:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Sat, 30 Apr 2011 15:10:41 -0700 (PDT)
In-Reply-To: <BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
References: <4DB99F31.4000308@mlbassoc.com>
	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Apr 2011 15:10:41 -0700
Message-ID: <BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Sat, 30 Apr 2011 22:13:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 11:23 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Apr 28, 2011 at 10:09 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>> I got my OMAP target to build with GCC-4.6.0 using the latest
>> Poky tree after a fresh rebuild. =C2=A0Sadly, the Linux kernel (2.6.37.3=
)
>> does not run correctly when built with this compiler. =C2=A0It
>> fails when enumerating the USB bus :-(
>>
>> Are there known issues with the Linux kernel on ARM and GCC-4.6?
>>
>
> There has been fixes on top of 4.6.0 the one we have right now is vanilla
> 4.6.0 release. I plan to add second set of patches but you have to dig a =
bit
> more to identify the problem
>

I have some updates for gcc 4.6.0
they are staged in

http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dkra=
j/gcc-4.6

(top 3 patches)

Please test them out and if you are lucky
your problem might be fixed too.

All, please try these patches and provide any feedback

-Khem


