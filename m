Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 394166E688
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 15:35:41 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id d192so11273144itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QZJAUhUwmEunmKynm3rBkrkAySPYQt52zF3IccSr9XU=;
	b=qo8sY3gryltJr4zvU4Jmklwpxg3AhVd8Cb+1j6MEXbmJMlsIVx8LHg74zq7Lv+oQcc
	8aOF8cUVmTNg5x48I05PgYznkxW8cQn8x3VpyBjWyFgKoa0jFqc+iqpPrKxeXTZttDCQ
	SvMlYBdEf1785sB/Eg31caEfIRiyEezvuCmOXdvVM4nMvhcXtYjLupGoZCxGvPeRyPa1
	ybc2c8MbP7p/86O0Z3YiHCcKABnEotSwAHwCqJbjoc1zaLC3NEAwkzFKADUUwGaTbu1p
	ZKPz8oWQNPuokogMnTpiEH9g0RBPO+7mXZjkn2M+hXiBhh2qbJERzc+rPDDgzqwngto7
	7d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QZJAUhUwmEunmKynm3rBkrkAySPYQt52zF3IccSr9XU=;
	b=nQi9PVUsMihB5hM1jxU4qMrTE/bBf8NUxs3CWYH2wUpYtKREUOGKkCrsKJ7QN4jyEx
	wpLcI+nsUB5cyeY4e15smohY0XHQdF7jpng2PRE4bekuC2MozEXsrT/sGz93BMaqLWRK
	P4sBWo0i2+W4LPZ3DB+FguM91yoL9BHuFeCko2x808pDYIZFsRc8mjGTwxoWIAjgB9JM
	3I40UQuPgykXyc+47ZjSDb/9urP/9/RbdsrTE3TgNJ7Zxqu7e2U4rf4SDOIuEAy72ifJ
	pj0yVNYT+0lGnZJVJtihCsFJgyK88dW/bfKoPGWHny7Xhip//NR6hIYQWA1d2r1uSYF8
	Kg8w==
X-Gm-Message-State: AHPjjUilhsVL8dtAnjRKHHX8lfXFkIj5Ril30/EER/EedU9lDhPiv359
	FYCNzR+zLB5RqpruKfs6OSAJFqzotveqAzWs7TZU+A==
X-Google-Smtp-Source: AOwi7QAH/wqLEfyGOem1VUigylYSBRZd3K+Jb7exbbCLTV1QEpqPIHM19LVPEvJF05CcjK62WwJ+VHvhrLlzwR6rkUg=
X-Received: by 10.36.162.67 with SMTP id o3mr1298678iti.27.1506526543247; Wed,
	27 Sep 2017 08:35:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 08:35:22 -0700 (PDT)
In-Reply-To: <239a2cfd-1507-b8dc-0d85-0ab7afa98c71@siemens.com>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0LYxVmQidhcuq9VeSBzb7y1KPcgqN6_R97d7PNf51C094g@mail.gmail.com>
	<1ebb3564-9e52-9480-c1c8-9f959d9e9416@siemens.com>
	<CAJTo0LYwUhk9tHNHZ7DACOC5WXKW_x=1vrNd7pArCxP7-Pe_dA@mail.gmail.com>
	<b48b82e6-bb1d-2e7a-ab50-609bd39c93d8@siemens.com>
	<239a2cfd-1507-b8dc-0d85-0ab7afa98c71@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 16:35:22 +0100
Message-ID: <CAJTo0LbR-sLX4YY4F1myb2EcEGQ3qSZjQL5OPOh5jut2_h4djg@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Wed, 27 Sep 2017 15:35:42 -0000
Content-Type: multipart/alternative; boundary="f403045fb2a27493ee055a2d8bc1"

--f403045fb2a27493ee055a2d8bc1
Content-Type: text/plain; charset="UTF-8"

On 27 September 2017 at 09:52, Andrej Valek <andrej.valek@siemens.com>
wrote:

> Could You please provide my the current status of my request?
>

Too much of a change for frozen master so it will have to wait for master
to reopen.

However it fails to build with ptest enabled:

| NOTE: make
DESTDIR=/data/poky-tmp/master/build/work/corei7-64-poky-linux/libxml2/2.9.5-r0/image/usr/lib/libxml2/ptest
install-ptest
| install: missing destination file operand after
'/data/poky-tmp/master/build/work/corei7-64-poky-linux/libxml2/2.9.5-r0/image/usr/lib/libxml2/ptest'

(noinst_PROGRAMS isn't set in the makefile)

Ross

--f403045fb2a27493ee055a2d8bc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 September 2017 at 09:52, Andrej Valek <span dir=3D"l=
tr">&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andre=
j.valek@siemens.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-=
color:rgb(204,204,204);padding-left:1ex">Could You please provide my the cu=
rrent status of my request?<br></blockquote><div><br></div><div>Too much of=
 a change for frozen master so it will have to wait for master to reopen.</=
div><div><br></div><div>However it fails to build with ptest enabled:</div>=
<div><br></div><div><div>| NOTE: make DESTDIR=3D/data/poky-tmp/master/build=
/work/corei7-64-poky-linux/libxml2/2.9.5-r0/image/usr/lib/libxml2/ptest ins=
tall-ptest</div><div>| install: missing destination file operand after &#39=
;/data/poky-tmp/master/build/work/corei7-64-poky-linux/libxml2/2.9.5-r0/ima=
ge/usr/lib/libxml2/ptest&#39;</div></div><div><br></div><div>(noinst_PROGRA=
MS isn&#39;t set in the makefile)</div><div><br></div><div>Ross</div></div>=
</div></div>

--f403045fb2a27493ee055a2d8bc1--
