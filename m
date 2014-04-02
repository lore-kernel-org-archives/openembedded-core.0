Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB736FADD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 17:06:45 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so537033iec.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=p9X12StW2zPdKw7ePzWSzcT81qRU5zRi6Alh4OiWX7M=;
	b=y6LEviA31U5o1ePQNwWImr02EmXttKKGaoB3YuicFRazQnHL5JyjJipMy8KiIF4Thc
	uPEBnzfQEVDMc+9cZ0XNKJofL57+2Izp7Z3F2RoJyaITxWN2tf0kDZAm9X4gWkbC2U0B
	f6CTpMpKDkdhZAjCqjsyr8Z5AzXqCUWV+kpM/8NzmXs90eUY0kqllHWI+W3/skAzpVJD
	Q7pGvaGFscgfEpDjlYvjAZwpQhSpEa8JFD9sZkCc4WUQriXvy11KDaBMSXDk2nu1qT9f
	Vj0Ovv7Rrh3MDRVfGSTIe8v+7jClx9Qqr0ZaxM8b3MA7N8t/JOtOQYfgxO2KDxap57rx
	aliA==
X-Received: by 10.50.35.129 with SMTP id h1mr2790682igj.17.1396458406769; Wed,
	02 Apr 2014 10:06:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 2 Apr 2014 10:06:16 -0700 (PDT)
In-Reply-To: <1396441537-2911-3-git-send-email-Martin.Jansa@gmail.com>
References: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
	<1396441537-2911-3-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Apr 2014 10:06:16 -0700
Message-ID: <CAMKF1srunWtK-tBOxD2P=-4+28ejgN+xwoitqs+ukMNiS77BZQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gcc-target: remove infodir
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
X-List-Received-Date: Wed, 02 Apr 2014 17:06:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 2, 2014 at 5:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> +       # Info dir listing isn't interesting at this point so remove it if it exists.
> +       if [ -e "${D}${infodir}/dir" ]; then
> +               rm -f ${D}${infodir}/dir
> +       fi

why check if it exists when you are already using rm -f ?

