Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 12E4A60196
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 09:04:07 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id e16so3299310qcx.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 02:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=n8y5BAYjxKGm3VAORGEbGweRjj1B9QhnrgYUOUNigLk=;
	b=A9YNtsdiSek7gCZDt4xtwxfKeq80lfn4+E/Cr0M9MicHiCVQtKMSg2Y6Ijhbl2G4hm
	i8ipHWAonrpuBwNMHjOg0ZGQEi5nwnNM0yRFlt6S2Cjkznp8LSU9J/+ellk1zBnFSgpj
	Ay5ML7z+xcG2pUAkpCpEYpcwGRSVxkOTfsCPHkSn+lVGNoigk0OLvYZIhUIZdQea2oVh
	o2PpCkLxTdMbyeE4orXZyL8zodJTBZcCR8akSP6q7ZtCpzNkF8vuU/CihOPvML+4MLEB
	NmDtH75vyhpzgls3DoMD4IrdrjZiupuilBoCoP/fFGsoExqHl01QqC4egrwuqOl5bUMX
	t+xw==
X-Gm-Message-State: ALoCoQnauv45j/1zX72V7zFObnyG1zKSiG4M9oWBKYoKtVzbQnKtb67VDLHZZC5JhTX4F2A6hpV3
X-Received: by 10.229.221.194 with SMTP id id2mr28564402qcb.5.1399107848238;
	Sat, 03 May 2014 02:04:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.136 with HTTP; Sat, 3 May 2014 02:03:48 -0700 (PDT)
In-Reply-To: <1399068428.12731.88.camel@ted>
References: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
	<1399066445.12731.86.camel@ted>
	<CANyK_8eUuUqAMf87-pSVdd7X5_BTXOn7iQCdQ0XYyTjxu=PKbA@mail.gmail.com>
	<1399068428.12731.88.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 3 May 2014 10:03:48 +0100
Message-ID: <CAJTo0Lbb_D7+SOMuPE5fKY52mnHuw=s3Y_0LxOzwsQTQcKsYXg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ensuring a task is re-ran when local.conf is updated
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
X-List-Received-Date: Sat, 03 May 2014 09:04:09 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2014 23:07, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> It may well do and I've realised the issue:
>
> codeparser.py:
> class PythonParser():
>     getvars = ("d.getVar", "bb.data.getVar", "data.getVar", "d.appendVar", "d.prependVar")
>
> we probably need to change this to an .endswith(".getVar", ".appendVar",
> ".prependVar") type check...

Could this be the root-cause of so many instances where we've had to
add explicit hints that variables should be added to the hash?

Ross

