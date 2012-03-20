Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9yA2-0006ap-T2
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 13:27:35 +0100
Received: by iaag37 with SMTP id g37so10778114iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TYI/BRXoWWFPRSJOVImg4bpqsnsiOH5SOd16XANc/Gw=;
	b=ddAONc0S03HTZYAboGcjrudJfvC85slTZRBZZUUqakUW1FWq04JpKAKqJ7yniSCYJ5
	UbMdy+NOcyVvYMC60qy3LS/EIN6rboc3zF0f1hCLToFjPK18/IkjjgiA3ARUTQQ3MY+r
	oRVol9Wz3khyXg4PHiq/q5aOUJaWNHx8drCzzbVwC+cqCYm5c7DQ9tQlH1xXO4w0WAmZ
	mxASxU5a5YzE/U20y8uXxreBeE8Fkn8mk21nXxbrS2A6lE5JUjKJlC1X7lVMwvXSKUkM
	xPDCZxLBOv25afq76auY+CCARNWk1gRLtXqu+DpCDzBK95+yB9ylYixkT3/h2aE1EyXs
	EmaQ==
MIME-Version: 1.0
Received: by 10.50.159.202 with SMTP id xe10mr8434914igb.66.1332245920946;
	Tue, 20 Mar 2012 05:18:40 -0700 (PDT)
Received: by 10.42.75.137 with HTTP; Tue, 20 Mar 2012 05:18:40 -0700 (PDT)
In-Reply-To: <CALbNGRSm2KV_RsV+rR4hFNcEg7Oi5Z57N1nGXS73Z17G6gqS1g@mail.gmail.com>
References: <CALbNGRSm2KV_RsV+rR4hFNcEg7Oi5Z57N1nGXS73Z17G6gqS1g@mail.gmail.com>
Date: Tue, 20 Mar 2012 13:18:40 +0100
Message-ID: <CALbNGRQ-DWnKZxDeZCWXVPRL-KqyNkZwPrhs4YB=ENk3MoVkCw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: Debugging with gdb
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
X-List-Received-Date: Tue, 20 Mar 2012 12:27:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2012 at 12:18 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> midori crashes with segmentation fault since a while (0.4.3 & 0.4.4).
> To understand why I would like to start a gdb remote debug session. In
> the past I prepared the image in the following way to get as much
> libraries as possible compiled with -O0 since I do not know which
> component might be responsible:
>
> 1. clean all tmp dirs
> 2. build all recipes where -O0 is not wanted
> (u-boot/kernel/gdb/gdb-cross) or not possible (eglibc/lttng-ust)
> 3. added in local.conf: 'SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}=
 -O0'
> 4. build image
>
> This sequence does not work anymore since the change in local.conf
> causes most (all?) recipes to rebuild which crashes at least at
> eglibc.
>
> I am running a bit out of ideas to get this done. The only solution I
> see is a minimum optimization passed in the recipe together with 3.
> and build from scratch.
>
> Comments / better ideas?

[1] should bring back old behavior - thanks

Andreas

[1] http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-March/0=
05842.html


