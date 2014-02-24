Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 75D456B6FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:12:00 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so14826915ykq.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=be6lugoYLwwY6pULvdqeuLi7iq0wLm0mjdzDrsHEDgk=;
	b=hRHAVdghd/QY7fv6IM99KddZUgKf15gaduuVNFWway++jBFyI2xDnzfrWyZFaHyIw0
	/S8RgmAE7/CWu92jcP1oSogLfxFqE3mbTkVyxVwYUkTdxeLrc71QF7B9C277srRlPMEB
	eo94GkKrfGMFPC1tVrjlKwJD6wYRJrcL2EY8WO2P90mgD6L+9UuOe88WyYBUy5DIZ+33
	1+zgNWrOtu058F+dy8zh15VWLOMC4qi2srhw3PQG5ugyTvUJsHguZYOoJxlfu7Yjdv3E
	lbk5nXXYXad/qgImDyCfX+4YlR2G/5YUCxnntGM3QUAk0kEcAgK/k2/88ZhdGH/0SRZz
	rSvQ==
MIME-Version: 1.0
X-Received: by 10.236.158.226 with SMTP id q62mr31429377yhk.2.1393254720767;
	Mon, 24 Feb 2014 07:12:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Mon, 24 Feb 2014 07:12:00 -0800 (PST)
In-Reply-To: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
Date: Mon, 24 Feb 2014 12:12:00 -0300
X-Google-Sender-Auth: MR54R1mQZbVfiMaRqfdZlyvmJUo
Message-ID: <CAP9ODKq2krk5HaemVsDqGcNowbCwaQeGpHrxWxM0rqBo09z3gw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 15:12:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Mon, Feb 24, 2014 at 9:01 AM, Laszlo Papp <lpapp@kde.org> wrote:
> I was wondering why existing images would not have version numbers
> attached. Say, we have a core-image-minimal image, but from the
> recipe, it is not possible which image version it is.
>
> Perhaps, it is just my ignorance and lack of understand, but for the
> moment, it seems to be an important information for e.g. distribution
> vendors and image creators to have an image version and the
> corresponding packages and versions attached to that particular
> version.
>
> It is easier to do a software upgrade then if you wish to do that
> based on the information of a certain image variant. I mean, it will
> lead to more manageable and reproducable images.
>
> It is possible that I am not aware of something important, so please
> enlighten me. It would be nice to see how other OE users do a system
> upgrade.
>
> For instance, the MeeGo Nokia phone had a software version information
> in the settings, and that is something I would personally consider as
> the image version, but again, there might be better ways. Please share
> good practices in here., or alternatively, feel free to point me to
> any documentation, examples, etc.

You can have a product-version recipe which populates it based on the
information you need (write it in a file in /etc and change PV as
need). That way you can even track this using buildhistory. We do it
for several products and it works quite well.

All the need structure for it to work is avaiblue, just make the
recipes in your product layer.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

