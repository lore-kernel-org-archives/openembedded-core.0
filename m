Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Roc3x-0006UC-TV
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 15:37:03 +0100
Received: by dadw11 with SMTP id w11so689327dad.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6c+HDWK5BBjIbNofGO3jobaaVsvmJdQyDzzdJ6zjnSQ=;
	b=BAS+tjffNxCRtcR3siLXW8y4wrK6T8bZFWsZOUDY6eu/w5LSzWT2Uf0onxh8ldem3d
	K+IFoyK+z6DZSu8OFD+5b+f/xGtd0Z/51XQpM8aZQXkJozVQrgGYWxtrsb4RDfT5sURz
	DbvsC7pYEjG4LigXEyP4ByFja9dovmx0/ETWE=
MIME-Version: 1.0
Received: by 10.68.120.72 with SMTP id la8mr5243986pbb.56.1327156157556; Sat,
	21 Jan 2012 06:29:17 -0800 (PST)
Received: by 10.143.10.7 with HTTP; Sat, 21 Jan 2012 06:29:17 -0800 (PST)
In-Reply-To: <1327146536.10079.16.camel@ted>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
	<4F1A3608.70002@linux.intel.com>
	<CADkTA4MWvSsScXymA1-3vStE4qrY6yR5p3-8QG8FkN+-rqaYvg@mail.gmail.com>
	<1327146536.10079.16.camel@ted>
Date: Sat, 21 Jan 2012 09:29:17 -0500
Message-ID: <CADkTA4MdDYGV4EJa92h0yCwMJUy_36bSQobCAnPU==1PhuYM0Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Sat, 21 Jan 2012 14:37:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 21, 2012 at 6:48 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-01-20 at 23:12 -0500, Bruce Ashfield wrote:
>> On Fri, Jan 20, 2012 at 10:50 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> > On 01/05/2012 12:37 AM, Liming Wang wrote:
>> >>
>> >> Hi Richard,
>> >>
>> >> These patches are aimed to replace emulation of qemuppc from prep to
>> >> mac99.
>> >> With this new emulation, qemuppc now supports framebuffer and the net=
work
>> >> works well.
>> >>
>> > Is there anything that needs to be setup differently for the runqemu
>> > scripts? =A0Our sanity tests have failed after changing to the new ppc=
 code
>> > and I wonder if there is something for the command line or ???
>>
>> What type of failure ? boot ? I'm building and booting it all the time, =
so I can
>> help there. Or are you talking about something in particular like the ne=
twork ?
>> disk ?
>
> I ran a test build and can confirm that whilst qemuppc can boot, there
> is no network. We need to fix the network ASAP as our automated testing
> depends on working network access...

Liming is out for the next week or so, but I'll see what I can do on Monday=
.
He did report a properly working networking with his initial submission, so=
 it
should just be a configuration issue.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


