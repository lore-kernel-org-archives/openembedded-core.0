Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RpMJS-0007Gl-6Z
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 17:00:07 +0100
Received: by pbaa13 with SMTP id a13so42079pba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 07:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qgw/wuchbqD4BvIrkx7Djg33e38FvmahW4E8tYrtWwM=;
	b=BGx5CkApRECFzKXkXDlKk5WAXtLWTRpdGt1G4l+iwMuYiGOkGao7drEVVjU6Lu9nt3
	5O2DxIm2m2w1G2FFODCjMV/FNCyHOnSV1sfXvo1adKUIyrDXMhFEKN4Tljb3xZKZzadk
	vtz2Tl/vCOLJ3WHWZ0P6qGvyrj8spbbsMioCw=
MIME-Version: 1.0
Received: by 10.68.118.136 with SMTP id km8mr23317840pbb.73.1327333445538;
	Mon, 23 Jan 2012 07:44:05 -0800 (PST)
Received: by 10.143.10.7 with HTTP; Mon, 23 Jan 2012 07:44:05 -0800 (PST)
In-Reply-To: <CADkTA4MdDYGV4EJa92h0yCwMJUy_36bSQobCAnPU==1PhuYM0Q@mail.gmail.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
	<4F1A3608.70002@linux.intel.com>
	<CADkTA4MWvSsScXymA1-3vStE4qrY6yR5p3-8QG8FkN+-rqaYvg@mail.gmail.com>
	<1327146536.10079.16.camel@ted>
	<CADkTA4MdDYGV4EJa92h0yCwMJUy_36bSQobCAnPU==1PhuYM0Q@mail.gmail.com>
Date: Mon, 23 Jan 2012 10:44:05 -0500
Message-ID: <CADkTA4MyOivZ1=o8WWZmDx9mAj_TGErWNAqmm9HC7kAaZRSvkQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Jan 2012 16:00:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 21, 2012 at 9:29 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sat, Jan 21, 2012 at 6:48 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Fri, 2012-01-20 at 23:12 -0500, Bruce Ashfield wrote:
>>> On Fri, Jan 20, 2012 at 10:50 PM, Saul Wold <sgw@linux.intel.com> wrote=
:
>>> > On 01/05/2012 12:37 AM, Liming Wang wrote:
>>> >>
>>> >> Hi Richard,
>>> >>
>>> >> These patches are aimed to replace emulation of qemuppc from prep to
>>> >> mac99.
>>> >> With this new emulation, qemuppc now supports framebuffer and the ne=
twork
>>> >> works well.
>>> >>
>>> > Is there anything that needs to be setup differently for the runqemu
>>> > scripts? =A0Our sanity tests have failed after changing to the new pp=
c code
>>> > and I wonder if there is something for the command line or ???
>>>
>>> What type of failure ? boot ? I'm building and booting it all the time,=
 so I can
>>> help there. Or are you talking about something in particular like the n=
etwork ?
>>> disk ?
>>
>> I ran a test build and can confirm that whilst qemuppc can boot, there
>> is no network. We need to fix the network ASAP as our automated testing
>> depends on working network access...
>
> Liming is out for the next week or so, but I'll see what I can do on Mond=
ay.
> He did report a properly working networking with his initial submission, =
so it
> should just be a configuration issue.

Does anyone have more details on this for me ? I just did a build and boot =
into
sato and everything worked here. Mouse was fine, opened the terminal, ifcon=
fig
reports and up and running ethernet, and I can ping and ssh out of qemppc t=
o
my host machine.

So I've got nothing to test here, since it all worked.

Note: there is one small change to runqemu that I can send along to enable =
the
keyboard in sato, but that's all that I have to go on.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


