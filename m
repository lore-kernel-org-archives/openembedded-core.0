Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4D39F6F66B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 17:45:20 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id e16so1561411qcx.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gbLUtOdcJv4vAKvKYQJp/mbajkPolCREm9JkZf5BEng=;
	b=b451ro4xWQvPOkb5hpQ1K4z2mp2q1mPBxeDj9MKpyU5PxeW+yRLcVjSFhs/Mi9vK6h
	mkDKmMPse1kdR1wPZ/B+c7Rh/KYRCEMIPcOIaeS0e/1eBjq6Pas1mmFEiG84Cp+vJSMU
	iXnks1CVBg/fxnOfnAlEgrqm4+tu2DCN4un61T4INw2jJv1p2ER+hW8TZkqPSVAvXSBX
	xTpXHp1/nh7qM/CS0cXT/abjTAh5mgxok2s9gbJ4xTl9iSf/T07cLkJ9aG9XR6YBm6Vt
	LMxsvhoiRdTpdoD+QQmS3zryPz+SyNm+9Aat6N/KDiW5RvceAQeJNwG3E5aCzkGr1vFe
	VeQg==
X-Gm-Message-State: ALoCoQlYSW08E3mBUvPsgt1kFscp81/3+L1CoACfi0SXhIw8/8geLsrt2ZrqzgXCQo4kauDdxpK2
X-Received: by 10.140.106.195 with SMTP id e61mr3915824qgf.66.1394732721521;
	Thu, 13 Mar 2014 10:45:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 13 Mar 2014 10:45:01 -0700 (PDT)
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Mar 2014 17:45:01 +0000
Message-ID: <CAJTo0LZPGDftsVZD0NQKSWYD9BnKkMOrdTGUOKnQ2bVY+b-jwg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6 V3] refactor the archiver*.bbclass
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
X-List-Received-Date: Thu, 13 Mar 2014 17:45:24 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
> Robert Yang (6):
>   classes/archive*.bbclass: remove archive-*-source.bbclass
>   archiver.bbclass: refactor it
>   package_rpm.bbclass: archive the source to srpm package
>   archiver.bbclass: move a few code to copyleft_compliance.bbclass
>   local.conf.sample.extended: update for the archiver
>   patch.bbclass: do_patch: unset TMPDIR from environment

This series appears to work for me and doesn't cause rebuilds (after
removing the patch change, as that obviously does).  Can anyone else
who actively uses the archiver verify that it still works for them?

Cheers,
Ross

