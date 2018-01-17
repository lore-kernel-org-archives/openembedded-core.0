Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 40A2D78733
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 19:04:09 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t12so12123757pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=4j6X0fG2Ngh3fymbRmWNkv3G05dXf2MLlD0ApHUgdLI=;
	b=DD/rC7yifH5R+jn4YI31C52BkLdtTPc9Ah96NSr/JQ+I3IVKl+6xQRx0tMExDssdpW
	B804kNqEtxLqgmHkl98Zbg/jz8kKXK+y6tbqyQsfiLv0YquzskKDJ5RmtdAv4X9N7dEW
	OeY88vf1liuhJEEP/V9eoUc+5upq2KTMDzhThV45CEIhP1Mc9QMlfAzBQRhwSEgo8+dQ
	KwE3NP2n0ZqSmaWIEmNwuzq19s4el20Qy6GAfDC7dpvw4jJlbqn3QrUmhO5J5ouXqfLE
	SLcVPgQqagS2sygCmeJ4eZaWYJd5ejfd2B/ZznbOn1ZwUOGps7I9DczzeoVJNeNxbQFA
	ofxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4j6X0fG2Ngh3fymbRmWNkv3G05dXf2MLlD0ApHUgdLI=;
	b=eVZlB+rbJr+2h2llmhaBc1P4fAJvg90QlaW43+4dhgrDxPJ/DESzSy5SwRokldx/4t
	0LTIZEpP3j1mtwaFwJco3nscXdLk7UJgGaz8llecYu68JpF0ir8PZIz1/K3vPoRX8qYb
	mMaGM7rYBkg0G9qMD2d7abLThZ5m6GhGjZcIWJruxo5zpEaWGFxhwo/oG36Ddo+r5mtT
	p289QaAcu2+BDam84CFYlA+v8CG6XgdBvEB2Icqp8xZeQnt0FDvygJ8skto7SL1Vqmy4
	dHd0TtoSSyg43Xf2NMHCz4Q24glxbuGDJuC/BrAT/tmCWeTRzkK/V09gDa5RNev/7X2h
	WQzA==
X-Gm-Message-State: AKwxytfIx1Gti3F9/XBD6LuqUaMage6G6pOtw27CTAsrB5ZFAhB2/O/4
	RVQVGEuk7vNA2rWtfvZVnT3syg==
X-Google-Smtp-Source: ACJfBotrBIjRc2BEog3lSPOlKFDQzoLZ4gNMtFPPc4/3NapAg4gaYw/CbAmK/2xp7jbxc7Hg/vpHJg==
X-Received: by 10.159.214.141 with SMTP id n13mr10976840plp.33.1516215851192; 
	Wed, 17 Jan 2018 11:04:11 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:242f:c14a:feac:fa0c?
	([2601:202:4000:1184:242f:c14a:feac:fa0c])
	by smtp.gmail.com with ESMTPSA id
	e190sm9421765pfe.15.2018.01.17.11.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 11:04:10 -0800 (PST)
To: Stefan Stanacar <sstncr@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
	<1515686841-28097-2-git-send-email-sstncr@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <8270727b-0177-4b21-7235-6febe3bec51b@gmail.com>
Date: Wed, 17 Jan 2018 11:04:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1515686841-28097-2-git-send-email-sstncr@gmail.com>
Subject: Re: [morty][PATCH] kernel.bbclass: Fix symlink creation when using externalsrc
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
X-List-Received-Date: Wed, 17 Jan 2018 19:04:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 01/11/2018 08:07 AM, Stefan Stanacar wrote:
> do_unpack is by default in SRCTREECOVEREDTASKS so this append can't run, since
> this tasks gets removed by externalsrc when it's enabled.
>
> However this was hidden because externalsrc does run do_fetch and do_unpack if
> there are type=kmeta or file:// entries in the SRC_URI value of the kernel recipe.
> (e.g linux-yocto).
>
> Make this a separate task so that it actually gets run for kernel recipes with
> no file:// or type=kmeta in SRC_URI.

Is this fixed in Master?

- armin
> Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index f8318b8..3eaae03 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -102,7 +102,7 @@ inherit ${KERNEL_CLASSES}
>  # the symlink.
>  do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
>  do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
> -base_do_unpack_append () {
> +python do_symlink_staging_dir () {
>      s = d.getVar("S", True)
>      if s[-1] == '/':
>          # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
> @@ -119,6 +119,8 @@ base_do_unpack_append () {
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> +addtask do_symlink_staging_dir after do_unpack before do_patch do_configure
> +
>  
>  inherit kernel-arch deploy
>  


