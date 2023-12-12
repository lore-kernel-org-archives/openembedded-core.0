Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89116C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 10:28:25 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.13621.1702376904602348179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 02:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X7Y1yCEL;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a1c7d8f89a5so728125366b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 02:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702376903; x=1702981703; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UKFz33JKgfzevFfwrx3Omq1y2QEkW+9mtMAa1zjOZ3s=;
        b=X7Y1yCELYXRc2F9ijEU8F79R0dljMH8QzWgqOdbSe/vzm597RwI8ObfUD90V2MBZOV
         ZK9QYDfblO1dRGzGG3O4rN5HQht3/omlgQBZO8E/YCG1Pn0NO9E+6AHwJxW6O9a8x0+2
         A0mW6h83MJBE297c1GX3BWLEnnzgmlv8idxM3ANzJ0TVwdI9PT0WzAI7v7bW6lsKzaoS
         vmnisPuiXgR1+sIDhIGAbOfCnlQGkD1BPkgeJ0oE4hqJYKNHsKLvJFsuJ3cmb5JddR2c
         kCNN+qACFNegoXcXK4+GdQrwD12Lq8KkoJ0i/OhFwL5uqAbu2PT95jbiigm5HbkLP7FG
         aZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702376903; x=1702981703;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UKFz33JKgfzevFfwrx3Omq1y2QEkW+9mtMAa1zjOZ3s=;
        b=quGZAfYF6FoFvoT9+nKdK8IrTEzbehk9meAuPFDbfTnPEZlggWgWfu/lxyDML0Ay/a
         msY8mt2XbRMfjacSJWauTLPP5Lfik8T6tyLDeA6e+y27HCEeNZTr66P9eUbIgIHsYvlx
         leG3FdSpqacXoBbGyXxw7y1JWJQ4CPOj87JBdWgvdJ1kQjBY0Q2RE9kRuCtsrZD6HLwW
         0LiDIyhn4aATua61VMhqL/dc7TwpMXG5wlxe892AFuiSA48i9811zHpKgtvfP5OmM7Gl
         yQst1jQ7ZZBHM75E7VfB1QzBvaC/1L+FPzt/c0f/Q62Vwq2Cz2yYm9df87NWcVJjF4zv
         PCzw==
X-Gm-Message-State: AOJu0YxxJXCtbZiIRPIrhB0lK4q4GrwGZb8biLpUx08RW0p36wi8n+7W
	N8niWyMLUlHjbDOD10Mk+B1ME9/TclTiFDFOCyjBkiMuMkY=
X-Google-Smtp-Source: AGHT+IFnvruDq37N2xJwku+piEq5q50X60mkLyBDFHhMUF/SdRp/GTGHovDJqjVRZt46tCeXIe0Z988xxrUq8geszDo=
X-Received: by 2002:a17:906:c14f:b0:a1c:f8db:c6a5 with SMTP id
 dp15-20020a170906c14f00b00a1cf8dbc6a5mr3522513ejc.46.1702376902637; Tue, 12
 Dec 2023 02:28:22 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 12 Dec 2023 12:28:11 +0200
Message-ID: <CALT56yM414xkWEHMf1+uXo5dwJKN2MSnnuL5Ltwu+0pYRxspfw@mail.gmail.com>
Subject: linux-yocto 6.6
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 10:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192190

Hello,

Granted that 6.5 is declared EOL, is there any timeline for the
linux-yocto 6.6 recipe?

-- 
With best wishes
Dmitry

