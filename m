Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 15F3660991
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 12:36:19 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id ca19so2624657edb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XlfE9LsVVl8NAikANPhSM9RvLzoTiRYi7Zz+v6vd7p4=;
	b=o+fPZDIM2gkBkAqjMyJtHq680YAs5lK8Mm9QEpaGZmnb3tGQ+JU8dwOEp6KgxByirB
	BvkmQj7rsVqNVoyEElEIVZVh10Zrdb7Pfo5h2VopSNGCPWSUvibWc8dKvjgpGjt+HAHy
	EIOKpTw0BgMoP42WiCeQpoo/KoRGNvUO+nFbzCGnT5hlvWFIT3ChV7T1w3qZsUqNGW4P
	QGDRqP5DELopJeaTrtkAxob6EAhBEfv/dbyLeER6LrSLE1pQPWtBj+lm1CJ4ZgJXlmur
	75eoLFa9lnxqztBtHcak14Dmk9qNwREatz/63Wo9MiP5aQ7levXVz/2DiQRiwYJwHUcc
	f3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XlfE9LsVVl8NAikANPhSM9RvLzoTiRYi7Zz+v6vd7p4=;
	b=hVeGBPY41JWusrEtoTvyb7XdbuZGdcmIwSul5feGTANrhUwqe/k0zNHayLswbOlRUW
	dZKQMEQym7zQFl0EjiJUyhcX0SVyF//XC6nljSjEVjBte9tSoykEU2NBMd/JKg9MaA8N
	kPpqNWlVb4PElsJw5PncmLhAeHt+D1Kmiajvpge3Bac8hDFCtHwiDoMz3INfS0yfWMVS
	n7BrOM+KKQma//oQ2+XjKdBcC9R+FFRbtNzoEAS4tWQlrsrNKvI+DRZnBGGtaOpoJA1I
	7RaqvL40D8+HjzQ6XEfvzAXWrrHiCpaNrFa5ObKIJEgnQBgF4PZ/GAIlDO4sWmA/raoU
	IRyQ==
X-Gm-Message-State: ANhLgQ12UgWIh9bJmPzBTMZS9rpAwVuNdOA5PwFOcGkEYJZ+69+v9VbI
	PI8Vz0BcUwG6/PdC6CRJnIKyeyvjMbUFyLdrJSA=
X-Google-Smtp-Source: ADFU+vtjYNKdOvgfDslqRO57Bn7U0p83KEst8t1VMhyfEHvbwZB0UTSDIFrJso4MImnoSXJ51Hm4fp/CJzI55Ag9SJ0=
X-Received: by 2002:a17:906:9456:: with SMTP id
	z22mr2242102ejx.327.1583930180595; 
	Wed, 11 Mar 2020 05:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <b1aa0d35-35bb-8043-fdd2-d57261eeb714@cn.fujitsu.com>
In-Reply-To: <b1aa0d35-35bb-8043-fdd2-d57261eeb714@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Mar 2020 08:36:09 -0400
Message-ID: <CADkTA4NOf2MXDkdta6o4MbEVTehSF+vY_D8ez53HjBgSzoDG6w@mail.gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: CVE related consulting on linux-yocto on zeus branch
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
X-List-Received-Date: Wed, 11 Mar 2020 12:36:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 2:02 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
>
> Hello,
>
>
> our team is currently working on CVE-related work. I would like to ask
> if the zeus branch of yocto has an update plan for linux-yocto in the
> near future. If not, can we submit a CVE-related patch for the
> linux-yocto of the zeus branch.

If it is part of -stable, then yes, it will be integrated into any of
the active upstream kernels. If it is in 5.2, we also have a -stable
process for those kernels as well.

If it doesn't fall into those categories, then send any patches
(against the kernel itself) to the linux-yocto mailing list, do not
send them as patches to the linux-yocto recipe itself.

Cheers,

Bruce

>
>   --
> Best Regards!
> Zang Ruochen
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

