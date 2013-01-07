Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsAOh-0004R9-P3
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 11:57:40 +0100
Received: from mail-ye0-f199.google.com ([209.85.213.199])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 02:42:29 -0800
Received: by mail-ye0-f199.google.com with SMTP id l12so29878148yen.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 02:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=p4Zv4XNJSvVVdiHSv6gjQ3runFgC/KNKou4b0zuEOWY=;
	b=QCoX3Hk2htjRqaWcj34F9sVFBSCpfY8wloVd+atacGOX55UlFQOaB2FFs5t6y/zLbe
	fkw4y64UinGyNLc24iNw3EQrIuSWQt6/vSUNpaoZ8TMd7DvlzJgyK5U/Tpd7o8xzHu+d
	NpGs6eVCgyRnzY9UYXFmaEFlNyiBlS/b4bw5h7jpkD1Bt4kcSeuvWdWDm/zNS0LzrSQv
	Tloa796hjl/FwkYWDGJYVM9dJhYGlbbJQbWhBMMLrur749r1VZj/TpSbjjtgroH4Ri6/
	Mzvk5UWNCnf3ERiv/gB5n/+FlG/jrCKXtr7eeM9e80IU31YDZsJYljOBigMTBl6NtEp9
	w1OA==
X-Received: by 10.58.239.162 with SMTP id vt2mr85298880vec.1.1357555348999;
	Mon, 07 Jan 2013 02:42:28 -0800 (PST)
Received: by 10.58.239.162 with SMTP id vt2mr85298875vec.1.1357555348933; Mon,
	07 Jan 2013 02:42:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 7 Jan 2013 02:42:08 -0800 (PST)
In-Reply-To: <1357550291-8035-1-git-send-email-constantinx.musca@intel.com>
References: <1357550291-8035-1-git-send-email-constantinx.musca@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Jan 2013 10:42:08 +0000
Message-ID: <CAJTo0Lasoqd3PcKGHtK0AKjf3OqNLUdVpFwnnksj+XdNopX77g@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQn1KkxTEmqqSB7HAr8aqJddUKyW6mVTnqeJdOI4d5FciiRWjac02g9oU2Wd1jpXjyPg81nG6pQF8sRsnJscAQOR4V/opsMzknLAPYL3jAyRkwuFiCA906+l7kSTPIi0PMIExzv3MzAiyceJWcDj2Ylzv9HIxE6/577GQEn2wD1jSGInPktJZDEg9MLCZUke8yUS3+Ud
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gsettings-desktop-schemas: add missing elements from meta-gnome
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
X-List-Received-Date: Mon, 07 Jan 2013 10:57:40 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 09:18, Constantin Musca <constantinx.musca@intel.com> wrote:
> +pkg_postinst_${PN} () {
> +    if [ -n "$D" ]; then
> +        exit 1
> +    fi
> +
> +    glib-compile-schemas ${datadir}/glib-2.0/schemas
> +}

The compiled form is little-endian and we're already built a native
glib-compile-schemas, so you can drop the $D check and perform this
postinst on the build host with glib-compile-schemas
$D${datadir}/glib-2.0/schemas.

Ross


