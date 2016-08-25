Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 453D67318A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:28:30 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id n128so93194520ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=609oDWeGTfS123+f4U8gERMYmfgE8fi2mO91GDq8FDI=;
	b=v6mo81UU4xEGxxg7QPzcvrG6vF9mWKZlS/7CUhS+vjT5ygNsEkS5cgXp0uIkj4tuCN
	1H4FiFw9GXfT/7AImS1Qv89rwIp+dBlXdVF9b1cBajFBO9HBL4m99BiqzsSM2yDckNbC
	ffj0XSEMulnBxhfcukOd3gytqzS9wC6bRbDDEby2oVtYVK6DjBsVPII2ZU+iZb9PYjId
	tNMJbP6Vm1FOH+qLFM7sZoqQvk5Z+YBJee3VM22e5VEi6vbFVix4JXb6N3gJrE9AYmvI
	SD6dbntUqjiYCN+9e+x790yiJXgAvNkt7Q7PoXYXtPylFQKw4rx5uNSm8uHDHk0KpV96
	FUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=609oDWeGTfS123+f4U8gERMYmfgE8fi2mO91GDq8FDI=;
	b=cRiZd9e1BXoEJHYfspK5vH12UAacI2C12yqldn9xmv+l4p2CZzi0l1wm9Hdw/eJNGh
	zo+WzonqH8R/mLuf3fRz+mI6boat4XfcBOOHdBAh/l2OjDyNGdST5UOoDRxv079ebphr
	1KvnoHRcruuhZxNmxZwUhimvmrdRAwi4076t9bEn5N+kVMJZvwi3isKLN2q9Exoq834q
	zsKfa321zbOVNOVbiusik45ALshHiQD4QGDkjjGo6jGlq22lyVULiWpbz6nePC3P58G8
	VLgNE6VXxoG0F95rr1prvLgxAEI4o79KPhinYVS+vwwZFDCAxtWAx0RBDQM9haLT90Ae
	BMkw==
X-Gm-Message-State: AEkoouuxymwuC+KhaAk1v/65pbxzgiRBoRonjHkJt6/MuzEcwM7f66ZxnSS9eiK5rXc/Q20KuVH2Sj3/Paej8WIL
X-Received: by 10.107.154.196 with SMTP id c187mr10357630ioe.99.1472135311210; 
	Thu, 25 Aug 2016 07:28:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 07:28:10 -0700 (PDT)
In-Reply-To: <2ea1073b1b15da51334a47814732d809fc1d4a3a.1472060412.git.mariano.lopez@linux.intel.com>
References: <cover.1472060412.git.mariano.lopez@linux.intel.com>
	<2ea1073b1b15da51334a47814732d809fc1d4a3a.1472060412.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 15:28:10 +0100
Message-ID: <CAJTo0LYmUmp8+KBwdJUYqNDHmxLjG+YUCviE4e+pmXOJGpjJ2g@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 1/2] cve-check-tool: Add recipe
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
X-List-Received-Date: Thu, 25 Aug 2016 14:28:32 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e4950d1053ae6367d

--001a1140e81e4950d1053ae6367d
Content-Type: text/plain; charset=UTF-8

On 24 August 2016 at 19:58, <mariano.lopez@linux.intel.com> wrote:

> +CFLAGS += "-Wno-error=pedantic"
>

This doesn't work in native builds, as the native class reassigns the value
at the last minute.  You'll have to use _append.

Ross

--001a1140e81e4950d1053ae6367d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2016 at 19:58,  <span dir=3D"ltr">&lt;<a href=3D"mailto:marian=
o.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":19t" clas=
s=3D"a3s aXjCH m156bfa5c1b1bd960">+CFLAGS +=3D &quot;-Wno-error=3Dpedantic&=
quot;<br></div></blockquote></div><br>This doesn&#39;t work in native build=
s, as the native class reassigns the value at the last minute.=C2=A0 You&#3=
9;ll have to use _append.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a1140e81e4950d1053ae6367d--
