Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8824C73F30
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 10:35:21 +0000 (UTC)
Received: by qgfi89 with SMTP id i89so2113732qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 03:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nEeli1jDg+15lktCkikSEjV00bBsOvfXhRMkjAELqo4=;
	b=fJLb7rFpfh4Foen/nickAV7C4u7Mb7HhU8EG44Y1nPbehZbTYozpxaLW3gP2V820sU
	fKz+So4zQpCzQW9vLn102SBYpao1mz6qiLm11uPZKcjw0PGpHfCqospKy0Dqt1hUDus8
	/nQdo59kRzJsl9cEQ9zz4wRpoiyPdC4OVTGrEO6Xn+DR3aOrx3qki0R4UG+EpT71ln6C
	J5eRDbVkJV5X/dNDlv39BEsbNsKk7ExBz6YPY12z1lDDfXHKvipepM68PHosdAnFydfA
	ib4KWEAXbKZcaeVORpxJwdUWzI/QuSbh7C5XOOF9OvAjJKnpCeNuYSymHerq3W1UyqcN
	LOEw==
X-Gm-Message-State: ALoCoQksNUwtS84vGDdqWhcTgPCQd7ujyzWd0ruFO8OXzj3JJgMet46RzmisowarIJP+Oye8pkF2
X-Received: by 10.229.110.10 with SMTP id l10mr20522313qcp.5.1430908522995;
	Wed, 06 May 2015 03:35:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 6 May 2015 03:35:02 -0700 (PDT)
In-Reply-To: <5549B621.4060008@topic.nl>
References: <5549B621.4060008@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 May 2015 11:35:02 +0100
Message-ID: <CAJTo0LZ1DgAk3Dmaq5Ted_7K-QWzM=nvsScgSMdUSQtFb9Bq3g@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Changing external kernel module results in rebuild of whole kernel
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
X-List-Received-Date: Wed, 06 May 2015 10:35:22 -0000
Content-Type: multipart/alternative; boundary=001a11344c843837410515675a48

--001a11344c843837410515675a48
Content-Type: text/plain; charset=UTF-8

On 6 May 2015 at 07:35, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> If I change a recipe for a kernel module (a bb recipe that does "inherit
> module") this will trigger a rebuild of the whole kernel.
>

You can start to debug this by using bitbake-whatchanged. Build the kernel
and modules, make a minor change to the module recipe, and then run
"bitbake-whatchanged virtual/kernel" or some relevant target.

Ross

--001a11344c843837410515675a48
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 May 2015 at 07:35, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fzi" class=
=3D"a3s" style=3D"overflow:hidden">If I change a recipe for a kernel module=
 (a bb recipe that does &quot;inherit module&quot;) this will trigger a reb=
uild of the whole kernel.<br></div></blockquote></div><br>You can start to =
debug this by using bitbake-whatchanged. Build the kernel and modules, make=
 a minor change to the module recipe, and then run &quot;bitbake-whatchange=
d virtual/kernel&quot; or some relevant target.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11344c843837410515675a48--
