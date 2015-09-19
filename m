Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id BDBD865D00
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 13:17:09 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so29604476qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Sep 2015 06:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uNZz7GBiSGV2ormHjKdMcnB6H8czKJVD9ZO9e3b5PMQ=;
	b=XtLZc56su4QAiFg2DcUZvTt6xsnVcIc8BTYJ4ucC9qacs4WltQcfxcO32WfklWplTK
	Ffhj8kOtVoAja9foZyHCpOtz5hTuHYOhPDCfPX/WG4G4mK2orfA90VHG23+rl9e0XKSY
	O3RwH90lkEe7V9CWxMhe4vaRPDi9sNIsPHzXKWHF5ATYlP09wb3YjxK6CAx6QO+AekGb
	0XWBOvSuFxbxV0+Yf0vhmPEMWJ4U7Yvpyvn/ndGBdlkQ0J3X85GKT8YMLS/j+pLmtO3s
	ELVjzH5AfdO+LpST327WWkAX1v8fJ+oVaD2XQpeZxPmOwP/tCLG7DC6B9v8z1A9/g3wa
	SApQ==
X-Gm-Message-State: ALoCoQn8VTeLeIiBUTDponAtSsMjynOJ3oHrj/5/OgbmATPvlkLam5SkxtC1d8FXkZ7XLRg7Xyy6
X-Received: by 10.55.195.86 with SMTP id a83mr12215392qkj.72.1442668629177;
	Sat, 19 Sep 2015 06:17:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Sat, 19 Sep 2015 06:16:49 -0700 (PDT)
In-Reply-To: <55FD5008.1050906@topic.nl>
References: <55FD5008.1050906@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 19 Sep 2015 14:16:49 +0100
Message-ID: <CAJTo0LZ48XTFKaMq+gwMk-RkiPF9J9b9bdYk25PhhkZrnaJVtg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: bitbake: Missing 'import errno' in git.py
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
X-List-Received-Date: Sat, 19 Sep 2015 13:17:09 -0000
Content-Type: multipart/alternative; boundary=001a1142b9502be4b50520197700

--001a1142b9502be4b50520197700
Content-Type: text/plain; charset=UTF-8

On 19 September 2015 at 13:07, Mike Looijmans <mike.looijmans@topic.nl>
wrote:

> I think there's an "import errno" missing in the file. Anyone already
> aware of this, or should I make a patch?
>

Yes, there's a patch on the bitbake list already.

Ross

--001a1142b9502be4b50520197700
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 September 2015 at 13:07, Mike Looijmans <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.=
nl</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3w4"=
 class=3D"a3s" style=3D"overflow:hidden">I think there&#39;s an &quot;impor=
t errno&quot; missing in the file. Anyone already aware of this, or should =
I make a patch?<br></div></blockquote></div><br>Yes, there&#39;s a patch on=
 the bitbake list already.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a1142b9502be4b50520197700--
