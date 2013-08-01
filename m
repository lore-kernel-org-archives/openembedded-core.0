Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id B9F016B1C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 09:50:47 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id e15so1831272vbg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 02:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=IDQTcpyHS0H+CAr/gHCDICs89rgVLmiMXI5Ebu90oio=;
	b=pEN9xyOkrutqQdfzns3sc3FxlTb0vnZ9ANDr9LSrPZnxwIov7Lp+B03KT+da+v4R+Z
	oj+kyPtlg4yeWgwyTb7xTt+Qf8ae9NWIKEFeIgX572y7uUeLsy2tt7xZyifsf5/MheZU
	uHFhyk2IxrXWQqDtWEe1OD/W8nmSf811hYRMlJPeKDF+a0p7fUjQEy7xiwe7VlH4Cc6A
	rHV0pt81QUjDyUTNQU9dmLqkrxXdGnv3cCceOUbuxM6dA8VuHNaRaLJGVtA1I+ZnvsH0
	6YjUZ9+/7pTElSFLpbvCLaQUuKOpeMi1bznPGHhYO3H+foD1oMgSI53r+nBoAy6d/jK0
	AoLw==
X-Received: by 10.220.1.9 with SMTP id 9mr220975vcd.37.1375350648079; Thu, 01
	Aug 2013 02:50:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 1 Aug 2013 02:50:28 -0700 (PDT)
In-Reply-To: <1375305315-22057-1-git-send-email-ronunes@gmail.com>
References: <1375305315-22057-1-git-send-email-ronunes@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Aug 2013 10:50:28 +0100
Message-ID: <CAJTo0LYtx1fg-hicArTgeQePBO+BRH7T+AkS75+7wPTUJQj66Q@mail.gmail.com>
To: ronunes@gmail.com
X-Gm-Message-State: ALoCoQlOzhV5RJrtdrJvN3vnuvSe1gjsv8zQ2zV2uCfYGkTEsRTQRo7YsX14JqKUfeVhaJfFW4oK
Cc: Rogerio Nunes <rogerio.nunes@freescale.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [master, dylan][PATCH] packagegroup-core-tools-testapps: isolate x11 dependent tools
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
X-List-Received-Date: Thu, 01 Aug 2013 09:50:48 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2013 22:15,  <ronunes@gmail.com> wrote:
> +    mesa-demos \

If no x11 distro feature then mesa shouldn't be linking against X, so
mesa-demos won't, so this should work, right?

Ross

