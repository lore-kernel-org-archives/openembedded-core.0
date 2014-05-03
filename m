Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id E50466098C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 22:44:23 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id v1so5461519yhn.35
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 15:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WbjqrGqchIrpEpnP8ggCQIa9S5xm/SpmRv02hwz13vo=;
	b=ZGtLxOW1hzTO5FJdeRQ07va866DX60anzcz09RoZ7ViSeABuXV7KCj2TWv0NIRFwf1
	1hZTn1CGp7lNVajGvtpw4blQBfDKJvXyFWOA4Eoqufo+02XUacjW5BfhznL7uWrIfAHh
	h/JEeyZ0J5Fh/lbNtoRBn6LfkTdCXBICz0BKd0OjEbuCkRgHPKXSxA1yzvwQVQMK8jba
	EtAw4EqqBXyKop1Ed6ls6G2BAEONxTQh9cCU+jI937AzQXXQptW4deIpSpEHnu927qkm
	Q6N6SlpPOSQjv9PfrMyaQccTonSmBEQp86cOIunHLKY4U0Tn9DgKvvCmTSIvwHsefzCY
	ycBg==
MIME-Version: 1.0
X-Received: by 10.236.142.16 with SMTP id h16mr15408127yhj.2.1399157064575;
	Sat, 03 May 2014 15:44:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.132 with HTTP; Sat, 3 May 2014 15:44:24 -0700 (PDT)
In-Reply-To: <1399156743-14903-1-git-send-email-joelf@ti.com>
References: <1399156743-14903-1-git-send-email-joelf@ti.com>
Date: Sat, 3 May 2014 19:44:24 -0300
X-Google-Sender-Auth: 7L4s7SAsr0Anb36nhiTmlxHwJPk
Message-ID: <CAP9ODKqbWSBmOm=A47aypdT53eeRMZQ27_8BsoaoHGHoVu-50Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Joel Fernandes <joelf@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Sat, 03 May 2014 22:44:28 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 3, 2014 at 7:39 PM, Joel Fernandes <joelf@ti.com> wrote:
> In poky with systemd enabled, vt102 is selected for getty
> causing user to experience a very crappy terminal. Default
> TERM to linux.
>
> Signed-off-by: Joel Fernandes <joelf@ti.com>

Don't bump PR, this is not needed in this case.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

