Return-Path: <andrea.adami@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 350BE71A32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 08:09:47 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id u62so623922lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 01:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cmGPLeEFC4UU1ftgk/DQ780rW0uGmo9yeNEnidz7qHU=;
	b=bPU+Pm2ZJXBKiweYqYyXwAy+j+efYXFm7XMsRxeqlhnX/HSM8FLrMzJaituHRecOvo
	HzzMoya/FfUPSlrXopP9P03trbF6N63/9WVdyBIYuM2o834eUA5EhSvnJheFazQ23eVf
	hwBxeZ1/ZBM3TW+wqJeVtaf5UerDJ9V08LfWyi3GjufqF584dDMNY9mCy9gbPyCc3x6m
	y58Tnlt3bA1rhRn33dIogtqm7JVjQsK14XJ6J6SQxwg1dWoGwU8rRGScGl/JE8bfoCQV
	/GsCVXWtjM7r2l4p5o2tl9B7iN4VjcgtFB6YCBfXdnDN3Q4H3yY3Ed6X8A8A5jFbgzI1
	G/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cmGPLeEFC4UU1ftgk/DQ780rW0uGmo9yeNEnidz7qHU=;
	b=RTXjUQsQEpBq1cTznnvhRXul4XJL7oMmc1MlAMvqZcVFKpS/i1r9g2CUS0JXGOivFs
	lI89cg833uDCnxYBA4yPLRaF3nTpzuAquA0hezzktb4Ow50Uyd4cC08kdb0wmggw57bb
	re5Geomso9goDfjUDKXF9Amu7VcNaZn82yV8R3JEjTUGzMt4TxETx2eZWr2M23vAlygN
	OzM7OGleC6hAYo6Qkw593T19upad79KUisGycZnKeHz7hDyN9qOTOpgxCLOnh6PEecqU
	zG1zYkWm7nw+t13gnE4RRcl3Jwr5RdkXoNbfsWB/s1dIEgQRmdvWk140RVNLm/dPPSWT
	mL+A==
X-Gm-Message-State: AKS2vOwSAOXf1kuWGhUX+avCdkvtHMam08Kt0V+P0xP3DueSGDo9YMf2
	kUI833csRLNGcLFy9BvQ4NEsPSli1g==
X-Received: by 10.80.160.231 with SMTP id 94mr2574678edo.173.1497514188476;
	Thu, 15 Jun 2017 01:09:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.172.100 with HTTP; Thu, 15 Jun 2017 01:09:48 -0700 (PDT)
In-Reply-To: <CF0C948DE8E2634BB64BF489FF9EF7E7CD0723@PGSMSX105.gar.corp.intel.com>
References: <1497481558-144957-1-git-send-email-yin.thong.choong@intel.com>
	<1497481558-144957-2-git-send-email-yin.thong.choong@intel.com>
	<CAAQYJAurJSt2HCD4jcDzctbNtx8MiqU16g0EGPnDh4TTSY2XYQ@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CD0723@PGSMSX105.gar.corp.intel.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 15 Jun 2017 10:09:48 +0200
