Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 26F436093E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 14:51:59 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id r30so123457787ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q63bjK7njDCb6CVKUO54jK0Z5+hE/SA3Z07N6FH5Y1o=;
	b=VVFVGYNjADzImbyWWjRZhUTo13SgQCObP37VnCvHj9zFHLsUJAWU0RFias9XFQrc4x
	wjWAcWaKcjMOgBDJH8yn3EUFJnKpHtJileaHKOnpFT4acKPxA8WGiZAJJckIqCALRvW7
	WU6xZFY9rP3VcqGk5MDBLb/N2pFQ/PAYTzRZ3yveqDHz8xg+pR7F7wTSOUE4oBDI8Kq5
	BAOqJjWfC1A7L/J5Cara9ZdQOWuIwp64RS/8e79GYcD7z7OnHk7uan8RICgYkcNdmulX
	Q2M54woe2Zbfjoa+9WmKl9RXsOEAFfrKTE2mtdXW3aI+vsDQyoCNeK0VTtv+SUsrpe/O
	nwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q63bjK7njDCb6CVKUO54jK0Z5+hE/SA3Z07N6FH5Y1o=;
	b=EUGRKHGwel9Iisx3N4UsyVIqNOUDd1XfD2acUeXHkKkgm4XI7HkCn3/OnffDEfDwZL
	bSLBBEmoVjJFtF6eUR3zsNjtsJ6LdB2uEsSIkD5keUU9hu5D2FCFGYDrriee2gnG4WA3
	mxqZKTbxbkdZgy6L0D0oUBJMPtTCM0X8jR1oLb8VlxrUWm72i/VrPNuQFSGwEjozu9OA
	c5HPoVEi4kBuxomlYHnmEafNIqUf05/qu33RIITwXv1v9U4i1Mr3ZqJa3+iEOpgTg4kZ
	fcrBdukGpZhdy/iDSxGoJSfqHMgdNL2Gp5KgV/IDD0aYPFJvh/XUKGZJ5QkZCIEWYHiH
	Nusw==
X-Gm-Message-State: AA6/9RkrDtvpkmCEJsar83SMkTP0QvYjKVMF20xgwhRI1VkojvPTqhigVYyr0GZfRk2aChVyWzzQihegoQw4xgAQ
X-Received: by 10.107.5.72 with SMTP id 69mr11637574iof.132.1476456721214;
	Fri, 14 Oct 2016 07:52:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Fri, 14 Oct 2016 07:51:40 -0700 (PDT)
In-Reply-To: <1476451269-11260-1-git-send-email-amarnath.valluri@intel.com>
References: <1476451269-11260-1-git-send-email-amarnath.valluri@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Oct 2016 15:51:40 +0100
Message-ID: <CAJTo0LZpzEtbLoeth8yWZ0vhxR8TBWCNKe7zHY-kAM83HVmL3w@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glmark2: Enabling c++ 11 features
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
X-List-Received-Date: Fri, 14 Oct 2016 14:52:00 -0000
Content-Type: multipart/alternative; boundary=001a113efe2c65e50d053ed45edb

--001a113efe2c65e50d053ed45edb
Content-Type: text/plain; charset=UTF-8

On 14 October 2016 at 14:21, Amarnath Valluri <amarnath.valluri@intel.com>
wrote:

>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 3 +++
>

This should go to openembedded-devel, not -core.

Ross

--001a113efe2c65e50d053ed45edb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 October 2016 at 14:21, Amarnath Valluri <span dir=3D"ltr">&lt;<a href=
=3D"mailto:amarnath.valluri@intel.com" target=3D"_blank">amarnath.valluri@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":li" class=3D"a3s aXjCH m157c35c265e531eb">=C2=A0meta-oe/recipes-benchm=
ark/<wbr>glmark2/<a href=3D"http://glmark2_git.bb" rel=3D"noreferrer" targe=
t=3D"_blank">glmark2_git.bb</a> | 3 +++<br></div></blockquote></div><br>Thi=
s should go to openembedded-devel, not -core.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113efe2c65e50d053ed45edb--
