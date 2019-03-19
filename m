Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 251C16BD1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 12:57:34 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id i12so17528671otp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=r9rJIpQkwuCeLonHZmTKR1lXdIDfu5EBkBgaoDhu+Uk=;
	b=mRKxFqzNXNvTmNDppb/G6fzF7jk42Ztv4Cc1/kitA5XhbTH86q+h8NQctb7SBjxykl
	R8l+m7oXx28sbPj6M6CWUyPnBAC88lVOQfkhzXcyxWIQSDzXB1qTIN31aLare1ojzFJX
	e2e7x/6if1FK2967DYj0H0/jXZgxX7qn30hhKi9/eINciAyMxUERzEKrgTLh33IDeweR
	Sqoh/SjPHp2G0uctzZoCjb1cGitEeFx09PbMxkuIySi3nrSORFLtP2sw3Nv9LfrkqhIB
	TP/d4H1zKnLh1KXtBEyb+TKI1EFr/Mk5eQl0utssaJ+FRNqoNZ+uEG7pSOoq0jGxbeaW
	qP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=r9rJIpQkwuCeLonHZmTKR1lXdIDfu5EBkBgaoDhu+Uk=;
	b=EkDaIwxcFjACw5nBDXz4IZhjry5u3JdIxj+1S84rcoErLyNh0vnNHcjn37/OEFJaOx
	/ajhODWo8CePZ4dnbn1zplpe1GqFAM2wM9NlF5VisZd5VgW/mqT9Kxjp5N3SfvjF8S7I
	PDcK6Wy6G6gMJfltLLV0UdjMI6WCk0Xb3M+Dy3VM9BHUQwmgjkjyY0mnngIobed4DkW/
	0AQR6ND+cfYf//DPlmIPBgO3SIoOZ5KJEnRTLna7x1r1gbj6thwH8nuSZcV3H0nQXQuz
	yElQF46b5X2Mi2KyprdCoLUN8KbyOCrAMOm7TcDsGVIIAk3iOonaDxTrK2QVPJgfgoCH
	n2wA==
X-Gm-Message-State: APjAAAV5FqRKkwI/nJSotluQRlOXQaMS7zm8sbxM4mk96OYwF5c6JUn5
	rWUkUVKhxU9nwty50cMRZtTl+OCCNHW7Gg==
X-Google-Smtp-Source: APXvYqzwl0OqgHCld8RcuuIvjR4n7IjvUtRJnMfSC1TNyhU/vGtj4TqFBKM9MzPl0dHB31rXi9qVUg==
X-Received: by 2002:a05:6830:1390:: with SMTP id
	d16mr1510475otq.30.1553000255555; 
	Tue, 19 Mar 2019 05:57:35 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com.
	[209.85.167.177])
	by smtp.gmail.com with ESMTPSA id b2sm5936270oih.1.2019.03.19.05.57.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:57:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f177.google.com with SMTP id w137so3846830oiw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 05:57:34 -0700 (PDT)
X-Received: by 2002:a54:4e02:: with SMTP id a2mr1347393oiy.140.1553000254079; 
	Tue, 19 Mar 2019 05:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190319003226.7618-1-otavio@ossystems.com.br>
	<CA+chaQcEo8A9x3K+mjTML5AwL_QG-uNfwVv1Kc0p6ozMHGETNA@mail.gmail.com>
In-Reply-To: <CA+chaQcEo8A9x3K+mjTML5AwL_QG-uNfwVv1Kc0p6ozMHGETNA@mail.gmail.com>
Date: Tue, 19 Mar 2019 09:57:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKofAodRS9sA=-6VivNBcejugF5ne1BT314-ZrHWqLZ1oQ@mail.gmail.com>
Message-ID: <CAP9ODKofAodRS9sA=-6VivNBcejugF5ne1BT314-ZrHWqLZ1oQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] openssl: Remove the c_rehash shell re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 12:57:35 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Martin,

On Mon, Mar 18, 2019 at 9:56 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> This won't work if someone uses only openssl10 in the image (a bit difficult to do with current master, but still some people have to do it), in case someone needs it as well, here is how Gentoo makes ca-certificate backwards compatible with old openssl:
> https://github.com/gentoo/gentoo/commit/03f9b674ca3315198c72849e8dd77583974759c2#diff-1801ddca78e57240592ef16b1c5262e7
> more details in:
> https://bugs.gentoo.org/653382

On OE-Core case, even if someone uses openssl10 as the library
provider, it will still use the openssl 1.1 binaries under target.
See:

+PACKAGE_PREPROCESS_FUNCS += "openssl_package_preprocess"
+
+# openssl 1.0 development files and executable binaries clash with openssl 1.1
+# files when installed into target rootfs. So we don't put them into
+# packages, but they continue to be provided via target sysroot for
+# cross-compilation on the host, if some software still depends on openssl 1.0.
+openssl_package_preprocess () {
+        for file in `find ${PKGD} -name *.h -o -name *.pc -o -name *.so`; do
+                rm $file
+        done
+        rm ${PKGD}${bindir}/openssl
+        rm ${PKGD}${bindir}/c_rehash
+        rmdir ${PKGD}${bindir}
+
+}

So for OE-Core, it is not supported. The rootfs generation will still
work, it seems.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

