Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RsiZd-0000zy-UQ
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 23:22:42 +0100
Received: by lahc1 with SMTP id c1so933176lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 14:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=DueA/VpjRJBoxAUtizh0+91L6yDkUZlDr17ajXoJVZM=;
	b=bMwTgqf0K7w1kVvspFXrY/7QN4HjM2hMQFonpwh0z6pgZGUp6nWsR1N/psMM7GO5FG
	ZfxkZ1YiJ/idl0GpD/lRDQhlGUOR9iK3vLxh/Vnqb8H/NqmVDLqjG0Irgf2fQ62I/ZaF
	n7xHQ5ExTdK4fUxrNxRDzP7jZnaKkzAUMV6LM=
Received: by 10.152.146.163 with SMTP id td3mr223482lab.6.1328134486487; Wed,
	01 Feb 2012 14:14:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 1 Feb 2012 14:14:16 -0800 (PST)
In-Reply-To: <5c0971fd58af250c14b7eeaa3206e1b8c5bff840.1328133261.git.nitin.a.kamble@intel.com>
References: <cover.1328133261.git.nitin.a.kamble@intel.com>
	<6e7973add09749de3b14543fde53791076063657.1328133261.git.nitin.a.kamble@intel.com>
	<5c0971fd58af250c14b7eeaa3206e1b8c5bff840.1328133261.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Feb 2012 14:14:16 -0800
Message-ID: <CAMKF1spB8Sji8p5ZY-czfLn44axDKNYUxgkb7PA2D-rNmVTfZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] linux-libc-headers: new recipes for latest upstream 3.2.2
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
X-List-Received-Date: Wed, 01 Feb 2012 22:22:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 1, 2012 at 1:55 PM,  <nitin.a.kamble@intel.com> wrote:
> +SRC_URI += " file://connector-msg-size-fix.patch"

I happen to peek into this patch. It seems this patch should not be applied
since its specific to a wrs kernel and linux-yocto does not apply this patch
as well.


