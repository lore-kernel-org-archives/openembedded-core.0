Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 156F260722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 07:09:36 +0000 (UTC)
Received: by wmww144 with SMTP id w144so124582049wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Nov 2015 23:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z0uDlth3PUTZR8pjwghnHaz5KjQICvWx6PE0h2xYj1M=;
	b=m1ryDCk4l2Z0/dEjObDSgUhS5v1ihMhFw+Se+hCc9BeQkc3SetwLORfcXoXCh9oQN6
	+mIjC+z4kSHfpVe8u0xTz4AywDmvsrEzyMUIPKv9z6dZSv76VG/sCTvEkE1RZQcCfPk4
	Q3l2eqdk6+bChnfZtR3c9Ex9waTPSpTzXOHD8Qni37Gx5id1iK9QCEB6Jo0k2MDhOeum
	6JZJgU5R0dMwn5LU3nm0Amf1gRGIqNVJYQ2BYtIUFeruTbCEbBDehK8bRCSAqN9TwXJT
	aM4Mp0fDCjEWyae6Znsr4S09SxnqoEHgmBriLAycApkqj9dZMus9Dx7bgn5t2J+nEGrd
	H5eg==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr13576868wjf.43.1448867376868;
	Sun, 29 Nov 2015 23:09:36 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Sun, 29 Nov 2015 23:09:36 -0800 (PST)
In-Reply-To: <565A634F.4020508@balister.org>
References: <565A634F.4020508@balister.org>
Date: Sun, 29 Nov 2015 23:09:36 -0800
Message-ID: <CAJ86T=VT051Y_=hEOpiPLs=CYZ=qgRg-a1HOVoGauDR8xJuVCw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should the devmem2 recipe move to oe-core?
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
X-List-Received-Date: Mon, 30 Nov 2015 07:09:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 28, 2015 at 6:30 PM, Philip Balister <philip@balister.org> wrote:
> I was poking at the layer index and ran across this:
>
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=devmem
>
> The recipe appears in 4 layers.
>
> Should we just move it to openembedded-core?

The busybox version appears to be better maintained (it's gained
support for 64bit data types, which is still missing from the
original), so maybe better to recommend the busybox version instead.

> I wonder how easy it would
> be to have the layer index report duplicate recipes?
>
> Philip
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

