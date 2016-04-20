Return-Path: <trini@konsulko.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 79E0973166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 15:23:31 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id d90so511149qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ypdiOvmvH+d5apmmP6MVuHZyT4cNFrI2pWnPYEDCwjA=;
	b=WsEdtvjtg4Dcb55idsrhFddRzSKgNTz5qA/XBHWWBJqp++qp1HT+V9RQdiMROb4Pdl
	jw4Ij2C4ls2kzrmBFG4E3LJvoqr6j5daBoZjX0SVpuO3F7j9tlIV/F4ZAizoxjWndMpV
	Ui9EhHb5bVvRYfS3URezCqawy1VoVPK0GWSi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ypdiOvmvH+d5apmmP6MVuHZyT4cNFrI2pWnPYEDCwjA=;
	b=i3sxSKaj+weezTTSYhL/Qw43oFWDAwdom3i6vQvzzSOFVXFD7llGFW0xj6ieAIcX8h
	T0wrs7d3jcfx+KCrxex56jvULH0U7fCGlTmdzyEoOGLFB+MNcjgZxGprquLSV11FeKZK
	8NcdYHwtG6z2co3GFcjDsK3Kbhbqy4/2LG4Medbjr09Yz2MCIREg/ipZovKfMoRHk3Ci
	Zdl78gv/YxOslHz2dywQFkOGPruZpqPq7bmwklvYX3DqixosXLWT79DaGAcNh8pcmB/f
	u4BkEV0LHtzvFllLlZ6Rcp+42Mzn7gWS6D2B6vufHMLhbW9ROPpXyY2Gl2wfDc7pxRTM
	Nd6w==
X-Gm-Message-State: AOPr4FXh0Yq5rW/EdiwORcaPOw6u5zd4NUXh0oj4JRCuUBY177e19RoMvKuXhV8eMIslVg==
X-Received: by 10.140.40.231 with SMTP id x94mr11771670qgx.83.1461165812613;
	Wed, 20 Apr 2016 08:23:32 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:225:22ff:fec3:d28d])
	by smtp.gmail.com with ESMTPSA id
	s62sm24965159qhe.10.2016.04.20.08.23.32
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 08:23:32 -0700 (PDT)
Date: Wed, 20 Apr 2016 11:23:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420152334.GD1924@bill-the-cat>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-3-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-3-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 2/4] u-boot: deploy u-boot-nodtb and dtb files
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
X-List-Received-Date: Wed, 20 Apr 2016 15:23:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:37PM +0200, Yannick Gicquel wrote:

> This enable the deployment of u-boot-nodtb.bin and u-boot.dtb files.
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

