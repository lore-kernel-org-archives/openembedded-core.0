Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 515AE71633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 11:14:29 +0000 (UTC)
Received: by qgeo38 with SMTP id o38so2891476qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=i1/G8b1uhvGQdzIR5EH+I8WYkSPxQAIbJbWPjfL/Ti8=;
	b=qOSFEVS4S6Yn/Ueyl8041MgthonPN9VYO1EEpX217vpiDCCHxBbgypYYYNqqOxcsqG
	5VigA4asWUGpsvT4VbUx2SIGiskKbnVQSJDf9oQHTQRQ1KNUczFq2QnDl86vJTqUazri
	URu9VcXts7AiNiNDMtcBT2VcFz10VvOAzSUxS4vPp9mINKPBCx/Sw5KuZ36P85bDPu3l
	XrhxFRxFfSWLN0NT3N1pZcjXao8I8uaRMRGyYxOFeVobFE+8eJB/rXfUdDAXJz97xur/
	za+r4YNmvmHAPLF6Npe8PMt4eBzdszpdsxuj6AfClGByRLEpTOW7/d0xML3+pnkgV988
	t5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=i1/G8b1uhvGQdzIR5EH+I8WYkSPxQAIbJbWPjfL/Ti8=;
	b=UyrgFNsFiDPuxlu9vP2Y39Yl/ElquF2l8zGa80XQL6m7G7DXRhgtWpwP+f1dOYIsFC
	qiTZKW0BoLSGY9EAI5MUnn0OKZxDMVVpDObDyr2mNgZ7YK1xGasGIKhpocpbUMNxDnjr
	rz/DTHi/ogOnyrxTbb16+movQjweHzXdt8Wz8ad6E667dZzVqtFuRfmiNK4YATgCWubU
	+Uw8lensiMsl749ON7LwESYvS+HWgPLxUoWVcduITi67PoIYNZ6xnOUK3lbAayFwXUVA
	jJHrs+xg7e41RbWBp4WgJr+1DpJf2whVUac0AQ42jbfG5YCv6EfbyzkUHdSDESctQfnJ
	TbuA==
X-Gm-Message-State: ALoCoQmcZ7zZEmEhi33KDj98Y30pkA8MiS3apGCELxLszY2I/n/tsHIzd0mTKYwg39DNxF8nRYw/
X-Received: by 10.140.171.197 with SMTP id r188mr16667130qhr.93.1446030869356; 
	Wed, 28 Oct 2015 04:14:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Wed, 28 Oct 2015 04:14:09 -0700 (PDT)
In-Reply-To: <77690b5c7cf4202599eafda90761a0e32cb464f7.1446013329.git.Qi.Chen@windriver.com>
References: <cover.1446013329.git.Qi.Chen@windriver.com>
	<77690b5c7cf4202599eafda90761a0e32cb464f7.1446013329.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Oct 2015 11:14:09 +0000
Message-ID: <CAJTo0LZTJF=mSDxf3shmetXubKRg+4JZrDR_fa437y4GhB7Sww@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rsync:Use usleep() for msleep() if it is available
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
X-List-Received-Date: Wed, 28 Oct 2015 11:14:34 -0000
Content-Type: multipart/alternative; boundary=001a113a7dfa4d7d250523284c57

--001a113a7dfa4d7d250523284c57
Content-Type: text/plain; charset=UTF-8

On 28 October 2015 at 06:41, Chen Qi <Qi.Chen@windriver.com> wrote:

> +Upstream-Status: Pending
>

Don't you mean backport?

Ross

--001a113a7dfa4d7d250523284c57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 October 2015 at 06:41, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2qj" class=3D"a3s=
" style=3D"overflow:hidden">+Upstream-Status: Pending<br></div></blockquote=
></div><br>Don&#39;t you mean backport?</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a7dfa4d7d250523284c57--
