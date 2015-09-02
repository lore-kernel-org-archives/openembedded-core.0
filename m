Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8D96877046
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 16:16:21 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so25983865ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=u32DY/kCTZXSMfTJeQUFkF5hgm3ewEhBA/HGLYwQ+Xo=;
	b=CHxtifsBGHqH9ENzSXx5fTUMZIl5k8VNysNuzrDurWeyNx1RqTgax+87lo4RMxApwh
	rgP8PuC90SP26+D2FDYgaY1hBpbTRb98UCtdpedvxMpfB384OlU2ZQNByK7c5NPHfpxR
	PA/qj5qLmyy7cKfknpeYG31vhaSzOO1Ud+29SCpBmD8PWzz5/cMf1V9CDWqhkYd8Ur++
	skv9hDtakpxfjFwrD9+SRR/20oxbvoAsBQrZR1qSgZzSkU1G+Kmh4jq3OvsPR9dWPOFW
	8A1gETxOEm1ikoR7JeGlN11V0VthJloezDK1naWQ/prFaRv8/hxvwO/+3uP+bJdjLIFB
	JuSg==
X-Gm-Message-State: ALoCoQl5I3Wf1D0lbrP6S8z6YzMpZA/6efJc+cFXsKdKumVBAL/IXgqZuBnjcXnMcKaWCCIgkNWT
X-Received: by 10.107.4.17 with SMTP id 17mr33880298ioe.10.1441210581290;
	Wed, 02 Sep 2015 09:16:21 -0700 (PDT)
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com.
	[209.85.223.171]) by smtp.gmail.com with ESMTPSA id
	hj18sm2512308igb.7.2015.09.02.09.16.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 09:16:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii196 with SMTP id i196so25857846ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Sep 2015 09:16:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.130.153 with SMTP id m25mr33755744ioi.192.1441210579686; 
	Wed, 02 Sep 2015 09:16:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 09:16:19 -0700 (PDT)
In-Reply-To: <e0cab1af2f3fa08d0a4d202c65fae83a927e1567.1441207840.git.patrick.ohly@intel.com>
References: <cover.1441207840.git.patrick.ohly@intel.com>
	<3b40bb267aa67a9c7adae08713d85060129a219b.1441207840.git.patrick.ohly@intel.com>
	<e0cab1af2f3fa08d0a4d202c65fae83a927e1567.1441207840.git.patrick.ohly@intel.com>
Date: Wed, 2 Sep 2015 13:16:19 -0300
Message-ID: <CAP9ODKrCzcUdfs9+GLsSe-ztS3c5BCmcLBPdmSayw-y9ZzPtkA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] initramfs-framework: add separate init_verbose log level parameter
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
X-List-Received-Date: Wed, 02 Sep 2015 16:16:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 12:48 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Using the general purpose "debug" and "verbose" kernel parameters to
> increase logging in the init script has the disadvantage that it
> also increases logging in other components, making the output hard
> to read (in particular with "debug").
>
> The new init_verbose parameter only affects the init script:
>   init_verbose, init_verbose=1, init_verbose=true: enable just some info messages
>   init_verbose=2: debug messages
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/recipes-core/initrdscripts/initramfs-framework/init | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
> index e8f4713..cd55ee2 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> @@ -14,6 +14,13 @@
>  # 'foo=value' as 'bootparam_foo=value'
>  # 'foo' as 'bootparam_foo=true'
>  # 'foo.bar[=value] as 'foo_bar=[value|true]'
> +#
> +# Special boot parameters always recognized by initramfs-framework (see modules
> +# like "debug" for additional ones):
> +# debug: enable debug logging (beware, also enables debug output in other system components)
> +# verbose: similar do debug, just less output
> +# init_verbose[=true|1|2]: same output as for verbose when no value or true/1 are given,
> +#                          same as debug for 2 - only affects logging in initramfs-framework

I personally don't see much benefit on this. The debug module is the
one used to debug the initramfs-framework script. If we ought to add
support for something like this, this should be done there.

A possible way to do so is adding in the module the init-verbose and
init-debug params and this to set bootparam_verbose and
bootparam_debug accordingly. This avoids changing the common code and
move this where it belongs.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

