Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsB18-00068E-R0
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:37:24 +0100
Received: by mail-oa0-f43.google.com with SMTP id k1so17545457oag.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=GSPiCCaUqUDcf3mFx5kOLWraBaV8SdEPIYrQZyuBLww=;
	b=PGjB6mdL/bM3BVnQE5+2X4d/BaRsAt5VTaCxDb47XoKvqO3eUikI82V5NTPcOsB42C
	x4PQ+OgDqVCRiMimlboLp7sGVYG2d9gGZHR5zzvhrfvSWGO9YT1yIFNO9Cu4cTX/hOo3
	zzwpTwsuO01j/8HTZ9+FWcJYXSCqiI3pOnytZxfQ53izSqm/8JzdePkQrilYIeLrpnRE
	oZPw7iOtrz1dWQeBkAPb6S+GI/NUcZWL7eN1SxogxTcqBkfFEJntqEYsTIPDw4Mnv2mV
	ljIwLi42gM9e+YN8iwzWP/TOnJlpb5mRCAKEYW6dzwz+QpCjb1xicCPHuZalH6zhpq2M
	FgFg==
MIME-Version: 1.0
Received: by 10.60.171.133 with SMTP id au5mr33431478oec.90.1357557732211;
	Mon, 07 Jan 2013 03:22:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 03:22:12 -0800 (PST)
In-Reply-To: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
References: <1357557340-28756-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 7 Jan 2013 09:22:12 -0200
X-Google-Sender-Auth: gOB5jRit3JkhBY_IN2MvWSgCZtM
Message-ID: <CAP9ODKrqu-2z8v2o2d=iLykX5MrHc9PgTfe=tP4FGuHky0jbgQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dropbear: don't use IMAGE_FEATURES
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
X-List-Received-Date: Mon, 07 Jan 2013 11:37:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 9:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * IMAGE_FEATURES are image specific, but dropbear recipe isn't
> * if you have debug-tweaks in EXTRA_IMAGE_FEATURES or added to
>   IMAGE_FEATURES in distro config, then it will set DISTRO_TYPE
>   to debug as expected, but if you add debug-tweaks only in
>   your-own-debug-image, then dropbear never sees debug-tweaks and
>   your-own-debug-image won't allow empty password login.
> * best way would be to patch dropbear to enable empty password by
>   runtime config or argument and enable it in ROOTFS_POSTPROCESS_COMMAND
>   like openssh_allow_empty_password does, see
>   http://permalink.gmane.org/gmane.network.ssh.dropbear/845
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I just fail to see why to keep using DISTRO_TYPE in dropbear in this
case. You could just always include the patch.

Do you have any specific reason?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


