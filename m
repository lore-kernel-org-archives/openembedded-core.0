Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SC9Ui-00038M-O0
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 14:57:56 +0200
Received: by wera1 with SMTP id a1so4141179wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 05:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=U9uHWJN6cZpaxFMfjL9qK9X79GUUKh/jb+9+mPdpyxs=;
	b=GY7AIcpU41EjoyM7T0zi5TFFU1aTVtM1vpVLoryw5EqugC0Mo8F4tKR/UrnTNwlgsa
	DoDT2HK7JscPkQTa3dbb+BOvGvf0f4P2brJLRFb1VmYB3V4dVpkT5n7dPaO0pTnzvNAW
	JjLhJiZlnUlcTHPsUBXIpJ0q1ahrVtPUef4jUHCZGgKYC+SbH8nMcN9+ZpMyz+ZgfMGA
	m0QXPYSvERvupt5OyooMSJDjlpEaJM3CZcf/2P2QXmb88TcXopqD7R68yJBp5pLUfRfD
	nfYKr+hD5ZmpwA1sYfGCuK1XuHjnt2SqcRSORNjhnhnj4mpOHQXeIsbNfG9vVJyWCS7Q
	pklw==
MIME-Version: 1.0
Received: by 10.180.100.2 with SMTP id eu2mr18386432wib.1.1332766136994; Mon,
	26 Mar 2012 05:48:56 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Mon, 26 Mar 2012 05:48:56 -0700 (PDT)
In-Reply-To: <27160280.DeolcF7eDi@helios>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<BFD998F2-6D5D-4E7D-8006-C133F0DF9C98@dominion.thruhere.net>
	<CAGiJk9fNChJRLzHTLptShp+duFZy+o2bf_Enz6_kv_v-httwxg@mail.gmail.com>
	<27160280.DeolcF7eDi@helios>
Date: Mon, 26 Mar 2012 14:48:56 +0200
Message-ID: <CAGiJk9cuP3=tc0Bv-Xw=8JZKcGrg4rvJurjtwxrj3HG1JS-knQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Mon, 26 Mar 2012 12:57:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/1 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Thursday 01 March 2012 15:15:11 Samuel Stirtzel wrote:
>> For the packages kconfig_compiler (needs libkdecore) and
>> makekdewidgets (needs libkdecore and libkdeui) it might work, as long
>> as the programs got their libraries.
>> Since building kdelibs native in OpenEmbedded would need a "full
>> featured" Qt-native and the other dependencies it would cause a lot
>> overhead.
>> Building libkdecore and kconfig_compiler alone works, but libkdeui
>> pulls "everything" else in.
>
> Ouch :( I can imagine trying to break these up would be quite tricky. Per=
haps
> it's something we have to live with for the time being. If we do rely on
> external executables, then we should check and error out as early as poss=
ible
> if the required executables don't exist.
>
>> > No testlab in oe-core, but buildhistory pretty much does the same:
>> > http://dominion.thruhere.net/koen/cms/the-testlab-strikes-again
>> Thanks, I will look into that.
>
> FYI there's very basic documentation for buildhistory here:
>
> =C2=A0http://wiki.yoctoproject.org/wiki/Buildhistory
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

Sorry for the late answer,
just wanted to say it worked, thanks both of you.

Still working on Plasma Active, but many other things are finished.

Most common applications work, for example:
Calligra (not all of the toolkit), Kate, KCalc, Konqueror, Kwin &
Kwin_gles (KDE window manager), Okular and the applications from
KDE-baseapps.
If anyone ever wanted to get a KDE application running on their
OpenEmbedded device;
Or better, ever wanted to do KDE development with OE, it now could be
worth to try out meta-kde.

Please note:
* The meta-kde repository is still work in progress.
* There is currently no mailing list hosting the meta-kde discussion,
but this is subject to change.
* The meta-kde layer could work with Poky too, please see the thread
on the yocto mailing-list (coming soon).

It would be nice if you'd like to test if meta-kde works for you,
since it could be possible that some R-/DEPENDS are missing.
E.g. if "bitbake konsole" just works.


--=20
Regards
Samuel


