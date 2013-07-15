Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE766A5A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 01:17:02 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id 10so10300273pdc.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2013 18:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=K0jGSHmJWrwO7NSpXJpJ6Hv9cfwgX1vzSm3kAEMCg04=;
	b=CSLtfivTvNoG5CHmXR/O6sSb+jemPEyChsuDeLftRAtXX1IWWTEJTCHMepKrV/AN49
	fDTVBZVXVu1lp47C8ISshw6mUqP/aAthHSWxQvaYEMcgQd7CVbniUOg3NpKohOuplNIQ
	AaCnKIwgrzeiMzcIxxHfAE1MPn0dxvhfdgJfM6bHGZ1S1XClcOU6TFe3AHhj1J8+YVJG
	htJFIRq2n71twmg+Ujig44/rbj4Jsdn5vm8rYRprb/bNd74omMgQaOaPl0j53ABgzuRF
	gKy02aY5oey3Z0lOnozNNinirks6LoGLVs8buK4OcGQVDcpnTaiMnv9IhBB8g7CE9BrA
	YsBw==
X-Received: by 10.66.218.39 with SMTP id pd7mr53138375pac.148.1373851022875;
	Sun, 14 Jul 2013 18:17:02 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.145.211])
	by mx.google.com with ESMTPSA id uj1sm949122pac.21.2013.07.14.18.16.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Jul 2013 18:17:01 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 09:12:23 +0800
Message-ID: <1494076.GQbbvjWTEm@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.8-1-ARCH; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Subject: qt 4.8.5 package error
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
X-List-Received-Date: Mon, 15 Jul 2013 01:17:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

hello,
	I'm using latest poky, when packaging qte, got following error, any idea?

ERROR: QA Issue: Found library in wrong location: 
/usr/bin/qtopia/examples/tools/styleplugin/styles/libsimplestyleplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/tools/styleplugin/styles/.debug/libsimplestyleplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/tools/echoplugin/plugin/libechoplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/tools/echoplugin/plugin/.debug/libechoplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/tools/plugandpaint/plugins/libpnp_extrafilters.so
Found library in wrong location: 
/usr/bin/qtopia/examples/tools/plugandpaint/plugins/.debug/libpnp_extrafilters.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/imageprovider/ImageProviderCore/libqmlimageproviderplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/imageprovider/ImageProviderCore/.debug/libqmlimageproviderplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/qwidgets/QWidgets/libqmlqwidgetsplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/qwidgets/QWidgets/.debug/libqmlqwidgetsplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/plugins/libqmlqwidgetsplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/TimeExample/libqmlqtimeexampleplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/TimeExample/.debug/libqmlqtimeexampleplugin.so
Found library in wrong location: 
/usr/bin/qtopia/examples/declarative/cppextensions/plugins/.debug/libqmlqwidgetsplugin.so
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa




-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

