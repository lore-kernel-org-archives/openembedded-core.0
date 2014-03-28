Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 061B36E3BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 15:23:25 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so3778880ykq.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 08:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=kvOEjVo1yvDQ5KwnpQBtqAEGcPZ+FZVaGn+rpZUSFks=;
	b=NJKPyMZMXj1qNRuR7mjJtqPoL3UsLk6HI8JZxbtSLNLG59lFCqImtVzqATwVtUIsQX
	MWjQyjC3xn2iR4tqcPRM0QnCiKEY72MhF/SGzlcaZos8BKiDATgGC33IO8pawg+TcqOa
	s255zCkWoUcWZJAT5NvZFbGPpI/p4QfUMxwhGPklheCJY8KCXoMUpELiznmow5+9zKlB
	w7xwgSu8B0Y0ixCReFXyxu48tkBrnfM+QWbk70LYsuef4MwuAcEiT4Yen9yx7br0j30U
	n0FPXdlX1L+pOk7Szh48u4l46MKzHilv82lCmGOgQrTUPtYjlPdU0TlFDWhnDUODxpS9
	B73Q==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr1857483yhb.155.1396020206210;
	Fri, 28 Mar 2014 08:23:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Fri, 28 Mar 2014 08:23:26 -0700 (PDT)
In-Reply-To: <533401A8.60304@enea.com>
References: <1395676843.24890.7.camel@ted> <5331935A.6060009@enea.com>
	<533401A8.60304@enea.com>
Date: Fri, 28 Mar 2014 12:23:26 -0300
X-Google-Sender-Auth: 7p7KiCYittTTTSdcFCBIeCaUFGI
Message-ID: <CAP9ODKrT1c3UP30ntyi1c+CGJdBW49-6CnoTtXfwoJSC63XRTQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Features in Yocto Project 1.7
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
X-List-Received-Date: Fri, 28 Mar 2014 15:23:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello David,

On Thu, Mar 27, 2014 at 7:47 AM, David Nystr=F6m <david.nystrom@enea.com> w=
rote:
> On 2014-03-25 15:31, David Nystr=F6m wrote:
>>
>> On 2014-03-24 17:00, Richard Purdie wrote:
>>>
>>> As development on 1.6 finishes up, its time to think about what we
>>> should be doing in the 1.7 cycle.
>>>
>>> I think from my perspective, in 1.7 I'd like to see us looking at
>>> "Developer Workflow". Its a generic topic which I think covered multipl=
e
>>> areas (in no particular order):
>>>
>>> * the ADT/SDK and how it intergrates into the rest of the system
>>
>>
>>> * toaster
>>> * python devshell
>>> * exteralsrc.bbclass
>>> * memory resident bitbake
>>> * how a standalone app developer might build an image
>>
>>
>> +1
>> My wishlist:
>>
>> 1. Assembly of an image from a package repository using the SDK.
>> 2. Ability to easily package multiple kernel flavours(builds with
>> different kernel configs) with linux related bbclass:es.
>
>
> 3. layer based repository splitting.
> --
> When having multiple users of a base repository. Ease management of
> customized repos, by having he ability to mark layers as "split layers",
> this would yield a separate repo per "split layer", which would contain
> packages modified/created by this layer.

So you mean:

 * base package feed
 * meta-qt5 package feed

and in case meta-qt5 adds a bbappend, in a existing recipe, what will
be the behavior?

> Said packages would also be built for the base repo, but without split-la=
yer
> modifications.
>
> A customized distro would use a compound of the base repo + split repo,
> where the split repo would have higher priority.
>
> I guess this could mean one deploy directory per split-layer.

This part is easy as all package managers we use has support for it (I
think) so it is a matter of proper generating those and add a method
to include it in the image, the first part is the most complicated one
I think...

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

