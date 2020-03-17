Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id BA27F60B9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 12:49:47 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q17so7469874qki.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=u5OyvydKagYefwkVqsA50npo0p948QgklIwkjoe7Cz0=;
	b=GKTt2SVRCR8oVe53/W2R1vqdxk0pfdGU2/ewFeugTIgvuWJrZlD6R8U5H4mI+KQtAS
	G28JeL6qFZrnjcilGJympAqfiqE8vbe+4W5kgY8RUdVdwroSh1BUne79bpFfEFG7Cg3U
	FplYKb5BJoRD3KjrL1nLJGXVIUYPdh6PfnH4KjzP6Iwh7Px1no9yi2l1yVsXUSF9gJtL
	upuQKEZBR9mKiXb8c1vyPJmb1cSDtjOvb7E/3vXCh2z7snpKqPD9BGipQwEvE7S1qr7N
	jUhvC9EH/9SemkSkBeTHBqgDsej86kB9qgY2S8p6OuEz0+1yg4z+e2hwSL3wIF0QlkNf
	Tz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=u5OyvydKagYefwkVqsA50npo0p948QgklIwkjoe7Cz0=;
	b=G78vm8+ZauWZAe5Zaxj6bahh4pA9TXxhCUOU3AVUjhXaD36MFoU4xHLhPlfUCsMKpU
	0OLkg2x3/xUWu5gTAeNo5zF2zW2RXvmAv4B0zjnlTWe5EXv7iEkVAUbeOMWXsa8KPh4r
	NAvf/7/mzOq+upB0F8KUk059OgXokkTgLr//CYBly9Vhc8LkyrwXR+G8oOnqihjGKUnG
	PddW2x3TbvVnIU55B/6Ejm+GCzZ9GmkYFzLgcEJwtnDN7sVyzDor8ZoB0ZUF+FSiwHGD
	Vl5hFNuNdC0t9fb94E7cIAxvQ7nihF5+4BXX6MzBKZcsgiS8zR23lub7DT23xQNVc/2e
	5N3A==
X-Gm-Message-State: ANhLgQ16mLSI6ONLoDAfjbICrs8jBZg/9jxdwE8Nw82Vj1l4+FlQi0VC
	IgZQG3A6PjBUYYJYYhi150EIka6G6M+XmQ==
X-Google-Smtp-Source: ADFU+vtFvAP6NitTuCMsdRloPv+GrwDcchfKjYO2RizHpCiBAS1c1DsKqRY5NUoir4S5mq1Z90TA3w==
X-Received: by 2002:a37:79c6:: with SMTP id u189mr4625695qkc.96.1584449388232; 
	Tue, 17 Mar 2020 05:49:48 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
	[209.85.160.175])
	by smtp.gmail.com with ESMTPSA id l2sm2004852qtq.69.2020.03.17.05.49.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 05:49:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f175.google.com with SMTP id i26so7447176qtq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 05:49:47 -0700 (PDT)
X-Received: by 2002:ac8:111a:: with SMTP id c26mr5300443qtj.249.1584449386902; 
	Tue, 17 Mar 2020 05:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200317124454.12732-1-domarys.correa@ossystems.com.br>
In-Reply-To: <20200317124454.12732-1-domarys.correa@ossystems.com.br>
Date: Tue, 17 Mar 2020 09:49:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpNc53hmuW7sr=pHjT7_csAS+uGg3mp0S-1a08ntNEoQw@mail.gmail.com>
Message-ID: <CAP9ODKpNc53hmuW7sr=pHjT7_csAS+uGg3mp0S-1a08ntNEoQw@mail.gmail.com>
To: Domarys Correa <domarys.correa@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.16.1 -> 3.16.5
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
X-List-Received-Date: Tue, 17 Mar 2020 12:49:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 9:45 AM Domarys Correa
<domarys.correa@ossystems.com.br> wrote:
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

