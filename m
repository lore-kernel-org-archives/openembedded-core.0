Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5905F6028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 21:51:05 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o6so2379695oag.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=p57Eu98tUofTPgcUJfu8qlvVKSxbKpiWq5uUT9AxkDs=;
	b=yElA45xJxD5y6SPXU/C20i4coGzz83absVtKbFP8+bzoCXsjUaIgIJFde/kXWEByYa
	UdsqgABoJoj9AW+cUgOssRMAN3Vq8CGPfc/IPTaJpa+Z2JZ4fvi1yCsGrVAtq9JXy4Re
	gaDwP3jYduN7hMzEem0fAKvDipZGyj1+ovwBDl6GQ1f3GgxNA1zFJAjsxf7Qg9/87MKu
	38xx81gHAhuhNOmAWhlh5RB5zfohL1bMEtjoeC1G+C2UUkJj8VpD6g3juftHLKERh8OD
	1szd/LpcvTF09AYPxZz5b6ih/fD26A7OMQDtdRlOsmO8AkbhePVDMTJZGoWR/kgCTB1h
	osYw==
MIME-Version: 1.0
X-Received: by 10.182.27.74 with SMTP id r10mr32884701obg.63.1374702665391;
	Wed, 24 Jul 2013 14:51:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Wed, 24 Jul 2013 14:51:05 -0700 (PDT)
In-Reply-To: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
Date: Wed, 24 Jul 2013 18:51:05 -0300
X-Google-Sender-Auth: I61TrGNukLlwsdRxLHzPJK-aMNE
Message-ID: <CAP9ODKouv4sp08h5dnm4M=4bfhewoqSSqgPiTiQm=VyN7=gZCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Wed, 24 Jul 2013 21:51:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Chris,

It is always good when you come with a 'RFC' thread ;-)

On Wed, Jul 24, 2013 at 3:54 PM, Chris Larson <clarson@kergoth.com> wrote:
...
> The standalone systemd-tmpfiles recipe I've created has a fairly small set
> of dependencies: intltool-native, dbus, libcap. Given this, I'd like to
> propose transitioning away from populate-volatiles to systemd-tmpfiles, even
> for non-systemd images. I think that the update-tmpfiles shell script may be
> of use in a transition, but before we even begin discussing a transition
> path, I'd like to request comments on the notion of moving to it at all.

I think it shouldn't be hard to make an C app or script which could
parse systemd-tmpfiles and use this for non-systemd systems. What do
you think?

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

