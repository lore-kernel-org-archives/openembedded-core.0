Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B62F6608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 11:35:20 +0000 (UTC)
Received: by iodb91 with SMTP id b91so5136743iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=31qxLGMHiKQUVIy3o7bLXD9SRFWzzEGskFzCWUD5NqE=;
	b=Q+Cr4BpnOMIbX+cNgnsHkj0fuVXMJj1kzNsIYJbqP9zbVqQrdQde4Mt2vIIYwiqOZc
	4v7B9iHdcl2XyB2a46yW4JvtLOz18MWb7YZjG9Hf4yauY9db7E7l2RSW48dQeUKHjXhG
	mS3ymBB/ek35X4UEGPHzreFEHSV2l9OVOS+8bjqurhF0hbu6lXxDW+l6Ab0a31AviUer
	Ae1aCgoYawjPlx9cssGGsnwBJpfaqf+9MwWUk17sI35gUCB4RtXU4ncQoykT7bvNifKi
	PvHdesMV1NDqq/FFPAyyPo30DNXSJifkDFmBOO/bFMPYgNpYFdqanUVNsL0+advXi3GS
	kiQQ==
X-Gm-Message-State: ALoCoQnty5cDmuQTVKmZ9BIQ1l2aeaiejIihqGJI64E15sFpGQlGUiu50V99OvhZIP893bmtaYZG
X-Received: by 10.107.131.168 with SMTP id n40mr13277109ioi.47.1439984121036; 
	Wed, 19 Aug 2015 04:35:21 -0700 (PDT)
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com.
	[209.85.213.182])
	by smtp.gmail.com with ESMTPSA id qc6sm454791igc.1.2015.08.19.04.35.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 04:35:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxp17 with SMTP id p17so102964506igx.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:35:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.178.133 with SMTP id cy5mr29323782igc.5.1439984119843;
	Wed, 19 Aug 2015 04:35:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 19 Aug 2015 04:35:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 19 Aug 2015 04:35:19 -0700 (PDT)
In-Reply-To: <CAJTo0LaoZcQ+398vYS-iaVssQnAVHr0cJCY4izC8=T73nWy4rQ@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
	<20150819071002.GA10916@ad.chargestorm.se>
	<CAJTo0LaoZcQ+398vYS-iaVssQnAVHr0cJCY4izC8=T73nWy4rQ@mail.gmail.com>
Date: Wed, 19 Aug 2015 08:35:19 -0300
Message-ID: <CAP9ODKok+TydzwtDA7o9YRS_tVEqffMPWAJtgPPPsbAjv5XpBA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Wed, 19 Aug 2015 11:35:24 -0000
Content-Type: multipart/alternative; boundary=089e01538cbef214da051da86dde

--089e01538cbef214da051da86dde
Content-Type: text/plain; charset=UTF-8

Em 19/08/2015 12:26, "Burton, Ross" <ross.burton@intel.com> escreveu:
>
> And now for the elephant in the room: is anyone going to work on this? :)

I can ask our people to work on this.

Is there a bug number to assign for me?

--089e01538cbef214da051da86dde
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
Em 19/08/2015 12:26, &quot;Burton, Ross&quot; &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; escreveu:<br>
&gt;<br>
&gt; And now for the elephant in the room: is anyone going to work on this? :)</p>
<p dir="ltr">I can ask our people to work on this.</p>
<p dir="ltr">Is there a bug number to assign for me?<br>
</p>

--089e01538cbef214da051da86dde--
