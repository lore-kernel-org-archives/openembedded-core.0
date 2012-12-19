Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlNrK-0008A6-F5
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 18:55:19 +0100
Received: from mail-qa0-f71.google.com ([209.85.216.71])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Dec 2012 09:40:25 -0800
Received: by mail-qa0-f71.google.com with SMTP id i20so4269009qad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 09:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Ic8sYNIp1qep+0F+iPYft7MXl+Hn2uEYReCSds6ydoE=;
	b=d8cwsXFWk74PDZlPzTOaSo1UyPT5PO6izPQ5pCQU0Gm7PuaS15AyAalCNPR0/Y/JIZ
	svBI6iOKhXC3uXNgSuGc8DXGJ8gg1MK5AdvHjEDYV1bgprVOD0hf27LI3c96FnWXF/my
	apo9EY//hOf1sbinolnKM/PezHAcVQKO7+XzWIEnyU+3ke1rC+pddNWY7eO5O8NvG2Ix
	iSW6OUK9uP0h5eh8p9FW4r7sXsDPdKS2IgP4QLCUVhny5BtECNBx1Jufe9847fIdXf3U
	Pxyu6D3uv/AYKEYSwR2Ve2UHZ5M3ZIiEwbDI+WRGqvKsbTcOafQ6l9y8cwlCGamDB6rx
	JkdQ==
X-Received: by 10.52.34.19 with SMTP id v19mr8744176vdi.128.1355938824113;
	Wed, 19 Dec 2012 09:40:24 -0800 (PST)
Received: by 10.52.34.19 with SMTP id v19mr8744172vdi.128.1355938824058; Wed,
	19 Dec 2012 09:40:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Wed, 19 Dec 2012 09:40:03 -0800 (PST)
In-Reply-To: <1355932969-25071-2-git-send-email-laurentiu.palcu@intel.com>
References: <1355932969-25071-1-git-send-email-laurentiu.palcu@intel.com>
	<1355932969-25071-2-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Dec 2012 17:40:03 +0000
Message-ID: <CAJTo0LZLZ34xpquSw77Z6v-6Kd3Lwrbz+-QB9d966my3g_sgZg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQmul/zHO/z4+jAnjp8z8VIA7D0+OLhIYLFvawOkGVxve7poM+2/IEuwuXQFvhkw0QyUcM3GriOqxHLlI1WyNEvMbVdnXXyd10wXzdqFLPGL1KmMnhpjMKgid/dgxrB5T7//R9mWgAbSXsPp7y7TQ+51faeqSZkBI0V+HoJB69IQNvfktal3K1SWhzwl7AmmLaTkPFAF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gtk-immodules-cache.bbclass: allow for offline cache generation
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
X-List-Received-Date: Wed, 19 Dec 2012 17:55:30 -0000
X-List-Received-Date: Wed, 19 Dec 2012 17:55:30 -0000
X-List-Received-Date: Wed, 19 Dec 2012 17:55:30 -0000
Content-Type: text/plain; charset=UTF-8

On 19 December 2012 16:02, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> +        DYNAMIC_LOADER=$D$(readelf -a $D${bindir}/gtk-query-immodules-$maj_ver.0 |\

"readelf -l" means less output which is always good.

I'd like to see some of that logic separated out into a bbclass so it
can be easily re-used.

Ross


