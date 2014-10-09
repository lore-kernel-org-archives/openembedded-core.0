Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6016C6FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 15:57:48 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id o8so460014qcw.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 08:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=5HE0kzxXIYuHkoIXg0ul1BUdFBvWvDgdUHmo32Q8CDE=;
	b=MhIrmtoUuk66inKcQVfS28rzVBuHGMAROPc0VmNLLWZfGoECUouh15K2DhCBWI8cq2
	TCoaIJTc+Cq00yq2B/4yVu3uJSEbZwNMvYPU9Oct7mdQyKDfr9vYQt+AF56Yb0qPWPgY
	WIQnRFI/lbwBXQy6TzkDUkEKVsPgq+8wFmBP874MFpXJMJHCjJkLm2g9iLSF+VUeeqRN
	LcF3+V4Cqu9HJYjMlwh2ObY9u3clDRszaBwclqZd0jpVaX2WuWlmvL6Q1wHArsUPWSRW
	2nRCwIUK7Mfswy/NTcCF8aWXyCwi19xjzCcRXewlcVHfIJsU/amoTI3sS3Bh97k+4FmS
	ssxg==
X-Gm-Message-State: ALoCoQnLKuW5VGQwwyJTQH205mCMyP/PsxJxq0LaV11r5rzhN2i19sV9R6TjJu1lc6c7HzR+E4jr
X-Received: by 10.229.74.136 with SMTP id u8mr25265737qcj.5.1412870269254;
	Thu, 09 Oct 2014 08:57:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Thu, 9 Oct 2014 08:57:29 -0700 (PDT)
In-Reply-To: <dd407026864c45e6b6fa6f6071469a83@CY1PR0301MB0700.namprd03.prod.outlook.com>
References: <e777247650f44526919fb4737b79b0a6@CY1PR0301MB0700.namprd03.prod.outlook.com>
	<dd407026864c45e6b6fa6f6071469a83@CY1PR0301MB0700.namprd03.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Oct 2014 16:57:29 +0100
Message-ID: <CAJTo0LbsTYT9N6CVvCqudQ-Y6nPt09agxRs4u05p2Hu3uuUOvg@mail.gmail.com>
To: Lauren Post <Lauren.Post@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple issues building from dizzy or master
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
X-List-Received-Date: Thu, 09 Oct 2014 15:57:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 October 2014 16:50, Lauren Post <Lauren.Post@freescale.com> wrote:
> I also think this poky revision might be causing the fetch/unpack issues.=
  In this issue we fetch works based on log output, unpack fails and when I=
 look at downloads I see the <package>.lock in the downloads directory.  Ha=
ppens randomly on many components.  I'm doing a build with only gcc patch a=
bove to confirm if the unpack failures come back without this commit below =
reverted.
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Ddizzy&id=3D7d8=
0f8e9468253496a7097685aac8f468940a9c5

That commit changes the format of a comment in the "bitbake -e"
output.  If you've scripts that invoke that and parse the output then
they'll need to be updated, but otherwise it won't have caused
problems with fetching.

Ross

