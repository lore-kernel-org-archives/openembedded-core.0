Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id E51FD79F45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:38:04 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id b5so8729554iti.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ypjKgFEormGMm5wcwfU3jw4nP9d2qud5P2ej6JQEOJM=;
	b=mH2Edgl09kqbepRHCebs6PN3lOKpaG3sUU6vdEb7AY55JAgYgc5fuPaifYugE3wFnS
	JSKdztFjGE4EDcCdOclSKhONb821G87zO47S5IYaD6RP5t8LoxqNz2EpGDwmgpBHf0Zc
	qHe/t2t2q+wh0nnOrl4HSn3pc38LucZN8cPJpPrJRXZt9hn7qLc+6gO/CdK/xRsC5EnM
	9IgXeEa1F++P4vaA3ii719h8/LEhhGeAi2p98XPdI4N1Pp007i367ZsOMK5OVXgfL+zH
	zB4Gtx/WS2yhMdtQk1OcKGhtRvuYT7Femyc/V+ZB3VvZTDzqVfXZ3ybhGapT8TARNHf9
	0rFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ypjKgFEormGMm5wcwfU3jw4nP9d2qud5P2ej6JQEOJM=;
	b=DvZSrQF/BZUjWAmnViNCw7Rh6mm31qDefRZhMaJZt2zc9EfhJbZnLtONnwtfhFompO
	rcbCWzrfPIx6PMcA0+VMeEmyVPlbjk//YScs8Fe2oNTqTjsi/26yGCC7WeQNxoafhgug
	at22I5LXdVAlc+aOL7lNRh7ewfcpygFTdwBPyzPRzRgFH8cAZ8FD/bdmuKdiE542BA7S
	7AwdzqGrJcFa6JZU4HZ728GDRjC03P5fM3RlQDedE8eUSK4HAYU9KMBJM4FVktETuKx3
	1OqJDAmafeM2WawKagb7s9wXKCihh8Jnx6pDAP/0HWFm72j/DvoxJ+aGYGCAl0ThAVDk
	IgFw==
X-Gm-Message-State: AA+aEWbBkbgn9hQ90b5ObUBJOlB+P2kz44DyUQhHRX/qF/ybE1T7Q4MJ
	qYRZV2y7+2eVxwoDrJv8k8JP6OBOmVPocs1P3gKNT7yBXQE=
X-Google-Smtp-Source: AFSGD/Vfg1J96eoibHApvRbeSkc7x6GHAo1W6T5ISimVDj54ofGP5XSpn8oXXVy5VJh6Clt7lMZoea4sqrzLBxPqIRI=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr19465792jal.31.1545215885869; 
	Wed, 19 Dec 2018 02:38:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545202218.git.liezhi.yang@windriver.com>
	<f8c21c17d3ad2ca31c4b26b23b74ab0bdefd2c77.1545202218.git.liezhi.yang@windriver.com>
In-Reply-To: <f8c21c17d3ad2ca31c4b26b23b74ab0bdefd2c77.1545202218.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2018 10:37:54 +0000
Message-ID: <CAJTo0LZOd5hFgFWqvYL2ucusTLCNymf9Jo__yf5Hd1SGeCytrA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cmake-native: Set --parallel for configure
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
X-List-Received-Date: Wed, 19 Dec 2018 10:38:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Dec 2018 at 06:34, Robert Yang <liezhi.yang@windriver.com> wrote:
> +               --parallel=${@d.getVar('PARALLEL_MAKE').replace('-j ', '')} \

See oe.utils.parallel_make_argument()

Ross

