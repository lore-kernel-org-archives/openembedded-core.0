Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SvrlS-0002aB-Ih
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 17:20:10 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 30 Jul 2012 08:08:11 -0700
Received: by obbuo19 with SMTP id uo19so7761743obb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 08:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=5tRgJL0uKatR9aFPWmyZwAGw610gz1qslvFNtvquKzs=;
	b=lqBhciL1sc8FRxp54chuAivqMC2kJ7QNwmnONwTJCeNf49B23B76EExINgSMR6f9EZ
	9imAXATlzZyY6seb+QfKv7U45cRJGF9mC0YI/bpr7Jrm/8gqnKBwWNYP/WUpDFa2NZSh
	9KDtwDTU63/5h43jkEW3qhy6PivWjV69zv+TmADbHkSnjR6Nsx5ej2S+nS0vJwq8B5Dr
	kPP3c1kz/ZrMtbGyzY804dEXxEESwx1uTrn4WwARu3itrrNhxPOQRKjnMkNf6hnKcWfp
	cBYwLF9T+lgjVcADqbutZlz2yV21USxM1x9JijQth7VLal55FsXxzWUVE/KECIpmx3uv
	5h7Q==
Received: by 10.182.51.37 with SMTP id h5mr18086138obo.35.1343660891313; Mon,
	30 Jul 2012 08:08:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Mon, 30 Jul 2012 08:07:51 -0700 (PDT)
In-Reply-To: <1343647468-25684-1-git-send-email-radu.moisan@intel.com>
References: <1343647468-25684-1-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2012 16:07:51 +0100
Message-ID: <CAJTo0LY+wc2ZdknHen4FhdxbDvL8u1q-Qh_+-YrdbPUXMSx-kg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl8YH5dNAMAJWzVns2Nd9oZI8iMVfvQ1jmurFFw/aHosAVWxlGolysl6rnAJmdL0NPleOlg
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Mon, 30 Jul 2012 15:20:10 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2012 12:24, Radu Moisan <radu.moisan@intel.com> wrote:
> +PROVIDES = "dbus-x11"

The provides that provide comparability were RPROVIDES/RREPLACES, this
doesn't do anything because nothing should be DEPENDing on dbus-x11,
so you can remove it.

Ross


