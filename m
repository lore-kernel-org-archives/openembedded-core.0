Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 307AB7D2FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 14:24:28 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id l17so6914344otq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=7plzb6vpPkFMU9PLHM7bs0OGiEPdIGHzzcdNWIyfVGg=;
	b=NujAW9P8dC+AM/U/nhqDr3w91+4VhHBjkiwtVnsKm1nhh4hQo228/AXGnEySFgMQgb
	F8fmQ8s2g6SCx424icL69hiwkKHqQxouD3D4I022sLMkKRLK9q0F8FerpOq54o7VMssd
	hd7QZCR6KIkjFrjQ12a4husc8Xd18hUbP5srKvaoXwNlwar4KzRfGN2VmmJaFnEaYFDc
	h4DaaTIONyZhK+CAUBLoCGKurvdDusxGY0wxILtUVR4H+Pj4682qlM8jE23aBwD6N6PF
	abxhTqB3Bd5aAnZMBPScLGl+jQjtdDYpdfYgxphQAjKnpSDOC2nXKPJeOvxL4GSuRgsE
	pqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=7plzb6vpPkFMU9PLHM7bs0OGiEPdIGHzzcdNWIyfVGg=;
	b=IE5YOyWk1xEr9IyRrcbB0/dU2ndOZe1Bp6NYQo8YfhztsPiiSWnQtKr0MdKg4XOnvu
	NqAOmAVPUooFjzoInpN4a5x1W8/HBG7mQFpFHs67SVOsYq0np0mxhqvfmpYsLH7haFGR
	nacsrw9kTBwt+TJtMwEF85A6VXi/yF14QWpcerbbjyH3bjLkygYYV1vUtVNZlTiuRImr
	l2CjtHi4ITQ/oQYhOpu1CgUrxfPaRp1llQ9QkHfq7uO+7xWKw+klHJl0FI2ndsEcRoOx
	5bJ/k1sySAeRrduMaktak/izr4igK2qouvQ+wCL1/IKnjG0rVdzC0xGJiKT92GYuoG+p
	AP7w==
X-Gm-Message-State: APjAAAUJ7PDiDykJaDm8Gvzcuvp7JL5uJ4mDlNDtyHnnfVjGRBnXxWxV
	W69VvKyl8VJM+dtAHJCzgD1faQ/d/wM0VLVIRlaBIg==
X-Google-Smtp-Source: APXvYqwRodcvsmCqGS4eldI/JLlqUe3x/oKYp3H7hHTxu3G+zAHdQEZrFuytMw0V/FNZTqpr/16i0hw4y2//blp9sK4=
X-Received: by 2002:a9d:694a:: with SMTP id p10mr11269227oto.61.1558103067638; 
	Fri, 17 May 2019 07:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190517142210.D894B440002@auh.yoctoproject.org>
In-Reply-To: <20190517142210.D894B440002@auh.yoctoproject.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 May 2019 16:24:16 +0200
Message-ID: <CANNYZj8vnT=MQZ6sA_1rTdDgeUM2ysd0xufpPhqzB5sYgeqjkQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2019-05-17
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
X-List-Received-Date: Fri, 17 May 2019 14:24:28 -0000
Content-Type: text/plain; charset="UTF-8"

Apologies for the noise; I am just debugging an issue with AUH, and
forgot to switch off email notifications :)

Alex

On Fri, 17 May 2019 at 16:22, <auh@auh.yoctoproject.org> wrote:
>
> Recipe upgrade statistics:
>
>     * Failed(get_env): 1
>         usbutils, 012, Alexander Kanavin <alex.kanavin@gmail.com>
>
>     TOTAL: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Alexander Kanavin <alex.kanavin: attempted=1 succeeded=0(0.00%) failed=1(100.00%)
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

