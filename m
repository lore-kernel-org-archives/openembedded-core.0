Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4325D77D4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 13:09:55 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id l7so94183347ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=cVNnAcVjWDYwxFnkkpVZy5nl7m+zdjy/a728ziPHtaU=;
	b=d+GzpO/AmFK2Y8Xmy6LAtbQxP7q40hFPwqGvvGrUTzHeNLBlEyQO8BpnQp6P0R2abC
	ivYM3ld8OAdDthVmYspcWzD0njPP86zV7Td1uQITLCkmr168bwcc2v9Qzacn1d5j3sJh
	UHRvwaAk0luY5CUAsBKJjChzCpRw03TAuysqd12R8+p8XJJuD2lnPdLPPLr/X3GgLAwt
	kXIM8x9mXatH0dHm2jw52GSc8Yfb+NKwMmKcUrCnNkHfx73NokFDZeu+YFGf3sHg4SG9
	SsIyjTIMeQKNO8CUVz/c4eu/dq1hdqdG7BGluK2+4boSrHS3DVH3dW+W+9zlaoe4Nejz
	gQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cVNnAcVjWDYwxFnkkpVZy5nl7m+zdjy/a728ziPHtaU=;
	b=TJd6fxHYpAdJalUclwqU3f2X11iKhJ4IfMwZQfvZHDU7N6C22Gy2eDkXXzTX73gPF4
	Zr1mmaIyvezg8CiziJRf75RzcUnun77M2LRNWYkEGzp5YxKhys4lGYtoRYzltzZG1qAq
	thdOf8qt2gi5Jt+JnXQnE9OklhGidB4UK8wcVZJvCEPNJwXl7I0oVBs+d6Oq8EdTyN/O
	0Lk7QrFNv2vnCdVlU3uLHgPNyPJBuHs02DyaGbYG972UrMv8ZLjWsHpI3jsqzMDi5rx8
	I5P8arc5xelIKOy0WL5XB6BBdbgfcniUjBj8ylUUrt6NyNTTG31E5bWkJj/0FreOqAVA
	fqTw==
X-Gm-Message-State: AN3rC/4JlGjC0j6vFaeQ619nm4D6HuEu3f4kzNBbhrU05u8e2Z4Ez7knE05r5FGytmR9+6pI
X-Received: by 10.36.172.106 with SMTP id m42mr6039892iti.82.1491829795545;
	Mon, 10 Apr 2017 06:09:55 -0700 (PDT)
Received: from pohly-mobl1 (p57A56DBC.dip0.t-ipconnect.de. [87.165.109.188])
	by smtp.gmail.com with ESMTPSA id
	123sm6387945iow.28.2017.04.10.06.09.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 06:09:54 -0700 (PDT)
Message-ID: <1491829792.10884.115.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Apr 2017 15:09:52 +0200
In-Reply-To: <CADkTA4PQHE0w9=kvr5EyeQvG-Vm8SPQFh9NqM2Jofp_Ec99fKA@mail.gmail.com>
References: <1491828558.10884.112.camel@intel.com>
	<CADkTA4PQHE0w9=kvr5EyeQvG-Vm8SPQFh9NqM2Jofp_Ec99fKA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Mon, 10 Apr 2017 13:09:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-04-10 at 08:59 -0400, Bruce Ashfield wrote:
> 
> 
> On Mon, Apr 10, 2017 at 8:49 AM, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
[...]
>         diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>         index 85f71a2e9a6..ac41c80d377 100644
>         --- a/meta/classes/go.bbclass
>         +++ b/meta/classes/go.bbclass
>         @@ -26,7 +26,7 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
>          export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}
>         ${TARGET_CXXFLAGS}"
>          export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}
>         ${TARGET_LDFLAGS}"
>         
>         -DEPENDS += "go-cross-${TARGET_ARCH}"
>         +DEPENDS += "go-cross-${TUNE_PKGARCH}"
>          DEPENDS_class-native += "go-native"
>         
>          FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
[...]

> This requires any layers with existing DEPENDS on go-cross-${TARGET}
> to be updated,

"inherit go" hides that detail, so only recipes which depend on
go-cross-${TARGET_ARCH} directly instead of using go.bbclass need to be
updated (and perhaps should be changed to use go.bbclass instead?).

But I'm not a go expert, so let's hear from those first ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




