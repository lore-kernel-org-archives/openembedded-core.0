Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id BC7E46010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 17:22:34 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 32so5621762ota.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 09:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f19dRTFQfERrUlfDW6Zd1WtlgZvDNJ7t3ZEqdCn3Q10=;
	b=OGzlYJulE2B2Pon/EReZAEBw7YTpze6pT5gcIXEDSQe/cksXyYkYH6alnouxMD+74h
	k0VGiwNcCezoUHkkfPr6vEvaJaSm4VphOBzemM4Y9vgz3sk/4rTiu8YjevnsHqu0js+c
	s5H6OSHWovLTs7C1wIaKGUtcqwsS9gPHKAaMzCMmC1Co8iwvhx5KcaMZE2MhJ6INB+n7
	XeG+o5tlqiao+ZEEG5lzTbX/lWPhJaGG/sqTYHxAIf6Q41S5gwUCJ4RtJ0jc/gKhVmmT
	jK2fTf0csZW10RXPwNWqh2d8gPoVW5JI14dZnILhB2JvnqyKVwHDGuNseanGlqqFYIC4
	kqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f19dRTFQfERrUlfDW6Zd1WtlgZvDNJ7t3ZEqdCn3Q10=;
	b=rvVE+hUNLYHi75sb/4G48lPay3ER5HnnopBBa5r4LyJmBDx2HvwWk5gKA09PPXq6o1
	HsIeNQrSgpcMTWMBYVSGuQTSxhcEbNqWw6iOP3UKgEcWrm/scnPGhS3DjABbgxqugRKg
	ke3QrF62JvssnpH3R0dNkHtnvyMu2A3DKQSxx5u7HsYkAliHnZ82LBT1N6O48YJlcBQe
	XyX4HJg7U6RtCZaDq/v8QqTC5p0A1ZCFO7ojhz6hOodMpP0L4CUhn0xKdzW3xfbdfbkJ
	/h/sVfZta0RJh6FV1tfrPQ4X9BtPkvWzmthTKnvoAJYB5qBGGrt+A5XXupoiML4N/ccm
	7TvA==
X-Gm-Message-State: AHQUAuZ3AEjUXbVmETsbMNsGEE3HDXEMisCOrilYo4XaMF6idCFUpXg3
	iWU09Zwem15xzkq4B2YCsG3JHdhZ+np24CaJSvk=
X-Google-Smtp-Source: AHgI3Ibn94nWu40P/D6d8oZzY9OPNEvgsBbNlvcE69FS0QskdUvwcDoBroSBUu7a95b0m2XQneYsNlZzzXe1l8ZL9+U=
X-Received: by 2002:a9d:640d:: with SMTP id h13mr4922219otl.153.1549992155679; 
	Tue, 12 Feb 2019 09:22:35 -0800 (PST)
MIME-Version: 1.0
References: <03b301d4c2ed$7497f360$5dc7da20$@gmail.com>
In-Reply-To: <03b301d4c2ed$7497f360$5dc7da20$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Feb 2019 18:22:23 +0100
Message-ID: <CANNYZj_PY61tmw=JjP7PPqqSVJff6kd=rsv=daNscx9eSkNWSA@mail.gmail.com>
To: sjolley.yp.pm@gmail.com, Michael Halstead <michael@yoctoproject.org>, 
	"Paul Eggleton (paul.eggleton@linux.intel.com)"
	<paul.eggleton@linux.intel.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW07'19
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
X-List-Received-Date: Tue, 12 Feb 2019 17:22:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Feb 2019 at 17:10, <sjolley.yp.pm@gmail.com> wrote:
> The recipe reporting system integration with the layer index is available at: https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M3/ and the historical data has now been imported.

Sadly the new RRS still seems to be suffering from the 'outdated info'
problem. For example glibc, or python3 recipes have been updated to
latest versions, yet RRS still shows that they haven't been.

Alex

