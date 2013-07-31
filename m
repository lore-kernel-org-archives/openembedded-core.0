Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3636B426
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 01:35:16 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id l10so259732oag.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=wwgrwPrj/XGuozQDIqjPkDv80Q0jXrd5vLLtWV7UFuI=;
	b=n5YkBEtD4uWxVhMN0szRfOb7AVIaJYBMPEArG/idHC39dggpoUO70NMaV8YeCAfmgh
	aLxtb/lkTCog8xo5LB1IMUDs75UWFE2QK7ecAZqaUZ9tKPhApv+K6PhBzHZvNYcT/7LI
	KU3UM0VYQO6uhr0/vAFuV/PfVw8ojn8BfJFkScfduYM+TlcfRUCXOe/ZYHugQ+qphgcd
	+c+IWiMheDs9Qf8SjbRruGraTQ+IgMSKZA0iu4Z8tojgnRYWgHkECtwcQkS7JbeqR/EY
	HJvh9BrFz7xVTOoTDKZHawchAAbDKJZWMZ5piYBlEkJHsl04dIACkNhvIxICriSIEYF8
	DY+Q==
MIME-Version: 1.0
X-Received: by 10.50.18.5 with SMTP id s5mr467442igd.6.1375234516416; Tue, 30
	Jul 2013 18:35:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.9.113 with HTTP; Tue, 30 Jul 2013 18:35:16 -0700 (PDT)
In-Reply-To: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
References: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
Date: Tue, 30 Jul 2013 22:35:16 -0300
X-Google-Sender-Auth: HGMMsufBR5bnMzpH2m-WpP_v32Y
Message-ID: <CAP9ODKoXUAUwQBmsjgq7YmSpG8R-X2YcM7r7Z5ocQzWmgRG77Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Jul 2013 01:35:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 30, 2013 at 10:11 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This allow the addition and removal of distro features easily. To add
> a feature, use:
>
>  EXTRA_DISTRO_FEATURES += "wayland"
>
> and to remove, use '~' prefix, as:
>
>  EXTRA_DISTRO_FEATURES += "~x11"
>
> This code has been mostly copied from Mentor Graphics public layer but
> changed the variable name for a more descriptive name. The original
> code can be seen at user_feature.bbclass at:
>
>  http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Both does not work for all cases. I am still checking why.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

