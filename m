Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 58B6260119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 17:04:02 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id hh10so3402574pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=H1W2TBwDrT6/NXKdcEZMw7Anu+OXUZ6vbYHEfPSh4WA=;
	b=gB3SZQ6qjKASmkMD3hMJbHaldnzqtBkhqqyxi4f9erOh2/HUv1M/o69qXx2f6A1Tkg
	rQT3bmeETMrAR7MmlwIoZ1Y/hYHkvn6qQW46P6bbR6wTHfyZGty3u8ROjM0+GD6Fp1je
	3psVwc0eiWJp2NQM4ceNlEDWlINCpG/tUymqVDxtv1kUySc0P9Wv78qAUcaF0OS3YOcr
	iV2IU4rWBqoVKSRr7jCGr71E4UTqmV8JCS+U1aN/p1Vv3Yfa4nHETwwgtXc//iErJYu3
	4Evel+Ekjj/vqBQZ+TtPCrGQgYhl+FHcqr3F6J0k2yEM4BRgWiikO4n/iey3IRO0N43T
	RF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=H1W2TBwDrT6/NXKdcEZMw7Anu+OXUZ6vbYHEfPSh4WA=;
	b=gNjPY9K2Y4j/gw7nBGjsjDcbfEHQEMcw2DXancdEGqGX32qtWmYlDi4pe+/m3GqjDq
	TR9Y3n3Y6VWoaWHbTBVBfV+xc2xhYEbf5/dONRNZWX2AeIC9zH9ekMLKniJpekl+84iZ
	M5LFw1zJKjVqfewx8o6RLIuhiPmaZK0W/IcQd04h7aErhtSyKJKo5t4eSmX8XPLd2BhF
	yAAzxqTt4dMycGxnOHjm/dCrE+mBJiWyjeIXBWb0HX/1VHJS3rcEBoZrZcqlvfsE2ptv
	zYXPX/ZDrYeK3lTa6jCr/R5EthheWQdwJ0SvWCDq2JX/o6WU+QtG5P3Ser00u6WBOYhz
	j26A==
X-Gm-Message-State: AE9vXwM2RYi6EEGOrVWKILP4bo7MOzpdgA6ZNiWm3ijUnQO7DchBr9DomKIw31O5R5bbDA==
X-Received: by 10.66.156.226 with SMTP id wh2mr18339999pab.116.1472144642851; 
	Thu, 25 Aug 2016 10:04:02 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:157a:f659:3403:a165?
	([2601:647:4c00:3edf:157a:f659:3403:a165])
	by smtp.gmail.com with ESMTPSA id
	p67sm22240504pfg.22.2016.08.25.10.04.01
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Aug 2016 10:04:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471656521-52469-2-git-send-email-pranav.tipnis@intel.com>
Date: Thu, 25 Aug 2016 10:04:32 -0700
Message-Id: <4A335734-632E-43D0-9D75-DADB5C5FE7F7@gmail.com>
References: <1471656521-52469-1-git-send-email-pranav.tipnis@intel.com>
	<1471656521-52469-2-git-send-email-pranav.tipnis@intel.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
	"Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 1/1] grub-efi.bbclass: Fix path in startup.nsh for iso image.
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
X-List-Received-Date: Thu, 25 Aug 2016 17:04:03 -0000
X-Groupsio-MsgNum: 86305
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9B192ED3-9020-4DCF-87F8-F59EEAB1D2B5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9B192ED3-9020-4DCF-87F8-F59EEAB1D2B5
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Aug 19, 2016, at 6:28 PM, Pranav Tipnis <pranav.tipnis@intel.com> wrote:
> 
> The path in startup.nsh for iso image is corrupted as follows:
> fs0:\EFI\BOOT^Hootx64.efi
> 
> Using printf will emit correct path which is:
> fs0:\EFI\BOOT\bootx64.efi
> 
> This happens because of echo command. Switching to printf
> like the one used in efi_populate() function.

This patch is ok

> 
> Signed-off-by: Pranav Tipnis <pranav.tipnis@intel.com>
> ---
> meta/classes/grub-efi.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index ae8ee38..178d0c8 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -59,7 +59,7 @@ efi_iso_populate() {
> 	cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
> 	cp $iso_dir/vmlinuz ${EFIIMGDIR}
> 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
> -	echo "fs0:${EFIPATH}\\${GRUB_IMAGE}" > ${EFIIMGDIR}/startup.nsh
> +	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" > ${EFIIMGDIR}/startup.nsh
> 	if [ -f "$iso_dir/initrd" ] ; then
> 		cp $iso_dir/initrd ${EFIIMGDIR}
> 	fi
> --
> 1.9.1
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9B192ED3-9020-4DCF-87F8-F59EEAB1D2B5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle/JSEACgkQuwUzVZGdMxTEtQCeNE3SStT3ftOTnHITpFowmQ0R
IgkAn3DxI0s/GZtsjBPKasE2CoIjd0bn
=f0mt
-----END PGP SIGNATURE-----

--Apple-Mail=_9B192ED3-9020-4DCF-87F8-F59EEAB1D2B5--
