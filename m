Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S3S2X-0008TG-8x
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:56:53 +0100
Received: by lagw12 with SMTP id w12so2078312lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 04:48:22 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.112.48.200 as permitted sender)
	client-ip=10.112.48.200; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.112.48.200 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.112.48.200])
	by 10.112.48.200 with SMTP id o8mr4565151lbn.54.1330692502443 (num_hops
	= 1); Fri, 02 Mar 2012 04:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=nEF+4wVpTAow/nvUXLVJ0wOZ0ElUFdRfdmWHKGrR/BU=;
	b=UayWi4RlukAI1Vc5gejJ1t2m5Y/v1uJcfYZ3+K2fg3ZnItjB4zE4rC1RaDAXupjCKD
	/j39AtbM6pW7LLN9YOfKD31/eUZ+4mKgk6ehblM3r4H44behE6s5s9XJAsrjQn8psxtW
	HHc6TNpx7tYgfDBPFGZm27Jr+vlVQ/9GG43Gv9+40XT0X/PRE9Wo1DIfBJXi7+Aq4y4b
	/SzsZoecIa3RF3JeeSx3qY7CPgDXgGya4u9roa/NcfnzqWJAPa/HacYi/reXOgQvqgYn
	7etXyEvvMZj7nPyDUdCVW2UAi70GQrnFO+qndcuEbkDXwidST2YzAYbAXLicSMnR4eIF
	gNWg==
MIME-Version: 1.0
Received: by 10.112.48.200 with SMTP id o8mr3724517lbn.54.1330692502378; Fri,
	02 Mar 2012 04:48:22 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Fri, 2 Mar 2012 04:48:22 -0800 (PST)
In-Reply-To: <1330691892.15224.17.camel@ted>
References: <1330547595-11631-1-git-send-email-ynezz@true.cz>
	<1330617040.31767.25.camel@ted>
	<CALbNGRRKMKQx1ZSzJruX26J2NGYFBYS+Cgp3W2Pk9ETCRtfY+g@mail.gmail.com>
	<1330691892.15224.17.camel@ted>
Date: Fri, 2 Mar 2012 13:48:22 +0100
Message-ID: <CALbNGRSJMFZ03x25xE+d_Sj6H2g6=gFx5OX15GAO2sRAGKrsSg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: fix link creation failure if the target already exists
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
X-List-Received-Date: Fri, 02 Mar 2012 12:56:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2012 at 1:38 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-03-02 at 13:29 +0100, Andreas M=C3=BCller wrote:
>> On Thu, Mar 1, 2012 at 4:50 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2012-02-29 at 21:33 +0100, Petr =C5=A0tetiar wrote:
>> >> | ln: failed to create symbolic link `beagleboard/systemd-image-beagl=
eboard.tar.bz2': File exists
>> >> NOTE: package systemd-image-1.0-r0: task do_rootfs: Failed
>> >>
>> >> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
>> >> ---
>> >> =C2=A0meta/classes/image_types.bbclass | =C2=A0 =C2=A02 +-
>> >> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>> >
>> > Is this still necessary after the recent image_types.bbclass fixes?
>> >
>> I pulled ~3-4 hours ago and the error persists. I don't know if it is
>> important for this problem but I am using opkg and get:
>>
>> | ln: failed to create symbolic link
>> `/home/andreas/tmp/oe-core-eglibc/deploy/images/overo/xfce-base-image-ov=
ero.tar.bz2':
>> File exists
>> NOTE: package xfce-base-image-1.0-r0: task do_rootfs: Failed
>
> Could you see what the IMAGE_FSTYPES variable contains please?
>
> (bitbake xfce-base-image -e | grep ^IMAGE_FSTYPES)
>
> The code shouldn't be trying to create this symlink more than once so
> whilst I understand the intent of the patch adding -f, I'd like to
> understand the root cause of the problem to ensure there isn't some
> other issue.
>
Agreed:

IMAGE_FSTYPES=3D"tar.bz2 tar.bz2"

Seems a 'sum' of local.conf

IMAGE_FSTYPES =3D "tar.bz2"

and machine.conf

IMAGE_FSTYPES +=3D "tar.bz2"

Andreas


