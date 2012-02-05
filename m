Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RuBvD-0004SV-Sb
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 00:55:03 +0100
Received: by lahc1 with SMTP id c1so2636391lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 15:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=NR3HRPLzKHEHAX3O9TSRtSusKZkMYlYgQo286kfjngc=;
	b=VfR/I93vwUd27FmkOi0CiJZ8rv31UwXnNiewh7KqeGMolOg3NBnE33eL3PNfUbc3gN
	GOy8H44ay/SaoEnfzM5u7fUWVqm63E60tZ5f3OugMy9CN9MTVk9Wtp/c4SZew5Wrl523
	NgWciw01xLW5OopmXqYZkY6WyaY3JuO7Y+7f4=
MIME-Version: 1.0
Received: by 10.152.102.237 with SMTP id fr13mr8380076lab.10.1328485623583;
	Sun, 05 Feb 2012 15:47:03 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Sun, 5 Feb 2012 15:47:03 -0800 (PST)
In-Reply-To: <CAMKF1spvxgnEb39qe1scw2k7Vqk--oSdVO18wcK3RFc5kqTqag@mail.gmail.com>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<CAMKF1spvxgnEb39qe1scw2k7Vqk--oSdVO18wcK3RFc5kqTqag@mail.gmail.com>
Date: Mon, 6 Feb 2012 00:47:03 +0100
Message-ID: <CALbNGRS0DRnMd2Ss2EnfvLPyU1WbaSMDdtypJsmvZBWMXtZjEw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do rootfs does not create log files
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
X-List-Received-Date: Sun, 05 Feb 2012 23:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2012 at 12:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Feb 5, 2012 at 2:16 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
>> Hi,
>>
>> is it a bug or a feature that do_rootfs does not create the package
>> information (packed_files / packages ..) in a deploy sub-folder did I
>> miss a switch for this?
>>
>
> which files to be sure ?
I lost them because had several build from scratch. So I can't tell
their names :( but in

deploy/images/<machine-name> was a sub-folder for each image created
containing helpful files (which packages were installed / licenses /
file in image...

Andreas


