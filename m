Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8CA77DCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 15:09:17 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id 31so21090420qtz.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8emFtywt7DtMLGoDs+Q33wG2M1NKwPqBk5LzM+XpgG4=;
	b=jIpDxtD15vw1BM/TITe0jcCjGk0y5qLNL+NLYG9+O+gN6BtKV9S8FJ+EcHb/YEIPqA
	FhTXGe+kqGX++zXOaj2x48dJLLocy5tzrYthduwPYHeE2ju1nnbKYTn4IVdyMhfzmDkW
	8CFb2kJU1x+b6ITFx0Tg1gGxWE1hDLyV3JjIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8emFtywt7DtMLGoDs+Q33wG2M1NKwPqBk5LzM+XpgG4=;
	b=RP1ABhLghMolMxqju6VU5XkSBJONUFaSk88ZKF4C3F/2SGAgIt5mOCdlaO42LT3RQ4
	MzvdIMNfgux6TIMKxhzynjxZg5gfUuwn3kxbf//eExGuVe/J8soU0Fvfm6F3eqqyTYm8
	s3IMtw7l3d8zp50rMq2kwZ539ZG1hEz0CJZXhWPITGUgblzi/ECDnvtK0kDuAIYKEXCE
	wb2hT+sYPgfVI9NBiHN7LaozsrQr2cay2Z5eWTPUI2AVO+0vfWyuzV91zRodHK4s4KkU
	80T4DsUW7ub2Qdc8Ls4PoaAaY/JcKSN1+gA/80rg9xTYf8AFNmt8wglNCLsoi6Va8aa1
	dqhw==
X-Gm-Message-State: AMCzsaW9AB4jNWav99+rl98TvcVyq9ZYijYbh7gaaN+UOJUc0LSyynJ4
	wg2h1s/YEX1e2aiFVem24bj+a9I31EnQpqKvafsUisin
X-Google-Smtp-Source: ABhQp+RXJiBtYOtNYH7dIOk8P+Uk18SDvR1XKhQ10U+IB49gwh2nEzDXOrewV6HSPe+FCwJZ2jxkLfuWSPwzbe1gvSY=
X-Received: by 10.237.59.7 with SMTP id p7mr3099619qte.3.1509462559012; Tue,
	31 Oct 2017 08:09:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.81.81 with HTTP; Tue, 31 Oct 2017 08:08:58 -0700 (PDT)
In-Reply-To: <20171031133324.5hdzhtu7kop7um4b@linux.intel.com>
References: <123c3e3f-4ba4-43f6-957f-530a69e81712@madrzak.eu>
	<20171031133324.5hdzhtu7kop7um4b@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 31 Oct 2017 16:08:58 +0100
Message-ID: <CAP71WjxBNTEfCAN18T86fDY9nu=B50Sta69vwEsh85Fi1OPMDA@mail.gmail.com>
To: ed.bartosh@linux.intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: add 'part-name' argument for naming GPT partitions
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
X-List-Received-Date: Tue, 31 Oct 2017 15:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2017 at 2:33 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wr=
ote:
>
> On Mon, Oct 30, 2017 at 08:53:09PM +0100, Artur M=C4=85drzak wrote:
> > The WIC's 'part' can now give a name for GPT partition in WKS file.
> > It's similar to '--label', but is naming partitions instead file system=
s.
> > It's required by some bootloaders to partitions have specified names.
> >
>
> Thank you for the patch!
>
> +1

Yes, +1 from me as well. The context of this patch is for the Qualcomm
SoC based board that have *interesting* bootloaders requirements, one
of them being to look for partition by their names.

Patchwork complained about the patch, so Artur, please address these
comments and resend the patch.

Ed: do you think this can be backported to previous release branches?
The lack of --part-name on previous releases make WIC unusable for us.
The backport is not trivial since many changes have happened, but
Artur has a equivalent patch for morty at least.


>
>
> > Signed-off-by: Artur M=C4=85drzak <artur@madrzak.eu>
> > ---
> >  scripts/lib/wic/help.py                  |  2 ++
> >  scripts/lib/wic/ksparser.py              |  1 +
> >  scripts/lib/wic/partition.py             |  1 +
> >  scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
> >  4 files changed, 15 insertions(+)
> >
> > diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> > index bd9c62e2e8..2ac45e052e 100644
> > --- a/scripts/lib/wic/help.py
> > +++ b/scripts/lib/wic/help.py
> > @@ -970,6 +970,8 @@ DESCRIPTION
> >                              This option cannot be used with --fixed-si=
ze
> >                              option.
> >
> > +         --part-name: This option is specific to wic. It specifies nam=
e for
> > GPT partitions.
> > +
> >           --part-type: This option is specific to wic. It specifies
> > partition
> >                        type GUID for GPT partitions.
> >                        List of partition type GUIDS can be found here:
> > diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> > index 99b66eebc5..7850e81d2f 100644
> > --- a/scripts/lib/wic/ksparser.py
> > +++ b/scripts/lib/wic/ksparser.py
> > @@ -144,6 +144,7 @@ class KickStart():
> >          part.add_argument('--no-table', action=3D'store_true')
> >          part.add_argument('--ondisk', '--ondrive', dest=3D'disk',
> > default=3D'sda')
> >          part.add_argument("--overhead-factor", type=3Doverheadtype)
> > +        part.add_argument('--part-name')
> >          part.add_argument('--part-type')
> >          part.add_argument('--rootfs-dir')
> >
> > diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.p=
y
> > index b623bb9e6d..66e61ba70c 100644
> > --- a/scripts/lib/wic/partition.py
> > +++ b/scripts/lib/wic/partition.py
> > @@ -51,6 +51,7 @@ class Partition():
> >          self.no_table =3D args.no_table
> >          self.num =3D None
> >          self.overhead_factor =3D args.overhead_factor
> > +        self.part_name =3D args.part_name
> >          self.part_type =3D args.part_type
> >          self.rootfs_dir =3D args.rootfs_dir
> >          self.size =3D args.size
> > diff --git a/scripts/lib/wic/plugins/imager/direct.py
> > b/scripts/lib/wic/plugins/imager/direct.py
> > index 60317eed22..bdb8385620 100644
> > --- a/scripts/lib/wic/plugins/imager/direct.py
> > +++ b/scripts/lib/wic/plugins/imager/direct.py
> > @@ -366,6 +366,10 @@ class PartitionedImage():
> >          for num in range(len(self.partitions)):
> >              part =3D self.partitions[num]
> >
> > +            if self.ptable_format =3D=3D 'msdos' and part.part_name:
> > +                raise WicError("setting custom partition name is not "=
 \
> > +                               "implemented for msdos partitions")
> > +
> >              if self.ptable_format =3D=3D 'msdos' and part.part_type:
> >                  # The --part-type can also be implemented for MBR
> > partitions,
> >                  # in which case it would map to the 1-byte "partition =
type"
> > @@ -519,6 +523,13 @@ class PartitionedImage():
> >              self._create_partition(self.path, part.type,
> >                                     parted_fs_type, part.start,
> > part.size_sec)
> >
> > +            if part.part_name:
> > +                logger.debug("partition %d: set name to %s",
> > +                             part.num, part.part_name)
> > +                exec_native_cmd("sgdisk --change-name=3D%d:%s %s" % \
> > +                                         (part.num, part.part_name,
> > +                                          self.path), self.native_sysr=
oot)
> > +
> >              if part.part_type:
> >                  logger.debug("partition %d: set type UID to %s",
> >                               part.num, part.part_type)
> > --
> > 2.13.6
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> --
> Regards,
> Ed
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

