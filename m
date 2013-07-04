Return-Path: <ross.burton@intel.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4619E6AD81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 11:29:43 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id g12so1790487oah.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 04:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=K5TJ/MIrAM/VY/8Qt5nzAR/coeaU+zT4HOWzojsVphU=;
	b=K5njqMOBTwQDGz57cC2rzLSqo7C4zXpecG4gky3VBRuvOAhF9pHD5P6gD9CKhvyec6
	/FrdDCL6IJomU+WAFTUxfCWIhSY7qEimQbThfNTXS/COxBaIExvPsTDaf1tztW/kiV15
	62rkolEl/TokziR18VMU+6fTBDLOVCAsjPoMBWBNcPwsJp85F/QGstK/bW2O5UP4rZ8F
	r7ud0rRiGnP5lXuJXLu1ZMGjBbmv9+bpWSQkneEqFSInZrlDZYkqcmJO4UlGtI+qy0SF
	Me1zSfPTp5ugTqESnCrRKTXPIUbDuodv+cUf5kjDPZPHsG/9iZX9lDDLXhs0PQUUAQka
	LeWw==
X-Received: by 10.182.95.71 with SMTP id di7mr5542850obb.12.1372937383614;
	Thu, 04 Jul 2013 04:29:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.160.41 with HTTP; Thu, 4 Jul 2013 04:29:23 -0700 (PDT)
In-Reply-To: <4e815a29c0d069823211ba33645f3b08ae968bfd.1372933905.git.laurentiu.palcu@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<4e815a29c0d069823211ba33645f3b08ae968bfd.1372933905.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 12:29:23 +0100
Message-ID: <CAJTo0LYa+ncg4fkiNewX2-Syo-7Lui2GDXpFuqLWOeyHBPk=MQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQk0dNxrO3p3w5YKVfaOF5d61uvFA+XrFX8AjIzYdIwTIsGrZ0gwIur4jPatyJjMHuzRYuK+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/5] xuser-account: create separate recipe for xuser creation
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
X-List-Received-Date: Thu, 04 Jul 2013 11:29:43 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 11:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> +USERADD_PARAM_${PN} = "--create-home \
> +                       --groups video,tty,audio,input,shutdown \
> +                       --user-group xuser"

I'm not liking the name "xuser" but unless someone has a much better
idea right now we can change that later.

Thinking about places where the xuser is used in other recipes (i.e.
connman for ACLs), can anyone see a problem with adding xuser to the
"users" group so those ACLS can use group membership instead of user
name?

Ross

