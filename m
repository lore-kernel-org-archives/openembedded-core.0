Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1EdF-0000YC-23
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 12:18:09 +0100
Received: from mail-ve0-f198.google.com ([209.85.128.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 03:02:23 -0800
Received: by mail-ve0-f198.google.com with SMTP id 14so4387164vea.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 03:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=ifYnsih4isKyKV0uvdUcmE05AAagKvqr8qCLBsJeaNI=;
	b=clv/aiEOiQnfZY1SQXjKZrT7tSitkUf3t9odsWrMnvdCQouobLCEIhF6JwJJOOuYk1
	MEVznLaysUD+Ud0ystR4A1Tzt7x4j3mUY6RKKQzYxMA2T9BsVFn7+rra5NWX7ohx7MzV
	MxrhAc0obmy1t1Tczl31y+yMsIf4HD8uMmIG6GzORNQPCHdySR8GeZB0Aj6kDegCOfNo
	Fvvfr71tBK2xgdO/lHeYvDRMhG1epqs5YhkEEdnKUuPbZrmd07JESGRaIO/gFIM7U6cZ
	5Ru4h+MDiUkM3se06aNs6PGduejIQ/QyxgOuOC1U0Dg/4K8oARXF8lhMO3g5EXdtJjia
	/dtA==
X-Received: by 10.58.50.7 with SMTP id y7mr6824622ven.24.1359716541857;
	Fri, 01 Feb 2013 03:02:21 -0800 (PST)
X-Received: by 10.58.50.7 with SMTP id y7mr6824617ven.24.1359716541748; Fri,
	01 Feb 2013 03:02:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 03:02:01 -0800 (PST)
In-Reply-To: <1359656561-9968-1-git-send-email-igeiser@devonit.com>
References: <1359656561-9968-1-git-send-email-igeiser@devonit.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 11:02:01 +0000
Message-ID: <CAJTo0LZsJsY2rkjTrUg-cxPBQAiod8yMRShgX9GM4dWM7MX5mw@mail.gmail.com>
To: igeiser@devonit.com
X-Gm-Message-State: ALoCoQnkR+Dy/N69q+uKY8xa1RTQKIpmP2gjsCmuuOuUJeCCZoYUp/Vpnywhwxipw/k7/uJDSiHKuWKCtddgSWnw9kgmiWGmwKXryGTji2J29QcauUG3trkntXi/HWh3WY17QvtlubdxlUEjcROzQogptlW8Fskpz9R/naW38Jv5+61ssJCP6svWodj/YZX0m9VwxZRXiBne
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] mesa-dri: add extra dri drivers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 11:18:09 -0000
X-List-Received-Date: Fri, 01 Feb 2013 11:18:09 -0000
Content-Type: text/plain; charset=UTF-8

On 31 January 2013 18:22,  <igeiser@devonit.com> wrote:
> From: Ian Reinhart Geiser <igeiser@devonit.com>
>
>  * By default enable only swrast.  This needs to
>    be here or for some reason qemuarm tries to
>    detect the intel dri libraries and fails.
>  * For x86 and x86-64 explicitly set all of
>    the supported drm drivers.
>
>  builds properly with qemux86 qemuarm and qemux86-64
>
> Signed-off-by: Ian Reinhart Geiser <igeiser@devonit.com>

Acked-by: Ross Burton <ross.burton@intel.com>

Ross


