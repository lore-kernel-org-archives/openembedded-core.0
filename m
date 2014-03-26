Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 355A36F4E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:47:42 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id c9so2727207qcz.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FBsPrq/7LxAX1hWhZb5VumqRunIJtuDVo23K6V96hRg=;
	b=inCGYKJrEGoGnKeu+vi4cEdfGOePYNBTpi3FqGLPhSa8fjPOXWUwpkOXXa0jj9ctwP
	VwTpLnaMt68zhjt0VMaTWrwuBW3fkkAXwamiK8F7y5sgugm1Y+zHm1lvCQMn5a8CT18X
	E9MQu1z/YAGYjAHrQVJ7a/CBwPKpeGWq+PqtLHE8WRW6nb48tQ6mrJKjk2X8bsw3N2Hd
	g718deABNpbn1ghwM9dsM/93F1ABmWXXG/ZitCtLzyhk1CQLyVfDpm4dJa22yTypou4m
	hK558CUgD5ShtgZreTHrYt2oOcozDZyUHwlcwpDtVCj+/a+OkN+NYhhGMgGh62fKajYQ
	sTVQ==
X-Gm-Message-State: ALoCoQk1b9HxK3VwuNXNEj/IAtzQ3YlgpxWzcdntDf994eO6DNZcIztsYLv5nPfALSqNCIHpdOvQ
X-Received: by 10.229.219.133 with SMTP id hu5mr90610446qcb.5.1395848863638;
	Wed, 26 Mar 2014 08:47:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 08:47:23 -0700 (PDT)
In-Reply-To: <1395844085-9929-8-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<1395844085-9929-8-git-send-email-lauren.post@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 15:47:23 +0000
Message-ID: <CAJTo0LY+dtv+r43D=t+F0Rdhwcfr3KaMR4iLj2-mS0f1sjkJCw@mail.gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/11] gst-plugin-bluetooth: Change DEPENDS from bluez4 to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 15:47:45 -0000
Content-Type: text/plain; charset=UTF-8

On 26 March 2014 14:28, Lauren Post <lauren.post@freescale.com> wrote:
> -DEPENDS = "bluez4 gst-plugins-base"
> +DEPENDS = "virtual/bluez gst-plugins-base"

gst-plugin-bluetooth is literally a rebuild of bluez with
--enable-gstreamer where everything else gets deleted.  This is pretty
vile and it should be a PACKAGECONFIG option, but in this case using
virtual/bluez is incorrect.

Ross

