Received: from mail-ia0-f169.google.com ([209.85.210.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3mXC-0005iL-Qc
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 12:54:36 +0100
Received: by mail-ia0-f169.google.com with SMTP id j5so4144123iaf.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=FMMuc7fnXXtmOTga9RfKzCPpcaHBcZutj2eTli13dTY=;
	b=wJ/7XCGlN28S8XjCxH4FXEJqEjKzqIUhXwKlM3RM9i8485NLbQ9GEPczuc9v4eBRcw
	CG57llGqNOGFY/4Pa3TjpYcxZGTqaizgV0nvrM4z+TilpwaSJ0QmHnoYx5/uhjQl/L5Q
	v7iQQ8qkKg6hx4LGNExgU2Iv/cqYavYd70GpDaAdjwKeYum53W9XrewwulQmxrio0qie
	bJN6hLDbZoCB5DWiNGdf7S4LPKLJ5yIwZEebhwcV9CmnPyaEHhA7hAgi/9XRvB36OPZH
	hbQy2hOE/WWCZVlDwrm6Qo+lBIFY5VHvtQfpYrD5fwDs/l7W/IsWP+p7OZsbrMtnk2s4
	+cmg==
MIME-Version: 1.0
X-Received: by 10.50.149.168 with SMTP id ub8mr1481572igb.111.1360323512478;
	Fri, 08 Feb 2013 03:38:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.64.10.105 with HTTP; Fri, 8 Feb 2013 03:38:32 -0800 (PST)
In-Reply-To: <CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
Date: Fri, 8 Feb 2013 09:38:32 -0200
X-Google-Sender-Auth: fXrpxOdFQoWY9DMjpokab_6rbno
Message-ID: <CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 11:55:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 9:36 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 8 February 2013 11:32, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> The code where mistakenly replacing the localtime file setting so we
>> end with a copy of file instead of a symbolic link. This fixes it so
>> now, we'll only do that in case the link is pointing to invalid data.
>
> Can you fix the code to symlink instead of copy?  systemd and more
> needs a symlink so that it can identify the name of the timezone from
> the link target.

You mean inside the if?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


