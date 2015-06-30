Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id B273C60017
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:50:09 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so14532533qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YaZyfzC/UlDDMVxDe5WWi6vkI4Fovh4Udn/GZUHrZnk=;
	b=d7pWbK7oQolrzKa7hgI44MtRTx6YAoO409B745dNtlt3GLQHQ6moPn2oJAELPDGAJc
	tt3gJ9VXCxn8zpbGuUrBgeSOqbJxAPp2l3JxquwH4U3kVgda4lgAUtXW5Ute6QZvajP2
	t/n/ZaCFq0G6DWVJ4p1OQVjJ2iKmnfn0JXfOYfo4HmZqZ1Sabguyk2rAvL30PGJzW2hx
	GPFH6CNblK8U6EkgvbkSTG4hLBaaehsmbeWv7c+jDuUIH7k8ezpJC93WIpw4qmtqmDNB
	eWHfSeV8IosaiJMYEm6UraQGSjdRttbh3/s+23TOXQ0SNH77EszTLxNgu5BJ/Fut2W4g
	4E3Q==
X-Gm-Message-State: ALoCoQm3v7fZho+27Nzxg4HrpNZmQwlPctMYzLWZnjAmgxm/QnuD8D1S6NEQzZBxYhtqbZ5wUaT+
X-Received: by 10.55.18.197 with SMTP id 66mr28776829qks.13.1435693810115;
	Tue, 30 Jun 2015 12:50:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 12:49:50 -0700 (PDT)
In-Reply-To: <CAJTo0Lb2doffPRhcsfrr_M37XOxdSL13=juHkvLtbjL4=_3qdg@mail.gmail.com>
References: <cover.1434464336.git.jussi.kukkonen@intel.com>
	<0c7f245a788abe31dc96f33860465b32300c05dd.1434464336.git.jussi.kukkonen@intel.com>
	<CAJTo0Lb2doffPRhcsfrr_M37XOxdSL13=juHkvLtbjL4=_3qdg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 20:49:50 +0100
Message-ID: <CAJTo0Lb4-bL1pK4Lb4BbtArRWumZ2K9JKcWEQoExcO2Yw6uBgg@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/6] adwaita-icon-theme: Add new icon theme for GTK+
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
X-List-Received-Date: Tue, 30 Jun 2015 19:50:09 -0000
Content-Type: multipart/alternative; boundary=001a11474faa8efcb50519c183c0

--001a11474faa8efcb50519c183c0
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 16:47, Burton, Ross <ross.burton@intel.com> wrote:

> Would it be sensible to split out the high-resolution icons (the 256x256)
> into a sub-package so systems that don't have very high resolution screens
> don't need to ship them?  I guess it comes down to how big they are.
>

Answering my own question.  Using du -bh, adwaita-icon-theme is ~12M in
total, ~7MB of which is the 256px icons.  Sounds like a separate package
would be useful for people who don't care for those icons.

Ross

--001a11474faa8efcb50519c183c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2015 at 16:47, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Would it b=
e sensible to split out the high-resolution icons (the 256x256) into a sub-=
package so systems that don&#39;t have very high resolution screens don&#39=
;t need to ship them?=C2=A0 I guess it comes down to how big they are.<br><=
/div></blockquote></div><br>Answering my own question.=C2=A0 Using du -bh, =
adwaita-icon-theme is ~12M in total, ~7MB of which is the 256px icons.=C2=
=A0 Sounds like a separate package would be useful for people who don&#39;t=
 care for those icons.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross=C2=A0</div></div>

--001a11474faa8efcb50519c183c0--
