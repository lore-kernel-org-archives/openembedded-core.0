Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2CAB2771DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:15:47 +0000 (UTC)
Received: by ioir85 with SMTP id r85so19565744ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ywu03a4BPHM1atnhVMvpntg7X4kD49ub8gH5DBq95PA=;
	b=XkiVjt9r+BWWSpJNsuhm4C1O6ogpXqQH0DCzZGkRv4ylpocyBDSv90KTUR4o8C51vm
	7GNfSNI+PpNXmb75LejfnJPBiQPbZe87L2MH7HplN6c6pR5OZ2jkdgopvvaxOZNnsTX3
	1Ep0xlTXoGvgz0EwdMj2s1v4wkC7fCDOQeoD8P/QDJDmMJD5FYIuueNE5z4QD32qWBHi
	/Y5CqIwECIrFvo/xKLQTQyU7ADhqL13rt7GKUU/W8B72Wv9b/U885Jtzj3P4op0q/36+
	esESH+YidygBwYmbUouFSyp3GvxNiIOqBGXcq2WLwSTn/pjoeppnh8GlYQi44w7IxFpx
	qqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ywu03a4BPHM1atnhVMvpntg7X4kD49ub8gH5DBq95PA=;
	b=kieLpOdmW+yx2QSQQy08SMwnma949oVWUAZ0US6UOQxzdtmXqqxvyMdyK6PWMjw5/G
	jLNMoFBJZw9U/XtZrxp/PJl6XDZWzQAcQ0NTRfutOYz0rYHpSggs5RWIo/LW+9nS+GjO
	Bk2SDtZXzyEo8sNcKwdhlUsqLPj9Zr5aeLv0Bz4XnJz9uRaNszvfoU9WnWgvDmu/uKLa
	lG4Myik+sw/MNxOQFIN3ZFnZP6ksaG4kKLpRgy9j91GnuDwxye8tvncdYI/YJp1/dTyT
	13i2cyj+Y4+85rk6lIRII0vqbUtW4sL+X+U5oM6n7Y9V6R6n18V9fpFJuWR2uoBjkGOp
	CLUQ==
X-Gm-Message-State: ALoCoQlAliI4xdJ2Rkb5v1J+8YQEBB1oIxSI+NvipWvUUkXLPdQIYnZyC+6QKWCTI0meQL/mSdhR
X-Received: by 10.107.135.30 with SMTP id j30mr12638585iod.148.1447323347669; 
	Thu, 12 Nov 2015 02:15:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 12 Nov 2015 02:15:28 -0800 (PST)
In-Reply-To: <1447303449-20796-1-git-send-email-armccurdy@gmail.com>
References: <1447303449-20796-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Nov 2015 10:15:28 +0000
Message-ID: <CAJTo0LYoc6vqX=vU645oWxL74z__7BNRCrNMjcX3RDt9XHkDEQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimg.bbclass: make default KERNEL_IMAGETYPE match kernel.bbclass
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
X-List-Received-Date: Thu, 12 Nov 2015 10:15:48 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a037e0c0524553a2c

--001a113ec64a037e0c0524553a2c
Content-Type: text/plain; charset=UTF-8

On 12 November 2015 at 04:44, Andre McCurdy <armccurdy@gmail.com> wrote:

> -KERNEL_IMAGETYPE ??= "bzImage"
> +KERNEL_IMAGETYPE ??= "zImage"
>

Or would it be better to unify on bzImage for master?

(this patch would be suitable for jethro)

Ross

--001a113ec64a037e0c0524553a2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2015 at 04:44, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":27y" class=
=3D"a3s" style=3D"overflow:hidden">-KERNEL_IMAGETYPE ??=3D &quot;bzImage&qu=
ot;<br>
+KERNEL_IMAGETYPE ??=3D &quot;zImage&quot;</div></blockquote></div><br>Or w=
ould it be better to unify on bzImage for master?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">(this patch would be suitable f=
or jethro)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a113ec64a037e0c0524553a2c--
