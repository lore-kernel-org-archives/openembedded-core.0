Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD5F6041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 07:18:52 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id a11so1264901eae.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 00:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=2yPOX6CRjzzNZvDAkXEVQNZLidjtjo3FcSTHUpf+ptg=;
	b=YGhvXaRDwDFSGjZ8ciD36/BwvcmhDMGaqmDToqoxokJ1T2AJmdZ+648udrQutjKDKD
	Ar1XF/0VSuiOHaHU3q239tJ0rUh6OVdygIDSuCEBOeLrDhqtIU6PdZ/RfsQKDs1J7j+G
	A7swgWzWZlVBGA89a+kMKQ5SPFjCu0RIN0sYVOUUA5FaGeQWgxjY3YXFREy/SUXSMe0d
	ld/zBUlsX56qikppVhQTsxMOlS+HqkKluQr5QEwn+WOCOUXiWnQxESTQFc99wSmjWMHp
	8pNTQfDLgYXCnvf/04/akLFxdXEBV8nO3s7Ym/Yqlw/0MkUIoAXuy4lAuiZtluOxPyPF
	D7yQ==
X-Received: by 10.14.208.131 with SMTP id q3mr12498550eeo.111.1369984732352;
	Fri, 31 May 2013 00:18:52 -0700 (PDT)
Received: from ?IPv6:2001:610:612::dd64:906a:9471:140e?
	([2001:610:612:0:dd64:906a:9471:140e])
	by mx.google.com with ESMTPSA id s8sm64986567eeo.4.2013.05.31.00.18.50
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 00:18:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1369922325.git.ross.burton@intel.com>
Date: Fri, 31 May 2013 09:18:49 +0200
Message-Id: <373E49FF-E99D-446B-A4A5-F852FDCAEFCF@dominion.thruhere.net>
References: <cover.1369922325.git.ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQm/tNfhdWWuBOkfHCVzuByr3PMZWwWI8adJNk08BOp0L9CLTrUAAmC71DIJ57stmXkVJEms
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Mesa and Wayland updates
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
X-List-Received-Date: Fri, 31 May 2013 07:18:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mei 2013, om 16:00 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Hi,
>=20
> A short series that updates our Mesa and Wayland to the latest =
upstream
> releases, adds a very rudimentary init script to start Weston, and a =
basic image
> that boots directly into Weston on DRM.

We talked about weston off-list a few weeks ago and this seems a good =
time to bring it back on list :)

I'd like to get the framebuffer backend supported, so I upgraded weston =
to 1.0.90 and added:

+                 --enable-fbdev-compositor \

+# Needed for weston-launch
+WESTONBACKEND ??=3D "fbdev-backend.so"
+
+export WESTON_NATIVE_BACKEND =3D "${WESTONBACKEND}"
=20
At the time of writing that weston didn't support runtime detection or =
config files entries for selecting the backend, only commandline =
arguments. So whatever is getting picked at build time, you're stuck =
with that. Does 1.1.x address that situation?

regards,

Koen=

