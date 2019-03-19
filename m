Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
	[209.85.167.169])
	by mail.openembedded.org (Postfix) with ESMTP id A2EBB6BF3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:37:49 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id w137so4484984oiw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=duq6JrOCUiw8qU0OTH0G5J7GzW2FBV5JNnrP0W9i2CA=;
	b=SWn85Sv7jeG5+UUdoLesE98EE1/DEf2bqJ9AY8TbMu553mtV9dod6xfmMroJSscExw
	Q0GPV7Mk7zwYNyL+R7xB1Ot6MDFwuVTYLFHJ7x08X2WsygHgPaOeqiQ8m4DxsmNJC/j4
	cH0vaP8JPI6dpxLLC4JRKc+wZIjLm5VGhzWLITy3fRQ5VSXUxON1atAhl/7KN62klxxB
	tZfV0QwijqzszJa3CrBcIYq2I3u8aSBX70Kxf0/E7UtHLjVsDytUk+CZWTWgcQbI8BVN
	fn5R/YfPk8CpJ9xo9gdxovxTKIJbZPtuxeyVDdhySLQebpLAk9jVjGCj+R/VnlCk8IU4
	I/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=duq6JrOCUiw8qU0OTH0G5J7GzW2FBV5JNnrP0W9i2CA=;
	b=EzKtesA2ox4mJ32Gk2tijn47XnjOZ/45h+odzMABBP9gPmkJNU5dqM//wuhYayp+td
	yEQtnxBoxQZnelo9WNm9TawGMQE39NyVa4/Ys6Fn4dPYvn7wLx9PQbBO7WgVbJqU6tWO
	CjO+7gkwMVBXoOD/Mp0wdszJMNzWNJ4rjWZyZ2YcGnvq0HgI8MzCKuHR6xnZyy/iKo4I
	ErGcWj5A4LctwdZJz+x7mlPfyS/xp38X/jBaT1hbbAAcgFX+eVg/7qygADqhkyQL2ddl
	biokZdp6yr/CoKQFhpSAgUHtN1YftJ9L8YCAXeCEdOywa0zt4DrcTAGZk+h9Bql4x2Zw
	XUCg==
X-Gm-Message-State: APjAAAXDTc9WPJf0zHEkXlwwE44I+PZcVh/An5f7xkGXLMHb938djqYW
	JvJNnaFS+A9TQnqHeL6fVEBjoUvxL16pMg==
X-Google-Smtp-Source: APXvYqxWM5yEwHR3mdPk4L7oV9/4CwngWlZMch48p4xIbc1BY6glhdbI9aL+YmOdLVleM7Y7R50Mcg==
X-Received: by 2002:aca:6cc9:: with SMTP id h192mr2128611oic.161.1553013470206;
	Tue, 19 Mar 2019 09:37:50 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
	[209.85.210.47]) by smtp.gmail.com with ESMTPSA id
	j206sm618378oif.52.2019.03.19.09.37.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 09:37:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f47.google.com with SMTP id e80so13186906ote.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:37:48 -0700 (PDT)
X-Received: by 2002:a9d:3988:: with SMTP id y8mr2358456otb.231.1553013468342; 
	Tue, 19 Mar 2019 09:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190319135727.31246-1-otavio@ossystems.com.br>
	<be5b31d22d21458dbafc7cf1c7b5a14a@XBOX04.axis.com>
In-Reply-To: <be5b31d22d21458dbafc7cf1c7b5a14a@XBOX04.axis.com>
Date: Tue, 19 Mar 2019 13:37:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq4BDDD8Fj6VSfyTv0WHNu-R3730pbOts_+NfFm0aYUWQ@mail.gmail.com>
Message-ID: <CAP9ODKq4BDDD8Fj6VSfyTv0WHNu-R3730pbOts_+NfFm0aYUWQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/2] openssl: Remove the c_rehash shell re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 16:37:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 19, 2019 at 12:44 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
...
> You should remove the following line too:
>
> RDEPENDS_${PN}-misc = "perl"
>
> so we actually get rid of the perl dependency.

Fixed on v5; thanks for catching that.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

