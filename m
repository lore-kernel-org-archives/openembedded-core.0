Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id A786E7894C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:50:50 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id i19-v6so5834537otk.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 23:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pJRQc+pXiR0uZ8VJPu2CXDguNZaPtfBiP0eceoeX3HI=;
	b=rEScHkP2ZENFDgo2itvOsmId79RTx9LrhEXzTxYzZ4UeNLUKr2Tjv7ccTtQP5jVxm0
	bFUQigp4I/aJAwHdk7KqHxjMG5S8x7tTf3gA/T5MUxvZp3QXTKHPg3KoILwmCvI/KcIn
	YRA3CLaRyU2Gr+9FmklA/ws0SpQyZCTG4l6OO/oIrsAkJ+1ehXXXi0bzqXPvG19oVNwk
	GvkiiOpDFrVcRlpr8J+m6Ro74Z817/tO9XNro4SmcD4hK7oICdHBBJ6YNz3PujwruJ1w
	zqER3EOiLd+ILp84xV8lz+PMJHiAneckeBEeNg3ObSy204ujkv/MkxsIOvegkPv/C57H
	vQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pJRQc+pXiR0uZ8VJPu2CXDguNZaPtfBiP0eceoeX3HI=;
	b=URZBHT+7JzZA4VgzAbfI1QS7O7b6gGwbNvgeVPlSW6YbnSsi9m/jvsl08I5QKFOpHu
	yKyYeoaIxwhK2JZdZo8ryx9joRctt9cKQ+VawxEMG86xDTz1EbDMnaf4+u01TE6PowTu
	hrN9tKaRhyl6asM59Ea++j2fALYnKtOm/SVoDMR9eYtP4/MhH+FK6AQm4QJlDhLICoQU
	K3YX37U+pJTMX/ER3Yn+j0Led2QrQGz1e6L25U7WtZvUxPvXNu2wByG40xY7ceoi+qRY
	MR74JEtI8eMXeYZOiU8bhjzzibvElUfY9t9a+Pjh59bnOzy94yj6MPHSbnorJOpEpYzO
	GZDw==
X-Gm-Message-State: APt69E3SBgF6OpkOoUhB/YI1t8K1vdU2eNBmD/ZRjSSUCRLIli2EnKYC
	A0IqA5aOo8vCffg1QGebq01D49UWMsJv0tQx2s0=
X-Google-Smtp-Source: ADUXVKIH2HVCY8KSqNux6Pf05NHquUzLOFjDj9fTd3R50tomMMdkXLHf2kU/0xNOHkd8sl39eVKluCjGPJFd+OtlnUA=
X-Received: by 2002:a9d:50ad:: with SMTP id
	b45-v6mr629585oth.102.1528959051701; 
	Wed, 13 Jun 2018 23:50:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 23:50:51
	-0700 (PDT)
In-Reply-To: <1528920905-21801-1-git-send-email-jpuhlman@mvista.com>
References: <1528920905-21801-1-git-send-email-jpuhlman@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 09:50:51 +0300
Message-ID: <CANNYZj-BTnb_jGqA0nAwrjdr6mc11jPYmz+uTfRh7Ovpa5g7XQ@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] atk: Correct multilib conflict in header.
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
X-List-Received-Date: Thu, 14 Jun 2018 06:50:50 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-13 23:15 GMT+03:00 Jeremy Puhlman <jpuhlman@mvista.com>:
> +do_install_append () {
> +   if [ -e ${D}${includedir}/atk-1.0/atk/atk-enum-types.h ] ; then
> +      sed -i ${D}${includedir}/atk-1.0/atk/atk-enum-types.h -e "s,${B},,"
> +   fi
> +}

Instead of patching it after the fact during installation, can you
patch it at the source please? Then we have at least a chance of the
fix being accepted upstream, instead of carrying it forever.

Also, do include comments: we try to avoid recipe snippets that do
'magic' without any explanation.

Alex

