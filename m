Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id EB5246AE37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 12:13:57 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id jy13so1417373veb.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 04:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7X7JmGm9eNKPjWSuVXtcD9t1U86Z8W8qcBVsfN6CTlY=;
	b=CogX+iKrlKOZnfCUbq+0FTOPEGi3MeAKvkLJG1vD+JzTn2Znih+UxXOHDSbAusW+Q4
	j2CgcXO4jrVjLWV7cP8/yREnS6uyzcsS2K8HaRsTZM8CIZf44J+U7kdq2ycmvidqGllP
	u5fS1uS3cNoLAk47o+WS/QstLFxmC1oe4QhKCcH+YwbZf7/Ujnmm4GmQbhUT/lwqm5Gp
	y82H7DI4RFPDQgEKjVoRNP5e5nv9D0tskhggHqJMqShMbyO+nfmKvfUNb6T3Fhsa5n8u
	bkEtMiLojlS+1P9JwY4f7QklnbdDgkZ0QqN0aOn5S5IQpba6KxtFvxT8WihFZZPHInS1
	wo3g==
X-Gm-Message-State: ALoCoQnzhnReOFhr/g7IDOjBbKPDNWNcfhkDJxsiA0Z57QyC2PllsY8gZhp6OymSkzVQnUNUXZDN
X-Received: by 10.221.6.195 with SMTP id ol3mr881212vcb.34.1383912839164; Fri,
	08 Nov 2013 04:13:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 8 Nov 2013 04:13:39 -0800 (PST)
In-Reply-To: <1383853654-8658-1-git-send-email-dv@pseudoterminal.org>
References: <1383853654-8658-1-git-send-email-dv@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Nov 2013 12:13:39 +0000
Message-ID: <CAJTo0Lbt_36U_uPM7f=P-2Cqa2k9N3FcDwkdeKpHNx7E3tctFw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: upgrade to 1.2.0
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
X-List-Received-Date: Fri, 08 Nov 2013 12:13:58 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2013 19:47, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
>  PACKAGECONFIG ??= " \
> -    curl eglgles wayland \
> +    orc curl eglgles wayland uvch264 directfb neon \
> +    hls sbc dash bz2 smoothstreaming bluez \

eglgles and wayland should respect the opengl and wayland DISTRO_FEATURES.

(I've got a patch I was going to send to do that but if you're
upgrading to 1.2 then our patches will conflict)

Ross

