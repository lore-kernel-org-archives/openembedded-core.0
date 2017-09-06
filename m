Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 217BA77BF0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 10:15:52 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id b142so3949622ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Sep 2017 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dI4cstKrOFAE0E3CElZtB9ROI9fRGCddPrsFmfF8AVM=;
	b=U/s3Bgnfqrlf1ABoUCMi+WTVOIIFYk0HUe9+/iF+pX/CAiMmdGguX5rpQZ1yV/s+ow
	nWUpTZfimfPcHBACwseHpRhcecM9VlLpVBq9rjoih+Bklmc6NDxh1C8RWGJti0ZnGx5y
	JJ5yNAfDOtygUbsKeo0mQWvqVjVuxwbAdVV4YBYkCjdhXwpqctBVn97cn8uAZDrl8huo
	UB+JCmagV+mNmB5n7Qt7XSEAXWVEveHI+vtetYqGNutNyaR6+fxhaCmeO2Z86gPaVkxX
	i5U5uhQF0CbYuljaAgRKZPfYBZbfCdfEmA/2cFscyVa1mZmAdfWIojxSctbAWVHxOwDY
	VlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dI4cstKrOFAE0E3CElZtB9ROI9fRGCddPrsFmfF8AVM=;
	b=sOeb4W9hso7Bs7VXifSZxBk/dkT2r/F7lyE21rUIts6boq95BtKYci9+HBNLJ3pmhh
	At3c/c+UQmOqJXcVm/QbE6WdtO6ZI5kzacrDhbXNFyIVUxoVKUmYbs0IHDoCJ875Z/NQ
	Z49Jgz8b4UpJrbDdSTwFjvAUvsVJwPVBN2mz2CTgQWdAp6KfvPQgyiOqq7ViG/MRpHZw
	0oc/GscBO9ipoq8CluqxZHwyY7ZsadDA3fhe3xPK9ley52lBBhJ+R3Oig/8s+5fkqZEh
	PNjQbjT1SW6RmQOo0fwFUTqOdG6yXTdfkXcKsPhacp0FIQ6zySU1xAhYojrcxRiBZtyy
	ubAw==
X-Gm-Message-State: AHPjjUgevYPBi5SvPiYlPtp+QjI6QZbKnfjTiqXGjpzHfCKW1oqkB+6n
	AJNow2DURQI9D4ESzNJ5ECP3BDXbAsuI
X-Google-Smtp-Source: ADKCNb7Yl1q5Frmed7kPXq/lciJ4z8T4h6klh5zRBZ3lFfkL69VnPYNgIAbjZYdZlQY5d2bCo2gEVLDjdXG97TGsWTs=
X-Received: by 10.107.53.17 with SMTP id c17mr2012571ioa.117.1504692954242;
	Wed, 06 Sep 2017 03:15:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Wed, 6 Sep 2017 03:15:33 -0700 (PDT)
In-Reply-To: <188a6ad09f7aa5c2efeb1ecd5f25aa06264fe0d3.1504691079.git.ed.bartosh@linux.intel.com>
References: <cover.1504691079.git.ed.bartosh@linux.intel.com>
	<188a6ad09f7aa5c2efeb1ecd5f25aa06264fe0d3.1504691079.git.ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Sep 2017 11:15:33 +0100
Message-ID: <CAJTo0LZ-aqJX3Q34SQXTUwXhaZTCFUq5Ui0kHKC2s6rn4vdNkg@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bmap-tools: upgrade to v3.4
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
X-List-Received-Date: Wed, 06 Sep 2017 10:15:53 -0000
Content-Type: multipart/alternative; boundary="001a1144939008c6e3055882a10d"

--001a1144939008c6e3055882a10d
Content-Type: text/plain; charset="UTF-8"

On 6 September 2017 at 10:48, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> -SRCREV = "96702a869220ab20830db916ec4ac595e1d97f92"
> +SRCREV = "v3.4"
>

Using a tag means a fetch to decide if we need to rebuild, and can change.
Please just use the SHA of the tag, instead of the tag.

Ross

--001a1144939008c6e3055882a10d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 September 2017 at 10:48, Ed Bartosh <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bar=
tosh@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex">-SRCREV =3D &quot;<wbr>96702a8692=
20ab20830db916ec4ac5<wbr>95e1d97f92&quot;<br>
+SRCREV =3D &quot;v3.4&quot;<br></blockquote><div><br></div><div>Using a ta=
g means a fetch to decide if we need to rebuild, and can change.=C2=A0 Plea=
se just use the SHA of the tag, instead of the tag.</div><div><br></div><di=
v>Ross=C2=A0</div></div></div></div>

--001a1144939008c6e3055882a10d--
