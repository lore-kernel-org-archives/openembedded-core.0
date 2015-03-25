Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 212BE723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 14:32:21 +0000 (UTC)
Received: by pacwe9 with SMTP id we9so30791335pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=gPiZTJoiapcRj2UKjorwNv4H1bY59H30bQOnYr/XBz0=;
	b=On62nYpv95/Yli0K3saHCDICOtaBKm3Tg+f2VYXdoPJq5/wG9m2iUU0wq0MypLCwPv
	Y9tvif8FQsRtDBU+8ryHRn1azMvIc0IfUqzL0Nmkw19HQY5s7kJS1/r48fGqESagNz8O
	mE26AvK6cCCz8GA0Y7c1r43ijSdV7oMDvHY9nb29ocoGo31AtYx8SvjuGF+uJbf6Ni4e
	QEqN9XZBYJEDT/BXo1igQFP+ChZ6byU3u1bJjIVD4boKaFTIeha4ZOyecHtrBRy5RPbg
	BbKFoApqWdNqZ7CPHvwbH2Fv0Ud6JDThDb69lK1MNXLtgdSn70aEK2s4+NECmlRneMFr
	aN1Q==
X-Received: by 10.70.26.100 with SMTP id k4mr17533749pdg.125.1427293942905;
	Wed, 25 Mar 2015 07:32:22 -0700 (PDT)
Received: from Akusters-laptop-2.local ([12.104.145.3])
	by mx.google.com with ESMTPSA id qd6sm2673087pdb.89.2015.03.25.07.32.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 07:32:21 -0700 (PDT)
Message-ID: <5512C6F4.5050806@gmail.com>
Date: Wed, 25 Mar 2015 07:32:20 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1427289343-9625-1-git-send-email-brendan.le.foll@intel.com>
In-Reply-To: <1427289343-9625-1-git-send-email-brendan.le.foll@intel.com>
Subject: Re: [PATCH][dizzy] Update openssl to 1.0.1m
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
X-List-Received-Date: Wed, 25 Mar 2015 14:32:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 3/25/15 6:15 AM, brendan.le.foll@intel.com wrote:

Thank you for your support on Dizzy.

If it isn't too mush trouble,  is it possible to get the  CVE's list are
are being addressed by this update?

regards,
Armin

> From: Brendan Le Foll <brendan.le.foll@intel.com>
>
> Due to recent security fixes it's advisable to update to the latest openssl
> version. I propose an update to 1.0.1m rather than simply patching the
> individual CVEs which is much more time consuming/error prone
>
> This is exactly the same patch as for daisy since they share openssl version/patches
>
> Brendan Le Foll (1):
>   openssl: Upgrade to 1.0.1m
>
>  .../openssl/openssl/configure-targets.patch        | 28 +++----
>  .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch | 17 +++--
>  .../openssl/openssl/initial-aarch64-bits.patch     | 87 ++++++++++++++--------
>  ...-pointer-dereference-in-EVP_DigestInit_ex.patch | 19 +++--
>  ...NULL-pointer-dereference-in-dh_pub_encode.patch | 39 ----------
>  .../openssl/openssl/openssl_fix_for_x32.patch      | 83 ++++++++-------------
>  .../recipes-connectivity/openssl/openssl_1.0.1j.bb | 57 --------------
>  .../recipes-connectivity/openssl/openssl_1.0.1m.bb | 56 ++++++++++++++
>  8 files changed, 175 insertions(+), 211 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
>  create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.1m.bb
>


