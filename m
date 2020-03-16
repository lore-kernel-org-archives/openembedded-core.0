Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 188E5601E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 09:05:52 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id c20so13350107lfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 02:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-language;
	bh=zRBlsUvYm5UdEegnxOmmU211oa8MEPGYwkOAuiqoZDo=;
	b=mLpl/24zex43Q9Zn1oqPTuixkea8YjNLZJX2iPbKoqjuWhR5qL6JxaicY8mJXWBEUn
	qbDJZ4Gr18lSqbC8386zKtGc/ZEYf46p+RKU+HGB1fPxyIlJ/WzjvbPx7O6OWh5mrmY1
	+Hj7ORK1Q4y1vGrEs4ZuWjR/oGOJ3+kSKFIdgLGl4tBf074nXClBzB5T8ZapzK9fAI61
	quedhpzYL91MiL5TusxLyXlgp52u+X4ed38WTBX4benOlLPh9E4lePfXUAhsXfNNtSKA
	LMoT+bb3pNey8ALRzGc13DtOfU9MMHlH1oyJjVyRSI3NiUSCuhrUY2TLpfx/e0AhE8l/
	moaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-language;
	bh=zRBlsUvYm5UdEegnxOmmU211oa8MEPGYwkOAuiqoZDo=;
	b=S+8M3z8+S2aCeRvPystune2sw/J7fod3aAie+ScaHXPJT/QMHX3W8IoFxpEjmwMhnN
	go5t0ZOgXIDjXpEn4goDHrwsmuMdSZjwJr0gJAHwXDunnkQdz4N/uCnzQxM8LveAn9rQ
	eACmCiIvZ37/M4Yg56km6IeczHvmizlfrCFpxqo3JmPur5/Qcd+tEszbOOPEJ+Tlvcyq
	OjQ7PPwMRC7MtmPD5ggaXOHBgVC83jXEjYmIHlNuWUloSIcjgxeZa6QwARM/Gfxre8zL
	MDgY7Q4cHSm9KCz7YczInqsxf03GE23UAUbtWKEV0aP9wRUDTdC9UhrCcbX7ZXgQWiNb
	bEkw==
X-Gm-Message-State: ANhLgQ36n+eE6Eleke+8LcHBYWzA8UjvZvFDhryujsyxfLH6a+4PmXab
	XzyaqunRr4CV67NL8rhJ/iHtA1QG
X-Google-Smtp-Source: ADFU+vtJ52SMWdIYyUiaPTtx3vDkmpUMZT7auOyoSu/ScQHlby2Djd97jr8vnZBs5ZJ4vJkP5uwbsw==
X-Received: by 2002:a19:c7cd:: with SMTP id
	x196mr16007872lff.106.1584349553029; 
	Mon, 16 Mar 2020 02:05:53 -0700 (PDT)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id 4sm3983516ljq.27.2020.03.16.02.05.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Mar 2020 02:05:50 -0700 (PDT)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <74a48760-cfec-a2ff-e50b-ebd5d70ae8d8@gmail.com>
Date: Mon, 16 Mar 2020 10:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
Subject: How to skip building kernel modules
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
X-List-Received-Date: Mon, 16 Mar 2020 09:05:53 -0000
X-Groupsio-MsgNum: 136417
Content-Type: multipart/mixed; boundary="------------2387A484E79F9CFF293FE42E"
Content-Language: en-US

--------------2387A484E79F9CFF293FE42E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm using the linux-yocto kernel recipes together with additional kernel 
config fragments that I append in our custom distro layer. All required 
functionality is built into the kernel, so we don't install any kernel 
modules on target.

What would be the correct way to save compilation time and skip 
building/packaging the kernel modules ? Do I need to provide a custom 
defconfig that explicitly disables all modules ?

I can monkey-patch oe-core with the attached patch in order to achieve 
that goal, but I'm guessing something like this wouldn't be suitable for 
upstreaming ?

Cheers,
Jacob


--------------2387A484E79F9CFF293FE42E
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Handle-KERNEL_MODULES.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Handle-KERNEL_MODULES.patch"

From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Mon, 16 Mar 2020 09:47:58 +0100
Subject: [PATCH] Handle KERNEL_MODULES

---
 meta/classes/kernel.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..538e769f89 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -329,7 +329,12 @@ kernel_do_compile() {
 	fi
 }
 
+KERNEL_MODULES ?= "1"
+
 do_compile_kernelmodules() {
+	if [ "${KERNEL_MODULES}" = "0" ]; then
+		exit 0
+	fi
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
 		cc_extra=$(get_cc_option)
@@ -353,7 +358,7 @@ kernel_do_install() {
 	# First install the modules
 	#
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
+	if [ "${KERNEL_MODULES}" = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"

--------------2387A484E79F9CFF293FE42E--
