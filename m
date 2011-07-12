Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QggSd-0007Ze-F9
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 19:09:28 +0200
Received: by pvf24 with SMTP id 24so3896839pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 10:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=kvgx2o+otVUxKGtWCsh3DUiZ2G+R7bMn/zt3574VSkk=;
	b=mTpQ2Vuff3omzbIPFh9wNzs9MG1bbXXlw2e2FFeMLHJ51uDMhYSF2ndMiwHmSb4XKv
	14fu+zgFQyBWokmCKD9HKHRvnW1cVL1c2Qk2TwAGCbGjVscBnjFzjeGLVeoa7uPXSnpE
	oVC/BKoCTI/6rSJzL9qgcGEC6ZAqNECXRrCEE=
MIME-Version: 1.0
Received: by 10.142.142.9 with SMTP id p9mr67039wfd.175.1310490329010; Tue, 12
	Jul 2011 10:05:29 -0700 (PDT)
Received: by 10.142.239.3 with HTTP; Tue, 12 Jul 2011 10:05:28 -0700 (PDT)
In-Reply-To: <1310479486.20015.1056.camel@rex>
References: <cover.1310421821.git.andrea.adami@gmail.com>
	<1310479486.20015.1056.camel@rex>
Date: Tue, 12 Jul 2011 19:05:28 +0200
Message-ID: <CAAQYJAsswgjXmLB+2sd32rcGuh_AmCKmDzu=yRUgT0QbfqOpFQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/2] Embedding initramfs images during kernel build.
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
X-List-Received-Date: Tue, 12 Jul 2011 17:09:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

For some reasons one line has been horribly truncated:

cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$i
^

below the correct line:

kernel_do_configure() {
	yes '' | oe_runmake oldconfig
	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
		for img in cpio.gz cpio.lzo cpio.lzma; do
		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$i=
mg
		fi
		done
	fi


Sorry

Andrea



On Tue, Jul 12, 2011 at 4:04 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-07-12 at 00:33 +0200, Andrea Adami wrote:
>> * Sync with org.openembedded.dev and allow the inclusion of
>> * lzma and xz compressed initramfs images.
>> *
>> * Provide a convenient way to include an initramfs by setting
>> * INITRAMFS_IMAGE =3D "your_initramfs_image.bb"
>> * and specifying the chosen output format in the initramfs image recipe,=
 e.g.
>> * IMAGE_FSTYPES =3D "cpio.gz cpio.lzma"
>>
>> Andrea Adami (2):
>> =A0 kernel.bbclass: handle embedding of initramfs images
>> =A0 image_types.bbclass: support xz compressed initramfs.cpio and
>> =A0 =A0 tarballs
>
> Merged to master, thanks.
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


