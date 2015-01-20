Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABC47229E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:56:11 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id i50so6225838qgf.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5jCifgXcw7/NyUQmbnD6vJUc2rQwARSvVa1WZnCyi8o=;
	b=k4UEGyWSOKhVXXpSVu+XtJlbE/MZUI2VxM6UWU+fZfn0Lwmjm9JYnmbcY0O/kVywKw
	rJtqLsphF//vdcnAZIErYUzYFSNQwTls/1BoLkjtokdEq30ftBubzHOvKzjJK0ELprCm
	eU9w0vmEEfbrijj6Gbf031aH7XBE4swsbSUU8VJIq2gI7l9/41QDoN2xP0Ay+MLGGRuk
	2omsmzwgGCwC4UigFkGd7Q+StNEEblMQrwBWoMoEbyDiuzWn1nuMtF5sRuM/DRE2XxYb
	j8KT6EFO9XeFgwi2e0hSscsian9v4oXD93MbudyyHgz915aNNJkiir2y9Jxy6bIQRjCu
	tN8w==
X-Gm-Message-State: ALoCoQnxa0yUopVExalPh6BwSov6yQENSkBvXIFCeMjM+G2UvadBslyWi+YXez2JOFPsc2dFlEua
X-Received: by 10.224.93.6 with SMTP id t6mr58802486qam.93.1421769372111; Tue,
	20 Jan 2015 07:56:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 20 Jan 2015 07:55:51 -0800 (PST)
In-Reply-To: <1421677653-1166-1-git-send-email-daniel.dragomir@windriver.com>
References: <1421677653-1166-1-git-send-email-daniel.dragomir@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 15:55:51 +0000
Message-ID: <CAJTo0LY9L3vzJ+5EJsov04Dh1D9wCfVj7HHOQ-HcmA79mzG8+w@mail.gmail.com>
To: Daniel Dragomir <daniel.dragomir@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcc-common: Fix file ownership for installed files
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
X-List-Received-Date: Tue, 20 Jan 2015 15:56:13 -0000
Content-Type: multipart/alternative; boundary=089e0149502860d55b050d177ad0

--089e0149502860d55b050d177ad0
Content-Type: text/plain; charset=UTF-8

On 19 January 2015 at 14:27, Daniel Dragomir <daniel.dragomir@windriver.com>
wrote:

> Fix two QA warnings caused by setting the wrong user and group for
> files installed in the destination directory on do_install task.
>
> WARNING: log_check: There is a warn message in the logfile
> WARNING: log_check: Matched keyword: [warn]
> WARNING: log_check: warning: user xxxx does not exist - using root
>
> WARNING: log_check: There is a warn message in the logfile
> WARNING: log_check: Matched keyword: [warn]
> WARNING: log_check: warning: group xxxx does not exist - using root
>

This worries me.  Why is libgcc installing files with the wrong owners, and
is libgcc special or are other packages also installing files with the
wrong owners?  If this is a libgcc-specific problem and files are installed
with the wrong owners then fixing the install process seems like a better
fix.

Ross

--089e0149502860d55b050d177ad0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 January 2015 at 14:27, Daniel Dragomir <span dir=3D"ltr">&lt;<a href=
=3D"mailto:daniel.dragomir@windriver.com" target=3D"_blank">daniel.dragomir=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":31c" class=3D"a3s" style=3D"overflow:hidden">Fix two QA warnings ca=
used by setting the wrong user and group for<br>
files installed in the destination directory on do_install task.<br>
<br>
WARNING: log_check: There is a warn message in the logfile<br>
WARNING: log_check: Matched keyword: [warn]<br>
WARNING: log_check: warning: user xxxx does not exist - using root<br>
<br>
WARNING: log_check: There is a warn message in the logfile<br>
WARNING: log_check: Matched keyword: [warn]<br>
WARNING: log_check: warning: group xxxx does not exist - using root</div></=
blockquote></div><br>This worries me.=C2=A0 Why is libgcc installing files =
with the wrong owners, and is libgcc special or are other packages also ins=
talling files with the wrong owners?=C2=A0 If this is a libgcc-specific pro=
blem and files are installed with the wrong owners then fixing the install =
process seems like a better fix.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--089e0149502860d55b050d177ad0--
