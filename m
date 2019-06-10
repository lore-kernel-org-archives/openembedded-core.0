Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id B0CC26C466
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 19:17:15 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id j204so842572ite.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4zW7b6LIOQPdGhesJ+GVteq0nVpS+ugJzq5E4WMhj5E=;
	b=UXTIfbofinjgQSQutw7ubO2YD9LuDhA9bAATfDK7W0ITYhJQsRYgR4vJCLbnZ+5Gw+
	XBwfXrGSMSc0GxWAJeM6bf1OJ6RtPb6GEOckmhAwoxZDrC8DI9OcaRIzLoOfjccDh7WH
	zWNlLfYJPyuxUlu8gH0wWmGeITaMzXX2XauZWHHNm7NH4NxJuN67hAAVJgIDrqGl8V3u
	H6uKfZFkV5QroD1MCihCt/aSFDedRIpvyaMkg3TaBZ8MpaLnH5nrRz/m5xCoVY61crJK
	aWs6eNn2Dnbii0v8ekUoPoNwUAfa5au/tsxMoU27CtIJ4FQ92AVMM/LvBAQpMxjP1daT
	g/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4zW7b6LIOQPdGhesJ+GVteq0nVpS+ugJzq5E4WMhj5E=;
	b=C9aJIVnE+Q4T8uwskNfvNmnB98E5DDe/IJ7C4cl6BNIPy1X4xN9GcSfo6U4pY9ZKjw
	+Jq86UczKTWFLAJV6/PleulQeeePgUOx9pfot7s0JmfWI+/j/L4UHGvTSkWZw6q2H2A2
	7V80xjZOH+AuHxZIDHrL2Rdsf9IEJjrnxsvLWc9S3vpFykk1uXTE6lvjkErHWcfpBCf5
	HOFA4YPBGfV10uXMfxpQFQly5RXW26g4FFko40SqhhUDb3pazxxQxBMgzF2SRJVWtIoM
	whuKUFkej0a3k25Mlc8GmLCyhtt0AgNdrASLI6b0VTujsJCG+Mbqqxo1p35LqfPI1LBw
	Lzsw==
X-Gm-Message-State: APjAAAV7u1mVZZpZaBS5C+lRf5RwruQZ8z2OnWz3zEKemlAjCQcmew33
	D9yKWg31SzvVAsnEambau8wmnbK2HjuxlW4q4Ek=
X-Google-Smtp-Source: APXvYqyigkuR3x/bDEpTLfADXpoNLSsv+dNZesIRFe7XFsJYmavORC/HEagOQTwv+jZiGUXWOwq0X6aqvfsK3wl/giU=
X-Received: by 2002:a05:660c:503:: with SMTP id
	d3mr16588283itk.126.1560194236880; 
	Mon, 10 Jun 2019 12:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559574291.git.akuster808@gmail.com>
	<5d70ab1ba3570ff24d5d118805ed0d9bafad022d.1559574291.git.akuster808@gmail.com>
In-Reply-To: <5d70ab1ba3570ff24d5d118805ed0d9bafad022d.1559574291.git.akuster808@gmail.com>
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Date: Mon, 10 Jun 2019 15:17:05 -0400
Message-ID: <CA+rxa6oyS5W1p8TW850CUU5TgZ896+sT=ccb4dQiD-AmPOfxAQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/21] openssh: Avoid PROVIDES warning from rng-tools dependency
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
X-List-Received-Date: Mon, 10 Jun 2019 19:17:16 -0000
Content-Type: text/plain; charset="UTF-8"

Is there any plan to add a revision of this patch (From OE-Core rev:
f93f026212ebc28fce66682cdb995e061586df45) and a revision of the patch
that fix the "sshd startup is delayed" issue (From OE-Core rev:
9b01375236e19e3366c58877c4154d7c71632984) into thud?

p.s. I already added the change into a bbappend and tested it.


Regards,
Sylvain Lemieux

On Mon, Jun 3, 2019 at 11:08 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Avoid the warning:
>
> WARNING: Nothing RPROVIDES 'nativesdk-rng-tools' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-connectivity/openssh/openssh_7.9p1.bb RDEPENDS on or otherwise requires it)
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_7.9p1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> index 976bcc5..3b4ed72 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
> @@ -148,7 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
>
>  RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>  RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> -RRECOMMENDS_${PN}-sshd += "rng-tools"
> +RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
>  RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed"
>
>  RPROVIDES_${PN}-ssh = "ssh"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

