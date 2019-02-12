Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11DF26B50B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 11:50:48 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id u16so3865175otk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 03:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=xTvdU0UdLhyYgET87+W3lcgxfkigTclPlVj9wHc9wUg=;
	b=vRFBEJjA77LQHsLOrgmKhqJDwfNfTp6mlLeCptJEdJLySdR+KpdGb5vNn1/zWQP8a0
	j6ayJlzhEVzx/+AtrgUypD7tgKw2uLp2cDRXLxifzwAbHXCbS0HCAgVpBfqMNnyO/2es
	imGsca0iKjzCsol/YB7XuRiay7hdmvrMFfU9WcFLLRiwhJhSDh5peuJnSQcbznM//Qso
	SYvcrRU8tVFxyOcpl12UYeOW80eyhLgEDYUNDg2iSg15uKAf+mZg9oZKuKDDvwXvdB11
	nDAcOyTBaCUrDPnwZ6CP+N5fSw8Hcrw95kKtsiToWXqK16zo39ItxXEdTN9dpiIX6MqN
	mnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=xTvdU0UdLhyYgET87+W3lcgxfkigTclPlVj9wHc9wUg=;
	b=gRt2QpxpouoRVZ0M0F2saJ33f7QBAA97ot8bO3gduPEbnAFg/vYxeyXaEnIvBym6xl
	oCNWxd41zg0qPKAZ2j5rq8oKgBsxKUgkhSr9MLVa3r11NSuodCWT53nYpzi1NkF18/xe
	nctijhg9LuWq/oNj7zHKjtcyV9Jbm7kN23E3YmRsKUxf+9uvT+wtCvLDcxnWHtlt4Vdp
	qzwOoUjFXgUdM4J+FYOl3BXlyTs8+g77Llr8GPAhY7wi3DSx+8QmxR2NtwmsmHVIQS85
	lXPykLIJWdk//5t14McMzvWssehYle60O+B++QjtplH6TKoI0EwawwqrvRdAidtWLWTg
	4lTg==
X-Gm-Message-State: AHQUAuYu8/PwaQBNDa5r9odgEkDUsQYuy0BweQFLRBoxURB/bZqfINgc
	R/0XsXVbmL7aEX++jqtMwr/H/qI+5WbiGg==
X-Google-Smtp-Source: AHgI3IYHmtdz87bGxH8CXMj0rvsEGbKDg/wPIHcZBjg+elwSwlz3zsaSP+PRcmlVcACKxL6o/R665g==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr974636oti.193.1549972249479; 
	Tue, 12 Feb 2019 03:50:49 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
	[209.85.210.42])
	by smtp.gmail.com with ESMTPSA id i5sm5841117oia.46.2019.02.12.03.50.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 03:50:48 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f42.google.com with SMTP id s5so3877505oth.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 03:50:48 -0800 (PST)
X-Received: by 2002:a9d:7b52:: with SMTP id f18mr3077331oto.145.1549972247668; 
	Tue, 12 Feb 2019 03:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20190212093048.25238-1-pascal.bach@siemens.com>
In-Reply-To: <20190212093048.25238-1-pascal.bach@siemens.com>
Date: Tue, 12 Feb 2019 09:50:34 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoCKPHhLPbFDKGz3wvJPb1_yH4wG04DtwKQwXw6-uTHLw@mail.gmail.com>
Message-ID: <CAP9ODKoCKPHhLPbFDKGz3wvJPb1_yH4wG04DtwKQwXw6-uTHLw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: update to 3.13.4
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
X-List-Received-Date: Tue, 12 Feb 2019 11:50:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Pascal,

On Tue, Feb 12, 2019 at 7:51 AM Pascal Bach <pascal.bach@siemens.com> wrote:
> All patches have been rebased on top of the 3.13.4 release.

Most patches had no changes (even on ranges) and it'd be good to avoid
touching those files so we can keep the patch to the smaller changeset
possible. What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

