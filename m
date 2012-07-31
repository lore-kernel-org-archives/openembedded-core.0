Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sw9XN-00084H-M4
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 12:18:50 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 31 Jul 2012 03:07:11 -0700
Received: by ggnf1 with SMTP id f1so5135886ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 03:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=iErQsJrJmdfPOtRzRFaG8m3oIfy5kxTgdu/+eojlSPo=;
	b=bmxh4xDSXBbhaFdhQNy8lnOon99F9g2eTY8sF3AkPRGzsJixnGo1Ej1h44A/zrYe8S
	yaEOO3cD1MYAz1pwt2WDLy/7ibKM8fkL4CShuJnj1QwR9MdHDlmwklTw5SEpGkK0ellW
	m46UE8T2LwISNmawmjJcHVy/Hx6NX0/c5toRyZgzoyyIbQiTM5IWL9eDS/Yw40rka+eE
	cBvKG7CtDKavyk5AnHPKiK1EIbYmxfxXSCaKH5u5CiT8CQm+TnjuQb6J+6rwOS5LkC48
	iTO4VzsLwtdxR3s2xXlWLgIAJ8a1HYxw5jDyw6amzM+eOxID6uaZHMnvrT8kioa3hIbU
	8SWA==
Received: by 10.50.212.70 with SMTP id ni6mr1459141igc.30.1343729230104; Tue,
	31 Jul 2012 03:07:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Tue, 31 Jul 2012 03:06:49 -0700 (PDT)
In-Reply-To: <1343715803-27212-1-git-send-email-radu.moisan@intel.com>
References: <1343715803-27212-1-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jul 2012 11:06:49 +0100
Message-ID: <CAJTo0LZAau5bcYRCk0yKx0e=oDgj3fQ+sy=RLKrnoQfdj8bt1Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmdrkbrG2P6aIPF76tucoOYFpz9NqMDC/Nv9d/buiq0jZUAru6cvzwCE53Ekm3IJENKKCIf
Subject: Re: [PATCH v7] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Tue, 31 Jul 2012 10:18:50 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2012 07:23, Radu Moisan <radu.moisan@intel.com> wrote:
> Followed suggestions from Bugz 2261:
>
> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro feature.
> This makes the build dependencies reflect the feature list.
>
> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 dependency
> is now back in dbus where is belongs.
>
> 4) make dbus provide dbus-x11, for compatibility.
>
> Fixes [Yocto #2261]

Looks good to me.

Acked-by: Ross Burton <ross.burton@intel.com>

Ross


