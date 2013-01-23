Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Txxv8-0005F5-FA
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 11:51:12 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 02:35:33 -0800
Received: by mail-vb0-f69.google.com with SMTP id ff20so3973054vbb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 02:35:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=aOSRJQs1AwuPuc81eHZIYERMZVfUpOuuEmFaDHOPYdU=;
	b=hP5wL6VAtYz5CQtjaDQypUZW6Uiz1N/kKXPtaJQ/L629UWF/gPIn5NkaiXFyxpoHmm
	JAlwSzhHfUKwhr+mlcG544x13rCrRZAeKQ25fqkCOoqjIIMZVm2fnI4QOVkubInG3Vd3
	XoSqhfi7xzUeW6u7kmN7n59Pv+D6aTRgHBktH+ZJVF70xJ/KGRkIlFYJTb+67f4gr7fD
	ZVjBZ2JfAITx/XNlolDxbugncYsINsO0OBqGanrvYjmNxBwMEMehBg2m9kfyF1A2u/yc
	v7UJwii4+e3B1X4MdlNuAvesSuzo+jI9yhaa0aD0NyU2e2oeLuK1eR1i14orFNm8lKmN
	+2Tw==
X-Received: by 10.220.115.133 with SMTP id i5mr704718vcq.42.1358937331723;
	Wed, 23 Jan 2013 02:35:31 -0800 (PST)
X-Received: by 10.220.115.133 with SMTP id i5mr704709vcq.42.1358937331589;
	Wed, 23 Jan 2013 02:35:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Wed, 23 Jan 2013 02:35:11 -0800 (PST)
In-Reply-To: <50FF5408.1040601@windriver.com>
References: <cover.1358763271.git.kai.kang@windriver.com>
	<CAJTo0LZhpvRd7oR6n7gVbP1n6=YuqqT_CHoa6ozs8WiK7w3KWQ@mail.gmail.com>
	<50FF5408.1040601@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jan 2013 10:35:11 +0000
Message-ID: <CAJTo0LbX9f=cgoYdXNsQ-f4BJGmO+MwJ4XMdhGdDY0Y+wv4sGA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Gm-Message-State: ALoCoQkFYVaITNaOa/hZt6Kl+Uxh75OsLZBWmQmR6vNQiI4xv7VwuY3iS6yCdeJPGEGf2e0yT3QZMBbQr/lVVNkP65nK+WremYFYjdGzsrRX7UnJztA6iWqzn6nQrdeRQJuDzaiqj5p1Oxx+BM5CXQC3HMObStD6cbyk6LTi6JngCtFeJji/6B1Imms34RmzHDyHDZDFVEM7
Cc: scott.a.garman@intel.com, Zhenfeng.Zhao@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Upgrade perl to 5.14.3
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
X-List-Received-Date: Wed, 23 Jan 2013 10:51:14 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2013 03:07, Kang Kai <Kai.Kang@windriver.com> wrote:
> This update is for security issue, and target milestone is 1.3.1 in
> bugzilla:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3701
>
> So I suppose that Danny need it.

Danny will only take patches, not version upgrades.  Will you be able
to prepare a backported patch instead of a version upgrade for Danny?

Ross


