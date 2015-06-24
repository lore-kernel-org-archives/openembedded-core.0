Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id B5FCE75A33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 11:56:36 +0000 (UTC)
Received: by qcet6 with SMTP id t6so10760415qce.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 04:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jiob9T+r9WKXlVYzfEjlKaaG8FD6QxCjsF7HdG4eh34=;
	b=TcaknqG8xMwR1jC0EpKDMXLeZw8/RBSvifd+eWMH+ZrZz43DS3XEISc5Td+s9PQWC4
	B85az/WMJDXF9WBdEF1gNF4h0gYsw5BP1BL2sFwylrRrtlltLHJlm2lwx4lwiAAoIee4
	SXfeidmmaN1pcMQ8VLFzQzmaswiPT/EKN8oV8S+Q2djG9A+mF7LKQ+vcDoPMsdFnhC5D
	Hmnosoax/VDto7cuIFUTBjnYYo6NPScImtJAVWSvcVIh28QL57t6s5JS+FCPtSjf6Xy6
	Ur0LRti0MJtdFuEV5ANZNyCyOh6xRxq6TBsHZJVLnXA32IYcnlrM01B4F68FMXmcNeZz
	hwYQ==
X-Gm-Message-State: ALoCoQl2nATqY0rlGtRqMLGsMEN0WuhW68yKABMDFJk/hF1i8OjbU6hfY7Z0tlDLuYrsl72Vezqz
X-Received: by 10.55.27.11 with SMTP id b11mr58609903qkb.105.1435146998094;
	Wed, 24 Jun 2015 04:56:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 24 Jun 2015 04:56:18 -0700 (PDT)
In-Reply-To: <bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
	<bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jun 2015 12:56:18 +0100
Message-ID: <CAJTo0LZBzMKzzswgtsk0o3uohK+03a4kPB0niwhvyYqxpQBhYg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Wed, 24 Jun 2015 11:56:38 -0000
Content-Type: multipart/alternative; boundary=001a1147f32e05b84e05194233c0

--001a1147f32e05b84e05194233c0
Content-Type: text/plain; charset=UTF-8

On 24 June 2015 at 09:55, Robert Yang <liezhi.yang@windriver.com> wrote:

> Updated 0001-Add-P-prompt-into-Usage-info.patch.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

Currently this fails to fetch:

WARNING: Failed to fetch URL ftp://ftp.astron.com/pub/file/file-5.23.tar.gz,
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 6, output:
Login incorrect.

Hopefully this is a transient failure but is this still the best source
location?

Ross

--001a1147f32e05b84e05194233c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 June 2015 at 09:55, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":5kf" class=3D"" style=
=3D"overflow:hidden">Updated 0001-Add-P-prompt-into-Usage-info.patch.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>Currently th=
is fails to fetch:</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra"><div class=3D"gmail_extra">WARNING: Failed to fetch URL <a hre=
f=3D"ftp://ftp.astron.com/pub/file/file-5.23.tar.gz">ftp://ftp.astron.com/p=
ub/file/file-5.23.tar.gz</a>, attempting MIRRORS if available</div><div cla=
ss=3D"gmail_extra">ERROR: Fetcher failure: Fetch command failed with exit c=
ode 6, output:</div><div class=3D"gmail_extra">Login incorrect.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Hopefully this is=
 a transient failure but is this still the best source location?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>=
</div>

--001a1147f32e05b84e05194233c0--
