Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3qXO-0002NF-Es
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 17:10:54 +0100
Received: by mail-ve0-f170.google.com with SMTP id 14so3467167vea.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 07:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=/CV0bMlcb413UR8B25xLclcKDcHTHnLa/pLjKRxhkXk=;
	b=Xv8l72Dg/Jy6vdW+Tnf9DLqAOwkv7p/HSGzToKwwn07Ho/thCDmNP46iLdZM3gzpT4
	IVLhlmgtwkCLIwTakdKl8ov9h8HcFJYnRow7+/axMkCRuJS/aUCj3S7HDSbZKbmA0siM
	JjYENjXJXD0C5x5xCrYHrabELdJ/9LN3eINcyeyJazHTnrPTcVyWHIWo7pyGe/dK7Dbh
	wDsOcqmTDFQQXkhxIkXAlNGQZGovDItD2h9aXYToLydhzOseciDDsztnvp0X06U2+Zok
	aBcilDY1RA+3L5Ht9kjcso4P5T5a0ZEpseJ84oDAFgHrwcJIa8W7O9EC+++8tWOe6DkF
	pqwg==
X-Received: by 10.52.90.243 with SMTP id bz19mr6263484vdb.112.1360338899960;
	Fri, 08 Feb 2013 07:54:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 07:54:38 -0800 (PST)
In-Reply-To: <1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
References: <CAJTo0Lbf+qsJd2R_39bN2GDHZNbncKPZFa1VUQiHn7USVZy_iA@mail.gmail.com>
	<1360336833-14523-1-git-send-email-ml@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 15:54:38 +0000
Message-ID: <CAJTo0LZA7DuncMdkVwcoFr5ByQ=2fHOqgM97HD2TDokudoA+8w@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQlkzoQGVk6iWzyAZ+9hl3SUeCaEI8PevyxoSl3CL66+8B1ezdLQyFuMDglaNRj9EFYgV/61
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] packagegroup-core-boot: add VIRTUAL-RUNTIME_network_manager
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
X-List-Received-Date: Fri, 08 Feb 2013 16:10:54 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 15:20,  <ml@communistcode.co.uk> wrote:
> Now netbase has been split into netbase and init-ifupdown, the user should
> be able to make a choice on which network manager to install, and not be
> forced to install init-ifupdown alongside if they wish to use a vanilla copy
> of packagegroup-core-boot
>
> v2:
> - Update packagage-core-x11-sato to use the new variable

> @@ -26,6 +26,8 @@ RDEPENDS_${PN} = "\
>  NETWORK_MANAGER ?= "connman-gnome"
>  NETWORK_MANAGER_libc-uclibc = ""
>
> +VIRTUAL-RUNTIME_network_manager = "${NETWORK_MANAGER}"
> +
>  SUMMARY_${PN}-base = "Sato desktop - base packages"
>  RDEPENDS_${PN}-base = "\
>      matchbox-desktop \
> @@ -40,7 +42,6 @@ RDEPENDS_${PN}-base = "\
>      gtk-sato-engine \
>      shutdown-desktop \
>      libsdl \
> -    ${NETWORK_MANAGER} \
>      "

I meant to keep the NETWORK_MANAGER variable as that's the networking
UI (connman-gnome is the panel menu), but also add the VR_nm variable.

Ross


