Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id A2DB96AC33
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 13:59:57 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so83944667pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 06:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jY4AVnobEB4nnY7yIJlScQVrV4dKxEUUsNg6pTg28mk=;
	b=NYp5jeJz3lV6k2bec9p2zQTQK0c/rHpBCy6pggGGg+n2Vl3/YGuQ5hXHWs36N1QxAc
	nwUxCPe2/YULAzmTuFypIErDavIgGll7TZkYCRe6X2/4Rg6u5OgbpiQe2MTVDt18ojBV
	IgAza6t5TaD6jpXx8SGmORdka6TCnu8314t4RNnq+/rBCth4eqC2DobLrBMYDAqVqfO8
	TbLOdecOZIoglqJiJ9q/y7Eu5wPROuv02hkNSFYk9mlPgLAxC9prAipWqu7PgWlEPCzI
	HTvVRwovE3Llw7MyA2FPjVIviYp53LD1n/uOLv/YslNb7lmLDlHnrCkhFX2tFprwmnwL
	0NGw==
MIME-Version: 1.0
X-Received: by 10.70.100.168 with SMTP id ez8mr6661090pdb.129.1431093540326;
	Fri, 08 May 2015 06:59:00 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 8 May 2015 06:59:00 -0700 (PDT)
In-Reply-To: <1431093400-7922-1-git-send-email-philippe.coval@open.eurogiciel.org>
References: <1431093400-7922-1-git-send-email-philippe.coval@open.eurogiciel.org>
Date: Fri, 8 May 2015 10:59:00 -0300
X-Google-Sender-Auth: r31bYwvSco_ielDMWlkzxa9s6_w
Message-ID: <CAP9ODKoeX-=25bjPK2eR2SLsM=+DTWomixe2+VEVAZ8QhHCedA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Philippe Coval <philippe.coval@open.eurogiciel.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: support system's configuration file
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
X-List-Received-Date: Fri, 08 May 2015 13:59:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 8, 2015 at 10:56 AM, Philippe Coval
<philippe.coval@open.eurogiciel.org> wrote:
> Look for OPTARGS variable in /etc/default/weston
> and set it as weston's service default options.
>
> This can be used to force system's supported backend.
>
> Change-Id: I0562c9326df5b46226093199873ef58d77aeae75
> Signed-off-by: Philippe Coval <philippe.coval@open.eurogiciel.org>

That's great :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

