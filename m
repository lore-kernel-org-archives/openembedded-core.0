Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1FACA6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:10:50 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 97so16454629iok.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 08:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Te55HmFZLBZV6tjO62H/N8eYf6yCQA3LFyeODYPOQU4=;
	b=wv9c+kK4mo8jexUG0iKEolrNWQRqEGnxvZOMC3ikhVDL81uHZd9pZ4KJ96MDz8lTf8
	BqN/yYlqg0r4FGMC1hjutg3v3i96tTlralvBIQLLUOkiZwj+U0YYc2koQPJ5SjMbf4ef
	9iLxne9n0p6SwX6Gub+qW+IM5Mgr+liPqeyHajQAJux/Otjj8hF6NJxegeHZIlXcTcTU
	ZdhbxOF6+UttAgDv/Po5rtZRfR8gcIDXkU3a2RzcPtDIFwSFwHMlR7HuEiIBK3WbgP6u
	19qUpLa3n9mbBz1U5JoRRDKPoWnrQDpcufr9iFBzmrHpL7CkryZbnK14vxd6M8FFhWba
	5bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Te55HmFZLBZV6tjO62H/N8eYf6yCQA3LFyeODYPOQU4=;
	b=hiCpOGLVvuxyMCldKZDaIqSpZhUToR9N02JprHs/rF4mWbjnEL6KbmrLiky38f/pyc
	x3Iu8hRUndeg8fsbRbKdW0igLisY2FfL50HiNIGxC3v6tLQ6IPlOXGwuOtRaTQbRvHw6
	2o5UVMBfWDKWDyw0qxRWeUXnve6IUU1eZxc9mIg4+c8459gygGexi3bl+r9RTKOIB6AQ
	cz3Fb/ap+YKVGxrNOLSQefDZgBoyQLyV7da7Xb067bJKsQWkYzzBeY5LLhuZoZALdtqx
	oZeDDhRrOLGLqKghZR3gobLbKHKMtHUeI4HeSieUiDDwCAGr3VA9cY3rwgoJLxgg0atW
	eQrw==
X-Gm-Message-State: AMCzsaVtprjEYBDzW5IgGPYV87UhXCkNdX5DYbsd8zbFK+VniLVWRst9
	8laEhlQepbZ4UKkFsgLWcioJcUz8XJVNn2/x89tOUQ==
X-Google-Smtp-Source: AOwi7QCPSH/8mGs2XahUco8pM703H2q3MOZ1zK19wPTeFROeZJ+skV2uyDZmIrm4otBXj1TEpzbwDoX7/JCb47RHu7o=
X-Received: by 10.107.189.129 with SMTP id n123mr13499799iof.48.1508166652071; 
	Mon, 16 Oct 2017 08:10:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 08:10:31 -0700 (PDT)
In-Reply-To: <CA+chaQeokk6Ao9QcRoC1_jb+HzOAn0hOyAK7NRxo4yT_38f1Sw@mail.gmail.com>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170919151851.25093-1-Martin.Jansa@gmail.com>
	<CA+chaQeokk6Ao9QcRoC1_jb+HzOAn0hOyAK7NRxo4yT_38f1Sw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 16:10:31 +0100
Message-ID: <CAJTo0LbKoM94aUnrQ99iF470AE2cJ_Q0LgGOEp8VH-TzdwYu0Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCHv2] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Mon, 16 Oct 2017 15:10:51 -0000
Content-Type: multipart/alternative; boundary="94eb2c0761c88f5e63055bab6933"

--94eb2c0761c88f5e63055bab6933
Content-Type: text/plain; charset="UTF-8"

On 16 October 2017 at 16:01, Martin Jansa <martin.jansa@gmail.com> wrote:

> The world builds with this check applied show that *a lot* of components
> report one of these errors and often many of errors, the most complete logs
> from last couple days:
>

A lot of the errors in my logs were due to package-output.lock being
accessed inside/outside pseudo context.  Can you grep all of your logs and
collate some common patterns?

Ross

--94eb2c0761c88f5e63055bab6933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 October 2017 at 16:01, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">The world=
 builds with this check applied show that *a lot* of components report one =
of these errors and often many of errors, the most complete logs from last =
couple days:</div></blockquote><div><br></div><div>A lot of the errors in m=
y logs were due to package-output.lock being accessed inside/outside pseudo=
 context.=C2=A0 Can you grep all of your logs and collate some common patte=
rns?</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c0761c88f5e63055bab6933--
