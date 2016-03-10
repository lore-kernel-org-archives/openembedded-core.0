Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 00C2360124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 16:56:40 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id g203so113183303iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=orBEnSEQfXs2UUisMOnvEs6yNKy0ho0csXsGrRq03+0=;
	b=mR6aDViNACq0oBIbB/eQnH4+B256nwzeItiHbQN3OhUffB7WkMHvnnyS4AamebLdLH
	pfImBszHsncbBdXseGRGh2nIJi64xUONi1KoF9M7aTBzrkOFixzSLtkTFkkjXTIu+r3F
	nL1zgyyMAQUqKcNL+n37p52f+X2yzh5m3lE6jGB3gWptgAX2W7IVoSVxvWggJNbDn2mC
	qZMcOgv0pq4wO3sbLF5ni93E1TxINeXQHDE0iLt8ZYJFjUm9yzhScaJVF+JoO+XLjFEd
	qJqVs0CWDg1CB/43EFZ6jHqoy9XqtMh+sIOyHUzxhx1RDpjjQFCkliOSVoMZy5QZ0Az8
	kuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=orBEnSEQfXs2UUisMOnvEs6yNKy0ho0csXsGrRq03+0=;
	b=ZRpq+zWQ3/lH5KzBsCfBUmQUCAZrjzai11DmwQPQKnZtA5ddZZ6Vqk+xoqUmDDilsl
	5he4dBWZ0pykPIpuu/Ulm3GVzuP/9/mcSBPjVjzLr6W8H2bq3ouyEK58hkJEwKnjZ6H2
	XYH1OgsLUECJXtti0N9EBZbYItiboqxqHW1jbcXMYQJYAIAD6nJOActyPbGWIxqB28Y3
	HucaSVZF8XDikK4GRtBj29AYPZUudanEIWQLzt8AEvk8PwV6PKiXuhz7VibiaL6nQLOz
	/wdF+LeFJvs8ZGTcUIFumZLmmtvdpu1cEfPfDoo7wpXBFKDk0iPZRECAlG5Mp+5z+ZPY
	appQ==
X-Gm-Message-State: AD7BkJLAajsBss1e/0bXDAIJrjAK3Jr8lMM8Dq+RmRCm0gcphy70I7CAQ8+d2JNFsHBoFDr6OobIof0uyC4P0VDF
X-Received: by 10.107.6.32 with SMTP id 32mr4438016iog.99.1457629000808; Thu,
	10 Mar 2016 08:56:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 10 Mar 2016 08:56:21 -0800 (PST)
In-Reply-To: <20160310165631.GK2573@jama>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<20160310165631.GK2573@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Mar 2016 16:56:21 +0000
Message-ID: <CAJTo0LZ+Pwv=7OrQDGEFaHEBGCqk38fyWvJp3+n4T5DcUV_+0A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Thu, 10 Mar 2016 16:56:41 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5ccece05052db4b26c

--001a113fbf5ccece05052db4b26c
Content-Type: text/plain; charset=UTF-8

On 10 March 2016 at 16:56, Martin Jansa <martin.jansa@gmail.com> wrote:

>  which triggered exception NameError: name 'qemu_wrapper_cmdline' is not
> defined
>

Do you have oe-core 0b68f0632312392cbd20bfcb9ed4895cfc9883ff?  (which is in
master, which master-next branches from).

Ross

--001a113fbf5ccece05052db4b26c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 March 2016 at 16:56, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D":973" class=3D"" style=3D"o=
verflow:hidden">=C2=A0which triggered exception NameError: name &#39;qemu_w=
rapper_cmdline&#39; is not defined<br></div></blockquote></div><br>Do you h=
ave oe-core=C2=A00b68f0632312392cbd20bfcb9ed4895cfc9883ff? =C2=A0(which is =
in master, which master-next branches from).</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113fbf5ccece05052db4b26c--
