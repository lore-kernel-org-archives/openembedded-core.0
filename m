Received: from mail-vc0-f176.google.com ([209.85.220.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1USNqm-0003Uj-Pp
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 10:36:25 +0200
Received: by mail-vc0-f176.google.com with SMTP id hf12so1101674vcb.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 01:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=kUljuEer/C9Qc/fc1BaFTprT12ocJews3j7qen9P74Y=;
	b=givJrEp7xfmMiaznFeo0dzd9bBmgoOJiKcs4EI0X1T5HoElG/gQ+/CckYX7W6El6uT
	6i8oiiAVX38p0cliQzgsX/pPvA85FIRNHpImBVGbGONG6HJj+BoR8Ix80nAZVvvwwkQa
	8c9KMEOcjjls5iH1tMYDC3FB+ZCUbxCK2uWrExpDKVrOZCRPYpmM101Y5TQwVnrt6eK2
	BH/sNBarJg6QzjwIN16iavGhJdM7/PSqVhaDJutEKnAoEBUOJaKKU5oPZNW1QXx06cJi
	/3nPA/WpF872C6iCSMySfMgK9I+ebIM7P1yFrdJy8tV9+3CCo4b0hD14OOYutEB5CmXc
	TUrA==
X-Received: by 10.220.155.8 with SMTP id q8mr4056436vcw.42.1366186729034; Wed,
	17 Apr 2013 01:18:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 17 Apr 2013 01:18:28 -0700 (PDT)
In-Reply-To: <1366140144-30458-1-git-send-email-obi@opendreambox.org>
References: <1366140144-30458-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Apr 2013 09:18:28 +0100
Message-ID: <CAJTo0LZB5y=D0XevQbcc316=wN9TokaMEJwAhops+2TVceMFxw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQncWGL2ykSW5zRgDycuBqetLGlR/gfZFWHkvdVxlJE8V2E9bxf0eUD1Ove7dP3o+UVsVuro
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] separatebuilddir.inc: disable libmusicbrainz
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
X-List-Received-Date: Wed, 17 Apr 2013 08:36:25 -0000
Content-Type: text/plain; charset=UTF-8

On 16 April 2013 20:22, Andreas Oberritter <obi@opendreambox.org> wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/conf/distro/include/seperatebuilddir.inc |    3 ++-
> -B_pn-libmusicbrainz = "${SEPB}"
> +# CMake Error: The source directory "[...]libmusicbrainz-5.0.1[...]/build" does not appear to contain CMakeLists.txt.
> +#B_pn-libmusicbrainz = "${SEPB}"

As libmusicbrainz isn't in oe-core anymore, we should just delete this
fragment instead.

Ross


