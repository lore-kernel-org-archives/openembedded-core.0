Received: from mail-ve0-f169.google.com ([209.85.128.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7R9R-0000So-7l
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:53:06 +0100
Received: by mail-ve0-f169.google.com with SMTP id 15so4886854vea.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 05:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=VoTF53BRdv+jyC3d9w6s57NtEbqsQdiOh+DbmD23YVE=;
	b=CYj72MlNOulK7eoN5Jmgg6BbwHOXe/i1e3depWE9slMFZqIUj1duuRccgILa6REr4h
	uMJ/nZChTnTrFJYWzMMScOSM31Pnx3sHZmuNret62nzDpYch6lxU4QlQ8FWHkbH+LYKK
	QRWwPCgVvtIblMDwddrVBqQZ08NRzMaLdwCX1TDMaTNfNxa4NArqrRwvw1AYrkcniRPb
	Bv3nslmTRa0UrrhvDaj4vxduBAo04TE/LcxeWV8GUvlUh1OJAGTDX0C8XQoMTMXizfVA
	ljz2/1Van1cwMj5UMabzrveYQRTQX9pPzi0m6KLHdC4WA6YoEjMlagIq6KcxpCeGma/X
	qQZQ==
X-Received: by 10.58.30.7 with SMTP id o7mr16096775veh.19.1361194613116; Mon,
	18 Feb 2013 05:36:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Mon, 18 Feb 2013 05:36:33 -0800 (PST)
In-Reply-To: <1361193916-23303-1-git-send-email-constantinx.musca@intel.com>
References: <1361193916-23303-1-git-send-email-constantinx.musca@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Feb 2013 13:36:33 +0000
Message-ID: <CAJTo0LbQGozKYKjohkeFBnN_TLhTiarnQzXZLWU1gR_KtHuSGA@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQlY7PycJvwL0/4zfgsnwTmUh9qPOlAnv4m4MtklNAaPj8lxjEA6gC0O6PihmJkvZDrlX+Fe
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gnome-common: upgrade to 3.7.4
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
X-List-Received-Date: Mon, 18 Feb 2013 13:53:07 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 13:25, Constantin Musca <constantinx.musca@intel.com> wrote:
>  # The omf.make file failed if scrollkeeper doesn't happen to be
>  # installed

Remove this comment too.

Also I'll note that whilst this is strictly speaking a development
release, gnome-common doesn't really follow that cycle and this
upgrade should be safe (and brings in the license clarification work I
did, so it's clearly super important).

Ross


