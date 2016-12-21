Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 39007772D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:28:11 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c47so205687866qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=URSNuQd2Qel3/kOeFDCkynKA99xsYw94/lZZ40lUfz8=;
	b=BMrQebZ7OL08HVdZNZYhR5TD+Rs8Li2VU4Mg1tvE7CYElI/nQfKKTTr6g81kCrGbBF
	p36kLChuWcouPgZL+kZTFjlSX5jskUVHyA5bX5AgRRFzFU1IAw4Ph51aXSPGCNT7Z/2y
	KG7AFMtDUJLA3H0TxUUwACBJPX0gjneiBSikfHYqce7lPbRdqarxPLDfoITDMmqlK2xz
	1gnChFniP8cTCrovRTshicVJbcixh8odLbPXr/yJJ+vnvX8VqM8C9bFD0yLp1xz5nTEx
	bRSsgEa3R10Iv2HIT5/o2tveCFKuW0h6hNzrC+a0JUBX+hn4r3LKnc/fFuoe4IBAeI4b
	ZM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=URSNuQd2Qel3/kOeFDCkynKA99xsYw94/lZZ40lUfz8=;
	b=XoAclCjvSW8xRMlWhvXndXLSpOt5FVxNLPFci9joCv4aQwhkFp+uaAlkeJtH6etRGf
	3jSfoPfs+R/l228ybyf9sPDwKa55arQQ0RE/K8sQTBBe6DzAJoNM1FRXvVCu0HxFQm+Q
	/VqO85+dybNAcdIEdnXfq0lWFKpk4gmWYP4ER7BgLTfD25Fa3n4zA/vIp4N6jAORcczs
	YFyZQXjbvQ7fNuxh7cWfgqy5eb2yX9d61iotrZLhQqSfOvQwAchwVLpnXOY1Pp1Ai47f
	gt/m2pxU+1vY0CB8Dnyk2BcVZlbOeBjSUzDhj+8TjsuJ5lvy7xbL2rX1eQ4w59JuTdCp
	zang==
X-Gm-Message-State: AIkVDXKaaKwv/RgVf3qwuTBDBgYEvQCK7GiOXN1jzZstaBN8lwT9nNQ+9eaCBO5mQ/E+fBmL3En6E81yhmaXU6t0
X-Received: by 10.200.49.43 with SMTP id g40mr1849826qtb.188.1482326892321;
	Wed, 21 Dec 2016 05:28:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 21 Dec 2016 05:27:51 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Dec 2016 13:27:51 +0000
Message-ID: <CAJTo0LaRcmKATHBTRzosaFGAOLGc6R_1ioZfGbr4CU_7zShN4A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Broadcom firmware alternatives
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
X-List-Received-Date: Wed, 21 Dec 2016 13:28:12 -0000
Content-Type: multipart/alternative; boundary=001a1137b198dbc6bf05442b1f60

--001a1137b198dbc6bf05442b1f60
Content-Type: text/plain; charset=UTF-8

Hi,

So /lib/firmware/brcm/brcmfmac-sdio.bin is an alternative with five
possibilities:

/lib/firmware/brcm/brcmfmac4330-sdio.bin 10
/lib/firmware/brcm/brcmfmac4329-sdio.bin 10
/lib/firmware/brcm/brcmfmac4334-sdio.bin 10
/lib/firmware/brcm/brcmfmac4339-sdio.bin 20
/lib/firmware/brcm/brcmfmac43340-sdio.bin 10
/lib/firmware/brcm/brcmfmac43430-sdio.bin 10

Note that they're all the same priority, so the choice of what goes into
the rootfs is effectively random.

From reading the internet it looks like this alternative was only required
for kernels older than 3.13, so can we just remove this alternative now?

Ross

--001a1137b198dbc6bf05442b1f60
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>So=C2=A0/lib/firmware/brcm/brcmfmac=
-sdio.bin is an alternative with five possibilities:</div><div><br></div><d=
iv><div>/lib/firmware/brcm/brcmfmac4330-sdio.bin 10</div><div>/lib/firmware=
/brcm/brcmfmac4329-sdio.bin 10</div><div>/lib/firmware/brcm/brcmfmac4334-sd=
io.bin 10</div><div>/lib/firmware/brcm/brcmfmac4339-sdio.bin 20</div><div>/=
lib/firmware/brcm/brcmfmac43340-sdio.bin 10</div><div>/lib/firmware/brcm/br=
cmfmac43430-sdio.bin 10</div></div><div><br></div><div>Note that they&#39;r=
e all the same priority, so the choice of what goes into the rootfs is effe=
ctively random.</div><div><br></div><div>From reading the internet it looks=
 like this alternative was only required for kernels older than 3.13, so ca=
n we just remove this alternative now?</div><div><br></div><div>Ross</div><=
/div>

--001a1137b198dbc6bf05442b1f60--
