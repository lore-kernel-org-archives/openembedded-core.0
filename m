Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1YLk-0003Yy-AE
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 09:49:08 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 00:37:11 -0700
Received: by yhpp61 with SMTP id p61so1348151yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 00:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=+9JbIgZch8omxOmTWbk7UbohFH/VqUndOjygFj0zcu0=;
	b=J89Sm87+FnqAxOEX56o/WnmF1deHz/VB8sWrEGojBDjT2VQITcZoXYcp1/tdBR4I0f
	GOkc3CtZ4QeL3tH5vOlqxJrnsxyfbBpI7vwgCNG7/OP1TrpI+OijEeeY/21oPtT0f5lV
	n31jaL9iIU6e96cdhQIRpnkWyCIEnj6uZWgWL3qwnkHCQIA817YJ2BehuHijLo9vRDIX
	MgA4jygsKOwA3kk4V0o/Gid6L9Uhbs5dgfP1tlif4/DbG6KrmXU9/SX7SSmmn2XnO9Uo
	kOKSzZ/2xi9mIvKqryM2f7u4XjhfP9M7tM8RBjs1SKIsKFeri39MxdmasaCMJ5g8Wtsf
	EtKQ==
Received: by 10.42.64.9 with SMTP id e9mr13503943ici.20.1345016230408; Wed, 15
	Aug 2012 00:37:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.146.103 with HTTP; Wed, 15 Aug 2012 00:36:49 -0700 (PDT)
In-Reply-To: <CAJTo0LYPEOfgDhiKgh9G3Jsyi39hcU99qd0P_0UNL7NEwcY0PA@mail.gmail.com>
References: <cover.1344884283.git.ross.burton@intel.com>
	<502AF9CD.9020508@linux.intel.com>
	<CAJTo0LYPEOfgDhiKgh9G3Jsyi39hcU99qd0P_0UNL7NEwcY0PA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2012 08:36:49 +0100
Message-ID: <CAJTo0Lbzc5vG64aPKiZ5H_iVpwaQ7bn5uT8eemKo294CczXA7w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkUPBpUKWDCARDSYVfe+DE4YSvHwZjIge+4MoHb0nNap9E5oI5C0kWvP3T/OjqLQkciSW/r
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Enable EGL and GLES in x86 Mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 07:49:08 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2012 07:56, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 August 2012 02:22, Saul Wold <sgw@linux.intel.com> wrote:
>>> | ../../../../include/GL/internal/dri_interface.h:51:17: fatal error:
>>> drm.h: No such file or directory
>
> Not what I was expecting.  I've kicked off a local qemuarm build to investigate.

Hm, worked on qemuarm for me, and from what I can tell in the failed
autobuilder log linux-libc-headers was correctly built
(understandably) before mesa-dri.

Ross


