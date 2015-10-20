Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D8DF676F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:32:54 +0000 (UTC)
Received: by qkfm62 with SMTP id m62so4686381qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 02:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=KIQExz9dxn5obvBb3GAMU/eVIAh5JFgPVq9Kf69hPaI=;
	b=Ov5J50nqT5JVBuScQHLERCH3i01qN4q+9nb17btEJdTRg1NIG/XCaFGH7Ft0iqmFst
	3m80aA/k6tL9URQrZjK9tFU0YYsD3+N2HnNPdblOfthME7Qh7jQWXgNKWarMufRcdIOx
	KCWq4zR8XX4Z/XXAsDIhBNI4rpE0MyPR/JVHjTa5NG3SVz7Z2tm0CVmJbChJElninf47
	kmOc/ajhBqLwBz9nzSqNwkRDQWFarGRPFR9OuiuZ5uzIvMXjIj5OGrbYWANrNFSDzYae
	A4bWTj5fqpVSDtGSxZJLl+vJjSPx76TG2/in+7PSoIMN424/gLdiaHAUUtP5lz5HqL6Z
	cUTg==
X-Gm-Message-State: ALoCoQnaGwSdVC/XlkY7wLCJNnxzt3+6MBOZQOu14lPLpYtELWjJkWenKbxQnghst2RDqmd/Qm6f
X-Received: by 10.55.31.232 with SMTP id n101mr2389163qkh.107.1445333575000;
	Tue, 20 Oct 2015 02:32:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Tue, 20 Oct 2015 02:32:35 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 20 Oct 2015 11:32:35 +0200
Message-ID: <CAP71Wjx+xcW0qG62zxskUGY_BbWCS1Yk9OvJQx+fKooKKKyuvg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: How to handle mesa customization in BSP layers
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
X-List-Received-Date: Tue, 20 Oct 2015 09:32:59 -0000
Content-Type: text/plain; charset=UTF-8

hi there,

in the meta-qcom BSP layer, I need to customize mesa to enable
Gallium/freedreno driver which is not enabled in OE-core by default. I
have been using a bbappend , see [1] so far.

However it was reported by Koen that his is causing issues, at least
in Angstrom, though it's not specific to this distro.. See github
comments on [2].

The issue is that mesa is arch specific, not machine specific. So if
you start mixing machines from the same arch, we are getting
unexpected/wrong rebuilds.

How am I supposed to handle that properly in a BSP layer? I don't
think that enabling the freedreno driver should be a distro config, am
i right?

thanks
nico

[1] https://github.com/ndechesne/meta-qcom/blob/master/recipes-graphics/mesa/mesa_10.%25.bbappend
[2] https://github.com/ndechesne/meta-qcom/commit/dc00771aaba1051a3c679dd8f782089b499cbdbb

