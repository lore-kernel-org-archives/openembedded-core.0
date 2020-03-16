Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12D7E60273
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 13:07:46 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z15so21108593wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 06:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Djp4oKvip1as1fiHwk2fbuCDsBlSKln3cXHFKTRpgF4=;
	b=CanACfEUlNk2LwzVtNpS9PJNM+yy+Hfzfzat/UCztXeDsjlVVCmMzGxFqEpltPrLJS
	uzMkuev+rijauAiPNZ6g8Qm4EeqzBShdvgpA/ClMr5S9MZ5PT7fn7J0LaT1uRea+6gi6
	nF1byL6ViT3aXZ1aPgl54bwIDfoe/ISAO3g/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Djp4oKvip1as1fiHwk2fbuCDsBlSKln3cXHFKTRpgF4=;
	b=GG4WS8R3U+uEvTE7yB+58tSPI9fl9c8AD+4kicL9M2UcvSK0CIs9/fUXo1NjdZGFxP
	NzUa0rGkbBrV7HLmYOLkW3YuoFQCzfVzaHDjQ5Z+ocYgQ/QbEdNlvP16B89D/0FtLjxo
	YR5Kz3sA1ufucqJwYjgh0ipr+56p6ZrXHsdl0puDGIS1/+5TSOpMjJd8B674z6E2+Nfe
	qQOsPoC0M/CXsK9zQJtehS6Nt26xKH9IC5Iy1qhYmvCcdInjjnUf6Y124dtUfmeouJyY
	APZLllxNga0C6qrj4Gu5bUDCo35nVoz8diawsoxKhXD4RW0MDzgiPNaUQhH8lEvVty8E
	woIQ==
X-Gm-Message-State: ANhLgQ3UvvOBPyMmFmi8aBgi+tS5kWPQkGDi1uKzbMCkrYpOVtUDt4Lt
	k0m5hynVNfUKBPbwJSljZTnxrg==
X-Google-Smtp-Source: ADFU+vu/2nuizJJOlKu3et7U39jQ26klw48cUjl6F3HdOIulyad0OWGdygymkR8ZXSHP20CLGqUMcA==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr852356wrv.186.1584364067525; 
	Mon, 16 Mar 2020 06:07:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z19sm31232424wma.41.2020.03.16.06.07.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2020 06:07:46 -0700 (PDT)
Message-ID: <df089c009e2e77be0383c6b1222cfb71095669f0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Mar 2020 13:07:45 +0000
In-Reply-To: <bab60f8c-3c52-48e4-c453-db2cf1ea0542@siemens.com>
References: <20200306153234.23875-1-andrej.valek@siemens.com>
	<fc1e74eeded8fc881df72be0623b528a7c0e6d5f.camel@linuxfoundation.org>
	<bab60f8c-3c52-48e4-c453-db2cf1ea0542@siemens.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Extensible SDK improvements
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
X-List-Received-Date: Mon, 16 Mar 2020 13:07:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Andrej,

On Mon, 2020-03-09 at 09:05 +0100, Andrej Valek wrote:
> I can try to explain it in some examples.
> 
> I would like to add some extra (dynamic) variables into local.conf in
> eSDK mode. I have found, that there are 2 possibilities (in
> populate_sdk_ext.bbclass) sdk-extra.conf and sdk_extraconf.
> 
> - sdk-extra.conf
>  - You have to have handle own function to write into sdk-extra.conf. 
> I
> think, this is not the right way for me.
> - sdk_extraconf
>  - This variable is fine, but there are some restrictions. There is
> no
> easy way to add multiple variables including values.
> 
> I would like to have:
> aaa = "valueA"
> bbb = "valueB"
> in local.conf file.
> 
> 1. sdk_extraconf = 'aaa = "valueA"\nbbb = "valueB"'
>  - this will write aaa = "valueA"\nbbb = "valueB"
> 2. python copy_buildsystem_prepend() {
>   d.setVar('sdk_extraconf','aaa = "valueA"\nbbb = "valueB"')
> }
>  - This will write exactly, what you want, but you have to have an
> copy_buildsystem_prepend and mentioned all variables with values
> defined in your class/recipe.

Why do you have to set this in a copy_buildsystem_prepend ? Shouldn't
setting the variable in your distro config or class or somewhere else
work?

> 3. sdk_extraconf = "# My notes about local.conf"
>  - Yes, you can write some string into local.conf with this way.

I suspect you can also do:

sdk_extraconf () {
# My notes about local.conf
aaa = "valueA"
bbb = "valueB"
}

or something like that, I admit I've not tested it though.

> So I have founded an way, how to add multiple variables without
> explicitly specifying their values.
> 
> # format variables for sdk_extraconf
> def write_sdk_vars(d):
>   return '\n' + '\n'.join([var + ' = "' + d.getVar(var) + '"' for var
> in
> d.getVar('SDK_EXTRACONF_VARS').split()])
> 
> SDK_EXTRACONF_VARS = "aaa bbb"
> sdk_extraconf_append = " ${@write_sdk_vars(d)}"
> 
> It will do exactly what I want, but this way is little bit nasty. So
> I have created a more complex solution for community usage.
> I think, this patch adds more functionality also for other projects.
> They can add only variables into list and the class will handle all
> the
> rest.

I do see the problem with expansion. I suspect the code in
populate_sdk_ext should be:

extraconf = (d.getVar('sdk_extraconf', False) or '').strip()
instead of:
extraconf = (d.getVar('sdk_extraconf') or '').strip()

so that variables can be used as part of the expressions. It may be our
change to the defaults for getVar messed this up, or it may be we just
didn't correctly predict this problem.

> Is it enough for the explanation?

It helps, yes, thanks. What I don't want to do is add multiple
confusing mechanisms which do approximately the same thing slightly
differently. I'd much prefer one mechanism most people can use.

As such the original proposal still concerns me. I'd prefer to tweak
one of the existing ones (even merge them!) rather than add a third
slightly different one.

I do also still think some (but not all) of what you're describing
should be in your distro/classes rather than local.conf.

Is there a way we can improve the current code rather than adding more
options. Would the expansion change be enough?

Cheers,

Richard



