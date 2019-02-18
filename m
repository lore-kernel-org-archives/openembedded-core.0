Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 336EC7C895
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:41:44 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id g1so28206870otj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=2iLcOI9kYBGuqwPqNSVzC9wFCqteu2srptEak/Ag++M=;
	b=jrg3nY3yWN+pQWIfi4nFpW4X9xONZ/3XM6y/I+St1yRBtOU+c2ExUWyi9Cl1RiEEX3
	amfYU3UHtT2zr+dpPMdDfjX5s3T5SqMWXD1mCAQe9A2SP4X7SQWe2q8FA6gzyZ3qpwCY
	Rv4A9/E8mRb/z2Vq4YkxUQ4LBicGq1rbVsSKEKd1d+H0411gE6DN6u+fR8P0NqR9UHBN
	3V7yW19qWEAqVStV+BkYNb+TxY5JiS+BkWflp0BjLg/KvoZGEYOOZLkeyqNAIYO5IzKl
	VybeKzIVtglEoRNqIlDR8yW5Sr5IroDL2D1R5nPl8OsKKBNr2/H7ZDyQ05wc9iLxLQuf
	I76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=2iLcOI9kYBGuqwPqNSVzC9wFCqteu2srptEak/Ag++M=;
	b=maNhYo7oyFvoVkp220SuHk2NiDsVm1/CFSChD7xTitmyDq6WpIH+NG9IWvIAAhfXLX
	7V2rqsaNTQGgu+ILbsudui2OMg/EzRLci3oV5NEeLlkdbjNJJDzUPGm79MDzHD+I1qld
	SSqgjx+khtVZ/ixtLtOjueV4yGv/QAxc6q+tPa7XbuaSU1q/bT/VbVN9lTtrRleL/LQQ
	FfkbA6yT+hOYCXNMBg8dd/AIaGDiUnHjkhomWpj+0gzy5jGVCYZy8ZsGrACkhOKI4pfW
	wUMSsyWhSXDGfOeC77wty/FSVQH2eoLzNo0r9m4eqLfrjPuL2eudD2WmHBoKhjXEgtls
	b/+g==
X-Gm-Message-State: AHQUAuZgZXWDKPRINK2OHWiN4fT6T2yDXco36YjqHKthV3KasfRaIlIi
	9SqhYvs+uQgyFRxkDp04lEzkqKHIAhrVKQ==
X-Google-Smtp-Source: AHgI3IZaeMSUDuJjhJyfD4MyI14qFF6KMGRTAhjwrxxQ//5CuLxgtGCbp2UAZUvH1137UzzeGKSIjA==
X-Received: by 2002:aca:84b:: with SMTP id 72mr13842629oii.87.1550497305411;
	Mon, 18 Feb 2019 05:41:45 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
	[209.85.210.54]) by smtp.gmail.com with ESMTPSA id
	g128sm2666689oia.32.2019.02.18.05.41.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:41:44 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f54.google.com with SMTP id b3so28289054otp.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:41:44 -0800 (PST)
X-Received: by 2002:aca:ac45:: with SMTP id v66mr13764272oie.134.1550497303830;
	Mon, 18 Feb 2019 05:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
Date: Mon, 18 Feb 2019 10:41:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoV+=+X6X1qh6K4NQWMON5Pu9auTCGFadj0nVjRsxTn-w@mail.gmail.com>
Message-ID: <CAP9ODKoV+=+X6X1qh6K4NQWMON5Pu9auTCGFadj0nVjRsxTn-w@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mesa: Update 18.1.9 -> 18.3.3
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
X-List-Received-Date: Mon, 18 Feb 2019 13:41:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 18, 2019 at 10:30 AM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
>   - Refresh all patches.
>
>   - Remove "Use Python 3 to execute the scripts" patch
>       Commit 986033a2750c1160a4cef3c8418fc7f9e2b4fb5a add support
>       for both python 2 and 3.
>
>   - Remove "dri: i965: Add missing time.h include" patch
>       Commit 3c288da5eec81ee58b85927df18d9194ead8f5c2 add time.h
>       header file.
>
>   - Remove --enable-texture-float.
>       Commit 66673bef941af344314fe9c91cad8cd330b245eb remove option to
>       unconditionally enable floating-point textures.
>
>   - Commit 30b10dbb7c6f6bdf3e489620f8333c727bd3a6dd moved
>     ${sysconfdir}/drirc to ${datadir}/drirc.d/00-mesa-defaults.conf
>
>   - Add patch to fix mesa-native build
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

