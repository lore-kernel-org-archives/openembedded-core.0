Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5C80573EC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 13:38:33 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so87846476qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 06:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BUzw/yVnFwIq5dOjtXl75n+mKe5pY+KObJm6JRQAzEY=;
	b=DCya8uMIvdbF1MqKBns6k8PqORGQEdJAWFetoMcOPTo+Cy3NzHd/fa3dhIxzEN8cbp
	IgWNyQvXM5iBPmTnPi617aSs+vuARVWY6fIRW+0yrOOAdIt9XQHfnBLc0TaIYeb3byVk
	cE979nIqJZK7PvLP074B1YBE+2rv47H1lI9D0E8/MgeHPJqve5+B80D0XmDgcIVXtmQs
	qtjKzuC9e9d8Z32yLkKnwfRVA/vs48Qo3+GcB9dsBs6rzqsuPkgAu3UV6hG1SWA7yLBQ
	2yh7sEOCQ/GjtsaYo/aNqu2tEe5Uxlpt0gnU0HTD3oNzTaFBZYziJUU5H4n8uDq+vlgU
	XnDw==
X-Gm-Message-State: ALoCoQmRVgECrE8fEIlWNTPXwfCI++Mf/3DD2jhkuIczBDaeEXEdbkDr4JPTFRspLoYj87zOjDhb
X-Received: by 10.229.37.200 with SMTP id y8mr35460893qcd.28.1430833114269;
	Tue, 05 May 2015 06:38:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 5 May 2015 06:38:13 -0700 (PDT)
In-Reply-To: <1762023.DLBfWrMxP5@peggleto-mobl.ger.corp.intel.com>
References: <1430828220-14251-1-git-send-email-ross.burton@intel.com>
	<CAJTo0LYPCxdbcKkpJnBhW4ecrAdyPvOURaB6PLLoLWCB_Q-wcA@mail.gmail.com>
	<1762023.DLBfWrMxP5@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 May 2015 14:38:13 +0100
Message-ID: <CAJTo0LZ2hipVZ44Y6gWXDqgKftXCY4XoSBpbHUcM2nzk4iu1wA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] poky.conf: remove SVK mirror
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
X-List-Received-Date: Tue, 05 May 2015 13:38:35 -0000
Content-Type: multipart/alternative; boundary=001a11c2b18082624b051555cb3e

--001a11c2b18082624b051555cb3e
Content-Type: text/plain; charset=UTF-8

On 5 May 2015 at 14:37, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> Presumably we'd want to get rid of the svk:// URIs in mirrors.bbclass and
> own-
> mirrors.bbclass in OE-Core though?
>

Yep, that's the patch that prompted this change (from Andre McCurdy).

Ross

--001a11c2b18082624b051555cb3e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 May 2015 at 14:37, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mail=
to:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
9fq" class=3D"a3s" style=3D"overflow:hidden">Presumably we&#39;d want to ge=
t rid of the svk:// URIs in mirrors.bbclass and own-<br>
mirrors.bbclass in OE-Core though?<br></div></blockquote></div><br>Yep, tha=
t&#39;s the patch that prompted this change (from Andre McCurdy).</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a11c2b18082624b051555cb3e--
