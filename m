Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SyJoB-0000MF-0n
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 11:41:07 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 06 Aug 2012 02:29:21 -0700
Received: by obbuo19 with SMTP id uo19so4819873obb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=p5ef39NCiM1bQU1pPjvddvGNIWq9GT4eOrDZ++2dRAI=;
	b=AeNiTVpLw3hZZAscPzh9mjq17yft+cj9njZVi6Fc1sjRs5mJZumhFVa/SY78Uehkug
	h8bxrrgUoBBLMCM8J8JDoteC+wJm4TKL+HvP5+Z5FLUnCoYxv9F8LjpEgyppZtyXeeHy
	IK7EY17eHoCF3nvlIjb0Gj/SZ+m3J4CMiGhzS14hQV1/xW3vYaDNO33futxvBlJigH3Q
	wyMd3M63rBl1qMWODfNATTGU1q3fNVaF/5a+Au3g0UXkFne+/F9NVror2nki/VjsKPcS
	qjkSACInMd5hKluUlXcaKyoL0FcqKMYHJe/1iuMdP5z3XLX+5HwaAG76U60+ZtpV2Gfq
	hkmA==
Received: by 10.182.45.41 with SMTP id j9mr503978obm.67.1344245360219; Mon, 06
	Aug 2012 02:29:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Mon, 6 Aug 2012 02:28:59 -0700 (PDT)
In-Reply-To: <8db627a00e95e0f72a8c18eb31ddd5c06df99454.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<8db627a00e95e0f72a8c18eb31ddd5c06df99454.1344022584.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2012 10:28:59 +0100
Message-ID: <CAJTo0LY=M_j423OwyWjmNt2JTUEhyZ7xOE-HdYoSXqyJH6X0dg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmrqedXFrMozr9smlPyg6oAQg2H2nt+20qy7Ulnv7nHJ75MTW8S0b5AgMqbXxyjWawRN3ai
Subject: Re: [PATCH 2/5] sato-icon-theme: make postinst scriplet run at do_rootfs time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 09:41:07 -0000
Content-Type: text/plain; charset=UTF-8

On 3 August 2012 21:19, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>  pkg_postinst_${PN} () {
> -        if [ "x$D" != "x" ]; then
> -                exit 1
> +        gtk-update-icon-cache -q $D/usr/share/icons/Sato
> +        if [ ! -d $D/etc/gtk-2.0 ]; then
> +            mkdir -p $D/etc/gtk-2.0
>          fi
> -        gtk-update-icon-cache -q /usr/share/icons/Sato
> -        echo 'gtk-icon-theme-name = "Sato"' >> /etc/gtk-2.0/gtkrc
> +        echo 'gtk-icon-theme-name = "Sato"' >> $D/etc/gtk-2.0/gtkrc
>  }

Surely sato-icon-theme should be inheriting the gtk-icon-cache class
to remove all of the duplicated logic?

Ross


