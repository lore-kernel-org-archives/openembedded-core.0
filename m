Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 11C557E7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 18:56:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TZ1X3XMWz2M;
	Wed, 19 Jun 2019 20:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560970608;
	bh=uzlS1rz1z5oBOFLZYl5rD5FpPa3kVfJUDxmZB8EL5j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9B2NB5o7Cbj4OkyRhfw3YJarhD3UQd70MAtdztShO+bF0z6Fczq03nyY9Eyushec
	YQ0Wm8TfsaO6LQ0MBOmKFjLOjY/B1t//n7/K6sCbWjaL1XQAcWXctsj6QPWc8bVuQ6
	lKqqvLKlNJq8DOB4TkD1ehoNykouy7IWGtrNt+znGi20ip82atxTe+ewFwYUes+Blj
	Cjs9arNPmL444AIEPNLNAg+Ofhj5sah9p0QBpP2Nq0T3KIrHCF3S9BnUaj8eKr2/CQ
	ZF6R+uodSbWxkdr2DivLSAfWt1XoOPx4An01dv+xn5AAZcoca6Ji6YFgJJG8H7sjkJ
	Oh/XputUyq7ZI8+p73uuWwTeTU1R1zl+E5FQguWZ7hcaRiNSjE6jFAIqt/v+6vGNtY
	w74C1T1QHsG0EtNrALZQciqvdQIfnaL5t1BP0CBIElg21DV8P0BjuIMP93PYr5ai90
	KbpLH1tUfLAVkj7M1t9UFrMYEdAMeqMkLFOgTvScUUXL4VMyg2Csv1Pxc19LsPSV1g
	8TWXaBLo75S7ogaQ6XcXo3dlIaoaoeqHsDFb6R+8BClDPLzQ926jmvlTIGt1FG/k2w
	Vu+L8BQ/3ASAkL1DRMzMEi/+338cbRftFr1tf3x5wqDwSXna5Buue8LA6cezd1krna
	gobs2bF0H+0A02nBpcmYo4WA=
Date: Wed, 19 Jun 2019 21:56:46 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190619185646.GB4497@localhost>
References: <20190619180422.31204-1-bunk@stusta.de>
	<728b6a5f-cc41-3127-4f22-c9bd241208e0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <728b6a5f-cc41-3127-4f22-c9bd241208e0@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] wpa-supplicant: Fix CVE-2019-9494 CVE-2019-9495 CVE-2019-9496 CVE-2019-9497 CVE-2019-9498 CVE-2019-9499 CVE-2019-11555
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
X-List-Received-Date: Wed, 19 Jun 2019 18:56:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 19, 2019 at 11:30:59AM -0700, akuster808 wrote:
> 
> 
> On 6/19/19 11:04 AM, Adrian Bunk wrote:
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  ...erver-Fix-reassembly-buffer-handling.patch |  48 +++
> >  ...tant-time-operations-for-private-big.patch |  97 +++++
> >  ...nctions-for-constant-time-operations.patch | 222 ++++++++++++
> >  ...-peer-Fix-reassembly-buffer-handling.patch |  48 +++
> >  ...tant-time-selection-for-crypto_bignu.patch |  64 ++++
> >  ...tant-time-and-memory-access-for-find.patch | 327 +++++++++++++++++
> >  ...timing-differences-in-PWE-derivation.patch | 244 +++++++++++++
> >  ...anches-in-is_quadratic_residue_blind.patch | 147 ++++++++
> >  ...-Mask-timing-of-MODP-groups-22-23-24.patch | 121 +++++++
> >  ...-const_time-selection-for-PWE-in-FFC.patch | 108 ++++++
> >  ...-time-operations-in-sae_test_pwd_see.patch | 139 ++++++++
> >  ...rm-message-validation-in-error-cases.patch |  60 ++++
> >  ...r-Verify-received-scalar-and-element.patch |  61 ++++
> >  ...pwd-server-Detect-reflection-attacks.patch |  48 +++
> >  ...t-Verify-received-scalar-and-element.patch |  61 ++++
> >  ...k-element-x-y-coordinates-explicitly.patch | 335 ++++++++++++++++++
> >  .../wpa-supplicant/wpa-supplicant_2.7.bb      |  16 +
> >  17 files changed, 2146 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-server-Fix-reassembly-buffer-handling.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-OpenSSL-Use-constant-time-operations-for-private-big.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Add-helper-functions-for-constant-time-operations.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-reassembly-buffer-handling.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-OpenSSL-Use-constant-time-selection-for-crypto_bignu.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-Use-constant-time-and-memory-access-for-find.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-SAE-Minimize-timing-differences-in-PWE-derivation.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0006-SAE-Avoid-branches-in-is_quadratic_residue_blind.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0007-SAE-Mask-timing-of-MODP-groups-22-23-24.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0008-SAE-Use-const_time-selection-for-PWE-in-FFC.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0009-SAE-Use-constant-time-operations-in-sae_test_pwd_see.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0010-SAE-Fix-confirm-message-validation-in-error-cases.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0011-EAP-pwd-server-Verify-received-scalar-and-element.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0012-EAP-pwd-server-Detect-reflection-attacks.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0013-EAP-pwd-client-Verify-received-scalar-and-element.patch
> >  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0014-EAP-pwd-Check-element-x-y-coordinates-explicitly.patch
> 
> A simple "affects: < {version}" help RP and myself from asking if master
> is affected.
> 
> So is this fixed in master?

Sorry for that, yes they are already fixed in master.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


