Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 189996013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 20:49:59 +0000 (UTC)
Received: by qgh3 with SMTP id 3so128911173qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 13:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OYAi03iqsXJ4X6whK97vSF/JnMh7+ni/E4pJ4Z99YLA=;
	b=UlL9YMzPws1mBjHwo6KAobStmWZsqZchhSN+l1YU3znhEs19a/2s8RoeYBwdQGVz2P
	euqAfNZMwwsOLY1O9RgPGIdcHLkRsybNW9cG1EonQiA4nlusy9TlF1zV7lLstM9kk0bh
	fOSnxiV3yw71QQjSzjMohT1zWz/9RvbNSPoJOf6/KcNgdn9rXdD+7u5NO9iOPBzjG5PE
	sPd2zL6GnK55UKp9TFoXqZ49N9+mQdymoNLHmvNlxaFpk1Hs68VY9VL+M2sPFJFayB/a
	5gPoV5vFHwl9Bpcsrr6hz2OKdeEu7XRPnw0mfCTmvrn7JC+zVDL8kFSE+qJ0HlgrPMMP
	Z7kQ==
X-Gm-Message-State: ALoCoQlB8dWS/w2CRvB1j1TNZYsdJotndjWgxiRQ/ode/4/ndEyCnDzbNlRNCmrbmCjOJVPzy8sC
X-Received: by 10.55.24.160 with SMTP id 32mr43794305qky.23.1427489400434;
	Fri, 27 Mar 2015 13:50:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Mar 2015 13:49:40 -0700 (PDT)
In-Reply-To: <D13B0D59.C4118%dvhart@linux.intel.com>
References: <1427476655-5162-1-git-send-email-juro.bystricky@intel.com>
	<D13B0D59.C4118%dvhart@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Mar 2015 20:49:40 +0000
Message-ID: <CAJTo0Lb5zFO+u2mBtAWSRTUnxF3yqygSBvVMQJ9ohjKYhFCcQQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>,
	Juro Bystricky <juro.bystricky@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-git-proxy: Redirect error messages to STDERR
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
X-List-Received-Date: Fri, 27 Mar 2015 20:50:03 -0000
Content-Type: multipart/alternative; boundary=001a11441462a24b7605124b4697

--001a11441462a24b7605124b4697
Content-Type: text/plain; charset=UTF-8

Hi Juro,

On 27 March 2015 at 20:37, Darren Hart <dvhart@linux.intel.com> wrote:

> >oe-git-proxy script needs socat. If socat is not found,
> >an error message is issued on STDOUT. This leads to a misleading
> >git message:
> >
> >fatal: protocol error: bad line length character: ERRO
> >
> >instead of the intended message:
> >
> >ERROR: socat binary not in PATH
> >
> >Redirecting the error message to STDERR fixes this issue.
> >
> >Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>
> Thanks Juro, good fix.
>
> Reviewed-by: Darren Hart <dvhart@linux.intel.com>
>

I never saw the original mail, can you re-send it to the list please?

Ross

--001a11441462a24b7605124b4697
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Juro,</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">O=
n 27 March 2015 at 20:37, Darren Hart <span dir=3D"ltr">&lt;<a href=3D"mail=
to:dvhart@linux.intel.com" target=3D"_blank">dvhart@linux.intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4qh" class=3D"=
a3s" style=3D"overflow:hidden">&gt;oe-git-proxy script needs socat. If soca=
t is not found,<br>
&gt;an error message is issued on STDOUT. This leads to a misleading<br>
&gt;git message:<br>
&gt;<br>
&gt;fatal: protocol error: bad line length character: ERRO<br>
&gt;<br>
&gt;instead of the intended message:<br>
&gt;<br>
&gt;ERROR: socat binary not in PATH<br>
&gt;<br>
&gt;Redirecting the error message to STDERR fixes this issue.<br>
&gt;<br>
&gt;Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@inte=
l.com">juro.bystricky@intel.com</a>&gt;<br>
<br>
Thanks Juro, good fix.<br>
<br>
Reviewed-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.intel.com">dvha=
rt@linux.intel.com</a>&gt;</div></blockquote></div><br>I never saw the orig=
inal mail, can you re-send it to the list please?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11441462a24b7605124b4697--
