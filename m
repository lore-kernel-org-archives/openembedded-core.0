Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RqkCe-0007EE-EQ
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 12:42:48 +0100
Received: by werc1 with SMTP id c1so1235399wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 03:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jvSJc8UvFFy5nl/+7dPbqxYiRXEY4pUr4Y9Msa7Aowc=;
	b=k64jyLhtvPbjs5oEkDBZGJD0LYLvCdQDC4itFTLadn4paJJU2JBr7TqklmU94RyZZ3
	gEvDnd5DYjOkKBMUSbhPHi07e6NiUWnQaYh8SUrypilR/cmlAULcbGIIb9DNSn/ojxb5
	By6mSm2EojbUmtvd8PXEiw1mkaCmxb9WJOQJw=
MIME-Version: 1.0
Received: by 10.216.138.220 with SMTP id a70mr3463348wej.24.1327664099512;
	Fri, 27 Jan 2012 03:34:59 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Fri, 27 Jan 2012 03:34:59 -0800 (PST)
In-Reply-To: <2153827.uieeAmS9LV@helios>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<CA+M6bXmAt2xBmCpiXBXxtEB-ykB_4qwtZqF9FrgXf3AD7ranpg@mail.gmail.com>
	<CAGiJk9fVik9Cc425O5kntWzgtf0Z2WPYnVcAjdTkswHY5YX7_Q@mail.gmail.com>
	<2153827.uieeAmS9LV@helios>
Date: Fri, 27 Jan 2012 12:34:59 +0100
Message-ID: <CAGiJk9dDm0KKcKZUhqrTFg9JLgKwbyn45K2Y4WgdiWoctskaEA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Fri, 27 Jan 2012 11:42:48 -0000
Content-Type: text/plain; charset=UTF-8

2012/1/27 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Friday 27 January 2012 11:43:50 Samuel Stirtzel wrote:
>> just a quick question, couldn't we use a separate recipe for phonon,
>> so if a recipe depends on it we don't have to change distro vars?
>
> Well, this thread is now about something more fundamental (how to introduce
> new DISTRO_FEATURES), but we do still need to solve the problem that prompted
> the wider discussion. It's still possible that someone would want to build
> phonon without pulseaudio, even if it was split out into a separate recipe, so
> I'm not sure that addresses the problem.

Oh ok, I thought just about Qt + Phonon +- Pulseaudio case.
If a user disables or enables Pulseaudio he would need to rebuild all
Qt stuff to make it work (and building Qt is time consuming).
With a separate phonon recipe he could just rebuild the libphonon
recipe instead.

>
>> IMHO it would be easier to just depend on libphonon.bb instead of
>> adding a distro var for the one single recipe I'm working on.
>> Just my 0.02 cents.
>
> Pulseaudio has become an optional dependency for a lot of things. I think it
> makes sense to make a decision on whether or not to include this on a distro
> level since if you have it enabled in one place you almost certainly want it
> enabled everywhere else (and disabled everywhere if it is disabled).

So it's not just Phonon depending on Pulseaudio, then I see the
comfort of a distro level switch.
>
> Now, at the start of this saga there was a question as to whether this should
> be a DISTRO_FEATURE or PACKAGECONFIG (or both, ugh). Ultimately the result is
> the same - distro policy controls whether this feature is on or off.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
Regards
Samuel


