Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F91178204
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 09:26:30 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s66so20869690wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 02:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9QNdiuUh1OkbUZXZg6LN32x78YMyLc3NDRD1S6HrCXQ=;
	b=YHpmSYWiLD99kduXvT9qNKqxP5/9PPeybGnKOsrhXR5yc2WC9UmnmI6iIUkAoNSZ7c
	UGowmzkky3pax4VnjMayl5OWPz4vokU2X0nRfL5YxVkC/CBBOoZRWoLtGOORwmBwlrXo
	tA6zsk7B1IqQbG1Om8LXgCsN6NZcXmOP+hUO1/CM/5xg25qRcd9YYsDBHCq3l9Fj0fW/
	6PD1tscr7xcbgfEUkZWJWNB/6sGN676pA/Eng0OrPteOAWCbNIcNfJRFs0NbIILUfZpL
	fTLYlMSdDDPqL72KePHGVC0iIohAkVSRg9Jrzxmrj2M+TACTIEnaDxchqV1GRX4oeZsE
	oNHA==
X-Gm-Message-State: AMCzsaWjsp602GmmBerJS25Xvf/+s0LkqFnYIWZ8UpONQJjUzLYzpogD
	GoBTEA6ZvD7kc2SimFSjATE=
X-Google-Smtp-Source: ABhQp+TQ6V+Zi6AdBBXXlgx/04+ebcXUgZiwerZqyq22sB6L0N81yIP2T6mw/Y3tQCovKSSmuYD/vw==
X-Received: by 10.80.165.20 with SMTP id y20mr2122596edb.72.1509441992014;
	Tue, 31 Oct 2017 02:26:32 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id x38sm740567edd.94.2017.10.31.02.26.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 31 Oct 2017 02:26:31 -0700 (PDT)
Message-ID: <1509441974.11219.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Armin Kuster <akuster808@gmail.com>, akuster@mvista.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 31 Oct 2017 09:26:14 +0000
In-Reply-To: <cover.1509205113.git.akuster808@gmail.com>
References: <cover.1509205113.git.akuster808@gmail.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/36] Pyro-next pull request
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
X-List-Received-Date: Tue, 31 Oct 2017 09:26:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Armin,

On Sat, 2017-10-28 at 08:42 -0700, Armin Kuster wrote:
> Thomas PERROT (1):
>   Avoid a circular dependency between do_concat_dtb and
>     do_assemble_fitimage

This is not in master, and I still think this is wrong.


Cheers,
Andre'


