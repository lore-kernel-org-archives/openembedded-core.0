Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D2B55761D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:55:07 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so156873452pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=adSE2Q1iBUcR2w8Kh5BCLGEZsBBltGbSwdUuAKGiwbw=;
	b=TzKAT+wPAFuSEdoYQmN3Pzyf+ZgFA9WlQo0ZU/WT8e9xg7/pPyBMX6C3qHpUmrokmP
	Owv0X046/YkP9vS4/nRV53VBWpQtBTcRvT9m4GyZiU5cg+6cye7k6pcO24s9vjwl7dLI
	3PXVQ71SJjmlILkNiHytWsxg+9Sgb/FeQgzxidPWPuqXF2Vbm+7NdsLnEsE1lbqD4Mfp
	pXBMjkiNChl2IBkf1NFARIM7S/lx3FYBHZsrshvqZ2nWLWE0aDzm+al2SGow9N+yvPy2
	1idhASssnRRTU++UnjmcLjxROqW77YSPFwfz4r8TZuw3XuaDM4RCF8zQwNigUhNP9N/6
	GVkQ==
X-Gm-Message-State: ALoCoQkLEN1vgX1JDUb2r2v4C4co5BNfwkzkiB8J6yR0IAyg8+yBxE7hoRIUFeU5NLoXaReFwxcF
X-Received: by 10.70.38.231 with SMTP id j7mr18757384pdk.146.1437656107623;
	Thu, 23 Jul 2015 05:55:07 -0700 (PDT)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47]) by smtp.gmail.com with ESMTPSA id
	w10sm8930919pds.49.2015.07.23.05.55.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 05:55:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabkd10 with SMTP id kd10so85315714pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:55:05 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.20.196 with SMTP id p4mr18388723pde.58.1437656105310;
	Thu, 23 Jul 2015 05:55:05 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 23 Jul 2015 05:55:05 -0700 (PDT)
In-Reply-To: <1437658192-8322-4-git-send-email-b54851@freescale.com>
References: <1437658192-8322-1-git-send-email-b54851@freescale.com>
	<1437658192-8322-4-git-send-email-b54851@freescale.com>
Date: Thu, 23 Jul 2015 09:55:05 -0300
Message-ID: <CAP9ODKqUy+yz4fT+Rn81FNv6Tz0NRZAKe05ToZrmW73a0YX6aw@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 3/3] gstreamer1.0-plugins-base: Add patch for Gstreamer 1.4.5 base
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
X-List-Received-Date: Thu, 23 Jul 2015 12:55:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 23, 2015 at 10:29 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> Bug fix
>
> -[video-frame] Don't ref buffers twice when mapping
>
> -[video-frame] Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>
> -[videofilter] Use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
>
> -[id3demux] Use g_utf16_to_utf8() instead of g_convert
>
> -[gstvideodecoder] Handle audio video decoder error
>
> -[gstvideopool] Update video alignment after video alignment
>
> -[gstvideoencoder] Keep sticky events around when doing a soft reset
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>

Please split those so each one can be reviewed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

