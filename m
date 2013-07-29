Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 98E796B2C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 22:35:23 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o17so5253297oag.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=zMI9ovuSHpsKZrkqyJpRRCtbFdYYcNr0zURTyucK2SM=;
	b=KksDot9paT7M7cXQbSNAKOc9DZlfLasZUcOEPlB7Pa3ScOmb/o82g1NcOBKXke5BGD
	AmqzGj6w24WPULaGTUsY6gOsKzgg4tVlIOlxygQU4QqIUhqVE5XVad3ah4MOEYQSe9Aj
	Syw7C9q8EOoBAo31PpfmU14/bY140yEJffSvXWoaFdYZw9VtyNDSqOOHs2n5PCC5+EwS
	Sb+AVsNkjJXUMceAcMQmnI8oVECuSQrov/KihTKXiGyBYTJ6ZbcaOUSPATdIpLJjisae
	bQWb273Zz5edRITdYssUdgDiceru2C1gm4nleddqGQAbfY9VLatOop/RD6pIcSYtdRdm
	rX/Q==
MIME-Version: 1.0
X-Received: by 10.50.18.81 with SMTP id u17mr1254081igd.8.1375137323892; Mon,
	29 Jul 2013 15:35:23 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.9.113 with HTTP; Mon, 29 Jul 2013 15:35:23 -0700 (PDT)
In-Reply-To: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 29 Jul 2013 19:35:23 -0300
X-Google-Sender-Auth: ZUNCts_Z99TyYj3XXATNU_AwA5E
Message-ID: <CAP9ODKrDrN-Yb6oyk0sed_6B9tsAWG6KpuDG51zVojzjv9oz5A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Eric Nelson <eric.nelson@boundarydevices.com>,
	Rogerio Nunes <rogerio.nunes@freescale.com>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 29 Jul 2013 22:35:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Eric and Rogerio,

On Mon, Jul 29, 2013 at 7:26 PM, Otavio Salvador
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

I have submitted a patch for OE-Core to address this hardness to
add/remove distro features. It is based in user_features.bbclass from
Metro Graphics but I changed it to fit better in base.bbclass. Please
give it a try and comment if you have a better alternative solution
for this problem.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

