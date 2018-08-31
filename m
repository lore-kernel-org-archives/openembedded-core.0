Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 24205795B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:52:30 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id p206-v6so5053192ywg.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hGqQFa5DhnbYBC/zjK1p90KqksqW9vztZPelOEOnhsM=;
	b=qmEgFfpJV8R+Z2ohKT7wiMVfJ7rw9u1RkdPT62sPjthyeXOTl5q373/TBOc5nSYpnt
	DJrpphMbdEO/8xdQz3cLt/sBlWgEo4iU32AZHvr9JHaWdpzabmKKpNHicUStCvxDwXiX
	wi7VaVwUzqlVCgrwu/siMZQZRCSbhTpZAhWBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hGqQFa5DhnbYBC/zjK1p90KqksqW9vztZPelOEOnhsM=;
	b=dpXkv48UDjFA4zbHTd60+LaGbQ9NjnYJzxk2BLDM9TyO0wxJuVMV0H8CDM3Hy2EURl
	E8/ZiqYkdKqkTbYVkfnaugt56lYf+QP87lb0li9+FBkDIP10gKASpbYmXBI2Cb3pngEF
	pc+I9tjvXMWWjf2BhJiom/iFwJr0NzYPLmIc/3noN01RvOejk0TGDWAtDztUCiVF/2c1
	7Mrktq2Adr5cq+jxXAdDlgpFJZ5PrStCmNCtqGi+eUa42Bl+cCm5AUWFguX5FIarBm+s
	In3eDXMP6M00uu/3bg8h1qc32zIPrIhodBb+v4nFCG7QMCY1wvruKN3OFal0zK77C0zI
	NFMg==
X-Gm-Message-State: APzg51BG5ckLCdh3GVMv5Xpf5F/2awaGLF29JMSWfYgmChQ1yXjSAMHe
	CggrG0idrXzaYNis0ux/6OPgJw==
X-Google-Smtp-Source: ANB0VdYABVPHYbmjWBuo7YjeznopL2Vmv1Bwx0EbBIZArtf3RfuTyR9zNJbIN1UtFKAFSMPJrpsBfQ==
X-Received: by 2002:a81:3a48:: with SMTP id h69-v6mr816514ywa.6.1535723551803; 
	Fri, 31 Aug 2018 06:52:31 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	t2-v6sm14662109ywd.99.2018.08.31.06.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:52:30 -0700 (PDT)
Date: Fri, 31 Aug 2018 09:52:28 -0400
From: Tom Rini <trini@konsulko.com>
To: Jiang Lu <lu.jiang@windriver.com>
Message-ID: <20180831135228.GN26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-7-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1535681710-29461-7-git-send-email-lu.jiang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] wic:bootimg-efi:try other place for efi
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
X-List-Received-Date: Fri, 31 Aug 2018 13:52:31 -0000
X-Groupsio-MsgNum: 115694
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+vRq5lKQn39NaQ8P"
Content-Disposition: inline

--+vRq5lKQn39NaQ8P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 10:15:09AM +0800, Jiang Lu wrote:

> When there is no useful efi in $kerneldir, try copy
> all efi from EFI/BOOT into boot image.
>=20
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  .../wic/files/wic/plugins/source/bootimg-efi.py              | 12 ++++++=
++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-ef=
i.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> index 0eb86a0..d435268 100644
> --- a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> +++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> @@ -231,6 +231,18 @@ class BootimgEFIPlugin(SourcePlugin):
>              else:
>                  raise WicError("unrecognized bootimg-efi loader: %s" %
>                                 source_params['loader'])
> +            os.listdir("%s/EFI/BOOT/" % hdddir)
> +            found_efi =3D False
> +            for x in os.listdir("%s/EFI/BOOT/" % hdddir) :
> +                if x.endswith(".efi"):
> +                    found_efi =3D True
> +                    break;
> +            if not found_efi:
> +                cp_cmd =3D "cp %s/EFI/BOOT/*.efi %s/EFI/BOOT/" % (kernel=
_dir, hdddir)
> +                try:
> +                    exec_cmd(cp_cmd, True)
> +                except:
> +                    pass
>          except KeyError:
>              raise WicError("bootimg-efi requires a loader, none specifie=
d")

I'm not sure this is the right approach.  If you don't have things set
up for automagic finding you should use bootimg-partition and
IMAGE_BOOT_FILES.  I'm doing this right now for some EFI projects
because it's also bad form to dump everything into EFI/BOOT and some
things should end up in EFI/vendorname or similar.

--=20
Tom

--+vRq5lKQn39NaQ8P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbiUgcAAoJEIf59jXTHXZSm7IP/jkNHBthsIXHf2bFg/B6m+Ni
QR4GJB8O0BT91JPfNJO02WNS48pGTl0NelRGNRfpcZecRRmvRPCy7nhMelonrjNv
3AY2Z9CWgWQOWCJeOsPw8nJgHW0cLcHH+PRoNAfQlWBB/BJ4CC7u3hS0170gTYts
4pUmCzsXobFtmIB8JPfsfugdI5LiG65v0f8gGE5p6vPFMxYfTt0EAZ2SJPzNYmx9
+AVM3CLtvyR4AVo6xtvNzKGqh8ruUJyglFi+eUlPukw778GjGZDZgCprsgMY1NpU
Px0vguINkSotEp8JbGv+hpvkySxY6diVKfubJt4rti5Ag+y3DAXiOLuXJern9d3F
skZ4ku6YYod/EWwZs7PAH0qRrT9KRC0GH9Sm6L7lSs6Stpdb7CZk0Al+6Uz79tZl
F/afrl4FJ8ir+lYhKaiy61P7wju9ssLHKt9TMns9eY+RJ0klCvtEiWlI9ONwneyP
HipCjCfrZu0sxn0oqn47VC/pkNQ2WSX71dT7PTkpVSLMpsO5VPAKSSY5ezG+Dm/X
AKD1FXGLgr7amk+PDKmARS5rSTBRqHdZApiCR9vlNwoE+/+azwV6+FH3rU+ekPvH
q4uTDGjC5gGickaZeJwXa0IEdn+k96dopZFyULitqUSlraWjMpSSbb1Wu5ml411F
KVJ4R+5su/FKgIbi13fX
=DT2P
-----END PGP SIGNATURE-----

--+vRq5lKQn39NaQ8P--
