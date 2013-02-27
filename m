Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAl23-0000qG-5Q
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 18:43:08 +0100
Received: by mail-oa0-f43.google.com with SMTP id l10so1698095oag.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 09:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=IDviT8O5Em3pBJJdYdfZpGxhQ0DRJMTqYgAWuNNP5hc=;
	b=UMFY9HIHXvHcwd15rntI1GmOwyREoBDc7oasanmrdGObQirTYksO/D4OGoTmaQbWRy
	UpuK2u1vT9W/RiVRrDr/qW+7dAxrSntpiJQ2mhudy/DFaUK4ILI/LUOVU/LlvyLj3Yh8
	c8hjO0rIPjqBpw5xXrNuDFG5ZytMLBXG1yQ9qXfyQ5GlLigBpszyg54N1lhRnKot8nAo
	qRZS5N1N3Hmecv6dZ8vRvyAqeuPIqpfAIRiecPPqA4An1ng/MNjGBTUB/AludRHUoUO7
	3roXRcdGBQmesRzcxQ9/viYcy6pK6hB8wMZRGWeRxAry3FFfrgKnP086O5OczqWtsxxW
	KklQ==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr3134023oea.4.1361986005782; Wed,
	27 Feb 2013 09:26:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Wed, 27 Feb 2013 09:26:45 -0800 (PST)
In-Reply-To: <b4fdb05f5e0f97b427125f27e4d824f09eb7c651.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
	<b4fdb05f5e0f97b427125f27e4d824f09eb7c651.1361974597.git.ross.burton@intel.com>
Date: Wed, 27 Feb 2013 14:26:45 -0300
X-Google-Sender-Auth: s-V8rjLoh5Lrjzv3XoZeRhQEmyE
Message-ID: <CAP9ODKqP=z-LLbaJy70aF1YEsL3EGLRC2CS_fmdrEpg0ONWoQg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] systemd: set the location of the kill binary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 17:43:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 27, 2013 at 11:17 AM, Ross Burton <ross.burton@intel.com> wrote:
> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
> work on the target.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


