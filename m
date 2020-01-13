Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7027FCDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:59:24 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a5so9560686wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=F9IQqNjQts6OnqwWal8VANzB4J9Vo8VKJVjhOEjvSqI=;
	b=EWLOeXbZ8uGFRuDOc4yUoI3Z3q93qutzmkgZk2yeA1nqhv5AP73cnA2s+1uQ2n1orI
	S9NrtfyRIYA/uLQ7E0GPAQKTe74a6Fn8yPgMUldVaL2U5gEZhtbSTtyogfRU0vL8+J0M
	g0sIiIGX28FuaRfzfgfgMiqvwtHg7oGPonWm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=F9IQqNjQts6OnqwWal8VANzB4J9Vo8VKJVjhOEjvSqI=;
	b=FUk5msqhDVwiEnbPgg9RsMIW2dUzD0qt2uPN0nresTVWM9Qv6lmkWh9s0mZToQWFDE
	GMCNspCzPnUKSAavmbBGHwXKjyT3JZjNIJohhrZQzSWlUlBv+/zSo9ZcKTSppLzRJBwm
	h+D3hEDJqS8BJ0PJMmtevEHKE06YMgAdJtkL7WsSF6kIKtOXdkparNxipcsnkxF7eyaG
	gky8UkJqvYaqiCYZERyUFi5G5MHqPDviZ6kowtnZdvXoXb5b3+QBRm+ewJ3Bu2L8TAQJ
	KP8QVxe6NHSTVKQB60a3XtsTndM3iy81FUlr2GVhfluOr6r7iPUU7A+DtEtyzUrikd7j
	vuCA==
X-Gm-Message-State: APjAAAUW5b6xPB/sT5rXeTL5o3SCy/zzAXur4esOpQ7f9gRAZN1OKBGe
	yi41aZQWKCKel/FeNk3Vczcojw==
X-Google-Smtp-Source: APXvYqw2nJppoPjx/4BNmr9Bo+iaEFpI62AwOj4UmNHS+1lY6SE3Vm5m3RenaOlrGQMtz5z+9kjFcg==
X-Received: by 2002:a1c:c919:: with SMTP id f25mr19748010wmb.49.1578920365312; 
	Mon, 13 Jan 2020 04:59:25 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p17sm14866118wrx.20.2020.01.13.04.59.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 04:59:24 -0800 (PST)
Message-ID: <10f99a93a316115216d4e63d2b34a84dfc9e6925.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Rafael Giani <crg7475@mailbox.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 12:59:23 +0000
In-Reply-To: <a7a27af5-86c6-de19-d426-d8e62f2e8497@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
	<a7a27af5-86c6-de19-d426-d8e62f2e8497@mailbox.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
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
X-List-Received-Date: Mon, 13 Jan 2020 12:59:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-13 at 13:55 +0100, Carlos Rafael Giani wrote:
> Nope. This is an odd one. Are you sure there isn't a problem with
> the 
> setup itself? In step2c, I see:
> 
>  > ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain 
> /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-
> glibc/deploy/sdk/oecore-i686-armv7vet2hf-neon-toolchain-
> nodistro.0.sh 
> is not built. Build it before running the tests: 'bitbake <image> -c 
> populate_sdk' .

2c fails as earlier stepd didn't build. I think the real issue is
step1b which says:

| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency x11 found: YES 1.6.9
| Run-time dependency glib-2.0 found: YES 2.62.4
| Run-time dependency gobject-2.0 found: YES 2.62.4
| Run-time dependency gio-2.0 found: YES 2.62.4
| Run-time dependency gio-unix-2.0 found: YES 2.62.4
| Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
| Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
| Dependency gtk+-3.0 skipped: feature examples disabled
| Dependency gtk+-x11-3.0 skipped: feature examples disabled
| Run-time dependency gstreamer-1.0 found: YES 1.16.1
| Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
| Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
| Found CMake: NO
| Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-check-1.0
| Subproject directory not found and gstreamer.wrap file not found
| Subproject  subprojects/gstreamer is buildable: NO (disabling)
| Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer found: NO
| 
| meson.build:309:0: ERROR: Could not find dependency gst_controller_dep in subproject gstreamer
| 
| A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1 exit 1 from 'exit 1'
| 
NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: Failed

| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Found pkg-config: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency x11 found: YES 1.6.9
| Run-time dependency glib-2.0 found: YES 2.62.4
| Run-time dependency gobject-2.0 found: YES 2.62.4
| Run-time dependency gio-2.0 found: YES 2.62.4
| Run-time dependency gio-unix-2.0 found: YES 2.62.4
| Run-time dependency gmodule-no-export-2.0 found: YES 2.62.4
| Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
| Dependency gtk+-3.0 skipped: feature examples disabled
| Dependency gtk+-x11-3.0 skipped: feature examples disabled
| Run-time dependency gstreamer-1.0 found: YES 1.16.1
| Run-time dependency gstreamer-base-1.0 found: YES 1.16.1
| Run-time dependency gstreamer-net-1.0 found: YES 1.16.1
| Found CMake: NO
| Run-time dependency gstreamer-check-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-check-1.0
| Subproject directory not found and gstreamer.wrap file not found
| Subproject  subprojects/gstreamer is buildable: NO (disabling)
| Dependency gstreamer-check-1.0 from subproject subprojects/gstreamer found: NO
| 
| meson.build:309:0: ERROR: Could not find dependency gst_controller_dep in subproject gstreamer
| 
| A full log can be found at /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/work/armv7vet2hf-neon-oe-linux-gnueabi/gstreamer1.0-plugins-base/1.16.1-r0/temp/run.do_configure.46093:1 exit 1 from 'exit 1'
| 
NOTE: recipe gstreamer1.0-plugins-base-1.16.1-r0: task do_configure: Failed

missing a check dependency?

Cheers,

Richard



