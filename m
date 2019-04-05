Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 150216C0EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 13:21:16 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id y134so2786349itc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vPljNZzadckXCfl6uhn9lNHGs2jcgdkU8AtSHgdMHc8=;
	b=Cdqz+BO2Gk4f7mC7WX0iGnLC+QGyZshnqtW+hI8g7Jplc3JQWb0YefrjQUz1p9zpHO
	NGtvbCiNWuqcf0iXPbCSqoX5ofjlJ5VHRNWDLo97jYnB8dTQ8FxvNNSUgTv7ohXKIy5N
	AEIxoXW0Ep7YH9Kxe+a7hvlAIXlL/wmlKqxGVMoybTWQyeURzsnXxc+hiZ47V/bcXTRb
	DmfUj97dMWBtjHdjj81coxBpy7SZS4cMuVjWIyx6YmHpC1n7+MBu8toDkqE3VGt6u3kN
	92jtChivOtgnqyd0zoPiaxCXgHZqYVlMocC4G80OfjnIeyIj3fACrcc/Te7zvkDlxWqu
	Rbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vPljNZzadckXCfl6uhn9lNHGs2jcgdkU8AtSHgdMHc8=;
	b=bIQTKRsxGkHKHo6tVLaWs9OP5c2C4E6NLEo8pgJjJkl2h2xONLcFa6EkS3LlLl6uw3
	jv0havVGOUZbLqrlZQBYyfPO8dbwPBhI/BOQ20BBkEQj7tUqKmTe/keV6M15856FxO31
	X13H942s7gtUXil1L4BbG8TWnzMIojJO2hgeP2PLXQCiFSlJ6qG8M+SjEgjieVUuq34P
	lW9fC21UuXmaLhryh/6Seb5PQcSyc6GSLaOi/rxcdWzJKCpFmwjyI9sTkaHr8G4RHiaE
	uU9q2XaYu7WJpymbQMMgI+UyItfpKoI9ZqZotZ2+hEAjKAyEdMtz0Bh+yLI6lACz2+VI
	meTw==
X-Gm-Message-State: APjAAAXAa7AP4FG2PVqs3SveXBp98uGEdo+1iWSjpK/4IRpZ1cIvMrH5
	nkD7OGVUYq2eLvO8xtSEufZdw04HO1xgNV/AxiM=
X-Google-Smtp-Source: APXvYqxY519D/tCAJYHxPrPDf20d5EM1w8kokmXwYAUpP451luzYdC71G+vRf7deoP/Tawp1OhvLWbZsK9PzTSpqrZg=
X-Received: by 2002:a24:43c8:: with SMTP id s191mr7920661itb.109.1554470477359;
	Fri, 05 Apr 2019 06:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
	<CAJTo0LbBw=vgL8h8_K0diPKf8-UXeEqRoCUjasM2u7R0onXuyA@mail.gmail.com>
In-Reply-To: <CAJTo0LbBw=vgL8h8_K0diPKf8-UXeEqRoCUjasM2u7R0onXuyA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 5 Apr 2019 15:21:06 +0200
Message-ID: <CALbNGRQPtJ5LmpRj4FyOqPJb3Y+fcMK2CHP-McGuVLQPxNYB6A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/13] meson/gobject-introspection rework
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
X-List-Received-Date: Fri, 05 Apr 2019 13:21:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 2:18 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> ERROR: gstreamer1.0-python-1.14.4-r0 do_configure: QA Issue:
> gstreamer1.0-python: configure was passed unrecognised options:
> --enable-introspection [unknown-configure-option]

Seems my build did not include that. Need to test-build all inheriting
gobject-introspection. Will send a follow up tonight.

Andreas

