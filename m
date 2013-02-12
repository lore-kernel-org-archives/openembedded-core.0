Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1U5JD5-00036G-1Z; Tue, 12 Feb 2013 18:00:10 +0100
Received: by mail-oa0-f52.google.com with SMTP id k14so285945oag.25
	for <multiple recipients>; Tue, 12 Feb 2013 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ooXiPJ5g1cXnFsvM2Ia6BiHPMuWjXsVh/cY4Sh7iFHY=;
	b=XwPEYdU5m543Lc7ugX6g9umFQDGz5L+C7DM1VKpNr6oZuklaFZI76znMR1L3/EeMFI
	fVx74bBTUFE5nD/P4BzsMsaewzC7TgnjCmUSF7yyCGeEZLtAqRASNuEOoRP+Qc4Sty+V
	YUf1h+z7Go1sUbedXAILdf1Ai5/Jf27qWhb/V7riUcE3chgvHvg9EKKQH5ep0qn15kJs
	JwgMdQ97SXmFQOawNgCU6BGz1XgKfiTX/GrYU4Gsn9+8Leq9ZkIaXHG/wHAqt7g6zLRd
	1b7wf6I2M97fNyfLf6BeSnjKqm5N25t4vVeTSH7xiH8vcBB9y0C5XbDzpiUlnJTIhFUm
	2WBw==
MIME-Version: 1.0
X-Received: by 10.60.169.135 with SMTP id ae7mr13649138oec.82.1360687438724;
	Tue, 12 Feb 2013 08:43:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 12 Feb 2013 08:43:58 -0800 (PST)
In-Reply-To: <1906630.s5um26QAQj@helios>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
Date: Tue, 12 Feb 2013 14:43:58 -0200
X-Google-Sender-Auth: fqTEy7tdRO-Oj14AKQjSSCf-Dtc
Message-ID: <CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 17:00:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 12, 2013 at 8:38 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 12 February 2013 10:24:50 Burton, Ross wrote:
>> > * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe
>> > that is ahead of 1.0; the OE-Core version has two patches not in the
>> > meta-oe version but that both have been merged upstream in the git
>> > revision being used in the meta-oe version. There is no newer stable
>> > release. What do we do here? Should we ask upstream (Chris) for a new
>> > stable release?
>>
>> Is anyone actually using tslib these days?  oe-core dropped kdrive,
>> and we don't package the apparently unmaintained input driver for
>> Xorg.  I guess a new upstream would be good, and then move to meta-oe.
>
> Qt Embedded as we build it is currently configured to use tslib, as is
> SDL. If the alternative (evdev?) is supported they could presumably be
> switched over though. I don't know how practical that is however.

Yes Qt Embedded uses it; not sure evdev is an alternative here.

>> > * xserver-nodm-init: the two versions are quite distinct. Not sure I
>> > understand the full history here but perhaps someone else can fill in the
>> > blanks...?
>>
>> I don't understand the full history either yet, but this is clearly
>> something that needs to be sorted.
>>
>> > * meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
>> > As far as I can tell this just adds an /etc/busybox-syslog.default file
>> > containing OPTIONS="-C64" and seems to have been added for systemd
>> > support.
>> > I'm not sure why this wasn't moved to meta-systemd, but I assume it needs
>> > to be merged into OE-Core now that systemd support is being added
>> > there... ?
>> When it's understood *what* that does, then we can evaluate it for oe-core.
>
> The following commit introduced this:
>
> http://cgit.openembedded.org/meta-openembedded/commit/?id=c48a6a605c6d8d38cfbc5df39b3dc310bffc07c1
>
> Otavio can you explain further?

This was to make the service to use the /etc/default/busybox-syslog to
configure syslog. Today with the availability of journald I not sure
it still has an use. It might be dropped I think.

>> > * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>> > Another bbappend apparently for systemd support. Again, this should have
>> > been moved to meta-systemd; do we now need to merge it into OE-Core?
>>
>> Yes, half of it has been merged to master already. The rest should be
>> in Radu's branch, we can sort that today.
>
> OK, great.
>
>> > * meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
>> > Builds against external libav instead of using the builtin copy of ffmpeg,
>> > apparently for better performance on ARM (and presumably that is not the
>> > only benefit). It's less clear to me what should be done with this, but
>> > I'd still rather it could be eliminated. OE-Core does not have
>> > ffmpeg/libav; one wonders if it should or not.
>>
>> libav/gst-ffmpeg/gst-av (as it's called in gst1.0) has interesting
>> legal issues, but I do think it should be in oe-core.
>
> Well, we already have gst-ffmpeg in OE-Core so I can't imagine libav
> would be any worse as long as it is similarly protected with
> LICENSE_FLAGS.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


