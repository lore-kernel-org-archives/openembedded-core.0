Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B0CC677F1
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:10 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.14063.1676902732898912906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=M01vBdEV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id p6so751561pga.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Km/73tJXPA8epIq594QhkLBC3np/vTjulAZyu3LDhe8=;
        b=M01vBdEVONMxmVNoZ6BL5j7/WiBIo/VzaC0Tk2LYKncYbpr1J/EG97NOwE7+cXQwP6
         kgaWaMVwsNaFI81R3ic2DCh9G9G8p1lW/MQfNTgaJKh4Y0qtmv7zKStwVdd17eUm43Jg
         qCc552yl2hnklfLEE2ZXRd0AFqnurhc83w+w39iV5oIX982LdCVnOYdV3k5uIAnBtLDw
         z+reaBJBOb3W7y53pHKzxZf3LefjPu28E+/SSWeT8Wey5WxRRq+ebKBU2bWNlK8RreHE
         BruTkXMPE8AuskthmKZsT/CuSSQWGh+Pa+Egtgt61ltuq6Vf8A2znOJlqdKmoevb99sK
         BZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Km/73tJXPA8epIq594QhkLBC3np/vTjulAZyu3LDhe8=;
        b=Q7H1zQ/pXpCguOyt+B4RN3cLxD+go4+E0HELEUFEEInd3LgwIxD1CbaUYsZ4U2Q6sE
         wyrFRMYeGXf0Yo359/fWkuN89TudvTmZA79DeaNp5pcpoqXfjH6itMrkSkaXjPHXGreF
         FpBkaT0Bh3T+VFffC+/CGIaF5PUFzfMroogNLpj1FcKcC1WiLwqRabUXhoi8BN/YYWS/
         gw5z8IZw6wjPOqZGycjBHSANZ1LBHXkJwpByib0YVdfFVO9JDwFuC0jNpS7Ir8q353vJ
         MO5GVhYQ2nmGikTsw4mmdpexyNLCLb2PQusgmNqjl0mvV3OPdWqrLCLNnaFUe/Er3kww
         38/w==
X-Gm-Message-State: AO0yUKXhJp+ZSA7/A9bTGmMAo9Uci2uU3wUdXjT9b7Etj9ueSPrKuWhJ
	7bih9qX1DMhDHjEB1RQu7PPjKQWoiWBNKQZ6pCk=
X-Google-Smtp-Source: AK7set/YVN6sc++RjTHjCyROAvvnIPIZDsQ4dG5YrSvkqtkuYF9UVSBIyAOc4HlvvsBdVNppRcY24Q==
X-Received: by 2002:aa7:989c:0:b0:5a8:d360:de72 with SMTP id r28-20020aa7989c000000b005a8d360de72mr84893pfl.29.1676902743236;
        Mon, 20 Feb 2023 06:19:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.19.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:19:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/22] update-alternatives: fix typos
Date: Mon, 20 Feb 2023 04:18:21 -1000
Message-Id: <5dab1edf6df6eaba59c3c6a996ca19213e0a4743.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177420

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3ca05b072c152b76a86edaaddebabdef312ea95)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/update-alternatives.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
index 970d9bcd45..f34cc6bc19 100644
--- a/meta/classes-recipe/update-alternatives.bbclass
+++ b/meta/classes-recipe/update-alternatives.bbclass
@@ -5,7 +5,7 @@
 #
 
 # This class is used to help the alternatives system which is useful when
-# multiple sources provide same command. You can use update-alternatives
+# multiple sources provide the same command. You can use update-alternatives
 # command directly in your recipe, but in most cases this class simplifies
 # that job.
 #
@@ -35,7 +35,7 @@
 # A non-default link to create for a target
 # ALTERNATIVE_TARGET[name] = "target"
 #
-#   This is the name of the binary as it's been install by do_install
+#   This is the name of the binary as it's been installed by do_install
 #   i.e. ALTERNATIVE_TARGET[sh] = "/bin/bash"
 #
 # A package specific link for a target
@@ -68,7 +68,7 @@ ALTERNATIVE_PRIORITY = "10"
 
 # We need special processing for vardeps because it can not work on
 # modified flag values.  So we aggregate the flags into a new variable
-# and include that vairable in the set.
+# and include that variable in the set.
 UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
 
 PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
-- 
2.34.1


