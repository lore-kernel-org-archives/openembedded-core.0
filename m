Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB29606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 23:33:24 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f6so121209035ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 16:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CyWDdJz8zTznKS31ydfjGl+rXP946/QFpcdvE7/jRAA=;
	b=oOOju0iGHgrFASMRQgIgO7juc/6xYaaDyfdy4wJ3TylJLalwRlvioGFFsd/vO1c9ZB
	e7KK1glMf9M2oASfWC5YTguebBGzL7BcuOcbh2H/5TEUbgT8bErO5odDT499fZL+MYPJ
	rge8w5MHk9w+W+wgIcdLwDDdpLqr6P5muKBHn/kTXvZpWmxbc5j9UmVIH8KyM1SF28lZ
	siYIAm0Z7Jr4gy07HhLMXyH/BKfsxU3mCtJ01BBBIrFcUFuFFVA3iiwXs4dMSzXJrIrh
	r1JFugzdyMlTPAvIGq4ywQHqlaYH2FP0HDpBsN7R6QjsrPBvUfcrIMeypmOZPIsCUPpF
	PutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CyWDdJz8zTznKS31ydfjGl+rXP946/QFpcdvE7/jRAA=;
	b=XbVw11ybuqhUzBqbY7b9RVvmeKqEDhEPKbPWWVlE7hwn0e3xi13xYYYrJWPU0J2GSv
	C71jiRmfzz05DHYxXqZmns9XvOffdaBVroLHzwiYXkb9cUAoUTJWUAJe7BKVmVdLL79r
	VBxly4RUzaYeHRPFWzNpB2dftaIV/BeBSeIo9HxCA/3iuik49yW780Kx4ZDh17/hH/Xi
	tQZ8vzhl7dq1n7vXFd9NghGhQtHEua+Sr6BtS2ndtG/hnlaEGb7v/+efR630k7w4dDNT
	BwB8gVtL+3VHZ4moyBTj6d4+IDAuDh7Or/xsI4Zrnw3KVCofLaDR9UIFFx6EWV/geKK3
	qguA==
X-Gm-Message-State: ALyK8tLGF9zTViZ5RGwof0tCpch5AF9IwqRyfTyzwNU4fjv6w0Ky3JAgCSeac32bJKTng5tGKeyC59Yu+luAwsKi
X-Received: by 10.36.131.194 with SMTP id d185mr88473228ite.38.1469489605179; 
	Mon, 25 Jul 2016 16:33:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 25 Jul 2016 16:33:05 -0700 (PDT)
In-Reply-To: <07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jul 2016 00:33:05 +0100
Message-ID: <CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Mon, 25 Jul 2016 23:33:25 -0000
Content-Type: multipart/alternative; boundary=94eb2c049652eb1d0505387e3557

--94eb2c049652eb1d0505387e3557
Content-Type: text/plain; charset=UTF-8

On 24 July 2016 at 06:16, Robert Yang <liezhi.yang@windriver.com> wrote:

> Fixed:
> checking for XML::Parser... configure: error: XML::Parser perl module is
> required for intltool
>
> The module is installed to sysroot, but need use native perl to find it.
>

This is fixed by [PATCH 2/2] intltool: remove broken XML::Parser detection.

Ross

--94eb2c049652eb1d0505387e3557
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 July 2016 at 06:16, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":1mp" class=3D"">Fixed:=
<br>
checking for XML::Parser... configure: error: XML::Parser perl module is re=
quired for <span class=3D"">intltool</span><br>
<br>
The module is installed to sysroot, but need use native perl to find it.</d=
iv></blockquote></div><br>This is fixed=C2=A0by [PATCH 2/2] intltool: remov=
e broken XML::Parser detection.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--94eb2c049652eb1d0505387e3557--
