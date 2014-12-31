Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 90CF665C88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 19:16:55 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so7953016ykp.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 11:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8UChwKATSfj9xkB7sDTumgxNvKCnlf97JFpVN9Yguts=;
	b=0QQqi39/sXX3Q6n27iKr5URzV6c0fwTL3MVjS5NjRcHGy845a9cc6X5O8DiPUCddsz
	z4Jz7JDy+Nu4KBPs1RA03lr5OTkKEG4ZByucKUsrfMDF1XtrAaL5fjUndDLfNM78CIu9
	jMMY9lRuqzd7nnCEjvVXwWIiaeACufjU6n13pCpzd0dT79VKfte6hAJw7snWxB47SZ0L
	CEF2pn67A7bCWUNM1YW8zBk8I8maHGN+7equ3r885D3CGagnMULgHqyGqyPZkeQBSDIl
	7Xad3kaum2McX1cXB2GX+Nw5err2UM7kSTuA96li24GQwxCa2p09d4acS5EG1m/3W2nh
	/HRw==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr43712180yho.104.1420053415445;
	Wed, 31 Dec 2014 11:16:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 31 Dec 2014 11:16:55 -0800 (PST)
In-Reply-To: <1419610232-6386-1-git-send-email-otavio@ossystems.com.br>
References: <1419610232-6386-1-git-send-email-otavio@ossystems.com.br>
Date: Wed, 31 Dec 2014 17:16:55 -0200
X-Google-Sender-Auth: sbCmb8FhgviKbvVcaqzo1is6Bzk
Message-ID: <CAP9ODKpyDYSHCFF+3RJTa_PgjCEvcSAGEGHKR8cH4ADgg5VuiA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH] sed: Skip 'build-deps' QA check for sed-ptest package
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
X-List-Received-Date: Wed, 31 Dec 2014 19:17:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 26, 2014 at 2:10 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The sed-ptest package has runtime dependencies which are used only
> when running the tests. So the 'build-dep' QA check can be skipped for
> this specific package. Fixes the following QA error:
>
> ,----
> | WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
> |     isn't a build dependency? [build-deps]
> `----
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Ping?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

