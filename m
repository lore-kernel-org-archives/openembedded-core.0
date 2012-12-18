Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tl09p-0006zU-Ks
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 17:36:44 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so646233pad.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LrP6caB7va8yvV5ATXifU4BZPhwE3UqUtjDpwMKGNfs=;
	b=q8hO7BVmu6/4Th+XH9QE9qAbyUsGTX9TIZ7gm8bIpSSJGg9u7RAlKou2FX0F/9SmeR
	My8bHn+mIOxaEuST/8r8uYwzffoLov+dKHsyXJXRaCEgQJcOX7r8+ib3qkN3SnoYYz6p
	wLGHPrQAZJw+tRjr9B/jg+5YMMEw++qFZmxC1j9U3fW0/stsbcaNT2SVK2xFLRYE+8Zm
	Mp0tkUkxQ0NEHPjr027QbTDnVE1ksI7AupNHboXqcTY3YSe+Gep9wxtdiHmQTO28XHOh
	1u2tmlQt1X8JhtsmRtIlkXttKSpkYJBGaWZHa5EwNptxKO90EmzIgjTcWWf0D0XBaJVb
	c1CA==
MIME-Version: 1.0
Received: by 10.66.72.198 with SMTP id f6mr8092768pav.42.1355847719022; Tue,
	18 Dec 2012 08:21:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Tue, 18 Dec 2012 08:21:58 -0800 (PST)
In-Reply-To: <CAJTo0LaCj0EtR519zkt-y6GELWA_kuYSV+OynB935ev-uuXc0g@mail.gmail.com>
References: <1355845633-16899-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LaCj0EtR519zkt-y6GELWA_kuYSV+OynB935ev-uuXc0g@mail.gmail.com>
Date: Tue, 18 Dec 2012 14:21:58 -0200
X-Google-Sender-Auth: mH2d3FoxFzQaMS3F1xWz_qzOYwc
Message-ID: <CAP9ODKr7_SmWEWWDa9fwxJ_QBmCQ24x-wdMHSWCfjmoUAcRt+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-toolset-native: should not have mesa-dri-glsl-native in this toolset since there are no providers
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
X-List-Received-Date: Tue, 18 Dec 2012 16:36:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 18, 2012 at 2:11 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 December 2012 15:47, Saul Wold <sgw@linux.intel.com> wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> To clarify for everyone else, mesa-dri-glsl-native is only used by
> mesa-dri during the build and isn't useful outside of the build.
>
> Upstream fixes have meant we don't need a -native package anymore, so
> it's been dropped in MUT.

MUT?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


