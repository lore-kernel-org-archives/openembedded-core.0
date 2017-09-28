Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7544A775DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 18:04:42 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id x131so1586247ywa.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 11:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=mFir2kmEk+47G7AdVSa71y0ixZDLNw7Lm9jnaKdwYks=;
	b=e09IqFkWHrX4D4d5lMud/52SJ0nWa+RR4Ct73f2vmQpQ7YL7OMGRVFlUf0oTkkhDUu
	PzYOd3/gAhuYM+cx+Lf30LXP6Q/d6lkCs2zCMtwcT1uhKuRk2GksTk9+Fl1Jt7tL3TuW
	AhwyU4DjtUpgByZcxsU04rrKn+0AiojLlnn/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=mFir2kmEk+47G7AdVSa71y0ixZDLNw7Lm9jnaKdwYks=;
	b=d5HkZa5G9pYSVO/vcLZBdBkHHqizcGSsBPD9dNJHJyN+++gByg5Ko0N9udJhBmWlSS
	KRQ1M19wFKuv/Wu9HfyWh4jTNw8QOx+P8+xwU7Y8b91HvSfpluu0qv4sKBS2VF6NBAQO
	gRNgh4E9DL6WGDrWBhaK5VHrbyNRFXAtvfN9SlXWl0ziuGb7lUX4bpcQzHYWaBFTvS+X
	1K329HNKqwGQ6ED+OIyvXNprAR6nmkv35HGz8bEhgAz9VKCszeEEkzAz5lGvvgF21vkE
	pKpGF9n8VWw0KxrqmqP3Hb7hlzY++ROXF87/56fZ9WQZKKyDQK2FEoMtGbYtuEp/8rS4
	OzaQ==
X-Gm-Message-State: AHPjjUgRzqUT1FvIjEBmSca/4tdEg7UwY0gfdfgZk5/xj5DrQ7m8DKo/
	Y2AuuWz5Vytcm2+fStu9pottEg==
X-Google-Smtp-Source: AOwi7QBJAH/y7sA/Xhnbeh9q4erYrFSXVdpWXpe4UxFXbbcPCgjtTc0O2leJirCkteCVE14P2lhMDA==
X-Received: by 10.129.46.151 with SMTP id u145mr4197466ywu.527.1506621880009; 
	Thu, 28 Sep 2017 11:04:40 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:706c:f3a8:eab4:3cc8])
	by smtp.gmail.com with ESMTPSA id t64sm826553ywf.91.2017.09.28.11.04.38
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 11:04:39 -0700 (PDT)
Date: Thu, 28 Sep 2017 14:04:42 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170928180442.GR3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
	<CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
	<20170928174942.GP3112@bill-the-cat>
	<CAP9ODKrN8R_BpNobDUQNw33vEeQVJKF7g9mGK3-m=TUiyRukSQ@mail.gmail.com>
	<20170928175915.GQ3112@bill-the-cat>
	<CAP9ODKoWKvzf9eKAbjPCe4MY5d8f2EsBSjXbA87Ouw46QHP+=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoWKvzf9eKAbjPCe4MY5d8f2EsBSjXbA87Ouw46QHP+=w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Thu, 28 Sep 2017 18:04:43 -0000
X-Groupsio-MsgNum: 103476
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bWTBxx0QKOXH2iZ2"
Content-Disposition: inline

--bWTBxx0QKOXH2iZ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 03:01:13PM -0300, Otavio Salvador wrote:
> On Thu, Sep 28, 2017 at 2:59 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Thu, Sep 28, 2017 at 02:57:04PM -0300, Otavio Salvador wrote:
> >> On Thu, Sep 28, 2017 at 2:49 PM, Tom Rini <trini@konsulko.com> wrote:
> >> > On Thu, Sep 28, 2017 at 02:46:23PM -0300, Otavio Salvador wrote:
> >> >> Hello Tom,
> >> >>
> >> >> On Thu, Sep 28, 2017 at 2:44 PM, Tom Rini <trini@konsulko.com> wrot=
e:
> >> >> > On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
> >> >> >> On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
> >> >> >> > In the case of non-wic images there is logic today to generate=
 a
> >> >> >> > startup.nsh file that will be executed by EFI to run the loade=
r that the
> >> >> >> > image contains.  In the WIC case is currently depends on that =
file being
> >> >> >> > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only us=
ed if
> >> >> >> > present there.
> >> >> >>
> >> >> >> What's wrong with this approach?
> >> >> >
> >> >> > No one ever provides a startup.nsh and everyone that wants one cr=
eates
> >> >> > the same one line trivial example.  The end result is that no WIC=
 images
> >> >> > are Just Bootable on UEFI systems unless you first go and spell t=
hat out
> >> >> > as the desired booting device.  This isn't an awesome workflow wh=
ich is
> >> >> > why the non-WIC cases make the required startup.nsh :)
> >> >>
> >> >> I think it could be done as we did for u-boot-extlinux support.
> >> >
> >> > That's complete overkill for a static one line file.
> >>
> >> No, it is not. It allows for reproducable builds.
> >
> > Either solution would allow for reproducible builds.  Perhaps it would
> > be clearer if the patch just always generated that content instead like
> > the systemd and grub2 classes do?
>=20
> No; if the file is generated by wic it is external of the build and
> thus can change without the image change.

WIC isn't external to the build, it's part of the build.

--=20
Tom

--bWTBxx0QKOXH2iZ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzTm6AAoJEIf59jXTHXZS8TAQALjLkiMGLbxoET08ZITJWA1V
5MEbQdGRylDwXj7LErAye8gpSrlYdblFwa5j9LxDWTDKI6mbxkInymGsW7ehbmzG
4B2TgeXL2sHv1gXv9tBE8q+HGoCHmqhbmKZO6aLRd42eEFS7ML5SkmH3O/021Ga+
gB6lgIJrXIenbpOlEQFJZ86dRp3EpY1zqS7H9YwRcGHIhkEX9Pt+TsHcHh6PhIKE
12wTq1oDkCkn9C/WgW+jntQJV44955aXHi4OvryYH5+dfSz70a45WdKCyJzfbopX
P7fiOhPFekb/og2FmFEZ3jKP41QrWZgWG5WEWwQV0HAxykObP+0RQHUxwpV4ft3t
TzavHYN7sb5N5aByTUB+ptGeyeqmR6MU/68YgnX+vSIfH4McxiUzlSPX65gb6gN4
s863WI4U3dA/e3iBZl4zHY5e/LIGYboyHlObSKH40dJaHe4qXN4F9V9I5xqvxcok
v7gDFvkYmzcoTwGs3FN4ojENXf5+0JPBCz+WqbT6feSTp741oh/49RbNVDtS9mlY
5E1MSdHA4gp5RNfrUV2K0YPRvHC93VxgX3JLq4KpgEGMdkS1/oyXztPyc8uNd1nG
PLQ1xPcGG+p2921JqCkiZjJzF/pF0RvqosujKlbvM1Jsp7urzVEjq6zg5D9o6t7H
Kvxt/QP5xx3aWBvxSi9l
=2AJr
-----END PGP SIGNATURE-----

--bWTBxx0QKOXH2iZ2--
