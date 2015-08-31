Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 852FC762B7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 04:23:09 +0000 (UTC)
Received: by iod35 with SMTP id 35so16031322iod.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 21:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=G+5kJYbwb7+YNu766r1Koc3wOsBCVZtNV+B5zax48W8=;
	b=vJ+w9J3vi0nvmiKfiPTq0nzrSbXbLstvpdnhcwFEB2rhNAkN/q6WhWj9Xw/1qP/jXW
	WjL9cwe/+a6h+Z7k/27EOZe6cvEU9DkZRssddgHmDgn9iJXNiJ8x8EIFnfCcWvzNZAg4
	vi4pNOT+QSsuPm1xfc0vibrrvfyZUnWdIWu/HEKO7yXCfVPCAFqTPCcq95OlnVtpKer8
	Kq2uA5b+MGluggyS6C34WuQUFlrJxpd3bwj5ZFXR/2d37XcZ013j8XQ6wsQG2ypuT25t
	bWD4E3KIyhUsUZvYizIhQq4CQaRgISGI87IRdPTwdrHdS8fysOqcTtEI2ZFLiiFE9ijv
	PQsQ==
X-Received: by 10.107.40.200 with SMTP id o191mr22034378ioo.83.1440994990076; 
	Sun, 30 Aug 2015 21:23:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Sun, 30 Aug 2015 21:22:50 -0700 (PDT)
In-Reply-To: <989b768736c5d92eda4f8beb230e02005811ff18.1440969020.git.ed.bartosh@linux.intel.com>
References: <cover.1440969020.git.ed.bartosh@linux.intel.com>
	<989b768736c5d92eda4f8beb230e02005811ff18.1440969020.git.ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 30 Aug 2015 21:22:50 -0700
X-Google-Sender-Auth: Kmxqs31xHaVHB3tydI1rFt70VZM
Message-ID: <CABcZANkADU6Ttr+6ZWGcH51Ue_Au++5ULxfN1__p4z+zcJYi6g@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] image.py: write bitbake variables to .env file
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
X-List-Received-Date: Mon, 31 Aug 2015 04:23:11 -0000
Content-Type: multipart/alternative; boundary=001a1141cf8c81bc4b051e93ca5e

--001a1141cf8c81bc4b051e93ca5e
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 30, 2015 at 2:14 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Write set of bitbake variables used by wic into
> build/tmp/sysroots/<machine>/imagedata/<image>.env
>
> List of variables is defined in WICVARS variable in
> meta/classes/image_types.bbclass.
>
> This is needed for wic to be able to get bitbake variables without
> running 'bitbake -e'.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>

The function name (_write_env) sounds generic, as does the commit message,
and the filename, yet it relies on a variable which is WIC-specific. This
seems rather inconsistent to me, either this thing is for wic alone, or it
isn't, and the function name, file name, and variable name should reflect
that.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141cf8c81bc4b051e93ca5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Aug 30, 2015 at 2:14 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux=
.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">Write set of bitbake variables used by wic into<br>
build/tmp/sysroots/&lt;machine&gt;/imagedata/&lt;image&gt;.env<br>
<br>
List of variables is defined in WICVARS variable in<br>
meta/classes/image_types.bbclass.<br>
<br>
This is needed for wic to be able to get bitbake variables without<br>
running &#39;bitbake -e&#39;.<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br></span></blockquote><div><br></div><=
div>The function name (_write_env) sounds generic, as does the commit messa=
ge, and the filename, yet it relies on a variable which is WIC-specific. Th=
is seems rather inconsistent to me, either this thing is for wic alone, or =
it isn&#39;t, and the function name, file name, and variable name should re=
flect that.</div></div>-- <br><div class=3D"gmail_signature">Christopher La=
rson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Open=
Zaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</=
div>
</div></div>

--001a1141cf8c81bc4b051e93ca5e--
