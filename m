Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCB76BACB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 15:49:31 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so3605282pdj.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=h3x07CTijex6qnpbjrgsl8S4qZaNgAlWRKZzRRWvhUQ=;
	b=bACwZGmjaVqwnRCiiWNkqIxdelZeg6ykv6UFrMv16aoUCt7ipaghhaay3vafyrGcTj
	cs5mluGzGIAF5OZSccmNHD49/ACWhbmWxGBLECZHMGfoOmFP/eKQDMSp4CvIUaQUBS6O
	05qmMI5+nx+CcsWd+zfNzVWMx0FqfziBPF8T5VmzMi5L3jiPcCUostdHLPxT2XuS07KP
	W0XwbP02lTfIW+kmBCY8e7DQp2RGnXOwHl5ufg6534FHb8Itfow+wZ9GRcuomG8AsVa5
	UufHHg1Ch4jNe/6DbA8E60HjZwRVXwdl4i6U9PyM4PPRn+soEPKcOpssAwazs2CaKhDS
	LX1Q==
X-Received: by 10.66.190.198 with SMTP id gs6mr15197705pac.49.1377532172104;
	Mon, 26 Aug 2013 08:49:32 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id ys4sm18807061pbb.9.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 08:49:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521AD896.3000503@windriver.com>
Date: Mon, 26 Aug 2013 19:49:25 +0400
Message-Id: <6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Mon, 26 Aug 2013 15:49:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

On Aug 26, 2013, at 8:24 AM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> Perhaps the zynq machine definition is the right way to go, since =
nearly
> enough support is mainline (in both qemu and the kernel), and we can
> motivate the rest into their respective upstreams.
>=20
> If someone can come up the right conf files, and machine definition, I
> can pretty easily support it in linux-yocto.

Could you tell me what's steps I need to follow, to add a new machine=20
definition and support to the linux-yocto kernel?=20

I'd like to learn how to do this!

Best regards,

Elvis Dowson=

