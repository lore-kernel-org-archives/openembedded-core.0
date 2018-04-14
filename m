Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 86B65605BF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 12:55:53 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id w2-v6so1761772otj.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TASvOcamKM5TIEUlzH6xqsuiD8gi1zn+C0pNeSqAlCc=;
	b=gEqqzmXyf0grFde5Yun7DZTTNPScLVm4RPB9todxvEi6fyYZ7xGsNM1KvzYL/3hv0f
	Z6tOhgfBsZ0+GhOy4znB1PTCu5nPT/V81diT8egubWJ44cAmtb6PsDVdv+l2ZFjvqdh4
	1bwpwr3SAoOWqS+4m3V7v0EBcVwd/FKzpQ1IhaeGYVC5XFlXaEVioEjy0c+s39kp4By/
	qOWIt8YFmtC11loP4guiZYsVA7wPP7a1lCXpkfHBoKCIEEtRjRoOnH3J9xDJfww5x3jB
	AjPzvcjAKlMMzAjTCuDbW0oeJcn9SJ9DGBrYvnG1TqbYPvwQblljG//jDjPLed9pstob
	iu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TASvOcamKM5TIEUlzH6xqsuiD8gi1zn+C0pNeSqAlCc=;
	b=NkQMaFwW++wc2HtqEhTSlUOZ021EBDJDnx9O/ACYgFgIsutOVjb3lodRHOGsEYv2vN
	Icg2bkO0+HIST8OAUWE5DwDx68W75CZDAiAaGbfzDcGdFyNWAstvmFgAVhxQqr2RA6Jg
	37g4afm9wGJ7caz+AL3z3wKUftp+AOxYYA8uy9aVp/bykN9BRLBRNuTLbJfJYwaKThTz
	a4dIJ0M5wHJw+/PI1h5wG86+PnBk/TerslceCbz9JPGPenOKmv9zvhRbyeNGFXEep8JT
	tB7VSkArx3rQu6wpUoP+IDzupHlu8YNR8jN2jyEHNbiHzyHrCoj4p8yVYZlCQkgATE8z
	YPgg==
X-Gm-Message-State: ALQs6tAtA+tEfXjwdj8FezQ/7/V9gXdPKCQkApIxvOFpyvVhivUstUCF
	yNc21Mf8b0TeS7xhlDZYKG+YA/nqaissfG1sp7I=
X-Google-Smtp-Source: AIpwx4+307vxHF8ttBzSF8+q0piHbYBH1c1plQBZYNOXugIWeZAelseNYITYx1H9hj4ajRQmUiaOOnsMgaqC9wYqnCc=
X-Received: by 2002:a9d:7346:: with SMTP id
	l6-v6mr6332780otk.227.1523710554259; 
	Sat, 14 Apr 2018 05:55:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Sat, 14 Apr 2018 05:55:53 -0700 (PDT)
In-Reply-To: <20180414101014.4bcbbc31@host0.betafive.co.uk>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
	<20180414101014.4bcbbc31@host0.betafive.co.uk>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 14 Apr 2018 14:55:53 +0200
Message-ID: <CALbNGRSAMPf02-vWKrcX6j_K-My=e+Bw4RTwHRDHF9qcxz2JhA@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Sat, 14 Apr 2018 12:55:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 14, 2018 at 11:10 AM, Paul Barker <paul@betafive.co.uk> wrote:
> On Fri, 13 Apr 2018 00:12:16 +0200
> Andreas M=C3=BCller <schnitzeltony@gmail.com> wrote:
>
>> On Thu, Apr 12, 2018 at 11:46 PM, Andreas M=C3=BCller
>> <schnitzeltony@gmail.com> wrote:
>> > On Thu, Apr 12, 2018 at 11:38 PM, Cal Sullivan
>> > <california.l.sullivan@intel.com> wrote:
>> >> If you're using a non-linux-yocto kernel you likely need to apply thi=
s patch
>> >> to your kernel as well:
>> >>
>> >> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-ke=
rnel/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specificati=
on-of.patch
>> > Correct: RaspberryPi kernel
>> >>
>> >> (This is in all linux-yocto kernels, I'm only linking to meta-intel b=
ecause
>> >> I knew where it was off the top of my head)
>> >>
>> >> This was sent upstream but last I looked it didn't gain any traction.=
 I
>> >> think Bruce resent it recently but I can't be sure.
>> >>
>> >> Thanks,
>> >> Cal
>> >>
>> > That looks very promising - will try and let you know - thanks in adva=
nce :)
>> >
>> Perfect! - Thanks Cal for quick help!
>
> Sounds like we should apply this to the kernel recipe in
> meta-raspberrypi.
>
> Andreas, want to send a PR for this? Or shall I add to my todo list?
>
Paul: Am still on my meta-raspi-light (FYI 4.14-rt does not yet
perform good enough to make music) so I think for you it's easier:)

BTW: I had to add the kernel patch also for 4.9 - it had the same issue.

Andreas