Message-ID: <CAAQYJAvrVsjFjDUa_UfS7MWTvoUTn4xFC8mrkOH-cJ8emmTifQ@mail.gmail.com>
To: "Choong, Yin Thong" <yin.thong.choong@intel.com>
Cc: "otc-pg-team@eclists.intel.com" <otc-pg-team@eclists.intel.com>, "Eggleton,
	Paul" <paul.eggleton@intel.com>, "Wold, Saul" <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] image_types.bbclass: Added default argument for ubi and ubifs image creation
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
X-List-Received-Date: Thu, 15 Jun 2017 08:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 9:52 AM, Choong, Yin Thong
<yin.thong.choong@intel.com> wrote:
> I get the information thru the official ubi and ubifs website. http://www=
.linux-mtd.infradead.org/faq/ubifs.html
> Besides I also tested with core-image-sato-sdk build which required more =
-c maximum size to create the image. If the configuration size is no suffic=
ient error will highlight and build fail.
>
> Default -c is 2047. If build core-image-sato-sdk. -c parameter has to be =
increased to 8749 which will be highlight on the build error.
>
> Thanks and Regards
> Choong YinThong
>
> -----Original Message-----
> From: Andrea Adami [mailto:andrea.adami@gmail.com]
> Sent: Thursday, June 15, 2017 3:20 PM
> To: Choong, Yin Thong <yin.thong.choong@intel.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>; otc-pg-team@eclis=
ts.intel.com; Eggleton, Paul <paul.eggleton@intel.com>; Wold, Saul <saul.wo=
ld@intel.com>
> Subject: Re: [OE-core] [PATCH v2] image_types.bbclass: Added default argu=
ment for ubi and ubifs image creation
>
> On Thu, Jun 15, 2017 at 1:05 AM,  <yin.thong.choong@intel.com> wrote:
>> From: Choong YinThong <yin.thong.choong@intel.com>
>>
>> Added default argument for ubi and ubifs image creation.
>
> Hello,
>
> Is it better to error out *before* ot to create an *invalid* image?
> How can you guess such defaults?
>
> Cheers
> Andrea
>
>
>
>> MKUBIFS_ARGS and UBINIZE_ARGS both argument still able to edit in
>> local.conf
>>
>> [YOCTO #11589]
>>
>> Signed-off-by: Choong YinThong <yin.thong.choong@intel.com>
>> ---
>>  meta/classes/image_types.bbclass | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes/image_types.bbclass
>> b/meta/classes/image_types.bbclass
>> index 7749b00..bbde08d 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -292,3 +292,12 @@ IMAGE_EXTENSION_live =3D "hddimg iso"
>>  # The IMAGE_TYPES_MASKED variable will be used to mask out from the
>> IMAGE_FSTYPES,  # images that will not be built at do_rootfs time: vmdk,=
 vdi, qcow2, hdddirect, hddimg, iso, etc.
>>  IMAGE_TYPES_MASKED ?=3D ""
>> +
>> +# Default argument to create ubi and ubifs image with
>> +core-image-sato-sdk
>> +(http://www.linux-mtd.infradead.org/faq/ubifs.html)
>> +# -m 2048: tells mkfs.ubifs that the minimum input/output unit size
>> +of the flash this UBIFS image is created for is 2048 bytes (NAND page
>> +in this case); # -e 129024: logical eraseblock size of the UBI volume t=
his image is created for; # -c 8749: specifies maximum file-system size in =
logical eraseblocks; this means that it will be possible to use the resulti=
ng file-system on volumes up to this size (less or equivalent); so in this =
particular case, the resulting FS may be put on volumes up to about 251MiB =
(129024 multiplied by 2047); See this section for more details.
>> +# -p 128KiB: tells ubinize that physical eraseblock size of the flash
>> +chip the UBI image is created for is 128KiB (128 * 1024 bytes); # -s 51=
2: tells ubinize that the flash supports sub-pages and sub-page size is 512=
 bytes; ubinize will take this into account and put the VID header to the s=
ame NAND page as the EC header.
>> +MKUBIFS_ARGS ??=3D " -m 2048 -e 129024 -c 8749 "
>> +UBINIZE_ARGS ??=3D " -p 128KiB -m 2048 -s 512 "

Hello,

the linux-mtd faq starts with "The below example... " it's just this,
an example.

I am building ubi/ubifs images since some years and basically each
device needs to customize that in a config file:
My examples:

# UBI: max collie (14.125 =3D 113 PEBs)
# 14.125 x 1024 : 128 =3D 113 PEBs
MKUBIFS_ARGS =3D "-m 1 -e 130944 -c 113 -x zlib"
UBINIZE_ARGS =3D "-m 1 -p 131072"

# UBI: max akita (128-7 MiB =3D 968 PEBs)
# 121 x 1024 : 128 =3D 968 PEBs
MKUBIFS_ARGS =3D "-m 2048 -e 129024 -c 968 -x zlib"
UBINIZE_ARGS =3D "-m 2048 -p 131072 -s 512"

# UBI: max c7x0 (128-7 MiB =3D 7744 PEBs)
# 121 x 1024 : 16 =3D 7744 PEBs
MKUBIFS_ARGS =3D "-m 512 -e 15872 -c 7744 -x zlib"
UBINIZE_ARGS =3D "-m 512 -p 16384 -s 256"

# UBI: max poodle (64-7 MiB =3D 3648 PEBs)
# 57 x 1024 : 16 =3D 3648 PEBs
MKUBIFS_ARGS =3D "-m 512 -e 15872 -c 3648 -x zlib"
UBINIZE_ARGS =3D "-m 512 -p 16384 -s 256"

What I am saying is that with the 'defaults' you obtain almost surely
an unbootable image....
I'd prefer a prompt about the missing settings.

My 2 cents

Andrea

P.S.
There is one more issue since some time:
I use IMAGE_FSTYPES ?=3D "tar.gz jffs2 jffs2.sum ubi ubifs"

if the ubi image fails then bitbake aborts and the other valid rootfs
(tar.gx, jffs2,...) are not created
This happens with the first device above, having only 113 PEBs

Worth to check and maybe fire a bug.


>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

